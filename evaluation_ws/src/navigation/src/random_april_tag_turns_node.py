#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import math

import numpy

import rospy
from duckietown_msgs.msg import AprilTagsWithInfos, FSMState, TurnIDandType
from std_msgs.msg import Int16  # Imports msg


class RandomAprilTagTurnsNode:
    def __init__(self):
        # Save the name of the node
        self.node_name = rospy.get_name()
        self.turn_type = -1

        rospy.loginfo(f"[{self.node_name}] Initializing.")

        # Setup publishers
        # self.pub_topic_a = rospy.Publisher("~topic_a",String, queue_size=1)
        self.pub_turn_type = rospy.Publisher("~turn_type", Int16, queue_size=1, latch=True)
        self.pub_id_and_type = rospy.Publisher("~turn_id_and_type", TurnIDandType, queue_size=1, latch=True)

        # Setup subscribers
        # self.sub_topic_b = rospy.Subscriber("~topic_b", String, self.cbTopic)
        self.sub_topic_mode = rospy.Subscriber("~mode", FSMState, self.cbMode, queue_size=1)
        # self.fsm_mode = None #TODO what is this?
        self.sub_topic_tag = rospy.Subscriber("~tag", AprilTagsWithInfos, self.cbTag, queue_size=1)

        # Read parameters
        self.pub_timestep = self.setupParameter("~pub_timestep", 1.0)
        # Create a timer that calls the cbTimer function every 1.0 second
        # self.timer = rospy.Timer(rospy.Duration.from_sec(self.pub_timestep),self.cbTimer)

        rospy.loginfo(f"[{self.node_name}] Initialzed.")

        self.rate = rospy.Rate(30)  # 10hz

    def cbMode(self, mode_msg):
        # print mode_msg
        # TODO PUBLISH JUST ONCE
        self.fsm_mode = mode_msg.state
        if self.fsm_mode != mode_msg.INTERSECTION_CONTROL:
            self.turn_type = -1
            self.pub_turn_type.publish(self.turn_type)
            # rospy.loginfo("Turn type now: %i" %(self.turn_type))

    def cbTag(self, tag_msgs):
        if (
            self.fsm_mode == "INTERSECTION_CONTROL"
            or self.fsm_mode == "INTERSECTION_COORDINATION"
            or self.fsm_mode == "INTERSECTION_PLANNING"
        ):
            # loop through list of april tags

            # filter out the nearest apriltag
            dis_min = 999
            idx_min = -1
            for idx, taginfo in enumerate(tag_msgs.infos):
                if taginfo.tag_type == taginfo.SIGN:
                    tag_det = (tag_msgs.detections)[idx]
                    pos = tag_det.transform.translation
                    distance = math.sqrt(pos.x ** 2 + pos.y ** 2 + pos.z ** 2)
                    if distance < dis_min:
                        dis_min = distance
                        idx_min = idx

            if idx_min != -1:
                taginfo = (tag_msgs.infos)[idx_min]

                availableTurns = []
                # go through possible intersection types
                signType = taginfo.traffic_sign_type
                if signType == taginfo.NO_RIGHT_TURN or signType == taginfo.LEFT_T_INTERSECT:
                    availableTurns = [
                        0,
                        1,
                    ]  # these mystical numbers correspond to the array ordering in open_loop_intersection_control_node (very bad)
                elif signType == taginfo.NO_LEFT_TURN or signType == taginfo.RIGHT_T_INTERSECT:
                    availableTurns = [1, 2]
                elif signType == taginfo.FOUR_WAY:
                    availableTurns = [0, 1, 2]
                elif signType == taginfo.T_INTERSECTION:
                    availableTurns = [0, 2]
                rospy.loginfo(f"[{self.node_name}] reports Available turns are: [{availableTurns}]")
                # now randomly choose a possible direction
                if len(availableTurns) > 0:
                    randomIndex = numpy.random.randint(len(availableTurns))
                    chosenTurn = availableTurns[randomIndex]
                    self.turn_type = chosenTurn
                    self.pub_turn_type.publish(self.turn_type)

                    id_and_type_msg = TurnIDandType()
                    id_and_type_msg.tag_id = taginfo.id
                    id_and_type_msg.turn_type = self.turn_type
                    self.pub_id_and_type.publish(id_and_type_msg)

                    # rospy.loginfo("possible turns %s." %(availableTurns))
                    # rospy.loginfo("Turn type now: %i" %(self.turn_type))

    def setupParameter(self, param_name, default_value):
        value = rospy.get_param(param_name, default_value)
        rospy.set_param(param_name, value)  # Write to parameter server for transparancy
        # rospy.loginfo("[%s] %s = %s " %(self.node_name,param_name,value))
        return value

    def on_shutdown(self):
        rospy.loginfo(f"[{self.node_name}] Shutting down.")


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("random_april_tag_turns_node", anonymous=False)

    # Create the NodeName object
    node = RandomAprilTagTurnsNode()

    # Setup proper shutdown behavior
    rospy.on_shutdown(node.on_shutdown)
    # Keep it spinning to keep the node alive
    rospy.spin()
