# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "duckietown_msgs: 71 messages, 12 services")

set(MSG_I_FLAGS "-Iduckietown_msgs:/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(duckietown_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" "geometry_msgs/PoseStamped:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" "geometry_msgs/PoseStamped:duckietown_msgs/AprilTagDetection:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" "geometry_msgs/PoseStamped:duckietown_msgs/AprilTagDetection:geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Pose:duckietown_msgs/TagInfo"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" "duckietown_msgs/DiagnosticsCodeProfiling:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" "duckietown_msgs/DiagnosticsRosLink:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" "duckietown_msgs/NodeParameter:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" "duckietown_msgs/DiagnosticsRosTopic:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" "sensor_msgs/Image:sensor_msgs/RegionOfInterest:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" "std_msgs/Header:std_msgs/ColorRGBA"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" "sensor_msgs/CompressedImage:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" "sensor_msgs/CompressedImage:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" "duckietown_msgs/Vector2D"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" "duckietown_msgs/Vector2D:duckietown_msgs/LEDDetection"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" "duckietown_msgs/LEDDetectionArray:sensor_msgs/CompressedImage:duckietown_msgs/Vector2D:std_msgs/Header:duckietown_msgs/LEDDetection"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" "std_msgs/Header:std_msgs/ColorRGBA"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" "duckietown_msgs/Rect:duckietown_msgs/ObstacleType"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" "duckietown_msgs/ObstacleImageDetection:duckietown_msgs/Rect:std_msgs/Header:duckietown_msgs/ObstacleType"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" "geometry_msgs/Point:duckietown_msgs/ObstacleType"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" "geometry_msgs/Point:duckietown_msgs/ObstacleProjectedDetection:std_msgs/Header:duckietown_msgs/ObstacleType"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" "duckietown_msgs/Rect"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" "sensor_msgs/Image:duckietown_msgs/Rect:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" "geometry_msgs/Point:duckietown_msgs/Vector2D"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" "geometry_msgs/Point:duckietown_msgs/Segment:duckietown_msgs/Vector2D:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" "geometry_msgs/Point:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" "geometry_msgs/Vector3Stamped:std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" "std_msgs/Bool:geometry_msgs/Point32:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" "std_msgs/Bool:std_msgs/Float32:std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" "std_msgs/String"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" "std_msgs/String"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" "duckietown_msgs/NodeParameter"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" "duckietown_msgs/LEDPattern:std_msgs/Header:std_msgs/ColorRGBA"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" ""
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" "std_msgs/String"
)

get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_custom_target(_duckietown_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "duckietown_msgs" "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)

### Generating Services
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_cpp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
)

### Generating Module File
_generate_module_cpp(duckietown_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(duckietown_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(duckietown_msgs_generate_messages duckietown_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_cpp _duckietown_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(duckietown_msgs_gencpp)
add_dependencies(duckietown_msgs_gencpp duckietown_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS duckietown_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)

### Generating Services
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_eus(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
)

### Generating Module File
_generate_module_eus(duckietown_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(duckietown_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(duckietown_msgs_generate_messages duckietown_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_eus _duckietown_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(duckietown_msgs_geneus)
add_dependencies(duckietown_msgs_geneus duckietown_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS duckietown_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)

### Generating Services
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_lisp(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
)

### Generating Module File
_generate_module_lisp(duckietown_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(duckietown_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(duckietown_msgs_generate_messages duckietown_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_lisp _duckietown_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(duckietown_msgs_genlisp)
add_dependencies(duckietown_msgs_genlisp duckietown_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS duckietown_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)

### Generating Services
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_nodejs(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
)

### Generating Module File
_generate_module_nodejs(duckietown_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(duckietown_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(duckietown_msgs_generate_messages duckietown_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_nodejs _duckietown_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(duckietown_msgs_gennodejs)
add_dependencies(duckietown_msgs_gennodejs duckietown_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS duckietown_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/RegionOfInterest.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg;/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3Stamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Bool.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_msg_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)

### Generating Services
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv"
  "${MSG_I_FLAGS}"
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/ColorRGBA.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)
_generate_srv_py(duckietown_msgs
  "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
)

### Generating Module File
_generate_module_py(duckietown_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(duckietown_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(duckietown_msgs_generate_messages duckietown_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramHealth.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramTransform.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AntiInstagramThresholds.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/AprilTagsWithInfos.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ButtonEvent.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CarControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationClearance.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/CoordinationSignal.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfiling.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsCodeProfilingArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLink.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosLinkArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosNode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosParameterArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopic.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DiagnosticsRosTopicArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DisplayFragment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneControl.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DroneMode.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/NodeParameter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/DuckiebotLED.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/EpisodeStart.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/FSMState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImg.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/IntersectionPoseImgDebug.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsParameters.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/KinematicsWeights.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LanePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionArray.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDDetectionDebugInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDInterpreter.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LEDPattern.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LightSensor.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/LineFollowerStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/MaintenanceState.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleImageDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleProjectedDetectionList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ObstacleType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ParamTuner.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pixel.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Pose2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Rects.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SceneSegments.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Segment.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SegmentList.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetection.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SignalsDetectionETHZ17.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/SourceTargetNodes.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/StopLineReading.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TagInfo.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/ThetaDotSample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Trajectory.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/TurnIDandType.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Twist2DStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vector2D.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehicleCorners.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/VehiclePose.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/Vsample.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelEncoderStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmd.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdStamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/msg/WheelsCmdDBV2Stamped.msg" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ChangePattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/GetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/IMUstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/LFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeGetParamsList.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/NodeRequestParamsUpdate.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SensorsStatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetCustomLEDPattern.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetFSMState.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetValue.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/SetVariable.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dianzhaoli/duckie_catkin_ws/src/duckietown_msgs/srv/ToFstatus.srv" NAME_WE)
add_dependencies(duckietown_msgs_generate_messages_py _duckietown_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(duckietown_msgs_genpy)
add_dependencies(duckietown_msgs_genpy duckietown_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS duckietown_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/duckietown_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(duckietown_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(duckietown_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(duckietown_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/duckietown_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(duckietown_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(duckietown_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(duckietown_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/duckietown_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(duckietown_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(duckietown_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(duckietown_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/duckietown_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(duckietown_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(duckietown_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(duckietown_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/duckietown_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(duckietown_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(duckietown_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(duckietown_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
