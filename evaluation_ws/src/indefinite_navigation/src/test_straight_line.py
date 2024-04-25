#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import LanePose, StopLineReading, Twist2DStamped


class IndefNavigationNode:
    def __init__(self):
        # Save the name of the node
        self.node_name = rospy.get_name()

        rospy.loginfo(f"[{self.node_name}] Initializing.")
        veh_name = self.node_name.split("/")[1]
        wheel_topic = "/" + veh_name + "/joy_mapper_node/car_cmd"
        lane_topic = "/" + veh_name + "/lane_filter_node/lane_pose"
        stop_topic = "/" + veh_name + "/stop_line_filter_node/stop_line_reading"

        self.lane = None
        self.stop = None
        self.forward_time = 4.8

        self.pub_wheels_cmd = rospy.Publisher(wheel_topic, Twist2DStamped, queue_size=1)
        self.sub_lane = rospy.Subscriber(lane_topic, LanePose, self.cbLane, queue_size=1)
        self.sub_stop = rospy.Subscriber(stop_topic, StopLineReading, self.cbStop, queue_size=1)

        rospy.loginfo(f"[{self.node_name}] Initialzed.")

        self.rate = rospy.Rate(30)  # 10hz

    def cbLane(self, data):
        self.lane = data

    def cbStop(self, data):
        self.stop = data

    def driveForward(self):
        # move forward
        for i in range(3):
            if self.lane is None or self.stop is None:
                rospy.loginfo("still waiting for lane and stop line")
                rospy.sleep(1)
        if self.lane is None or self.stop is None:
            rospy.loginfo("could not subscribe to lane and stop line")
            return

        # Measured dist for stop as 146+8cm cm physically
        self.init = self.lane, -1.54
        forward_for_time = self.forward_time
        starting_time = rospy.Time.now()
        while (rospy.Time.now() - starting_time) < rospy.Duration(forward_for_time):
            wheels_cmd_msg = Twist2DStamped()
            wheels_cmd_msg.header.stamp = rospy.Time.now()
            wheels_cmd_msg.v = 0.5
            wheels_cmd_msg.omega = 0.0
            self.pub_wheels_cmd.publish(wheels_cmd_msg)
            # rospy.loginfo("Moving?.")
            self.rate.sleep()
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


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("indef_navigation_node", anonymous=False)

    # Create the NodeName object
    node = IndefNavigationNode()
    # raw_input("drive forward?")
    node.driveForward()
