#!/usr/bin/env python3

import math
import time
import numpy as np
import rospy
from duckietown_msgs.msg import Twist2DStamped
import time
import numpy as np
import sys



class lane_controller(object):

    def __init__(self):
        self.node_name = rospy.get_name()
        self.lane_reading = None
        self.last_ms = None
        self.pub_counter = 0
        self.controller = Controller()

        self.velocity_to_m_per_s = 0.67
        self.omega_to_rad_per_s = 0.45 * 2 * math.pi

        # Setup parameters
        self.velocity_to_m_per_s = 1.53
        self.omega_to_rad_per_s = 4.75
        self.setGains()

        # Publication
        self.pub_car_cmd = rospy.Publisher("~car_cmd", Twist2DStamped, queue_size=1)
        # safe shutdown
        rospy.on_shutdown(self.custom_shutdown)

        # timer
        self.gains_timer = rospy.Timer(rospy.Duration.from_sec(0.1), self.getGains_event)
        # rospy.loginfo("[%s] Initialized " % (rospy.get_name()))

        self.stop_line_distance = 999
        self.stop_line_detected = False
        
    def sendStop(self):
        # Send stop command
        car_control_msg = Twist2DStamped()
        car_control_msg.v = 1.0
        car_control_msg.omega = 0.0
        self.publishCmd(car_control_msg)        
        rospy.sleep(0.5)
        

if __name__ == '__main__':
    # create the node
    rospy.init_node("lane_controller_node", anonymous=False)
    control_node = lane_controller()
    # run node
    control_node.sendStop()
    # keep spinning
    rospy.spin()
