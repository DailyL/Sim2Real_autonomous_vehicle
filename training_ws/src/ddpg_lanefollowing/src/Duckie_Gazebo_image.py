#!/usr/bin/env python
import sys
import rospy
import numpy as np

from std_msgs.msg import Header
from gazebo_msgs.msg import ContactsState, ModelStates
from tf import TransformListener
from duckietown_msgs.msg import  Twist2DStamped, LanePose
import math
from scipy.stats import norm
from gazebo_msgs.srv import SpawnModel, DeleteModel
from std_srvs.srv import Empty
from geometry_msgs.msg import Twist
from shapely.geometry import Point
from shapely.geometry.polygon import asPolygon
from sensor_msgs.msg import CompressedImage, Image
import cv2
from cv_bridge import CvBridge, CvBridgeError




class Duckie_Gazebo(object):
    def __init__(self):
        #init code
        rospy.init_node("Duckie_Gazebo")
        self.follower_pose_x = 1.0961583516695363
        self.follower_pose_y = 0.7700045782607453
        self.leader_pose_x = 2.26
        self.leader_pose_y = 0.59
        self.follower_v = 0
        self.d = 0
        self.rate = rospy.Rate(50)                                     
        self.sub_collision = rospy.Subscriber("~collision", ContactsState, self.collision_callback,queue_size = 1)
        self.sub_states = rospy.Subscriber("/gazebo/model_states", ModelStates, self.states_callback,queue_size = 1)
        self.sub_lane_pose = rospy.Subscriber("~lane_pose", LanePose, self.lane_pose_callback, queue_size=1)
        self.sub_image = rospy.Subscriber("~image", Image, self.image_callback, queue_size=1)
        self.v_desired = 0.5
        self.lanePose_d = 0       #lateral offset
        self.lanePose_phi = 0   #heading error
        self.collision = False                
        self.pub_car_twist = rospy.Publisher('~cmd',Twist,queue_size = 1)
        self.out_road_x_max = 7.15
        self.out_road_y_max = 5.575
        self.out_road_x_min = 0
        self.out_road_y_min = 0
        
        self.in_road_x_max = 5.1
        self.in_road_y_max = 3.51
        self.in_road_x_min = 2.07
        self.in_road_y_min = 2.07 
        self.on_left = False
        self.bridge = CvBridge()
        self.image_cv = np.zeros((80, 40, 3))
        self.img_rows = 80 
        self.img_cols = 40
        
    def image_callback(self, msg):
        try:
            cv_image = CvBridge().imgmsg_to_cv2(msg, "passthrough")
            self.image_cv = cv2.resize(cv_image, (80, 40), interpolation=cv2.INTER_NEAREST)
        except CvBridgeError as e:
            print(e)
        
    def collision_callback(self, msg):
        if (msg.states != []):    
            self.collision = True
            print("collision")        	           
    def states_callback(self, msg):
        self.follower_pose_x = msg.pose[2].position.x
        self.follower_pose_y = msg.pose[2].position.y
        self.follower_v_x = msg.twist[2].linear.x
        self.follower_v_y = msg.twist[2].linear.y
        
        self.leader_pose_x = msg.pose[3].position.x
        self.leader_pose_y = msg.pose[3].position.y
        
        self.follower_v= pow((pow(self.follower_v_x,2) + pow(self.follower_v_y,2)),0.5)
        self.d = pow((pow((self.leader_pose_x-self.follower_pose_x),2) + pow((self.leader_pose_y-self.follower_pose_y),2)),0.5)
        
    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            self.on_left = True
    
    def reset(self):  
    
    #reseat function to reset simulation
    #return the initial states after reset
    #return: states                       
        reset_world = rospy.ServiceProxy('gazebo/reset_world', Empty)

        rospy.wait_for_service('gazebo/reset_world')
        reset_world()
        
        #get initial states
        """
        status1 = self.lanePose_d
        status2 = self.follower_v
        status3 = self.lanePose_phi
        status4 = self.d
        """
        cv_image_re = cv2.resize(self.image_cv, (self.img_rows, self.img_cols))
        
        state = cv_image_re
        
        return state
	 
                           
    def setReward(self):
    
        if self.collision:
            collision_done = True
            r_collision = -1
            self.collision = False
        else:
            collision_done = False
            r_collision = 0          
        
        if self.off_road(self.follower_pose_x, self.follower_pose_y):
            off_road_done = True
            r_off_road = -1
        else:
            off_road_done = False
            r_off_road = 0
            
            
        if self.on_left:
            r_on_left = -1
            self.on_left = False
        else:
            r_on_left = 0

        
        
        r_v = self.follower_v / self.v_desired
        
        r_d = -max(0, 2 - self.d)
        
        """
        if self.d > 0.05 and self.d < 0.1*self.follower_v:
            r_d = -0.0035 * (0.1 * self.follower_v - self.d)
        elif self.d <= 0.05:                                                   # near collosion
            r_d = -1     
        elif self.d > self.follower_v:
            r_d = -0.00175 * (self.d - self.follower_v)
        else:
            r_d = 0
        """
          
        reward = 2.0*r_collision + 1.0*r_off_road - 0.85*abs(self.lanePose_d)  + 0.2*r_v + r_on_left *0.8 - 1.3*abs(self.lanePose_phi) # + 0.5*r_d  - 1.0*abs(self.lanePose_phi)

        return reward, (collision_done or off_road_done)

    def step(self,action):

    #step function
    #take an action and return updated states
    #return: state, reward, done
        done = False
        car_twist_msg = Twist()
        car_twist_msg.linear.x = action[0,0]
        car_twist_msg.angular.z = action[0,1]
        self.pub_car_twist.publish(car_twist_msg)     
        self.rate.sleep()
             
        """
        status1 = self.lanePose_d
        status2 = self.follower_v
        status3 = self.lanePose_phi
        status4 = self.d
        """
        cv_image_re = cv2.resize(self.image_cv, (self.img_rows, self.img_cols))
        
        state = cv_image_re
        
        reward, done = self.setReward()
            
        return state, reward, done
             
             
             
    def off_road(self,x ,y):
        if (x < self.out_road_x_max and x > self.out_road_x_min) and (y < self.out_road_y_max and y > self.out_road_y_min):
            in_big = True
        else:
            in_big = False 
            
            
        if (x < self.in_road_x_max and x > self.in_road_x_min) and (y < self.in_road_y_max and y > self.in_road_y_min):
            in_small = True
        else:
            in_small = False       
    
        if in_big and (not in_small):
            return False
        else:
            return True
        
    
    
if __name__ == "__main__":
            r = Duckie_Gazebo()
            print (r.setReward())
            r.reset()
            print (r.setReward())





