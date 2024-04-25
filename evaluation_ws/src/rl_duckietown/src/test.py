#!/usr/bin/env python
import rospy
from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped, LanePose, VehicleCorners
import numpy as np
import os
import cv2
from cv_bridge import CvBridge, CvBridgeError
from env import launch_env

class ROSAgent(object):
    def __init__(self):
       

        # Use our env launcher
        self.env = launch_env()

        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(50)
        self.action = np.array([0, 0])

    def spin(self):
        """
        Main loop
        Steps the sim with the last action at rate of 10Hz
        """
        while not rospy.is_shutdown():
            fea, img, r , d, _ = self.env.step(self.action)
            print(r)
            self.env.render()
            if d:
                self.env.reset()
            self.env._publish_img(img)
            self.env._publish_info()
            self.r.sleep()

if __name__ == "__main__":
    # Initializes the node
    rospy.init_node('ROSAgent')
    r = ROSAgent()
    r.spin()

