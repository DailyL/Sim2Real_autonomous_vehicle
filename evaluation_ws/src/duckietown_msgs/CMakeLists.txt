cmake_minimum_required(VERSION 2.8.3)
project(duckietown_msgs)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  message_generation
  std_msgs
  geometry_msgs
  visualization_msgs
  sensor_msgs
  tf_conversions
  tf
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  AntiInstagramThresholds.msg
  AprilTagDetection.msg
  AprilTagDetectionArray.msg
  AprilTagsWithInfos.msg
  BoolStamped.msg
  ButtonEvent.msg
  CarControl.msg
  CoordinationClearance.msg
  CoordinationSignal.msg
  DiagnosticsCodeProfiling.msg
  DiagnosticsCodeProfilingArray.msg
  DiagnosticsRosLink.msg
  DiagnosticsRosLinkArray.msg
  DiagnosticsRosNode.msg
  DiagnosticsRosParameterArray.msg
  DiagnosticsRosTopic.msg
  DiagnosticsRosTopicArray.msg
  DisplayFragment.msg
  DroneControl.msg
  DroneMode.msg
  NodeParameter.msg
  DuckiebotLED.msg
  EncoderStamped.msg
  EpisodeStart.msg
  FSMState.msg
  IntersectionPose.msg
  IntersectionPoseImg.msg
  IntersectionPoseImgDebug.msg
  KinematicsParameters.msg
  KinematicsWeights.msg
  LanePose.msg
  LEDDetection.msg
  LEDDetectionArray.msg
  LEDDetectionDebugInfo.msg
  LEDInterpreter.msg
  LEDPattern.msg
  LightSensor.msg
  LineFollowerStamped.msg
  MaintenanceState.msg
  ObstacleImageDetection.msg
  ObstacleImageDetectionList.msg
  ObstacleProjectedDetection.msg
  ObstacleProjectedDetectionList.msg
  ObstacleType.msg
  ParamTuner.msg
  Pixel.msg
  Pose2DStamped.msg
  Rect.msg
  Rects.msg
  SceneSegments.msg
  Segment.msg
  SegmentList.msg
  SignalsDetection.msg
  SignalsDetectionETHZ17.msg
  SourceTargetNodes.msg
  StopLineReading.msg
  TagInfo.msg
  ThetaDotSample.msg
  Trajectory.msg
  TurnIDandType.msg
  Twist2DStamped.msg
  Vector2D.msg
  VehicleCorners.msg
  VehiclePose.msg
  Vsample.msg
  WheelEncoderStamped.msg
  WheelsCmd.msg
  WheelsCmdStamped.msg
  WheelsCmdDBV2Stamped.msg
)

## Generate services in the 'srv' folder
add_service_files(
  FILES
  ChangePattern.srv
  GetVariable.srv
  IMUstatus.srv
  LFstatus.srv
  NodeGetParamsList.srv
  NodeRequestParamsUpdate.srv
  SensorsStatus.srv
  SetCustomLEDPattern.srv
  SetFSMState.srv
  SetValue.srv
  SetVariable.srv
  ToFstatus.srv
)


## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  sensor_msgs
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES duckietown_msgs
   CATKIN_DEPENDS
   geometry_msgs
   roscpp rospy
   sensor_msgs
   std_msgs
   message_runtime
   visualization_msgs
#  DEPENDS system_lib
)


include_directories(
  ${catkin_INCLUDE_DIRS}
)
