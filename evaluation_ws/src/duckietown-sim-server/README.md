# Duckietown Environment and Duckiebot in gazebo

With this folder, you can run duckietown environment and control robot with gazebo.

## Install Depencencies

Requirements:
- Python 2
- ROS Kinetic
- Gazebo 7 (*not Gazebo 8!*)

**NOTE:  To build successfully, maybe you need to install a lot ros packages. Based on the error message, use ```sudo apt-get install ros-kinetic-packagename```.**

**TODO: complete the list of depencencies to install.**

```
sudo apt-get install \
ros-kinetic-xacro

# Python packages
pip install \
catkin_pkg \
catkin-tools \
defusedxml \
pyzmq \
rospkg \
pygazebo==3.0.0-2014.1
```

## Build and run duckietown environment with a duckiebot

```
source /opt/ros/kinetic/setup.bash
cd simulator
catkin build
source devel/setup.bash
cd src/duckietown_gazebo
source env_gazebo.sh
cd ..
./run_gazebo.sh
```
You will see a Duckiebot in Duckietown now.

In gazebo, shortcut "Ctrl+T" can call out "Gazebo: Topic Selector" window. Then click topic ```/gazebo/default/mybot/chassis/camera1/image```under ```gazebo.msgs.ImageStamped```, a camera window of dockiebot will show up.

You can also control robot through publish messege to topic with command ```rostopic pub /cmd_vel geometry_msgs/Twist "linear:
  x: 0.2
  y: 0.0
  z: 0.0
angular:
  x: 0.0
  y: 0.0
  z: 0.1"``` or ```./run_cmd```



