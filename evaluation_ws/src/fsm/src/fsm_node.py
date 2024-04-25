#!/usr/bin/env python3
import copy

import rospy
from duckietown_msgs.msg import BoolStamped, FSMState
from duckietown_msgs.srv import SetFSMState, SetFSMStateResponse


class FSMNode:
    def __init__(self):
        self.node_name = rospy.get_name()

        # Build transition dictionray
        self.states_dict = rospy.get_param("~states", {})
        # Validate state and global transitions
        if not self._validateStates(self.states_dict):
            rospy.signal_shutdown(f"[{self.node_name}] Incoherent definition.")
            return

        # Load global transitions
        self.global_transitions_dict = rospy.get_param("~global_transitions", {})
        if not self._validateGlobalTransitions(self.global_transitions_dict, list(self.states_dict.keys())):
            rospy.signal_shutdown(f"[{self.node_name}] Incoherent definition.")
            return

        # Setup initial state
        self.state_msg = FSMState()
        self.state_msg.state = rospy.get_param("~initial_state", "")
        self.state_msg.header.stamp = rospy.Time.now()
        # Setup publisher and publish initial state
        self.pub_state = rospy.Publisher("~mode", FSMState, queue_size=1, latch=True)

        # Provide service
        self.srv_state = rospy.Service("~set_state", SetFSMState, self.cbSrvSetState)

        # Construct publishers
        self.pub_dict = dict()
        nodes = rospy.get_param("~nodes")

        self.active_nodes = None
        for node_name, topic_name in list(nodes.items()):
            self.pub_dict[node_name] = rospy.Publisher(topic_name, BoolStamped, queue_size=1, latch=True)

        # print self.pub_dict
        # Process events definition
        param_events_dict = rospy.get_param("~events", {})
        # Validate events definition
        if not self._validateEvents(param_events_dict):
            rospy.signal_shutdown(f"[{self.node_name}] Invalid event definition.")
            return

        self.sub_list = list()
        self.event_trigger_dict = dict()
        for event_name, event_dict in list(param_events_dict.items()):
            topic_name = event_dict["topic"]
            msg_type = event_dict["msg_type"]
            self.event_trigger_dict[event_name] = event_dict["trigger"]
            # TODO so far I can't figure out how to put msg_type instead of BoolStamped.
            # importlib might help. But it might get too complicated since different type
            self.sub_list.append(
                rospy.Subscriber(topic_name, BoolStamped, self.cbEvent, callback_args=event_name)
            )

        rospy.loginfo(f"[{self.node_name}] Initialized.")
        # Publish initial state
        self.publish()

    def _validateGlobalTransitions(self, global_transitions, valid_states):
        pass_flag = True
        for event_name, state_name in list(global_transitions.items()):
            if state_name not in valid_states:
                rospy.logerr(
                    f"[{self.node_name}] State {state_name} is not valid. (From global_transitions of "
                    f"{event_name})"
                )
                pass_flag = False
        return pass_flag

    def _validateEvents(self, events_dict):
        pass_flag = True
        for event_name, event_dict in list(events_dict.items()):
            if "topic" not in event_dict:
                rospy.logerr(f"[{self.node_name}] Event {event_name} missing topic definition.")
                pass_flag = False
            if "msg_type" not in event_dict:
                rospy.logerr(f"[{self.node_name}] Event {event_name} missing msg_type definition.")
                pass_flag = False
            if "trigger" not in event_dict:
                rospy.logerr(f"[{self.node_name}] Event {event_name} missing trigger definition.")
                pass_flag = False
        return pass_flag

    def _validateStates(self, states_dict):
        pass_flag = True
        valid_states = list(states_dict.keys())
        for state, state_dict in list(states_dict.items()):
            # Validate the existence of all reachable states
            transitions_dict = state_dict.get("transitions")
            if transitions_dict is None:
                continue
            else:
                for transition, next_state in list(transitions_dict.items()):
                    if next_state not in valid_states:
                        rospy.logerr(
                            f"[{self.node_name}] {next_state} not a valide state. (From {state} with event "
                            f"{transition})"
                        )
                        pass_flag = False
        return pass_flag

    def _getNextState(self, state_name, event_name):
        if not self.isValidState(state_name):
            rospy.logwarn(f"[{self.node_name}] {state_name} not defined. Treat as terminal. ")
            return None

        # state transitions overwrites global transition
        state_dict = self.states_dict.get(state_name)
        if "transitions" in state_dict:
            next_state = state_dict["transitions"].get(event_name)
        else:
            next_state = None

        # state transitions overwrites global transitions
        if next_state is None:
            # No state transition defined, look up global transition
            next_state = self.global_transitions_dict.get(event_name)  # None when no global transitions
        return next_state

    def _getActiveNodesOfState(self, state_name):
        state_dict = self.states_dict[state_name]
        active_nodes = state_dict.get("active_nodes")
        if active_nodes is None:
            rospy.logwarn(f"[{self.node_name}] No active nodes defined for {state_name}. Deactive all nodes.")
            active_nodes = []
        return active_nodes

    def publish(self):
        self.publishBools()
        self.publishState()

    def isValidState(self, state):
        return state in list(self.states_dict.keys())

    def cbSrvSetState(self, req):
        if self.isValidState(req.state):
            self.state_msg.header.stamp = rospy.Time.now()
            self.state_msg.state = req.state
            self.publish()
        else:
            rospy.logwarn(f"[{self.node_name}] {req.state} is not a valid state.")
        return SetFSMStateResponse()

    def publishState(self):
        self.pub_state.publish(self.state_msg)
        rospy.loginfo(f"[{self.node_name}] FSMState: {self.state_msg.state}")

    def publishBools(self):
        active_nodes = self._getActiveNodesOfState(self.state_msg.state)
        for node_name, node_pub in list(self.pub_dict.items()):
            msg = BoolStamped()
            msg.header.stamp = self.state_msg.header.stamp
            msg.data = bool(node_name in active_nodes)
            node_state = "ON" if msg.data else "OFF"
            # rospy.loginfo("[%s] Node %s is %s in %s" %(self.node_name, node_name, node_state,
            # self.state_msg.state))
            if self.active_nodes is not None:
                if (node_name in active_nodes) == (node_name in self.active_nodes):
                    continue
            # else:
            #     rospy.logwarn("[%s] self.active_nodes is None!" %(self.node_name))
            # continue
            node_pub.publish(msg)
            # rospy.loginfo("[%s] node %s msg %s" %(self.node_name, node_name, msg))
            # rospy.loginfo("[%s] Node %s set to %s." %(self.node_name, node_name, node_state))
        self.active_nodes = copy.deepcopy(active_nodes)

    def cbEvent(self, msg, event_name):
        if msg.data == self.event_trigger_dict[event_name]:
            # Update timestamp
            self.state_msg.header.stamp = msg.header.stamp
            next_state = self._getNextState(self.state_msg.state, event_name)
            if next_state is not None:
                # Has a defined transition
                self.state_msg.state = next_state
                self.publish()

    def on_shutdown(self):
        rospy.loginfo(f"[{self.node_name}] Shutting down.")


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("fsm_node", anonymous=False)

    # Create the NodeName object
    node = FSMNode()

    # Setup proper shutdown behavior
    rospy.on_shutdown(node.on_shutdown)
    # Keep it spinning to keep the node alive
    rospy.spin()
