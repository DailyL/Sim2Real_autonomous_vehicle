cmake_minimum_required(VERSION 2.8.3)
project(navigation)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  message_generation
  duckietown_msgs

## -- UNCOMMENT BELOW LINE FOR LAPTOP BUILD -- ##
##  rqt_gui_py
)


catkin_python_setup()


add_service_files(
  FILES
  GraphSearch.srv
)


generate_messages(
  DEPENDENCIES
  std_msgs
  duckietown_msgs
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES navigation
  CATKIN_DEPENDS message_runtime
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)


install(PROGRAMS
  src/rqt_navigation
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
