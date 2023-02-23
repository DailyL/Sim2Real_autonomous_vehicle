cmake_minimum_required(VERSION 2.8.3)
project(easy_logs)

find_package(catkin REQUIRED COMPONENTS
  #roscpp
  rospy
  #duckietown_msgs # Every duckietown packages should use this.
  #cv_bridge
)

catkin_python_setup()
catkin_package()
 