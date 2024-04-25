#!/usr/bin/env python3
import numpy

import rospy
from duckietown_msgs.msg import FSMState
from std_msgs.msg import Int16  # Imports msg


class SRTurnsNode:
    def __init__(self):
        # Save the name of the node
        self.node_name = rospy.get_name()
        self.turn_type = -1

        rospy.loginfo(f"[{self.node_name}] Initializing.")

        # Setup publishers
        self.pub_turn_type = rospy.Publisher("~turn_type", Int16, queue_size=1, latch=True)

        # Setup subscribers
        self.sub_topic_mode = rospy.Subscriber("~mode", FSMState, self.cbMode, queue_size=1)

        rospy.loginfo(f"[{self.node_name}] Initialized.")

        self.rate = rospy.Rate(30)  # 10hz

    def cbMode(self, mode_msg):
        # print mode_msg
        self.fsm_mode = mode_msg.state
        if self.fsm_mode == "INTERSECTION_CONTROL":
            # return only straight and right turn
            availableTurns = [1, 2]
            # now randomly choose a possible direction
            if len(availableTurns) > 0:
                randomIndex = numpy.random.randint(len(availableTurns))
                chosenTurn = availableTurns[randomIndex]
                self.turn_type = chosenTurn
                self.pub_turn_type.publish(self.turn_type)
                rospy.loginfo(f"[{self.node_name}] possible turns {availableTurns}.")
                rospy.loginfo(f"[{self.node_name}] Turn type now: {self.turn_type}")
        else:
            self.turn_type = -1
            self.pub_turn_type.publish(self.turn_type)
            rospy.loginfo(f"[{self.node_name}] Turn type: {self.turn_type}")

    def on_shutdown(self):
        rospy.loginfo(f"[{self.node_name}] Shutting down.")


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("sr_turns_node", anonymous=False)

    # Create the NodeName object
    node = SRTurnsNode()

    # Setup proper shutdown behavior
    rospy.on_shutdown(node.on_shutdown)
    # Keep it spinning to keep the node alive
    rospy.spin()
