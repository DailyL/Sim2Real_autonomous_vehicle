#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import IntersectionDetection

if __name__ == "__main__":
    node = rospy.init_node("fake_intersection_detection", anonymous=True)
    intersection_pub = rospy.Publisher("~intersection_detection", IntersectionDetection, queue_size=10)

    rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        intersection_pub.publish(IntersectionDetection(type=IntersectionDetection.STOP))
        rate.sleep()
