#!/usr/bin/env python3
import time

import rospy
import rostest
import unittest
from duckietown_msgs.msg import LanePose, StopLineReading, Twist2DStamped


class KinematicsTestNode(unittest.TestCase):
    def __init__(self, *args):
        super(KinematicsTestNode, self).__init__(*args)

    def setup(self):

        rospy.init_node("kinematics_test_node", anonymous=False)

        veh_name = rospy.get_param("~veh", "")
        wheel_topic = "/" + veh_name + "/joy_mapper_node/car_cmd"
        lane_topic = "/" + veh_name + "/lane_filter_node/lane_pose"
        stop_topic = "/" + veh_name + "/stop_line_filter_node/stop_line_reading"

        rospy.loginfo("wheel topic = %s", wheel_topic)
        rospy.loginfo("lane topic = %s", lane_topic)
        rospy.loginfo("stop_topic = %s", stop_topic)

        self.lane = None
        self.stop = None
        self.lane_message_received = False
        self.stop_message_received = False

        self.forward_time = 4.8

        self.pub_wheels_cmd = rospy.Publisher(wheel_topic, Twist2DStamped, queue_size=1)
        self.sub_lane = rospy.Subscriber(lane_topic, LanePose, self.cbLane)
        self.sub_stop = rospy.Subscriber(stop_topic, StopLineReading, self.cbStop)

        timeout = time.time() + 10.0  # was 10
        while (
            not (self.lane_message_received or self.stop_message_received)
            and not rospy.is_shutdown()
            and time.time() < timeout
        ):
            rospy.sleep(0.1)

        self.assertTrue(self.lane_message_received)
        self.assertTrue(self.stop_message_received)

    def cbLane(self, data):
        self.lane_message_received = True
        self.lane = data

    def cbStop(self, data):
        self.stop_message_received = True
        self.stop = data

    def test_drive_forward(self):
        self.setup()
        # move forward
        for i in range(100):
            if self.lane == None or self.stop == None:
                rospy.loginfo("still waiting for lane and stop line")
                rospy.sleep(1)
        if self.lane == None or self.stop == None:
            rospy.loginfo("could not subscribe to lane and stop line")
            self.assertTrue(False)

        # Measured dist for stop as 146+8cm cm physically
        self.init = self.lane, -1.54
        forward_for_time = self.forward_time
        starting_time = rospy.Time.now()
        while (rospy.Time.now() - starting_time) < rospy.Duration(
            forward_for_time
        ):  # FIXME: this is an int. Will be interpreted as 4 or 5 -> precision problem!
            wheels_cmd_msg = Twist2DStamped()
            wheels_cmd_msg.header.stamp = rospy.Time.now()
            wheels_cmd_msg.v = 0.5
            wheels_cmd_msg.omega = 0.0
            self.pub_wheels_cmd.publish(wheels_cmd_msg)
            # rospy.loginfo("Moving?.")
            rospy.sleep(0.1)
        wheels_cmd_msg = Twist2DStamped()
        wheels_cmd_msg.header.stamp = rospy.Time.now()
        wheels_cmd_msg.v = 0.0
        wheels_cmd_msg.omega = 0.0
        self.pub_wheels_cmd.publish(wheels_cmd_msg)
        self.final = self.lane, self.stop
        self.calculate()

    def calculate(self):

        init_d = self.init[0].d
        init_phi = self.init[0].phi

        final_d = self.final[0].d
        final_phi = self.final[0].phi

        off_d = abs(init_d - final_d)
        off_phi = abs(init_phi - final_phi)
        result_trim = "FAILED"

        if abs(off_d) < 0.08:
            result_trim = "PASSED"

        init_stop_y = self.init[1]
        final_stop_y = self.final[1].stop_line_point.y

        velocity = abs(init_stop_y - final_stop_y) / self.forward_time
        result_vel = "FAILED"
        vel_diff = abs(velocity - 0.304166666666666666666666666666666666)
        if vel_diff < 0.015:
            result_vel = "PASSED"
        info = """
        LANE OFFSET SUMMARY
        ===================
        initial location is (%.4f, %.4f),
        final location is (%.4f, %.4f).

        distance offset = %.4f
        distance angle offset = %.4f
        TRIM TEST % s
        Note: pose angle offset does not factor into the trim test.

        VELOCITY OFFSET SUMMARY
        ======================
        initial stop sign y offset: %.4f
        final stop sign y offset: %.4f
        velocity computed: %.4f
        velocity diff from expected: %.4f
        VELOCITY TEST: %s

        """ % (
            init_d,
            init_phi,
            final_d,
            final_phi,
            off_d,
            off_phi,
            result_trim,
            init_stop_y,
            final_stop_y,
            velocity,
            vel_diff,
            result_vel,
        )
        print(info)
        self.assertEqual(result_trim, "PASSED", info)


if __name__ == "__main__":
    rostest.rosrun("rostest_kinematics_calibration", "kinematics_test_node", KinematicsTestNode)
