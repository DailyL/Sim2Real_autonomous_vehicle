#!/usr/bin/env python
from sensor_msgs.msg import CompressedImage
import numpy as np
import os
import tty,termios
import sys
import rospy
from std_msgs.msg import String
from duckietown_msgs.msg import Twist2DStamped 
from geometry_msgs.msg import Twist 

import cv2
import threading
import time


class keyboard_controller():

    def __init__(self):
        self.rate = rospy.Rate(50) # 10hz

    def move(self):
        fd = sys.stdin.fileno()
        old_ttyinfo = termios.tcgetattr(fd)
        tty.setraw(fd)
        self.pub = rospy.Publisher('~cmd', Twist, queue_size=10)
        count = 1

        while not rospy.is_shutdown():
            self.msg = Twist()
            ch = sys.stdin.read(1)
            if ch == 'a' or 'D' in ch:
                print("left\n")
                self.msg.linear.x = 0.75
                self.msg.angular.z = 0.8
            elif ch == 'd' or 'C' in ch:
                print("right\n")
                self.msg.linear.x = 0.75
                self.msg.angular.z = -0.8
            elif ch == 'w' or 'A' in ch:
                print("forward\n")
                self.msg.linear.x = 0.75	    
            elif ch == 's' or 'B' in ch:
                print("back\n")
                self.msg.linear.x = -0.75
            elif ch == ' ':
                print("stop\n")
                self.msg.linear.x = 0
                self.msg.angular.z = 0
            elif ch == 'q':
                self.msg.linear.x = 0
                self.msg.angular.z = 0
                pub.publish(self.msg)
                print ("quit")
                return 0
            else:
                continue
            log = "succeed v:" + str(self.msg.linear.x) + "\r"
            rospy.loginfo(log)
            self.pub.publish(self.msg)
            self.rate.sleep()
        termios.tcsetattr(fd, termios.TCSADRAIN, old_ttyinfo)
    """
    def camera_callback(rosdata):
        np_arr = np.fromstring(rosdata.data, np.uint8)
        image_np = cv2.imdecode(np_arr, 1)
        cv2.imshow('image', image_np)
        cv2.waitKey(1)
    

    def camera():
        rospy.Subscriber("/pepe1/duckbot/camera1/image_raw/compressed", CompressedImage, camera_callback)
        rospy.spin()
    """        
    
    
    
    """
        threads = []
        t1 = threading.Thread(target=camera)
        threads.append(t1)
        t2 = threading.Thread(target=move)
        threads.append(t2)
    """
if __name__ == '__main__':
    try:
        rospy.init_node('duckie_keyboard', anonymous=True)
        control_node = keyboard_controller()
        control_node.move()
    except rospy.ROSInterruptException:
        pass
