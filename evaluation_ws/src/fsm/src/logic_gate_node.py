#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import AprilTagsWithInfos, BoolStamped, Twist2DStamped
from std_msgs.msg import Float32, UInt8

classes = {
    "BoolStamped": BoolStamped,
    "Twist2DStamped": Twist2DStamped,
    "AprilTagsWithInfos": AprilTagsWithInfos,
    "Float32": Float32,
    "UInt8": UInt8,
}


class LogicGateNode:
    def __init__(self):

        # Enable this for printing all logic gate operations
        self.debugging = False

        self.node_name = rospy.get_name()
        self.gates_dict = rospy.get_param("~gates")
        # validate gate
        if not self._validateGates(self.gates_dict):
            rospy.signal_shutdown("Invalid gate_type.")
            return

        self.events_dict = rospy.get_param("~events")
        if not self._validateEvents():
            rospy.signal_shutdown("Invalid event definition.")
            return

        self.sub_list = list()
        self.pub_dict = dict()
        self.event_msg_dict = dict()
        self.event_trigger_dict = dict()
        self.last_published_msg = None
        for gate_name, gate_dict in list(self.gates_dict.items()):
            output_topic_name = gate_dict["output_topic"]
            self.pub_dict[gate_name] = rospy.Publisher(output_topic_name, BoolStamped, queue_size=1)
        for event_name, event_dict in list(self.events_dict.items()):
            topic_name = event_dict["topic"]
            self.event_trigger_dict[event_name] = event_dict["trigger"]
            # Initialize local copy as None
            self.event_msg_dict[event_name] = None
            self.sub_list.append(
                rospy.Subscriber(
                    topic_name, classes[event_dict["msg_type"]], self.cbBoolStamped, callback_args=event_name
                )
            )

    def _validateEvents(self):
        valid_flag = True
        for event_name, event_dict in list(self.events_dict.items()):
            if "topic" not in event_dict:
                rospy.logfatal(f"[{self.node_name}] topic not defined for event {event_name}")
                valid_flag = False
        return valid_flag

    def _validateGates(self, gates_dict):
        valid_gate_types = ["AND", "OR"]
        for gate_name, gate_dict in list(gates_dict.items()):
            gate_type = gate_dict["gate_type"]
            if gate_type not in valid_gate_types:
                rospy.logfatal(f"[{self.node_name}] gate_type {gate_type} is not valid.")
                return False
        return True

    def publish(self, msg, gate_name):

        # print gate_name, msg.data

        if msg is None:
            return
        self.pub_dict[gate_name].publish(msg)

    def getOutputMsg(self, gate_name, inputs):
        bool_list = list()
        latest_time_stamp = rospy.Time(0)

        for event_name, event_msg in list(self.event_msg_dict.items()):
            if event_name in inputs:  # one of the inputs to gate

                if self.debugging:
                    print(("sub-event: " + event_name))

                if event_msg is None:
                    if "default" in self.events_dict[event_name]:
                        bool_list.append(self.events_dict[event_name]["default"])
                    else:
                        bool_list.append(False)
                else:
                    if "field" in self.events_dict[event_name]:  # if special type of message
                        if (
                            getattr(event_msg, self.events_dict[event_name]["field"])
                            == self.event_trigger_dict[event_name]
                        ):
                            bool_list.append(True)
                        else:
                            bool_list.append(False)
                    else:  # else BoolStamped
                        if event_msg.data == self.event_trigger_dict[event_name]:
                            bool_list.append(True)
                        else:
                            bool_list.append(False)
                    # Keeps track of latest timestamp
                    if event_msg.header.stamp >= latest_time_stamp:
                        latest_time_stamp = event_msg.header.stamp

        # Perform logic operation
        msg = BoolStamped()
        msg.header.stamp = latest_time_stamp

        gate = self.gates_dict.get(gate_name)
        gate_type = gate.get("gate_type")
        if gate_type == "AND":
            msg.data = all(bool_list)
        elif gate_type == "OR":
            msg.data = any(bool_list)

        if self.debugging:
            print((bool_list, "->", msg.data))

        # print bool_list, msg.data

        return msg

    def cbBoolStamped(self, msg, event_name):
        self.event_msg_dict[event_name] = msg

        # print "got something"
        for gate_name, gate_dict in list(self.gates_dict.items()):
            inputs = gate_dict.get("inputs")
            if event_name in inputs:
                # print "in the inputs"

                self.publish(self.getOutputMsg(gate_name, inputs), gate_name)

    def on_shutdown(self):
        rospy.loginfo(f"[{self.node_name}] Shutting down.")


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("logic_gate_node", anonymous=False)
    # Create the NodeName object
    node = LogicGateNode()
    # Setup proper shutdown behavior
    rospy.on_shutdown(node.on_shutdown)
    # Keep it spinning to keep the node alive
    rospy.spin()
