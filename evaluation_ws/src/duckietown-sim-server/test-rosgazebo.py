import random

import rospy
import time

from gazebo_msgs.srv import GetModelState, SetModelState
from gazebo_stuff.model_state import State
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty

rospy.init_node('gym', anonymous=True)


class Model():
    last_state = None

    def state_callback(self, msg):
        print (msg)
        self.last_state = msg


model = Model()

unpause = rospy.ServiceProxy('/gazebo/unpause_physics', Empty)
pause = rospy.ServiceProxy('/gazebo/pause_physics', Empty)
# rospy.Subscriber('/gazebo/model_states', Empty, model.state_callback)

get_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
# resp1 = gms(model_name,relative_entity_name)



time.sleep(3)
unpause()
time.sleep(.1)
# get data of "mybot" model in reference to frame "world"
# in production we can substitute this to the origin of the duckietown world
old_state = State.get_state(get_state, "mybot", "world")
print (old_state)

new_state = State.make(model="mybot",
                  position=[random.uniform(-1, 2), random.uniform(-1, 2), 2],  # spawn at height for demo
                  orientation=[0, 1, 0, 0],
                  linear=[2, 0, 0],
                  angular=[0, 0, 0],
                  ref="world"
                  )
set_state(new_state)
time.sleep(.1)


pause()


# TODO parse this response for pose and orientation (in quaternion)

# '{model_name: mybot, pose: { position: { x: 1, y: 0, z: 2 }, orientation: {x: 0, y: 0.491983115673, z: 0, w: 0.870604813099 } }, twist: { linear: { x: 0, y: 0, z: 0 }, angular: { x: 0, y: 0, z: 0}  }, reference_frame: world }'
