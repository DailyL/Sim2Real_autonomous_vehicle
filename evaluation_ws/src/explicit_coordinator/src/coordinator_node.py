#!/usr/bin/env python3

from random import random
import rospy
from duckietown_msgs.msg import (
    CoordinationClearance,
    FSMState,
    BoolStamped,
    Twist2DStamped,
    AprilTagsWithInfos,
)
from duckietown_msgs.msg import SignalsDetection, CoordinationSignal, MaintenanceState
from std_msgs.msg import String
from time import time

UNKNOWN = "UNKNOWN"


class State:
    INTERSECTION_PLANNING = "INTERSECTION_PLANNING"
    LANE_FOLLOWING = "LANE_FOLLOWING"
    AT_STOP_CLEARING = "AT_STOP_CLEARING"
    SACRIFICE = "SACRIFICE"
    SOLVING_UNKNOWN = "SOLVING_UNKNOWN"
    GO = "GO"
    KEEP_CALM = "KEEP_CALM"
    TL_SENSING = "TL_SENSING"
    INTERSECTION_CONTROL = "INTERSECTION_CONTROL"
    AT_STOP_CLEARING_AND_PRIORITY = "AT_STOP_CLEARING_AND_PRIORITY"
    SACRIFICE_FOR_PRIORITY = "SACRIFICE_FOR_PRIORITY"
    OBSTACLE_ALERT = "OBSTACLE_ALERT"
    OBSTACLE_STOP = "OBSTACLE_STOP"


class VehicleCoordinator:
    """The Vehicle Coordination Module for Duckiebot"""

    T_MAX_RANDOM = 5.0  # seconds
    T_CROSS = 6.0  # seconds
    T_SENSE = 2.0  # seconds
    T_UNKNOWN = 1.0  # seconds
    T_MIN_RANDOM = 2.0  # seconds
    T_KEEP_CALM = 4.0  # seconds

    def __init__(self):

        self.node = rospy.init_node("veh_coordinator", anonymous=True)

        # We communicate that the coordination mode has started
        rospy.loginfo("The Coordination Mode has Started")

        self.active = True

        # Determine the state of the bot
        self.state = State.INTERSECTION_PLANNING
        self.last_state_transition = time()
        self.random_delay = 0
        self.priority = False

        # Node name
        self.node_name = rospy.get_name()

        # Initialize flag
        self.intersection_go_published = False

        # Parameters
        self.traffic_light_intersection = UNKNOWN

        self.use_priority_protocol = True
        if rospy.get_param("~use_priority_protocol") == False:
            self.use_priority_protocol = False

        self.tl_timeout = 120
        rospy.set_param("~tl_timeout", self.tl_timeout)

        # Initialize detection
        self.traffic_light = UNKNOWN
        self.right_veh = UNKNOWN
        self.opposite_veh = UNKNOWN

        # Initialize mode
        self.mode = "INTERSECTION_PLANNING"

        # Subscriptions
        self.sub_switch = rospy.Subscriber("~switch", BoolStamped, self.cbSwitch, queue_size=1)

        rospy.Subscriber("~mode", FSMState, lambda msg: self.set("mode", msg.state))
        rospy.Subscriber("~apriltags_out", AprilTagsWithInfos, self.set_traffic_light)
        rospy.Subscriber("~signals_detection", SignalsDetection, self.process_signals_detection)
        rospy.Subscriber("~maintenance_state", MaintenanceState, self.cbMaintenanceState)

        # Initialize clearance to go
        self.clearance_to_go = CoordinationClearance.NA

        # Set the light to be off
        self.roof_light = CoordinationSignal.OFF

        # Publishing
        self.clearance_to_go_pub = rospy.Publisher("~clearance_to_go", CoordinationClearance, queue_size=10)
        self.pub_intersection_go = rospy.Publisher("~intersection_go", BoolStamped, queue_size=1)
        self.pub_coord_cmd = rospy.Publisher("~car_cmd", Twist2DStamped, queue_size=1)
        self.roof_light_pub = rospy.Publisher("~change_color_pattern", String, queue_size=10)
        self.coordination_state_pub = rospy.Publisher("~coordination_state", String, queue_size=10)

        # Update param timer
        rospy.Timer(rospy.Duration.from_sec(1.0), self.updateParams)

        while not rospy.is_shutdown():
            self.loop()
            rospy.sleep(0.1)

    def cbMaintenanceState(self, msg):
        if msg.state == "WAY_TO_MAINTENANCE" and self.use_priority_protocol:
            self.priority = True
            rospy.loginfo(f"[{self.node_name}] Granted priority rights on intersections.")
        else:
            self.priority = False

    def set_traffic_light(self, msg):
        # Save old traffic light
        traffic_light_old = self.traffic_light_intersection
        # New traffic light
        # TODO: only consider two closest signs
        for item in msg.infos:
            if item.traffic_sign_type == 17:
                self.traffic_light_intersection = True
                break
            else:
                self.traffic_light_intersection = False
        # If different from the one before, restart from lane following
        if traffic_light_old != self.traffic_light_intersection:
            self.set_state(State.INTERSECTION_PLANNING)

        # Print result
        # if self.traffic_light_intersection != UNKNOWN:
        #     #TODO if tl but can't see the led's for too long, switch to april tag intersection
        #     # Print
        #     if self.traffic_light_intersection:
        #         rospy.loginfo('[%s] Intersection with traffic light' %(self.node_name))
        #     else:
        #         rospy.loginfo('[%s] Intersection without traffic light' %(self.node_name))

    def set_state(self, state):
        # Update only when changing state
        if self.state != state:
            rospy.loginfo(f"[{self.node_name}] Transitioned from {self.state} to {state}")
            self.last_state_transition = time()
            self.state = state

        # Set roof light
        if self.state == State.AT_STOP_CLEARING:
            # self.reset_signals_detection()
            self.roof_light = CoordinationSignal.SIGNAL_A
        elif self.state == State.AT_STOP_CLEARING_AND_PRIORITY:
            self.roof_light = CoordinationSignal.SIGNAL_PRIORITY
            # Publish LEDs - priority interrupt
            # self.roof_light_pub.publish(self.roof_light)
        elif self.state == State.SACRIFICE_FOR_PRIORITY:
            self.roof_light = CoordinationSignal.SIGNAL_SACRIFICE_FOR_PRIORITY
            # Publish LEDs - priority interrupt
            # self.roof_light_pub.publish(self.roof_light)
        elif self.state == State.SACRIFICE:
            self.roof_light = CoordinationSignal.OFF
        elif self.state == State.KEEP_CALM:
            if self.priority:
                self.roof_light = CoordinationSignal.SIGNAL_PRIORITY
            else:
                self.roof_light = CoordinationSignal.SIGNAL_A
        elif self.state == State.GO and not self.traffic_light_intersection:
            self.roof_light = CoordinationSignal.SIGNAL_GREEN
        elif self.state == State.INTERSECTION_PLANNING or self.state == State.TL_SENSING:
            self.roof_light = CoordinationSignal.OFF

    #    rospy.logdebug('[coordination_node] Transitioned to state' + self.state)

    # Define the time at this current state
    def time_at_current_state(self):
        return time() - self.last_state_transition

    def set(self, name, value):

        self.__dict__[name] = value

        # Initialization of the state and of the type of intersection
        if name == "mode":
            if value == "JOYSTICK_CONTROL" or value == "INTERSECTION_COORDINATION":
                self.set_state(State.INTERSECTION_PLANNING)
                self.traffic_light_intersection = UNKNOWN

    # Definition of each signal detection
    def process_signals_detection(self, msg):
        self.set("traffic_light", msg.traffic_light_state)
        self.set("right_veh", msg.right)
        self.set("opposite_veh", msg.front)

    # definition which resets everything we know
    def reset_signals_detection(self):
        self.traffic_light = UNKNOWN
        self.right_veh = UNKNOWN
        self.opposite_veh = UNKNOWN

    # publishing the topics
    def publish_topics(self):
        now = rospy.Time.now()

        # Publish LEDs
        self.roof_light_pub.publish(self.roof_light)

        # Clearance to go
        self.clearance_to_go_pub.publish(CoordinationClearance(status=self.clearance_to_go))

        # Publish intersection_go flag
        #        rospy.loginfo("clearance_to_go is "+str(self.clearance_to_go) + " and CoordinationClearance.GO is "+str(CoordinationClearance.GO))
        if self.clearance_to_go == CoordinationClearance.GO and not self.intersection_go_published:
            msg = BoolStamped()
            msg.header.stamp = now
            msg.data = True
            self.pub_intersection_go.publish(msg)
            self.intersection_go_published = True

            rospy.loginfo(f"[{self.node_name}] Go!")

        # Publish LEDs
        # self.roof_light_pub.publish(self.roof_light)

        car_cmd_msg = Twist2DStamped(v=0.0, omega=0.0)
        car_cmd_msg.header.stamp = now
        self.pub_coord_cmd.publish(car_cmd_msg)
        self.coordination_state_pub.publish(data=self.state)

    # definition of the loop
    def loop(self):

        if not self.active:
            return

        if self.traffic_light_intersection != UNKNOWN:
            self.reconsider()
        self.publish_topics()

    def reconsider(self):

        if self.state == State.INTERSECTION_PLANNING:
            if self.mode == "INTERSECTION_COORDINATION":
                # Reset detections
                self.reset_signals_detection()

                # Go to state (depending whether there is a traffic light)
                if self.traffic_light_intersection:
                    self.set_state(State.TL_SENSING)
                    self.begin_tl = time()

                else:
                    if self.priority:
                        self.set_state(State.AT_STOP_CLEARING_AND_PRIORITY)
                    else:
                        self.set_state(State.AT_STOP_CLEARING)

        elif self.state == State.AT_STOP_CLEARING_AND_PRIORITY:
            # First measurement not seen yet
            if self.right_veh == UNKNOWN or self.opposite_veh == UNKNOWN:
                self.random_delay = 1 + random() * self.T_UNKNOWN
                self.set_state(State.SOLVING_UNKNOWN)
            # Other cars with priority detected
            elif (
                self.right_veh == SignalsDetection.SIGNAL_PRIORITY
                or self.opposite_veh == SignalsDetection.SIGNAL_PRIORITY
            ):
                self.random_delay = self.T_MIN_RANDOM + random() * (self.T_MAX_RANDOM - self.T_MIN_RANDOM)
                self.set_state(State.SACRIFICE_FOR_PRIORITY)
                rospy.loginfo(
                    f"[{self.node_name}] Other vehicle are waiting as well. Will wait for "
                    f"{self.random_delay:.2f} s"
                )
            # No cars detected
            else:
                self.set_state(State.KEEP_CALM)

        elif self.state == State.AT_STOP_CLEARING:
            # First measurement not seen yet
            if self.right_veh == UNKNOWN or self.opposite_veh == UNKNOWN:
                self.random_delay = 1 + random() * self.T_UNKNOWN
                self.set_state(State.SOLVING_UNKNOWN)
            # Other cars with priority detected
            elif (
                self.right_veh == SignalsDetection.SIGNAL_PRIORITY
                or self.opposite_veh == SignalsDetection.SIGNAL_PRIORITY
            ):
                self.random_delay = self.T_MIN_RANDOM + random() * (self.T_MAX_RANDOM - self.T_MIN_RANDOM)
                self.set_state(State.SACRIFICE_FOR_PRIORITY)
                rospy.loginfo(
                    f"[{self.node_name}] Other vehicle are waiting as well. Will wait for "
                    f"{self.random_delay:.2f} s"
                )
            # Other cars with priority detected
            elif (
                self.right_veh == SignalsDetection.SIGNAL_SACRIFICE_FOR_PRIORITY
                or self.opposite_veh == SignalsDetection.SIGNAL_SACRIFICE_FOR_PRIORITY
            ):
                self.random_delay = self.T_MIN_RANDOM + random() * (self.T_MAX_RANDOM - self.T_MIN_RANDOM)
                self.set_state(State.SACRIFICE_FOR_PRIORITY)
                rospy.loginfo(
                    f"[{self.node_name}] Other vehicle are waiting as well. Will wait for "
                    f"{self.random_delay:.2f} s"
                )
            # Other cars  detected
            elif (
                self.right_veh == SignalsDetection.SIGNAL_A or self.opposite_veh == SignalsDetection.SIGNAL_A
            ):
                self.random_delay = self.T_MIN_RANDOM + random() * (self.T_MAX_RANDOM - self.T_MIN_RANDOM)
                self.set_state(State.SACRIFICE)
                rospy.loginfo(
                    f"[{self.node_name}] Other vehicle are waiting as well. Will wait for "
                    f"{self.random_delay:.2f} s"
                )
            # No cars detected
            else:
                self.set_state(State.KEEP_CALM)

        elif self.state == State.GO:
            self.clearance_to_go = CoordinationClearance.GO
            if self.mode == "INTERSECTION_PLANNING":
                self.set_state(State.INTERSECTION_PLANNING)

        elif self.state == State.SACRIFICE_FOR_PRIORITY:
            # Wait a random delay
            if self.time_at_current_state() > self.random_delay:
                if self.priority:
                    self.set_state(State.AT_STOP_CLEARING_AND_PRIORITY)
                else:
                    self.set_state(State.AT_STOP_CLEARING)

        elif self.state == State.SACRIFICE:
            # Wait a random delay
            if self.time_at_current_state() > self.random_delay:
                self.set_state(State.AT_STOP_CLEARING)

        elif self.state == State.KEEP_CALM:
            if self.priority:
                # Other cars with priority detected
                if (
                    self.right_veh == SignalsDetection.SIGNAL_PRIORITY
                    or self.opposite_veh == SignalsDetection.SIGNAL_PRIORITY
                ):
                    self.set_state(State.SACRIFICE_FOR_PRIORITY)
                # other cars not acknowledging my priority (just arrived)
                elif (
                    self.right_veh == SignalsDetection.SIGNAL_A
                    or self.opposite_veh == SignalsDetection.SIGNAL_A
                ):
                    self.set_state(State.KEEP_CALM)  # TODO: otherwise will go to else
                # No cars with priority detected
                else:
                    if self.time_at_current_state() > self.T_KEEP_CALM:
                        self.set_state(State.GO)
            else:
                # Other cars  detected
                if (
                    self.right_veh == SignalsDetection.SIGNAL_A
                    or self.opposite_veh == SignalsDetection.SIGNAL_A
                ):
                    self.set_state(State.SACRIFICE)
                    # No cars  detected
                else:
                    if self.time_at_current_state() > self.T_KEEP_CALM:
                        self.set_state(State.GO)

        elif self.state == State.SOLVING_UNKNOWN:
            if self.time_at_current_state() > self.random_delay:
                if self.priority:
                    self.set_state(State.AT_STOP_CLEARING_AND_PRIORITY)
                else:
                    self.set_state(State.AT_STOP_CLEARING)

        elif self.state == State.TL_SENSING:
            rospy.loginfo(
                "[%s] I have been waiting in traffic light for: %s", self.node_name, (time() - self.begin_tl)
            )
            if self.traffic_light == "traffic_light_go":
                rospy.loginfo("[%s] Traffic light is green. I have priority. GO!", self.node_name)
                self.set_state(State.GO)

            # If a tl intersection april tag is present but tl is switched off, wait until tl_timeout then use led coordination
            elif time() - self.begin_tl > self.tl_timeout:
                if self.priority:
                    self.set_state(State.AT_STOP_CLEARING_AND_PRIORITY)
                else:
                    self.set_state(State.AT_STOP_CLEARING)

        # If not GO, pusblish wait
        if self.state != State.GO:
            # Initialize intersection_go_published
            self.intersection_go_published = False
            # Publish wait
            self.clearance_to_go = CoordinationClearance.WAIT

    def cbSwitch(self, switch_msg):
        self.active = switch_msg.data

    def updateParams(self, event):
        self.tl_timeout = rospy.get_param("~tl_timeout")

    # def onShutdown(self):
    #     rospy.loginfo("[CoordinatorNode] Shutdown.")
    #     self.clearance_to_go_pub.unregister()
    #     self.pub_intersection_go.unregister()
    #     self.pub_coord_cmd.unregister()
    #     self.roof_light_pub.unregister()
    #     self.coordination_state_pub.unregister()
    #


if __name__ == "__main__":
    car = VehicleCoordinator()
    #    rospy.on_shutdown(coordinator_node.onShutdown)
    rospy.spin()
