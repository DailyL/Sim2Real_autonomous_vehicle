import rospy
import time
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty

rospy.init_node('gym', anonymous=True)

unpause = rospy.ServiceProxy('/gazebo/unpause_physics', Empty)
pause = rospy.ServiceProxy('/gazebo/pause_physics', Empty)
reset_proxy = rospy.ServiceProxy('/gazebo/reset_simulation', Empty)


time.sleep(3)
unpause()
time.sleep(.1)
pause()
quit()
time.sleep(3)
reset_proxy()
