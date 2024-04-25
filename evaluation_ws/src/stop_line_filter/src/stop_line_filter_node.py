#!/usr/bin/env python3
import numpy as np

import rospy
from duckietown.dtros import DTParam, DTROS, NodeType, ParamType
from duckietown_msgs.msg import BoolStamped, FSMState, LanePose, SegmentList, StopLineReading
from geometry_msgs.msg import Point


# import math


class StopLineFilterNode(DTROS):
    def __init__(self, node_name):
        # Initialize the DTROS parent class
        super(StopLineFilterNode, self).__init__(node_name=node_name, node_type=NodeType.PERCEPTION)

        # Initialize the parameters
        self.stop_distance = DTParam("~stop_distance", param_type=ParamType.FLOAT)
        self.min_segs = DTParam("~min_segs", param_type=ParamType.INT)
        self.off_time = DTParam("~off_time", param_type=ParamType.FLOAT)
        self.max_y = DTParam("~max_y", param_type=ParamType.FLOAT)

        ## params
        # self.stop_distance = self.setupParam("~stop_distance", 0.22) # distance from the stop line that we should stop
        # self.min_segs      = self.setupParam("~min_segs", 2) # minimum number of red segments that we should detect to estimate a stop
        # self.off_time      = self.setupParam("~off_time", 2)
        # self.max_y         = self.setupParam("~max_y ", 0.2) # If y value of detected red line is smaller than max_y we will not set at_stop_line true.

        ## state vars
        self.lane_pose = LanePose()

        self.state = "JOYSTICK_CONTROL"
        self.sleep = False

        ## publishers and subscribers
        self.sub_segs = rospy.Subscriber("~segment_list", SegmentList, self.cb_segments)
        self.sub_lane = rospy.Subscriber("~lane_pose", LanePose, self.cb_lane_pose)
        self.sub_mode = rospy.Subscriber("fsm_node/mode", FSMState, self.cb_state_change)
        self.pub_stop_line_reading = rospy.Publisher("~stop_line_reading", StopLineReading, queue_size=1)
        self.pub_at_stop_line = rospy.Publisher("~at_stop_line", BoolStamped, queue_size=1)

    # def setupParam(self,param_name,default_value):
    #     value = rospy.get_param(param_name,default_value)
    #     rospy.set_param(param_name,value) #Write to parameter server for transparancy
    #     rospy.loginfo("[%s] %s = %s " %(self.node_name,param_name,value))
    #     return value
    #
    # def updateParams(self,event):
    #     self.stop_distance = rospy.get_param("~stop_distance")
    #     self.min_segs      = rospy.get_param("~min_segs")
    #     self.off_time      = rospy.get_param("~off_time")
    #     self.max_y         = rospy.get_param("~max_y")

    def cb_state_change(self, msg):
        if (self.state == "INTERSECTION_CONTROL") and (msg.state == "LANE_FOLLOWING"):
            self.after_intersection_work()
        self.state = msg.state

    def after_intersection_work(self):
        self.loginfo("Blocking stop line detection after the intersection")
        stop_line_reading_msg = StopLineReading()
        stop_line_reading_msg.stop_line_detected = False
        stop_line_reading_msg.at_stop_line = False
        self.pub_stop_line_reading.publish(stop_line_reading_msg)
        self.sleep = True
        rospy.sleep(self.off_time.value)
        self.sleep = False
        self.loginfo("Resuming stop line detection after the intersection")

    # def cbSwitch(self, switch_msg):
    #     self.active = switch_msg.data
    #     if self.active and self.state == "INTERSECTION_CONTROL":
    #         self.after_intersection_work()
    #
    #

    def cb_lane_pose(self, lane_pose_msg):
        self.lane_pose = lane_pose_msg

    def cb_segments(self, segment_list_msg):

        if not self.switch or self.sleep:
            return

        good_seg_count = 0
        stop_line_x_accumulator = 0.0
        stop_line_y_accumulator = 0.0
        for segment in segment_list_msg.segments:
            if segment.color != segment.RED:
                continue
            if segment.points[0].x < 0 or segment.points[1].x < 0:  # the point is behind us
                continue

            p1_lane = self.to_lane_frame(segment.points[0])
            p2_lane = self.to_lane_frame(segment.points[1])
            avg_x = 0.5 * (p1_lane[0] + p2_lane[0])
            avg_y = 0.5 * (p1_lane[1] + p2_lane[1])
            stop_line_x_accumulator += avg_x
            stop_line_y_accumulator += avg_y  # TODO output covariance and not just mean
            good_seg_count += 1.0

        stop_line_reading_msg = StopLineReading()
        stop_line_reading_msg.header.stamp = segment_list_msg.header.stamp
        if good_seg_count < self.min_segs.value:
            stop_line_reading_msg.stop_line_detected = False
            stop_line_reading_msg.at_stop_line = False
            self.pub_stop_line_reading.publish(stop_line_reading_msg)

            # ### CRITICAL: publish false to at stop line output_topic
            # msg = BoolStamped()
            # msg.header.stamp = stop_line_reading_msg.header.stamp
            # msg.data = False
            # self.pub_at_stop_line.publish(msg)
            # ### CRITICAL END

        else:
            stop_line_reading_msg.stop_line_detected = True
            stop_line_point = Point()
            stop_line_point.x = stop_line_x_accumulator / good_seg_count
            stop_line_point.y = stop_line_y_accumulator / good_seg_count
            stop_line_reading_msg.stop_line_point = stop_line_point
            # Only detect redline if y is within max_y distance:
            stop_line_reading_msg.at_stop_line = (
                stop_line_point.x < self.stop_distance.value and np.abs(stop_line_point.y) < self.max_y.value
            )

            self.pub_stop_line_reading.publish(stop_line_reading_msg)
            if stop_line_reading_msg.at_stop_line:
                msg = BoolStamped()
                msg.header.stamp = stop_line_reading_msg.header.stamp
                msg.data = True
                self.pub_at_stop_line.publish(msg)

    def to_lane_frame(self, point):
        p_homo = np.array([point.x, point.y, 1])
        phi = self.lane_pose.phi
        d = self.lane_pose.d
        T = np.array([[np.cos(phi), -np.sin(phi), 0], [np.sin(phi), np.cos(phi), d], [0, 0, 1]])
        p_new_homo = T.dot(p_homo)
        p_new = p_new_homo[0:2]
        return p_new

    # def onShutdown(self):
    #     rospy.loginfo("[StopLineFilterNode] Shutdown.")


if __name__ == "__main__":
    lane_filter_node = StopLineFilterNode(node_name="stop_line_filter")
    rospy.spin()
