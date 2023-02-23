cmake_minimum_required(VERSION 2.8.3)
project(visualization_tools)

find_package(catkin REQUIRED COMPONENTS
  rospy
  duckietown_msgs # Every duckietown packages should use this.
  std_msgs
  visualization_msgs
  geometry_msgs
)


catkin_python_setup()


catkin_package()

include_directories(${catkin_INCLUDE_DIRS})
