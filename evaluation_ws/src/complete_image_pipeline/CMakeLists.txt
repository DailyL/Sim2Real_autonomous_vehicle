cmake_minimum_required(VERSION 2.8.3)
project(complete_image_pipeline)

find_package(catkin REQUIRED COMPONENTS
  duckietown_msgs
  rospy
  sensor_msgs
)

catkin_python_setup()

catkin_package()
