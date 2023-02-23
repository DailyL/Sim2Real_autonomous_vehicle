#!/usr/bin/env python
import rospy
import numpy as np
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from std_msgs.msg import Float32
from duckietown_msgs.msg import SegmentList, Segment, Pixel, LanePose, BoolStamped, Twist2DStamped
from scipy.stats import multivariate_normal, entropy
from scipy.ndimage.filters import gaussian_filter
from math import floor, atan2, pi, cos, sin, sqrt
import time
from geometry_msgs.msg import Twist

class LaneFilterNode(object):
    """
    
Lane Filter Node

Author: Liam Paull

Inputs: SegmentList from line detector

Outputs: LanePose - the d (lateral displacement) and phi (relative angle) 
of the car in the lane

For more info on algorithm and parameters please refer to the google doc:
 https://drive.google.com/open?id=0B49dGT7ubfmSX1k5ZVN1dEU4M2M

    """
    def __init__(self):
        self.node_name = "Lane Filter"
        self.active = True
        self.updateParams(None)
        
        self.d,self.phi = np.mgrid[self.d_min:self.d_max:self.delta_d,self.phi_min:self.phi_max:self.delta_phi]
        self.beliefRV=np.empty(self.d.shape)
        self.initializeBelief()
        self.lanePose = LanePose()
        self.lanePose.d=self.mean_0[0]
        self.lanePose.phi=self.mean_0[1]

        self.dwa = -(self.zero_val*self.l_peak**2 + self.zero_val*self.l_max**2 - self.l_max**2*self.peak_val - 2*self.zero_val*self.l_peak*self.l_max + 2*self.l_peak*self.l_max*self.peak_val)/(self.l_peak**2*self.l_max*(self.l_peak - self.l_max)**2)
        self.dwb = (2*self.zero_val*self.l_peak**3 + self.zero_val*self.l_max**3 - self.l_max**3*self.peak_val - 3*self.zero_val*self.l_peak**2*self.l_max + 3*self.l_peak**2*self.l_max*self.peak_val)/(self.l_peak**2*self.l_max*(self.l_peak - self.l_max)**2)
        self.dwc = -(self.zero_val*self.l_peak**3 + 2*self.zero_val*self.l_max**3 - 2*self.l_max**3*self.peak_val - 3*self.zero_val*self.l_peak*self.l_max**2 + 3*self.l_peak*self.l_max**2*self.peak_val)/(self.l_peak*self.l_max*(self.l_peak - self.l_max)**2)


        self.t_last_update = rospy.get_time()
        self.v_current = 0
        self.w_current = 0
        self.v_last = 0
        self.w_last = 0
        self.v_avg = 0
        self.w_avg = 0

        # Subscribers
        if self.use_propagation:
            self.sub_velocity = rospy.Subscriber("~velocity", Twist, self.updateVelocity)
            #self.sub_velocity = rospy.Subscriber("~velocity", Twist2DStamped, self.updateVelocity) # change this when use in real bot 
        self.sub = rospy.Subscriber("~segment_list", SegmentList, self.processSegments, queue_size=1)

        # Publishers
        self.pub_lane_pose  = rospy.Publisher("~lane_pose", LanePose, queue_size=1)
        self.pub_belief_img = rospy.Publisher("~belief_img", Image, queue_size=1)
        self.pub_entropy    = rospy.Publisher("~entropy",Float32, queue_size=1)
    	#self.pub_prop_img = rospy.Publisher("~prop_img", Image, queue_size=1)
        self.pub_in_lane    = rospy.Publisher("~in_lane",BoolStamped, queue_size=1)
        self.sub_switch = rospy.Subscriber("~switch", BoolStamped, self.cbSwitch, queue_size=1)

        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0), self.updateParams)


    def updateParams(self, event):
        self.mean_0 = [rospy.get_param("~mean_d_0",0) , rospy.get_param("~mean_phi_0",0)]
        self.cov_0  = [ [rospy.get_param("~sigma_d_0",0.1) , 0] , [0, rospy.get_param("~sigma_phi_0",0.01)] ]
        self.delta_d     = rospy.get_param("~delta_d",0.02) # in meters
        self.delta_phi   = rospy.get_param("~delta_phi",0.02) # in radians
        self.d_max       = rospy.get_param("~d_max",0.5)
        self.d_min       = rospy.get_param("~d_min",-0.7)
        self.phi_min     = rospy.get_param("~phi_min",-pi/2)
        self.phi_max     = rospy.get_param("~phi_max",pi/2)

        self.cov_v       = rospy.get_param("~cov_v",0.5) # linear velocity "input"
        self.cov_omega   = rospy.get_param("~cov_omega",0.01) # angular velocity "input"
        self.linewidth_white = rospy.get_param("~linewidth_white",0.04)
        self.linewidth_yellow = rospy.get_param("~linewidth_yellow",0.02)
        self.lanewidth        = rospy.get_param("~lanewidth",0.4)
        self.min_max = rospy.get_param("~min_max", 0.3) # nats
        # For use of distance weighting (dw) function
        self.use_distance_weighting = rospy.get_param("~use_distance_weighting",False)
        self.zero_val    = rospy.get_param("~zero_val",1)
        self.l_peak      = rospy.get_param("~l_peak",1)
        self.peak_val    = rospy.get_param("~peak_val",10)
        self.l_max       = rospy.get_param("~l_max",2)

        # For use of maximum segment distance
        self.use_max_segment_dist = rospy.get_param("~use_max_segment_dist",False)
        self.max_segment_dist = rospy.get_param("~max_segment_dist",1.0)

        # For use of minimum segment count
        self.use_min_segs = rospy.get_param("~use_min_segs",False)
        self.min_segs = rospy.get_param("~min_segs", 10)

        # For propagation
        self.use_propagation = rospy.get_param("~use_propagation",False)
        self.cov_mask = [rospy.get_param("~sigma_d_mask",0.05) , rospy.get_param("~sigma_phi_mask",0.05)]

    def cbSwitch(self, switch_msg):
        self.active = switch_msg.data

    def processSegments(self,segment_list_msg):
        if not self.active:
            return
        t_start = rospy.get_time()

        if self.use_propagation:
            self.propagateBelief()
            self.t_last_update = rospy.get_time()

        # initialize measurement likelihood
        measurement_likelihood = np.zeros(self.d.shape)

        for segment in segment_list_msg.segments:
            if segment.color != segment.WHITE and segment.color != segment.YELLOW:
                continue
            if segment.points[0].x < 0 or segment.points[1].x < 0:
                continue

            d_i,phi_i,l_i = self.generateVote(segment)
            if d_i > self.d_max or d_i < self.d_min or phi_i < self.phi_min or phi_i>self.phi_max:
                continue
            if self.use_max_segment_dist and (l_i > self.max_segment_dist):
                continue

            i = floor((d_i - self.d_min)/self.delta_d)
            j = floor((phi_i - self.phi_min)/self.delta_phi)

            if self.use_distance_weighting:           
                dist_weight = self.dwa*l_i**3+self.dwb*l_i**2+self.dwc*l_i+self.zero_val
                if dist_weight < 0:
                    continue
                measurement_likelihood[i,j] = measurement_likelihood[i,j] + dist_weight
            else:
                measurement_likelihood[i,j] = measurement_likelihood[i,j] +  1/(l_i)


        if np.linalg.norm(measurement_likelihood) == 0:
            return
        measurement_likelihood = measurement_likelihood/np.sum(measurement_likelihood)

        if self.use_propagation:
            self.updateBelief(measurement_likelihood)
        else:
            self.beliefRV = measurement_likelihood

        # TODO entropy test:
        #print self.beliefRV.argmax()

        maxids = np.unravel_index(self.beliefRV.argmax(),self.beliefRV.shape)
        # rospy.loginfo('maxids: %s' % maxids)
        self.lanePose.header.stamp = segment_list_msg.header.stamp
        self.lanePose.d = self.d_min + maxids[0]*self.delta_d
        self.lanePose.phi = self.phi_min + maxids[1]*self.delta_phi
        self.lanePose.status = self.lanePose.NORMAL

        # publish the belief image
        bridge = CvBridge()
        belief_img = bridge.cv2_to_imgmsg((255*self.beliefRV).astype('uint8'), "mono8")
        belief_img.header.stamp = segment_list_msg.header.stamp
        
        max_val = self.beliefRV.max()
        self.lanePose.in_lane = max_val > self.min_max and len(segment_list_msg.segments) > self.min_segs and np.linalg.norm(measurement_likelihood) != 0
        self.pub_lane_pose.publish(self.lanePose)
        self.pub_belief_img.publish(belief_img)

        # print "time to process segments:"
        # print rospy.get_time() - t_start

        # Publish in_lane according to the ent
        in_lane_msg = BoolStamped()
        in_lane_msg.header.stamp = segment_list_msg.header.stamp
        in_lane_msg.data = self.lanePose.in_lane
        # ent = entropy(self.beliefRV)
        # if (ent < self.max_entropy):
        #     in_lane_msg.data = True
        # else:
        #     in_lane_msg.data = False
        self.pub_in_lane.publish(in_lane_msg)

    def updateVelocity(self,twist_msg):
        self.v_current = twist_msg.linear.x
        self.w_current = twist_msg.angular.z
        
        # change this when use to real bot
        #self.v_current = twist_msg.v
        #self.w_current = twist_msg.omega
        
        #self.v_avg = (self.v_current + self.v_last)/2.0
        #self.w_avg = (self.w_current + self.w_last)/2.0

        #self.v_last = v_current
        #self.w_last = w_current

    def initializeBelief(self):
        pos = np.empty(self.d.shape + (2,))
        pos[:,:,0]=self.d
        pos[:,:,1]=self.phi
        self.cov_0
        RV = multivariate_normal(self.mean_0,self.cov_0)
        self.beliefRV=RV.pdf(pos)

    def propagateBelief(self):
        delta_t = rospy.get_time() - self.t_last_update

        d_t = self.d + self.v_current*delta_t*np.sin(self.phi)
        phi_t = self.phi + self.w_current*delta_t

        p_beliefRV = np.zeros(self.beliefRV.shape)

        for i in range(self.beliefRV.shape[0]):
            for j in range(self.beliefRV.shape[1]):
                if self.beliefRV[i,j] > 0:
                    if d_t[i,j] > self.d_max or d_t[i,j] < self.d_min or phi_t[i,j] < self.phi_min or phi_t[i,j] > self.phi_max:
                        continue
                    i_new = floor((d_t[i,j] - self.d_min)/self.delta_d)
                    j_new = floor((phi_t[i,j] - self.phi_min)/self.delta_phi)
                    p_beliefRV[i_new,j_new] += self.beliefRV[i,j]

        s_beliefRV = np.zeros(self.beliefRV.shape)
        gaussian_filter(100*p_beliefRV, self.cov_mask, output=s_beliefRV, mode='constant')

        if np.sum(s_beliefRV) == 0:
            return
        self.beliefRV = s_beliefRV/np.sum(s_beliefRV)

    	#bridge = CvBridge()
        #prop_img = bridge.cv2_to_imgmsg((255*self.beliefRV).astype('uint8'), "mono8")
        #self.pub_prop_img.publish(prop_img)
                
        return

    def updateBelief(self,measurement_likelihood):
        self.beliefRV=np.multiply(self.beliefRV+1,measurement_likelihood+1)-1
        self.beliefRV=self.beliefRV/np.sum(self.beliefRV)#np.linalg.norm(self.beliefRV)

    def generateVote(self,segment):
        p1 = np.array([segment.points[0].x, segment.points[0].y])
        p2 = np.array([segment.points[1].x, segment.points[1].y])
        t_hat = (p2-p1)/np.linalg.norm(p2-p1)
        n_hat = np.array([-t_hat[1],t_hat[0]])
        d1 = np.inner(n_hat,p1)
        d2 = np.inner(n_hat,p2)
        l1 = np.inner(t_hat,p1)
        l2 = np.inner(t_hat,p2)
        if (l1 < 0):
            l1 = -l1;
        if (l2 < 0):
            l2 = -l2;
        l_i = (l1+l2)/2
        d_i = (d1+d2)/2
        phi_i = np.arcsin(t_hat[1])
        if segment.color == segment.WHITE: # right lane is white
            if(p1[0] > p2[0]): # right edge of white lane
                d_i = d_i - self.linewidth_white
            else: # left edge of white lane
                d_i = - d_i
                phi_i = -phi_i
            d_i = d_i - self.lanewidth/2

        elif segment.color == segment.YELLOW: # left lane is yellow
            if (p2[0] > p1[0]): # left edge of yellow lane
                d_i = d_i - self.linewidth_yellow
                phi_i = -phi_i
            else: # right edge of white lane
                d_i = -d_i
            d_i =  self.lanewidth/2 - d_i

        return d_i, phi_i, l_i

    def getSegmentDistance(self, segment):
        x_c = (segment.points[0].x + segment.points[1].x)/2
        y_c = (segment.points[0].y + segment.points[1].y)/2

        return sqrt(x_c**2 + y_c**2)

    def onShutdown(self):
        rospy.loginfo("[LaneFilterNode] Shutdown.")


if __name__ == '__main__':
    rospy.init_node('lane_filter',anonymous=False)
    lane_filter_node = LaneFilterNode()
    rospy.on_shutdown(lane_filter_node.onShutdown)
    rospy.spin()
