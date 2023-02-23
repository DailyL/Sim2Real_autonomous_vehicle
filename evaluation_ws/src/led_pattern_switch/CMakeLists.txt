cmake_minimum_required(VERSION 2.8.3)
project(led_pattern_switch)


find_package(catkin REQUIRED COMPONENTS
  duckietown_msgs
  roscpp
  rospy
)

# catkin_python_setup()


catkin_package()


include_directories(
  ${catkin_INCLUDE_DIRS}
)
