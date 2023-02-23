cmake_minimum_required(VERSION 2.8.3)
project(display_renderers)

find_package(catkin REQUIRED COMPONENTS
  rospy
  duckietown_msgs # Every duckietown packages should use this.
  sensor_msgs
  std_msgs
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
