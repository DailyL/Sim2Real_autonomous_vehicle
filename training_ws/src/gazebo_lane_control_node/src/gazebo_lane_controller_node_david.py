#!/usr/bin/env python
import rospy
import numpy as np
import math
from duckietown_msgs.msg import  Twist2DStamped, LanePose
from geometry_msgs.msg import Twist

class lane_controller(object):
    def __init__(self):
        self.node_name = rospy.get_name()
        self.turn_d = -10
        self.turn_phi = -3

        self.gain = 0.55

        # Publicaiton
        self.pub_car_twist = rospy.Publisher("~cmd_vel", Twist2DStamped, queue_size=1)
        # Subscriptions
        self.sub_lane_reading = rospy.Subscriber("~lane_pose", LanePose, self.cbPose, queue_size=1)

        # safe shutdown
        rospy.on_shutdown(self.custom_shutdown)

        # timer
        rospy.loginfo("[%s] Initialized " %(rospy.get_name()))

    def custom_shutdown(self):
        rospy.loginfo("[%s] Shutdown" %(rospy.get_name()))
        rospy.sleep(0.5)
        car_twist_msg = Twist2DStamped()
        car_twist_msg.v = 0
        car_twist_msg.omega = 0
        self.pub_car_twist.publish(car_twist_msg)
        rospy.sleep(0.5)

    def cbPose(self,lane_pose_msg):

        turn = self.turn_phi * lane_pose_msg.phi + self.turn_d * lane_pose_msg.d
        #print ("phi = " + str(self.turn_phi * lane_pose_msg.phi) + ", d = " + str(self.turn_d * lane_pose_msg.d))
        car_twist_msg = Twist2DStamped()
        car_twist_msg.v = self.gain
        car_twist_msg.omega = turn
        self.pub_car_twist.publish(car_twist_msg)


if __name__ == "__main__":
    rospy.init_node("lane_controller",anonymous=False)
    lane_control_node = lane_controller()
    rospy.spin()
