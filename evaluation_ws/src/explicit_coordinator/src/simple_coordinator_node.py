#!/usr/bin/env python3

from random import random
import rospy
from duckietown_msgs.msg import CoordinationClearance, FSMState, BoolStamped, Twist2DStamped
from duckietown_msgs.msg import SignalsDetection, CoordinationSignal
from std_msgs.msg import String
from time import time

UNKNOWN = "UNKNOWN"


class State:
    LANE_FOLLOWING = "LANE_FOLLOWING"
    AT_STOP_CLEARING = "AT_STOP_CLEARING"
    AT_STOP_CLEAR = "AT_STOP_CLEAR"
    RESERVING = "RESERVING"
    CONFLICT = "CONFLICT"
    GO = "GO"
    TL_SENSING = "TL_SENSING"
    INTERSECTION_NAVIGATION = "INTERSECTION_NAVIGATION"


class VehicleCoordinator:
    """The Vehicle Coordination Module for Duckiebot"""

    T_MAX_RANDOM = 2.0  # seconds
    T_CROSS = 6.0  # seconds
    T_SENSE = 2.0  # seconds

    def __init__(self):
        rospy.loginfo("Coordination Mode Started")

        self.state = State.LANE_FOLLOWING
        self.last_state_transition = time()
        self.random_delay = 0

        self.intersection_go_published = False

        self.node = rospy.init_node("veh_coordinator", anonymous=True)

        # Parameters

        if rospy.get_param("~intersectionType") == "trafficLight":
            self.traffic_light_intersection = True
        else:
            self.traffic_light_intersection = False

        rospy.loginfo(f"[simple_coordination_node]: trafficLight={self.traffic_light_intersection}")

        # Subscriptions
        self.mode = "LANE_FOLLOWING"
        rospy.Subscriber("~mode", FSMState, lambda msg: self.set("mode", msg.state))

        self.traffic_light = UNKNOWN
        self.right_veh = UNKNOWN
        self.opposite_veh = UNKNOWN
        rospy.Subscriber("~signals_detection", SignalsDetection, self.process_signals_detection)

        # Publishing
        self.clearance_to_go = CoordinationClearance.NA
        self.clearance_to_go_pub = rospy.Publisher("~clearance_to_go", CoordinationClearance, queue_size=10)
        self.pub_intersection_go = rospy.Publisher("~intersection_go", BoolStamped, queue_size=1)
        self.pub_coord_cmd = rospy.Publisher("~car_cmd", Twist2DStamped, queue_size=1)

        self.roof_light = CoordinationSignal.OFF
        self.roof_light_pub = rospy.Publisher("~change_color_pattern", String, queue_size=10)

        self.coordination_state_pub = rospy.Publisher("~coordination_state", String, queue_size=10)

        while not rospy.is_shutdown():
            self.loop()
            rospy.sleep(0.1)

    def set_state(self, state):
        self.state = state
        self.last_state_transition = time()

        if self.state == State.AT_STOP_CLEARING:
            self.reset_signals_detection()
            self.roof_light = CoordinationSignal.SIGNAL_A
        elif self.state == State.AT_STOP_CLEAR:
            self.roof_light = CoordinationSignal.SIGNAL_A
        elif self.state == State.RESERVING:
            self.roof_light = CoordinationSignal.SIGNAL_B
        elif self.state == State.CONFLICT:
            self.roof_light = CoordinationSignal.SIGNAL_A
        elif self.state == State.GO and not self.traffic_light_intersection:
            self.roof_light = CoordinationSignal.SIGNAL_C
        else:
            self.roof_light = CoordinationSignal.OFF

        if self.state == State.GO:
            self.clearance_to_go = CoordinationClearance.GO
        else:
            self.clearance_to_go = CoordinationClearance.WAIT

        rospy.logdebug("[simple_coordination_node] Transitioned to state" + self.state)

    def time_at_current_state(self):
        return time() - self.last_state_transition

    def set(self, name, value):
        self.__dict__[name] = value

    def process_signals_detection(self, msg):
        self.set("traffic_light", msg.traffic_light_state)
        self.set("right_veh", msg.right)
        self.set("opposite_veh", msg.front)

    def reset_signals_detection(self):
        self.traffic_light = UNKNOWN
        self.right_veh = UNKNOWN
        self.opposite_veh = UNKNOWN

    def publish_topics(self):
        now = rospy.Time.now()
        self.clearance_to_go_pub.publish(CoordinationClearance(status=self.clearance_to_go))
        # Publish intersection_go flag
        if self.clearance_to_go == CoordinationClearance.GO:
            msg = BoolStamped()
            msg.header.stamp = now
            msg.data = True
            self.pub_intersection_go.publish(msg)
            # TODO: publish intersection go only once.
        self.roof_light_pub.publish(self.roof_light)

        car_cmd_msg = Twist2DStamped(v=0.0, omega=0.0)
        car_cmd_msg.header.stamp = now
        self.pub_coord_cmd.publish(car_cmd_msg)
        self.coordination_state_pub.publish(data=self.state)

    def loop(self):
        self.reconsider()
        self.publish_topics()

    def reconsider(self):
        if self.state == State.LANE_FOLLOWING:
            if self.mode == "COORDINATION":
                self.reset_signals_detection()
                if self.traffic_light_intersection:
                    self.set_state(State.TL_SENSING)
                else:
                    self.set_state(State.AT_STOP_CLEARING)

        elif self.state == State.AT_STOP_CLEARING:
            if (
                self.right_veh != SignalsDetection.NO_CAR
                or self.opposite_veh == SignalsDetection.SIGNAL_B
                or self.opposite_veh == SignalsDetection.SIGNAL_C
            ):
                self.set_state(State.AT_STOP_CLEARING)
            elif self.time_at_current_state() > self.T_CROSS + self.T_SENSE:
                self.set_state(State.AT_STOP_CLEAR)

        elif self.state == State.AT_STOP_CLEAR:
            if (
                self.right_veh != SignalsDetection.NO_CAR
                or self.opposite_veh == SignalsDetection.SIGNAL_B
                or self.opposite_veh == SignalsDetection.SIGNAL_C
            ):
                self.set_state(State.AT_STOP_CLEARING)
            else:
                self.set_state(State.RESERVING)

        elif self.state == State.RESERVING:
            if self.right_veh != SignalsDetection.NO_CAR:
                self.set_state(State.AT_STOP_CLEARING)
            elif self.time_at_current_state() > 2 * self.T_SENSE:
                if self.opposite_veh == SignalsDetection.SIGNAL_B:
                    self.random_delay = random() * self.T_MAX_RANDOM
                    print(f"Other vehicle reserving as well. Will wait for {self.random_delay:.2f} s")
                    self.set_state(State.CONFLICT)
                else:
                    self.set_state(State.GO)

        elif self.state == State.GO:
            if self.mode == "LANE_FOLLOWING":
                self.set_state(State.LANE_FOLLOWING)

        elif self.state == State.CONFLICT:
            if (
                self.right_veh != SignalsDetection.NO_CAR
                or self.opposite_veh == SignalsDetection.SIGNAL_B
                or self.opposite_veh == SignalsDetection.SIGNAL_C
            ):
                self.set_state(State.AT_STOP_CLEARING)
            elif self.time_at_current_state() > self.random_delay:
                self.set_state(State.AT_STOP_CLEAR)

        elif self.state == State.TL_SENSING:
            if self.traffic_light == SignalsDetection.GO:
                self.set_state(State.GO)


if __name__ == "__main__":
    car = VehicleCoordinator()
    rospy.spin()
