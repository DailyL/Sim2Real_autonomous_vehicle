#!/usr/bin/env python
import sys
import rospy
import numpy as np
from random import choice
from std_msgs.msg import Header
from gazebo_msgs.msg import ContactsState, ModelStates
from tf import TransformListener
from duckietown_msgs.msg import  Twist2DStamped, LanePose

from scipy.stats import norm
from gazebo_msgs.srv import SpawnModel, DeleteModel, SetModelStateRequest, SetModelState
from std_srvs.srv import Empty
from geometry_msgs.msg import Twist, Pose
from shapely.geometry import Point
from shapely.geometry.polygon import asPolygon
from scipy.spatial import distance
import math
import shapely.geometry as geom



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
        self.sub_states = rospy.Subscriber("/gazebo/model_states", ModelStates, self.states_callback,queue_size = 10)
        self.sub_lane_pose = rospy.Subscriber("~lane_pose", LanePose, self.lane_pose_callback, queue_size=10)
        self.sub_collision = rospy.Subscriber("~collision", ContactsState, self.collision_callback,queue_size = 10)

        self.lanewidth = 0.23
        self.v_desired = 0.75
        self.lanePose_d = 0       #lateral offset
        self.lanePose_phi = 0   #heading error
        self.collision = False                
        self.pub_car_twist = rospy.Publisher('~cmd',Twist,queue_size = 10)
        
        self.out_road_x_max = 7.15
        self.out_road_y_max = 5.575
        self.out_road_x_min = 0
        self.out_road_y_min = 0
        
        self.in_road_x_max = 5.1
        self.in_road_y_max = 3.51
        self.in_road_x_min = 2.07
        self.in_road_y_min = 2.07 
        self.on_left = False
        self.follower_pose_x_pre = 1.0961583516695363
        self.follower_pose_y_pre = 0.7700045782607453
        self.coords_big = np.loadtxt('/home/dianzhaoli/duckie_catkin_ws/src/rl_duckietown/src/tud_rl/run/opti_trajectory/aver_trajectory_with_yaw.txt')
        self.coords_small = np.loadtxt('/home/dianzhaoli/duckie_catkin_ws/src/rl_duckietown/src/tud_rl/run/opti_trajectory/aver_trajectory_small_circle_with_yaw.txt')
        self.pi = 3.141592653589793
        self.follower_pose_orien_x = 0
        self.follower_pose_orien_y = 0
        self.follower_pose_orien_z = 0
        self.follower_pose_orien_w = 0
        self.yaw = 0
        self.x_infi = 1
        self.k = 0.5

        """
        set up initial position
        later will choose from two different positions
        """

        """
        follower position
        """

        self.position = np.zeros((14,2))
        self.position[0,0] = 4.65
        self.position[1,0] = 1.4
        self.position[2,0] = 0.24
        self.position[3,0] = 0
        self.position[4,0] = 0
        self.position[5,0] = 1
        self.position[6,0] = 0

        self.position[0,1] = 1.16
        self.position[1,1] = 0.77
        self.position[2,1] = 0.24
        self.position[3,1] = 0
        self.position[4,1] = 0
        self.position[5,1] = 0
        self.position[6,1] = 1

        """
        leader position
        """

        self.position[7,0] = 3.42
        self.position[8,0] = 1.4
        self.position[9,0] = 0.24
        self.position[10,0] = 0
        self.position[11,0] = 0
        self.position[12,0] = 1
        self.position[13,0] = 0

        self.position[7,1] = 2.26
        self.position[8,1] = 0.59
        self.position[9,1] = 0.24
        self.position[10,1] = 0
        self.position[11,1] = 0
        self.position[12,1] = 0
        self.position[13,1] = 1


        self.leader_init_pose = Pose()
        self.follower_init_pose = Pose()
        
        """
        setup for reset of the environment
        """

        
        self.reset_proxy = rospy.ServiceProxy('/gazebo/reset_world', Empty)

        self.follower_state_reset = rospy.ServiceProxy('gazebo/set_model_state', SetModelState)
        self.leader_state_reset = rospy.ServiceProxy('gazebo/set_model_state', SetModelState)


        self.set_leader_state = SetModelStateRequest()
        self.set_follower_state = SetModelStateRequest()

        self.coords = None

    def collision_callback(self, msg):
        if (msg.states != []):    
            self.collision = True

        
    def states_callback(self, msg):
        self.follower_pose_x = msg.pose[3].position.x
        self.follower_pose_y = msg.pose[3].position.y
        self.follower_v_x = msg.twist[3].linear.x
        self.follower_v_y = msg.twist[3].linear.y
        self.follower_pose_orien_x = msg.pose[3].orientation.x
        self.follower_pose_orien_y = msg.pose[3].orientation.y
        self.follower_pose_orien_z = msg.pose[3].orientation.z
        self.follower_pose_orien_w = msg.pose[3].orientation.w

        self.leader_pose_x = msg.pose[2].position.x
        self.leader_pose_y = msg.pose[2].position.y
        
        self.follower_v= pow((pow(self.follower_v_x,2) + pow(self.follower_v_y,2)),0.5)
        
        self.yaw = self.quaternion_to_euler(self.follower_pose_orien_x, self.follower_pose_orien_y, self.follower_pose_orien_z, self.follower_pose_orien_w)
        self.d = pow((pow((self.leader_pose_x-self.follower_pose_x),2) + pow((self.leader_pose_y-self.follower_pose_y),2)),0.5)
        
        
    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            self.on_left = True
            self.lanePose_d = -1
            self.lanePose_phi = -1
    def reset(self):  
    
    #reseat function to reset simulation
    #return the initial states after reset
    #return: states                       
        reset_world = rospy.ServiceProxy('gazebo/reset_world', Empty)

        rospy.wait_for_service('gazebo/reset_world')
        reset_world()
        
        """
        set initial position for both car
        """

        self.set_follower_state.model_state.model_name = 'duckiebot_david'
        self.set_leader_state.model_state.model_name = 'duckiebot_rose'

        index = choice([0,1])
        
        self.set_follower_state.model_state.pose.position.x = self.position[0,index] 
        self.set_follower_state.model_state.pose.position.y = self.position[1,index]
        self.set_follower_state.model_state.pose.position.z = 0.24

        self.set_follower_state.model_state.pose.orientation.x = self.position[3,index]
        self.set_follower_state.model_state.pose.orientation.y = self.position[4,index]
        self.set_follower_state.model_state.pose.orientation.z = self.position[5,index]
        self.set_follower_state.model_state.pose.orientation.w = self.position[6,index]


        self.set_leader_state.model_state.pose.position.x = self.position[7,index] 
        self.set_leader_state.model_state.pose.position.y = self.position[8,index]
        self.set_leader_state.model_state.pose.position.z = 0.24

        self.set_leader_state.model_state.pose.orientation.x = self.position[10,index]
        self.set_leader_state.model_state.pose.orientation.y = self.position[11,index]
        self.set_leader_state.model_state.pose.orientation.z = self.position[12,index]
        self.set_leader_state.model_state.pose.orientation.w = self.position[13,index]
        
        self.follower_state_reset(self.set_follower_state)
        self.leader_state_reset(self.set_leader_state)



        if index == 0:
            self.coords = self.coords_small
        elif index == 1:
            self.coords = self.coords_big



        
        #get initial states
        
        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/1.0 
        status3 = self.follower_v/1.0
        status4 = 0
        status5 = 0
        status6 = 0
        status7 = 0
        status8 = 0
        
                
        self.state = [status1,status2,status3,status4,status5,status6,status7,status8]
        
        
        return np.array(self.state)
	 
                           
    def setReward(self,action,r_yaw,e_y):
        
        off_road, in_small = self.off_road(self.follower_pose_x, self.follower_pose_y)

        if self.collision:
            collision_done = True
            r_collision = -1
            self.collision = False
        else:
            collision_done = False
            r_collision = 0



        if off_road:
            off_road_done = True
            r_off_road = -1
        else:
            off_road_done = False
            r_off_road = 0
            
        if in_small:
            r_in_small = -1
        else:
            r_in_small = 0
                
 
        if abs(action[1]*4.0) >= 2.0:
            r_cmd_phi = - (abs(action[1]*4.0)-2)
        else:
            r_cmd_phi = 0 
        r_v = (self.follower_v-self.v_desired) / self.v_desired
        
        """
        if self.d > 0.05 and self.d < 0.1*self.follower_v:
            r_d = -0.0035 * (0.1 * self.follower_v - self.d)
        elif self.d <= 0.05:                                                   # near collosion
            r_d = -1     
        elif self.d > self.follower_v:
            r_d = -0.00175 * (self.d - self.follower_v)
        else:
            r_d = 0
        r_v = (self.follower_v-self.v_desired) / self.v_desired
        
        
        if self.on_left:
            r_on_left = -1
            self.on_left = False
        else:
            r_on_left = 0
            
            
            
        if self.d < 0.3:
            r_near_collision = 1 
        else:
            r_near_collision = 0 
        """
        """
        r_d, closest_index = self.closest_node((self.follower_pose_x,self.follower_pose_y), self.coords[:,:2])
        
        yaw_offset = abs(self.yaw - self.coords[closest_index,2])
        x_path = self.coords[closest_index,2]
        e_y = math.sin(x_path-math.atan((self.follower_pose_y-self.coords[closest_index,1])/(self.follower_pose_x-self.coords[closest_index,0])))*r_d
        
        x_d = self.x_infi * math.atan(self.k*e_y) + x_path
        r_yaw = abs(x_d - self.yaw)
        """
        if off_road or in_small or collision_done:
            reward = -1 
        else:
            reward = np.clip((0.3*math.pow(0.001,(abs(e_y)*0.6)) + 0.6*r_v - 0.1*r_yaw),-1,1)
        
        
         #rewards[i] = (0.15 + 0.4*((follow_velocity[0,i]-v_desired) / v_desired))
        

        
        
        

        #reward = 0.2*(10.0*r_collision + 8.0*r_off_road*self.follower_v  + r_in_small*8.0*self.follower_v +  r_cmd_phi + r_v - r_d)
        
        #self.follower_v*(math.cos(self.lanePose_phi)-self.lanePose_d)
        # + 0.5*r_d  - 1.0*abs(self.lanePose_phi) 0.8*r_on_left + + min(self.follower_v_x, self.follower_v_y) + r_near_collision *1.5 1.0*abs(self.lanePose_d)  + r_v + min(self.follower_v_x, self.follower_v_y) - r_near_collision *1.0   r_v*(np.cos(self.lanePose_phi)-self.lanePose_d)

        return reward, (off_road_done or collision_done)

    def step(self,action):

    #step function
    #take an action and return updated states
    #return: state, reward, done
        done = False
        car_twist_msg = Twist()
        car_twist_msg.linear.x = (action[0]+1)/2  # into [0,1]
        car_twist_msg.angular.z = action[1]*self.pi   # into [-4,4]  
        self.pub_car_twist.publish(car_twist_msg)     
        self.rate.sleep()
        
        r_d, closest_index = self.closest_node((self.follower_pose_x,self.follower_pose_y), self.coords[:,:2])
        
        x_path = self.coords[closest_index,2]
        
        e_y = math.sin(x_path-math.atan((self.follower_pose_y-self.coords[closest_index,1])/(self.follower_pose_x-self.coords[closest_index,0])))*r_d
            

        x_d = self.x_infi * math.atan(self.k*e_y) + x_path
        
        r_yaw_to_reward = abs(math.cos(x_d) - math.cos(self.yaw))


        if abs(x_d-self.yaw) > 6.0:
            r_yaw = abs(abs(x_d-self.yaw)-6.28)
        else:
            r_yaw = abs(x_d-self.yaw)
        
        if self.d <= 1.5:
            d_v = self.d/(self.follower_v + 0.00001)
        else:
            d_v = 0


        
        
        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/self.pi  # changed from 09.05.2022   from 1.0 to pi
        status3 = self.follower_v/1.0
        status4 = r_yaw/(2*self.pi)
        status5 = abs(e_y)/2.0
        status6 = d_v/15
        status7 = action[0]
        status8 = action[1]
                 
        state = [status1,status2,status3,status4,status5,status6,status7,status8]
        
        reward, done = self.setReward(action,r_yaw_to_reward,e_y)
        return state, reward, done, {}
             
             
             
    def off_road(self,x ,y):

        if (x < self.out_road_x_max and x > self.out_road_x_min) and (y < self.out_road_y_max and y > self.out_road_y_min):
            in_big = True
        else:
            in_big = False 
            
            
        if (x < self.in_road_x_max and x > self.in_road_x_min) and (y < self.in_road_y_max and y > self.in_road_y_min):
            in_small = True
        else:
            in_small = False       
    
        if not in_big:
            out_road = True
        else:
            out_road = False
            
        return out_road, in_small
        
        
        
    def distance_to_trajectory(self,x ,y):

        point = geom.Point(x, y)
            
        return point.distance(self.line)
        
    def get_old_states(self):
    
        return self.follower_pose_x, self.follower_pose_y
    
    def quaternion_to_euler(self, x, y, z, w):
        t3 = +2.0 * (w * z + x * y)
        t4 = +1.0 - 2.0 * (y * y + z * z)
        yaw = math.atan2(t3, t4)
        return yaw
    
    def quaternion_to_euler_(self, x, y, z, w):

        t0 = +2.0 * (w * x + y * z)
        t1 = +1.0 - 2.0 * (x * x + y * y)
        roll = math.atan2(t0, t1)
        t2 = +2.0 * (w * y - z * x)
        t2 = +1.0 if t2 > +1.0 else t2
        t2 = -1.0 if t2 < -1.0 else t2
        pitch = math.asin(t2)
        t3 = +2.0 * (w * z + x * y)
        t4 = +1.0 - 2.0 * (y * y + z * z)
        yaw = math.atan2(t3, t4)
        return [yaw, pitch, roll]
     
    def closest_node(self, node, nodes):
        closest_index = distance.cdist([node], nodes).argmin()
        closest_distance = distance.euclidean([node], nodes[closest_index])
        return closest_distance, closest_index

    def seed(self, seed):
        pass

    def render(self):
        pass



        
            
    
if __name__ == "__main__":
            r = Duckie_Gazebo()
            print (r.setReward())
            r.reset()
            print (r.setReward())





