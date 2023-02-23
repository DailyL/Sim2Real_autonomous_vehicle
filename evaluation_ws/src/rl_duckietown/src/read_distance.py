#!/usr/bin/env python

import sys
import rospy
import numpy as np


from sensor_msgs.msg import LaserScan




class Read_distance(object):
    def __init__(self):
        #init code
        rospy.init_node("Read_distance_from_lidar")
        self.sub_distance= rospy.Subscriber("~scan", LaserScan, self.distance_callback,queue_size = 10)
        self.distance = []
    def distance_callback(self, msg):

        self.distance = msg.ranges
        print(min(self.distance))
    def return_smallst_distance(self):

    	print(self.distance)

            
    def run(self):
        print(self.distance)

if __name__ == "__main__":
    r = Read_distance()
    while not rospy.is_shutdown():  
        rospy.spin()