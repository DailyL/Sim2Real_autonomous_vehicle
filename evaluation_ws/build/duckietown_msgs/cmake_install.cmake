# Install script for directory: /home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs/msg" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs/srv" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
    "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs/cmake" TYPE FILE FILES "/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/catkin_generated/installspace/duckietown_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/dianzhao/real_duckie_catkin_ws/devel/include/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/dianzhao/real_duckie_catkin_ws/devel/share/roseus/ros/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/dianzhao/real_duckie_catkin_ws/devel/share/common-lisp/ros/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/dianzhao/real_duckie_catkin_ws/devel/share/gennodejs/ros/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/dianzhao/real_duckie_catkin_ws/devel/lib/python3/dist-packages/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/dianzhao/real_duckie_catkin_ws/devel/lib/python3/dist-packages/duckietown_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/catkin_generated/installspace/duckietown_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs/cmake" TYPE FILE FILES "/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/catkin_generated/installspace/duckietown_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs/cmake" TYPE FILE FILES
    "/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/catkin_generated/installspace/duckietown_msgsConfig.cmake"
    "/home/dianzhao/real_duckie_catkin_ws/build/duckietown_msgs/catkin_generated/installspace/duckietown_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/duckietown_msgs" TYPE FILE FILES "/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/package.xml")
endif()

