#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import BoolStamped, Twist2DStamped, FSMState


class FakeCoordinatorNode:
    def __init__(self):
        rospy.Subscriber("~mode", FSMState, self.cbMode)
        self.pub_intersection_go = rospy.Publisher(
            "simple_coordinator_node/intersection_go", BoolStamped, queue_size=1
        )
        self.pub_coord_cmd = rospy.Publisher("simple_coordinator_node/car_cmd", Twist2DStamped, queue_size=1)

        self.timer = rospy.Timer(rospy.Duration.from_sec(0.1), self.publish_car_cmd)

    def cbMode(self, msg):
        if msg.state == "COORDINATION":
            self.pub_intersection_go.publish(BoolStamped(header=msg.header, data=True))

    def publish_car_cmd(self, event):
        self.pub_coord_cmd.publish(Twist2DStamped(v=0, omega=0))

    def onShutdown(self):
        rospy.loginfo("[LaneFilterNode] Shutdown.")


if __name__ == "__main__":
    rospy.init_node("fake_coordinator", anonymous=False)
    fake_coordinator_node = FakeCoordinatorNode()
    rospy.on_shutdown(fake_coordinator_node.onShutdown)
    rospy.spin()
