#!/usr/bin/env python

import rospy
import roslaunch
import numpy as np
import random
import math
from random import choice
from geometry_msgs.msg import Twist, Pose
from std_srvs.srv import Empty
from sensor_msgs.msg import LaserScan
from gym.utils import seeding
from gazebo_msgs.srv import SpawnModel, DeleteModel, GetModelState, GetModelStateRequest

from controller_manager_msgs.srv import LoadController, SwitchController,SwitchControllerRequest





goal = rospy.ServiceProxy('/gazebo/spawn_urdf_model', SpawnModel)

del_model = rospy.ServiceProxy('/gazebo/delete_model', DeleteModel)
reset_proxy = rospy.ServiceProxy('/gazebo/reset_world', Empty)

unpause = rospy.ServiceProxy('/gazebo/unpause_physics', Empty)
pause = rospy.ServiceProxy('/gazebo/pause_physics', Empty)


rospy.wait_for_service('/gazebo/delete_model')

del_model(str('duckiebot_david'))


# Build the target
rospy.wait_for_service('/gazebo/spawn_urdf_model')

init_pose = Pose()



goal_urdf = open("/home/dianzhaoli/duckie_catkin_ws/src/robot/mobile_bot/urdf/mobile_bot_david.urdf", "r").read()


target = SpawnModel
target.model_name = str('duckiebot_david')
target.model_xml = goal_urdf


position = np.zeros((7,2))

position[0,0] = 3.311
position[1,0] = 1.466
position[2,0] = 0.24
position[3,0] = 0
position[4,0] = 0
position[5,0] = 1
position[6,0] = 0



position[0,1] = 1.16
position[1,1] = 0.77
position[2,1] = 0.24
position[3,1] = 0
position[4,1] = 0
position[5,1] = 0
position[6,1] = 1

index = choice([0,1])



init_pose.position.x = position[0,index] 
init_pose.position.y = position[1,index]
init_pose.position.z = 0.24

init_pose.orientation.x = position[3,index]
init_pose.orientation.y = position[4,index]
init_pose.orientation.z = position[5,index]
init_pose.orientation.w = position[6,index]



goal(target.model_name, target.model_xml, '/david', init_pose, 'world')





rospy.wait_for_service('/david/controller_manager/load_controller')

s = rospy.ServiceProxy('/david/controller_manager/load_controller', LoadController)
switch_srv = rospy.ServiceProxy('/david/controller_manager/switch_controller', SwitchController)

controller_load = LoadController()
controller_name = str("david/velocity_controller")

resp=s(controller_name)
        


scr = SwitchControllerRequest()
scr.start_controllers.append('david/velocity_controller')




resp = switch_srv.call(scr)