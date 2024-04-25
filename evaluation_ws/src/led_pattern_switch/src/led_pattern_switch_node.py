#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import FSMState
from duckietown_msgs.srv import ChangePattern
from std_msgs.msg import String


class LEDPatternSwitchNode:
    def __init__(self):
        self.node_name = rospy.get_name()
        # rospy.loginfo("[%s] Initializing " %(self.node_name))
        # Read parameters
        self.mappings = rospy.get_param("~mappings")
        source_topic_dict = rospy.get_param("~source_topics")
        self.current_src_name = "joystick"  # by default if fsm is missing

        # Construct publisher
        # self.pub_cmd = rospy.Publisher("~change_color_pattern",String,queue_size=1)
        self.changePattern = rospy.ServiceProxy("~set_pattern", ChangePattern)

        # Construct subscribers
        self.sub_fsm_state = rospy.Subscriber(rospy.get_param("~mode_topic"), FSMState, self.cbFSMState)

        self.sub_dict = dict()
        for src_name, topic_name in list(source_topic_dict.items()):
            self.sub_dict[src_name] = rospy.Subscriber(
                topic_name, String, self.msgincb, callback_args=src_name
            )

        rospy.loginfo(f"[{self.node_name}] Initialized. ")

    def cbFSMState(self, fsm_state_msg):
        self.current_src_name = self.mappings.get(fsm_state_msg.state)
        if self.current_src_name is None:
            rospy.logwarn(
                f"[{self.node_name}] FSMState {fsm_state_msg.state} not handled. No msg pass through the "
                f"switch."
            )
        else:
            rospy.loginfo(
                f"[{self.node_name}] Led pattern switched to {self.current_src_name} in state "
                f"{fsm_state_msg.state}."
            )

    def msgincb(self, msg, src_name):

        if src_name == self.current_src_name:
            # rospy.loginfo("[%s] %s callback matches, publishing %s"%(self.node_name,src_name, msg.data))
            # self.pub_cmd.publish(msg)
            self.changePattern(msg)
        # else:
        # rospy.loginfo("[%s] %s callback does not match, not publishing"%(self.node_name,src_name))

    def on_shutdown(self):
        rospy.loginfo(f"[{self.node_name}] Shutting down.")


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("LED_pattern_switch_node", anonymous=False)
    # Create the DaguCar object
    node = LEDPatternSwitchNode()
    # Setup proper shutdown behavior
    rospy.on_shutdown(node.on_shutdown)
    # Keep it spinning to keep the node alive
    rospy.spin()
