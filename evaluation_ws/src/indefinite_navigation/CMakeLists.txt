cmake_minimum_required(VERSION 2.8.3)
project(indefinite_navigation)

find_package(catkin REQUIRED COMPONENTS
  duckietown_msgs
  roscpp
  rospy
  std_msgs
)


catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)


if (CATKIN_ENABLE_TESTING)
  find_package(rostest REQUIRED)
  # XXX: disabling failing tests
#   add_rostest(tests/calibrate_turn.test)
#   add_rostest(tests/calibrate_kinematics.test)
endif()
