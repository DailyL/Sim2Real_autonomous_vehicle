#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Joy
from std_msgs.msg import String


# Button List index of joy.buttons array:
# a = 0, b=1, x=2. y=3, lb=4, rb=5, back = 6, start =7, logitek = 8, left joy = 9, right joy = 10
class LEDJoyMapper:
    def __init__(self):
        self.node_name = rospy.get_name()
        rospy.loginfo(f"[{self.node_name}] Initializing ")

        self.joy = None
        self.last_pub_msg = None
        self.last_pub_time = rospy.Time.now()

        self.pub_pattern = rospy.Publisher("~change_color_pattern", String, queue_size=1)

        self.sub_joy_ = rospy.Subscriber("joy", Joy, self.cbJoy, queue_size=1)

        self.button2patterns = {
            # 'a' is pressed
            0: "CAR_SIGNAL_A",
            # 'b' is pressed
            1: "CAR_SIGNAL_B",
            # 'Y' is pressed
            3: "CAR_SIGNAL_C",
            # 'X' is pressed
            2: "light_off",
            # lb is pressed
            4: "traffic_light_go",
            # rb is pressed
            5: "traffic_light_stop",
            # logitek button is pressed
            # 8: 'test_all_1',
        }

    def cbJoy(self, joy_msg):
        self.joy = joy_msg
        self.publishControl()

    def publishControl(self):

        for b, pattern in list(self.button2patterns.items()):
            if self.joy.buttons[b] == 1:
                self.pub_pattern.publish(pattern)
                rospy.loginfo(f"Publishing pattern {pattern}")


if __name__ == "__main__":
    rospy.init_node("led_joy_mapper", anonymous=False)
    led_joy_mapper = LEDJoyMapper()
    rospy.spin()
