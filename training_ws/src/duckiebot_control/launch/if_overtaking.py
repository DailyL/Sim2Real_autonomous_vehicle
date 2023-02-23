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


tof_fow = 0.4363323152065277

def states_callback(msg):
    follower_pose_x = msg.pose[3].position.x
    follower_pose_y = msg.pose[3].position.y
    follower_v_x = msg.twist[3].linear.x
    follower_v_y = msg.twist[3].linear.y
    follower_pose_orien_x = msg.pose[3].orientation.x
    follower_pose_orien_y = msg.pose[3].orientation.y
    follower_pose_orien_z = msg.pose[3].orientation.z
    follower_pose_orien_w = msg.pose[3].orientation.w

    leader_pose_x = msg.pose[2].position.x
    leader_pose_y = msg.pose[2].position.y
        
    leader_pose_orien_x = msg.pose[2].orientation.x
    leader_pose_orien_y = msg.pose[2].orientation.y
    leader_pose_orien_z = msg.pose[2].orientation.z
    leader_pose_orien_w = msg.pose[2].orientation.w
        
    follower_v= pow((pow(follower_v_x,2) + pow(follower_v_y,2)),0.5)
        
    yaw = quaternion_to_euler(follower_pose_orien_x, follower_pose_orien_y, follower_pose_orien_z, follower_pose_orien_w)
    leader_yaw = quaternion_to_euler(leader_pose_orien_x, leader_pose_orien_y, leader_pose_orien_z, leader_pose_orien_w)
    d = pow((pow((leader_pose_x-follower_pose_x),2) + pow((leader_pose_y-follower_pose_y),2)),0.5)

    if d <= 1.5:
        if (abs(yaw - leader_yaw) < tof_fow) and (( 2.07 < follower_pose_x < 5.1 and abs(follower_pose_y-leader_pose_y) < 0.3 ) or ((abs(follower_pose_x-leader_pose_x) < 0.3) and 2.07 < follower_pose_y < 3.51)):
                print("do not overtaking")
                d_v = d/(follower_v + 0.00001)

        else:
            print("start overtaking")
            d_v = 0

def quaternion_to_euler(x, y, z, w):
    t3 = +2.0 * (w * z + x * y)
    t4 = +1.0 - 2.0 * (y * y + z * z)
    yaw = math.atan2(t3, t4)
    return yaw

        
def read_tof():

    rospy.init_node("read_tof")
    rate = rospy.Rate(10)

    sub_states = rospy.Subscriber("/gazebo/model_states", ModelStates, states_callback,queue_size = 1)

    rate.sleep()
if __name__ == "__main__":
    try:
        while not rospy.is_shutdown():
            read_tof()       
    
    except rospy.ROSInterruptException:
        print ("Program terminated!")

            











