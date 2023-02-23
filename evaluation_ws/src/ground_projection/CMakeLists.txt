cmake_minimum_required(VERSION 2.8.3)
project(ground_projection)


find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  duckietown_msgs
  sensor_msgs
  std_msgs
  geometry_msgs
  image_geometry
)

catkin_python_setup()

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
