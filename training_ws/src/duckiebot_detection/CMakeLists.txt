cmake_minimum_required(VERSION 2.8.3)
project(duckiebot_detection)

find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  duckietown_msgs
  roscpp
  rospy
)


catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
