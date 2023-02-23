import rospy
import time
from geometry_msgs.msg import Twist

rospy.init_node('gym', anonymous=True)

vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=5)

vel_cmd = Twist()
vel_cmd.linear.x = 1.0
vel_cmd.angular.z = 0.0

time.sleep(5)
vel_pub.publish(vel_cmd)

