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
        self.sub_collision = rospy.Subscriber("~collision", ContactsState, self.collision_callback,queue_size = 1)
        self.sub_states = rospy.Subscriber("/gazebo/model_states", ModelStates, self.states_callback,queue_size = 1)
        self.sub_lane_pose = rospy.Subscriber("~lane_pose", LanePose, self.lane_pose_callback, queue_size=1)
        self.lanewidth = 0.23
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
        self.follower_pose_x_pre = 1.0961583516695363
        self.follower_pose_y_pre = 0.7700045782607453
        self.coords = np.loadtxt('/home/dianzhaoli/duckie_catkin_ws/src/ddpg_lanefollowing/src/aver_trajectory.txt')
        self.line = geom.LineString(self.coords)
        self.reset()
        
    def collision_callback(self, msg):
        if (msg.states != []):    
            self.collision = True
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
            self.lanePose_d = -1
            self.lanePose_phi = -1
    def reset(self):  
    
    #reseat function to reset simulation
    #return the initial states after reset
    #return: states                       
        reset_world = rospy.ServiceProxy('gazebo/reset_world', Empty)

        rospy.wait_for_service('gazebo/reset_world')
        reset_world()
        
        #get initial states
        
        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/1.0 
        status3 = self.follower_v/1.0
        status4 = (self.follower_pose_x - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status5 = (self.follower_pose_y - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status6 = (self.follower_pose_x_pre - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status7 = (self.follower_pose_y_pre - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status8 = (self.leader_pose_x - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status9 = (self.leader_pose_y - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status10 = 0
        status11 = 0
        
                
        state = [status1,status2,status3,status4,status5,status6,status7,status8,status9,status10,status11]
        
        
        return state
	 
                           
    def setReward(self,action):
    
        if self.collision:
            collision_done = True
            r_collision = -1
            self.collision = False
        else:
            collision_done = False
            r_collision = 0          
        
        off_road, in_small = self.off_road(self.follower_pose_x, self.follower_pose_y)
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
                
 
        if abs(action[0,1]*4.0) >= 2.0:
            r_cmd_phi = - (abs(action[0,1]*4.0)-2)
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
        r_d = self.distance_to_trajectory(self.follower_pose_x, self.follower_pose_y)
        reward = (2.0*r_collision + 1.5*r_off_road + r_in_small*1.0 + (1-r_d/0.2) +  r_cmd_phi+ r_v)*0.5
        #reward = 0.2*(10.0*r_collision + 8.0*r_off_road*self.follower_v  + r_in_small*8.0*self.follower_v +  r_cmd_phi + r_v - r_d)
        
        #self.follower_v*(math.cos(self.lanePose_phi)-self.lanePose_d)
        # + 0.5*r_d  - 1.0*abs(self.lanePose_phi) 0.8*r_on_left + + min(self.follower_v_x, self.follower_v_y) + r_near_collision *1.5 1.0*abs(self.lanePose_d)  + r_v + min(self.follower_v_x, self.follower_v_y) - r_near_collision *1.0   r_v*(np.cos(self.lanePose_phi)-self.lanePose_d)

        return reward, (collision_done or off_road_done)

    def step(self,action):

    #step function
    #take an action and return updated states
    #return: state, reward, done
        done = False
        car_twist_msg = Twist()
        car_twist_msg.linear.x = action[0,0]  # into [0,1]
        car_twist_msg.angular.z = action[0,1]*4.0     # into [-4,4]  
        self.pub_car_twist.publish(car_twist_msg)     
        self.rate.sleep()
             
        
        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/1.0 
        status3 = self.follower_v/1.0
        status4 = (self.follower_pose_x - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status5 = (self.follower_pose_y - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status6 = (self.follower_pose_x_pre - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status7 = (self.follower_pose_y_pre - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status8 = (self.leader_pose_x - self.out_road_x_min)/(self.out_road_x_max - self.out_road_x_min)
        status9 = (self.leader_pose_y - self.out_road_y_min)/(self.out_road_y_max - self.out_road_y_min)
        status10 = action[0,0]
        status11 = action[0,1]*4.0
                 
        state = [status1,status2,status3,status4,status5,status6,status7,status8,status9,status10,status11]
        
        reward, done = self.setReward(action)
        self.follower_pose_x_pre,self.follower_pose_y_pre = self.get_old_states()    
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
        
            
    
if __name__ == "__main__":
            r = Duckie_Gazebo()
            print (r.setReward())
            r.reset()
            print (r.setReward())





