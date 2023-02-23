cmake_minimum_required(VERSION 2.8.3)
project(sensor_suite)


find_package(catkin REQUIRED COMPONENTS
  rospy
  adafruit_drivers
  duckietown_msgs # Every duckietown packages should use this.
)

catkin_python_setup()

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
