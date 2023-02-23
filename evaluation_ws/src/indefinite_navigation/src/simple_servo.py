#!/usr/bin/env python3
import rospy
from duckietown_msgs.msg import LanePose, StopLineReading, WheelsCmdStamped
from std_msgs.msg import Float32, String


class IndefNavigationNode:
    def __init__(self):
        # Save the name of the node
        self.node_name = rospy.get_name()

        rospy.loginfo(f"[{self.node_name}] Initializing.")

        self.lane = None
        self.stop = None
        self.ibvs_data = -1

        self.pub_wheels_cmd = rospy.Publisher("~wheels_cmd", WheelsCmdStamped, queue_size=1)
        self.sub_lane = rospy.Subscriber("~lane_pose", LanePose, self.cbLane, queue_size=1)
        self.sub_stop = rospy.Subscriber("~stop_line_reading", StopLineReading, self.cbStop, queue_size=1)
        self.sub_ibvs = rospy.Subscriber("~ibvs", Float32, self.cbIbvs, queue_size=1)
        self.pub_servo_status = rospy.Publisher("~servo_status", String, queue_size=1)
        rospy.loginfo(f"[{self.node_name}] Initialzed.")

        self.rate = rospy.Rate(30)  # 10hz

    def cbIbvs(self, data):
        if not (data.data == -1 and self.ibvs_data != -1):
            self.ibvs_data = data.data

    def cbLane(self, data):
        self.lane = data

    def cbStop(self, data):
        self.stop = data

    def servo(self):
        # move forward
        # end = rospy.Time.now() + rospy.Duration(.5)

        # continuous spin until servo line detected
        centered = True
        while not rospy.is_shutdown():
            wheels_cmd_msg = WheelsCmdStamped()

            # spin right unless servoing or centered
            wheels_cmd_msg.header.stamp = rospy.Time.now()
            wheels_cmd_msg.vel_left = 0.2
            wheels_cmd_msg.vel_right = -0.2

            angle_direction = self.ibvs_data - 0.5
            gain = 0.1
            if self.ibvs_data == -1:
                rospy.loginfo("No Line Detected. Continuing turn.")
                self.pub_servo_status.publish(String(data="None"))
            elif abs(angle_direction) < 0.05:
                rospy.loginfo("Centered.")
                wheels_cmd_msg.vel_left = 0
                wheels_cmd_msg.vel_right = 0
                centered = True
                self.pub_servo_status.publish(String(data="center"))

            elif angle_direction > 0:
                wheels_cmd_msg.vel_left = gain  # *abs(angle_direction)
                wheels_cmd_msg.vel_right = -gain  # *abs(angle_direction)
                rospy.loginfo(f"Servo right {angle_direction} ")
                self.pub_servo_status.publish(String(data="moving"))
            else:
                wheels_cmd_msg.vel_right = gain  # *abs(angle_direction)
                wheels_cmd_msg.vel_left = -gain  # *abs(angle_direction)
                rospy.loginfo(f"Servo left {angle_direction} ")
                self.pub_servo_status.publish(String(data="moving"))

            self.pub_wheels_cmd.publish(wheels_cmd_msg)
            # self.rate.sleep()

            if centered:
                rospy.loginfo("centered.  Waiting for while")
                rospy.sleep(rospy.Duration(3))

                #  while not rospy.is_shutdown():
                wheels_cmd_msg = WheelsCmdStamped()
                wheels_cmd_msg.header.stamp = rospy.Time.now()
                wheels_cmd_msg.vel_left = 0.3
                wheels_cmd_msg.vel_right = -0.3
                self.pub_wheels_cmd.publish(wheels_cmd_msg)
                rospy.sleep(rospy.Duration(1))
                centered = False


if __name__ == "__main__":
    # Initialize the node with rospy
    rospy.init_node("indef_navigation_node", anonymous=False)

    # Create the NodeName object
    node = IndefNavigationNode()
    node.servo()
