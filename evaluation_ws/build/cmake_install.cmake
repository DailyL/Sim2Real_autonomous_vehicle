# Install script for directory: /home/dianzhao/real_duckie_catkin_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/dianzhao/real_duckie_catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE PROGRAM FILES "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE PROGRAM FILES "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/setup.bash;/home/dianzhao/real_duckie_catkin_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/setup.bash"
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/setup.sh;/home/dianzhao/real_duckie_catkin_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/setup.sh"
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/setup.zsh;/home/dianzhao/real_duckie_catkin_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/setup.zsh"
    "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/dianzhao/real_duckie_catkin_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/dianzhao/real_duckie_catkin_ws/install" TYPE FILE FILES "/home/dianzhao/real_duckie_catkin_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/dianzhao/real_duckie_catkin_ws/build/gtest/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown-sim-server/duckiebot_description/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown_demos/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown-sim-server/duckietown_gazebo/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_geotiff_launch/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_slam/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_slam_launch/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/led_joy_mapper/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_map_tools/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_nav_msgs/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/adafruit_drivers/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/deadreckoning/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown_protocols/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/easy_algo/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/easy_logs/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/easy_regression/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_geotiff/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_geotiff_plugins/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_marker_drawing/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/ros_commons/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/ros_http_api/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/apriltag/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/complete_image_pipeline/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/display_renderers/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/easy_node/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/explicit_coordinator/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/fsm/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/image_processing/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/anti_instagram/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/ground_projection/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_compressed_map_transport/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/indefinite_navigation/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/lane_control/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/led_detection/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/led_pattern_switch/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/line_detector/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/navigation/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/rl_duckietown/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/rplidar_ros/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/sensor_suite/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/stop_line_filter/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_imu_attitude_to_tf/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_imu_tools/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_map_server/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_trajectory_server/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/lane_filter/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/hector_slam/hector_mapping/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/laser_filters/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/tof_driver_2/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/unicorn_intersection/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/vehicle_detection/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/visualization_tools/cmake_install.cmake")
  include("/home/dianzhao/real_duckie_catkin_ws/build/vl53l0x/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/dianzhao/real_duckie_catkin_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
