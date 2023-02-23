#!/usr/bin/env python3
import json

import rospy
from duckietown_msgs.msg import BoolStamped, FSMState, LanePose, TurnIDandType
from std_msgs.msg import String


class UnicornIntersectionNode:
    def __init__(self):
        self.node_name = "Unicorn Intersection Node"

        ## setup Parameters
        self.setupParams()

        ## Internal variables
        self.state = "JOYSTICK_CONTROL"
        self.active = False
        self.turn_type = -1
        self.tag_id = -1
        self.forward_pose = False

        ## Subscribers
        # self.sub_turn_type = rospy.Subscriber("~turn_type", Int16, self.cbTurnType)
        self.sub_turn_type = rospy.Subscriber("~turn_id_and_type", TurnIDandType, self.cbTurnType)
        self.sub_fsm = rospy.Subscriber("~fsm_state", FSMState, self.cbFSMState)
        self.sub_int_go = rospy.Subscriber("~intersection_go", BoolStamped, self.cbIntersectionGo)
        self.sub_lane_pose = rospy.Subscriber("~lane_pose_in", LanePose, self.cbLanePose)
        self.sub_switch = rospy.Subscriber("~switch", BoolStamped, self.cbSwitch, queue_size=1)

        ## Publisher
        self.pub_int_done = rospy.Publisher("~intersection_done", BoolStamped, queue_size=1)
        self.pub_LF_params = rospy.Publisher("~lane_filter_params", String, queue_size=1)
        self.pub_lane_pose = rospy.Publisher("~lane_pose_out", LanePose, queue_size=1)
        self.pub_int_done_detailed = rospy.Publisher(
            "~intersection_done_detailed", TurnIDandType, queue_size=1
        )

        ## update Parameters timer
        self.params_update = rospy.Timer(rospy.Duration.from_sec(1.0), self.updateParams)

    def cbLanePose(self, msg):
        if self.forward_pose:
            self.pub_lane_pose.publish(msg)

    def changeLFParams(self, params, reset_time):
        data = {"params": params, "time": reset_time}
        msg = String()
        msg.data = json.dumps(data)
        self.pub_LF_params.publish(msg)

    def cbIntersectionGo(self, msg):
        rospy.loginfo("[%s] Recieved intersection go message from coordinator", self.node_name)
        if not self.active:
            return

        if not msg.data:
            return

        while self.turn_type == -1:
            if not self.active:
                return
            rospy.loginfo(
                "[%s] Requested to start intersection, but we do not see an april tag yet.", self.node_name
            )
            rospy.sleep(2)

        tag_id = self.tag_id
        turn_type = self.turn_type

        sleeptimes = [self.time_left_turn, self.time_straight_turn, self.time_right_turn]
        LFparams = [self.LFparams_left, self.LFparams_straight, self.LFparams_right]
        omega_ffs = [self.ff_left, self.ff_straight, self.ff_right]
        omega_maxs = [self.omega_max_left, self.omega_max_straight, self.omega_max_right]
        omega_mins = [self.omega_min_left, self.omega_min_straight, self.omega_min_right]

        self.changeLFParams(LFparams[turn_type], sleeptimes[turn_type] + 1.0)
        rospy.set_param("~lane_controller/omega_ff", omega_ffs[turn_type])
        rospy.set_param("~lane_controller/omega_max", omega_maxs[turn_type])
        rospy.set_param("~lane_controller/omega_min", omega_mins[turn_type])
        # Waiting for LF to adapt to new params
        rospy.sleep(1)

        rospy.loginfo("Starting intersection control - driving to " + str(turn_type))
        self.forward_pose = True

        rospy.sleep(sleeptimes[turn_type])

        self.forward_pose = False
        rospy.set_param("~lane_controller/omega_ff", 0)
        rospy.set_param("~lane_controller/omega_max", 999)
        rospy.set_param("~lane_controller/omega_min", -999)

        # Publish intersection done
        msg_done = BoolStamped()
        msg_done.data = True
        self.pub_int_done.publish(msg_done)

        # Publish intersection done detailed
        msg_done_detailed = TurnIDandType()
        msg_done_detailed.tag_id = tag_id
        msg_done_detailed.turn_type = turn_type
        self.pub_int_done_detailed.publish(msg_done_detailed)

    def cbFSMState(self, msg):
        if self.state != msg.state and msg.state == "INTERSECTION_COORDINATION":
            self.turn_type = -1

        self.state = msg.state

    def cbSwitch(self, switch_msg):
        self.active = switch_msg.data

    def cbTurnType(self, msg):
        self.tag_id = msg.tag_id
        if self.turn_type == -1:
            self.turn_type = msg.turn_type
        if self.debug_dir != -1:
            self.turn_type = self.debug_dir

    def setupParams(self):
        self.time_left_turn = self.setupParam("~time_left_turn", 2)
        self.time_straight_turn = self.setupParam("~time_straight_turn", 2)
        self.time_right_turn = self.setupParam("~time_right_turn", 2)
        self.ff_left = self.setupParam("~ff_left", 1.5)
        self.ff_straight = self.setupParam("~ff_straight", 0)
        self.ff_right = self.setupParam("~ff_right", -1)
        self.LFparams_left = self.setupParam("~LFparams_left", 0)
        self.LFparams_straight = self.setupParam("~LFparams_straight", 0)
        self.LFparams_right = self.setupParam("~LFparams_right", 0)
        self.omega_max_left = self.setupParam("~omega_max_left", 999)
        self.omega_max_straight = self.setupParam("~omega_max_straight", 999)
        self.omega_max_right = self.setupParam("~omega_max_right", 999)
        self.omega_min_left = self.setupParam("~omega_min_left", -999)
        self.omega_min_straight = self.setupParam("~omega_min_straight", -999)
        self.omega_min_right = self.setupParam("~omega_min_right", -999)

        self.debug_dir = self.setupParam("~debug_dir", -1)

    def updateParams(self, event):
        self.time_left_turn = rospy.get_param("~time_left_turn")
        self.time_straight_turn = rospy.get_param("~time_straight_turn")
        self.time_right_turn = rospy.get_param("~time_right_turn")
        self.ff_left = rospy.get_param("~ff_left")
        self.ff_straight = rospy.get_param("~ff_straight")
        self.ff_right = rospy.get_param("~ff_right")
        self.LFparams_left = rospy.get_param("~LFparams_left")
        self.LFparams_straight = rospy.get_param("~LFparams_straight")
        self.LFparams_right = rospy.get_param("~LFparams_right")
        self.omega_max_left = rospy.get_param("~omega_max_left")
        self.omega_max_straight = rospy.get_param("~omega_max_straight")
        self.omega_max_right = rospy.get_param("~omega_max_right")
        self.omega_min_left = rospy.get_param("~omega_min_left")
        self.omega_min_straight = rospy.get_param("~omega_min_straight")
        self.omega_min_right = rospy.get_param("~omega_min_right")

        self.debug_dir = rospy.get_param("~debug_dir")

    def setupParam(self, param_name, default_value):
        value = rospy.get_param(param_name, default_value)
        rospy.set_param(param_name, value)  # Write to parameter server for transparancy
        rospy.loginfo(f"[{self.node_name}] {param_name} = {value} ")
        return value

    def onShutdown(self):
        rospy.loginfo("[UnicornIntersectionNode] Shutdown.")


if __name__ == "__main__":
    rospy.init_node("unicorn_intersection_node", anonymous=False)
    unicorn_intersection_node = UnicornIntersectionNode()
    rospy.on_shutdown(unicorn_intersection_node.onShutdown)
    rospy.spin()
