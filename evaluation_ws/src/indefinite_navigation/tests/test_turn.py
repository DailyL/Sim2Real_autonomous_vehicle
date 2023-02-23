#!/usr/bin/env python3
from std_srvs.srv import Empty

import rospy
import rostest
import unittest
from duckietown_msgs.msg import BoolStamped, FSMState, LanePose, Twist2DStamped


class IndefNavigationTurnNode(unittest.TestCase):
    def __init__(self, *args):
        super(IndefNavigationTurnNode, self).__init__(*args)
        # self.setup()

    def setup(self):
        # give lane_filter some time to start before beginning
        rospy.sleep(8)
        rospy.init_node("indef_navigation_turn_node", anonymous=False)
        # Save the name of the node
        self.node_name = rospy.get_name()

        rospy.loginfo(f"[{self.node_name}] Initializing.")
        veh_name = self.setupParam("~veh", "")
        self.type = self.setupParam("~type", "right")
        lane_topic = "/" + veh_name + "/lane_filter_node/lane_pose"
        done_topic = "/" + veh_name + "/open_loop_intersection_control_node/intersection_done"
        mode_topic = "/" + veh_name + "/open_loop_intersection_control_node/mode"
        left_service = "/" + veh_name + "/open_loop_intersection_control_node/turn_left"
        right_service = "/" + veh_name + "/open_loop_intersection_control_node/turn_right"
        forward_service = "/" + veh_name + "/open_loop_intersection_control_node/turn_forward"
        wheels_cmd = "/" + veh_name + "/open_loop_intersection_control_node/car_cmd"
        self.lane = None
        self.done = None

        self.publish_mode = rospy.Publisher(mode_topic, FSMState, queue_size=1)
        self.pub_wheels = rospy.Publisher(wheels_cmd, Twist2DStamped, queue_size=1)
        self.sub_lane = rospy.Subscriber(lane_topic, LanePose, self.cbLane, queue_size=1)
        self.sub_done = rospy.Subscriber(done_topic, BoolStamped, self.cbDone, queue_size=1)

        rospy.wait_for_service(left_service)
        self.turn_left_serv = rospy.ServiceProxy(left_service, Empty)

        rospy.wait_for_service(right_service)
        self.turn_right_serv = rospy.ServiceProxy(right_service, Empty)

        rospy.wait_for_service(forward_service)
        self.turn_forward_serv = rospy.ServiceProxy(forward_service, Empty)

        self.rate = rospy.Rate(30)  # 10hz
        rospy.loginfo(f"[{self.node_name}] Initialized.")

    def setupParam(self, param_name, default_value):
        value = rospy.get_param(param_name, default_value)
        rospy.set_param(param_name, value)  # Write to parameter server for transparancy
        rospy.loginfo(f"[{self.node_name}] {param_name} = {value} ")
        return value

    def cbLane(self, data):
        self.lane = data

    def cbDone(self, data):
        self.done = data.data or self.done

    def test_turn(self):
        self.setup()
        mode = FSMState()
        mode.state = "INTERSECTION_CONTROL"
        startTime = rospy.Time.now()
        endTime = startTime + rospy.Duration.from_sec(0.2)
        while rospy.Time.now() < endTime:
            self.publish_mode.publish(mode)
        # need to wait 1 second before publishing new turn type
        rospy.sleep(1)
        if self.type.lower() == "left":
            self.turn_left_serv()
        elif self.type.lower() == "right":
            self.turn_right_serv()
        else:
            self.turn_forward_serv()

        count = 0
        while not self.done:
            count += 1
            rospy.loginfo("Waiting for intersection_done")
            rospy.sleep(0.2)
            if count > 50:
                self.assertEqual(True, False, "Timed out waiting for intersection")
                return

        stop = Twist2DStamped()
        stop.v = 0
        stop.omega = 0
        startTime = rospy.Time.now()
        end_time = startTime + rospy.Duration.from_sec(1)
        rospy.loginfo(f"start_time = {startTime}, end_time={end_time}")
        while rospy.Time.now() < end_time:
            self.pub_wheels.publish(stop)
            rospy.sleep(0.1)
        self.final = self.lane
        self.calculate()

    def calculate(self):
        init_d = 0.0
        init_phi = 0.0

        final_d = self.final.d
        final_phi = self.final.phi

        off_d = abs(init_d - final_d)
        off_phi = abs(init_phi - final_phi)
        result_trim = "FAILED"

        if abs(off_d) < 0.08:
            result_trim = "PASSED"

        info = f"""
        TURN RESULT
        ===================
        Goal location is ({init_d:.4f}, {init_phi:.4f}), 
        final location is ({final_d:.4f}, {final_phi:.4f}).
        
        distance offset = {off_d:.4f}
        distance angle offset = {off_phi:.4f}
        TURN TEST {result_trim: }
        """
        print(info)
        self.assertEqual(result_trim, "PASSED", info)


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("indef_navigation_turn_node", anonymous=False)

    rostest.rosrun("rostest_turn_calibration", "indef_navigation_turn_node", IndefNavigationTurnNode)
