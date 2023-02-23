
"use strict";

let AntiInstagramHealth = require('./AntiInstagramHealth.js');
let IntersectionPoseImg = require('./IntersectionPoseImg.js');
let ObstacleType = require('./ObstacleType.js');
let LineFollowerStamped = require('./LineFollowerStamped.js');
let StopLineReading = require('./StopLineReading.js');
let DiagnosticsRosTopic = require('./DiagnosticsRosTopic.js');
let ObstacleImageDetection = require('./ObstacleImageDetection.js');
let AprilTagsWithInfos = require('./AprilTagsWithInfos.js');
let CoordinationClearance = require('./CoordinationClearance.js');
let Segment = require('./Segment.js');
let KinematicsWeights = require('./KinematicsWeights.js');
let DiagnosticsRosNode = require('./DiagnosticsRosNode.js');
let CoordinationSignal = require('./CoordinationSignal.js');
let VehicleCorners = require('./VehicleCorners.js');
let KinematicsParameters = require('./KinematicsParameters.js');
let TurnIDandType = require('./TurnIDandType.js');
let DiagnosticsRosProfiling = require('./DiagnosticsRosProfiling.js');
let DuckieSensor = require('./DuckieSensor.js');
let LEDDetection = require('./LEDDetection.js');
let DiagnosticsRosProfilingUnit = require('./DiagnosticsRosProfilingUnit.js');
let DiagnosticsRosTopicArray = require('./DiagnosticsRosTopicArray.js');
let DiagnosticsRosLinkArray = require('./DiagnosticsRosLinkArray.js');
let EpisodeStart = require('./EpisodeStart.js');
let WheelsCmd = require('./WheelsCmd.js');
let Pose2DStamped = require('./Pose2DStamped.js');
let LightSensor = require('./LightSensor.js');
let Vsample = require('./Vsample.js');
let WheelEncoderStamped = require('./WheelEncoderStamped.js');
let TagInfo = require('./TagInfo.js');
let Twist2DStamped = require('./Twist2DStamped.js');
let StreetNameDetection = require('./StreetNameDetection.js');
let SceneSegments = require('./SceneSegments.js');
let MaintenanceState = require('./MaintenanceState.js');
let DiagnosticsRosParameterArray = require('./DiagnosticsRosParameterArray.js');
let DroneControl = require('./DroneControl.js');
let LEDDetectionDebugInfo = require('./LEDDetectionDebugInfo.js');
let LEDInterpreter = require('./LEDInterpreter.js');
let Rect = require('./Rect.js');
let LEDPattern = require('./LEDPattern.js');
let VehiclePose = require('./VehiclePose.js');
let AntiInstagramTransform = require('./AntiInstagramTransform.js');
let SignalsDetectionETHZ17 = require('./SignalsDetectionETHZ17.js');
let ParamTuner = require('./ParamTuner.js');
let IntersectionPoseImgDebug = require('./IntersectionPoseImgDebug.js');
let ObstacleImageDetectionList = require('./ObstacleImageDetectionList.js');
let SegmentList = require('./SegmentList.js');
let LEDDetectionArray = require('./LEDDetectionArray.js');
let StreetNames = require('./StreetNames.js');
let AprilTagDetection = require('./AprilTagDetection.js');
let Vector2D = require('./Vector2D.js');
let Pixel = require('./Pixel.js');
let CarControl = require('./CarControl.js');
let ObstacleProjectedDetection = require('./ObstacleProjectedDetection.js');
let DiagnosticsRosLink = require('./DiagnosticsRosLink.js');
let DisplayFragment = require('./DisplayFragment.js');
let ThetaDotSample = require('./ThetaDotSample.js');
let Trajectory = require('./Trajectory.js');
let LanePose = require('./LanePose.js');
let DiagnosticsCodeProfiling = require('./DiagnosticsCodeProfiling.js');
let DiagnosticsCodeProfilingArray = require('./DiagnosticsCodeProfilingArray.js');
let AprilTagDetectionArray = require('./AprilTagDetectionArray.js');
let ButtonEvent = require('./ButtonEvent.js');
let NodeParameter = require('./NodeParameter.js');
let IntersectionPose = require('./IntersectionPose.js');
let DroneMode = require('./DroneMode.js');
let Rects = require('./Rects.js');
let FSMState = require('./FSMState.js');
let SignalsDetection = require('./SignalsDetection.js');
let WheelsCmdStamped = require('./WheelsCmdStamped.js');
let WheelsCmdDBV2Stamped = require('./WheelsCmdDBV2Stamped.js');
let DuckiebotLED = require('./DuckiebotLED.js');
let EncoderStamped = require('./EncoderStamped.js');
let AntiInstagramThresholds = require('./AntiInstagramThresholds.js');
let BoolStamped = require('./BoolStamped.js');
let SourceTargetNodes = require('./SourceTargetNodes.js');
let ObstacleProjectedDetectionList = require('./ObstacleProjectedDetectionList.js');

module.exports = {
  AntiInstagramHealth: AntiInstagramHealth,
  IntersectionPoseImg: IntersectionPoseImg,
  ObstacleType: ObstacleType,
  LineFollowerStamped: LineFollowerStamped,
  StopLineReading: StopLineReading,
  DiagnosticsRosTopic: DiagnosticsRosTopic,
  ObstacleImageDetection: ObstacleImageDetection,
  AprilTagsWithInfos: AprilTagsWithInfos,
  CoordinationClearance: CoordinationClearance,
  Segment: Segment,
  KinematicsWeights: KinematicsWeights,
  DiagnosticsRosNode: DiagnosticsRosNode,
  CoordinationSignal: CoordinationSignal,
  VehicleCorners: VehicleCorners,
  KinematicsParameters: KinematicsParameters,
  TurnIDandType: TurnIDandType,
  DiagnosticsRosProfiling: DiagnosticsRosProfiling,
  DuckieSensor: DuckieSensor,
  LEDDetection: LEDDetection,
  DiagnosticsRosProfilingUnit: DiagnosticsRosProfilingUnit,
  DiagnosticsRosTopicArray: DiagnosticsRosTopicArray,
  DiagnosticsRosLinkArray: DiagnosticsRosLinkArray,
  EpisodeStart: EpisodeStart,
  WheelsCmd: WheelsCmd,
  Pose2DStamped: Pose2DStamped,
  LightSensor: LightSensor,
  Vsample: Vsample,
  WheelEncoderStamped: WheelEncoderStamped,
  TagInfo: TagInfo,
  Twist2DStamped: Twist2DStamped,
  StreetNameDetection: StreetNameDetection,
  SceneSegments: SceneSegments,
  MaintenanceState: MaintenanceState,
  DiagnosticsRosParameterArray: DiagnosticsRosParameterArray,
  DroneControl: DroneControl,
  LEDDetectionDebugInfo: LEDDetectionDebugInfo,
  LEDInterpreter: LEDInterpreter,
  Rect: Rect,
  LEDPattern: LEDPattern,
  VehiclePose: VehiclePose,
  AntiInstagramTransform: AntiInstagramTransform,
  SignalsDetectionETHZ17: SignalsDetectionETHZ17,
  ParamTuner: ParamTuner,
  IntersectionPoseImgDebug: IntersectionPoseImgDebug,
  ObstacleImageDetectionList: ObstacleImageDetectionList,
  SegmentList: SegmentList,
  LEDDetectionArray: LEDDetectionArray,
  StreetNames: StreetNames,
  AprilTagDetection: AprilTagDetection,
  Vector2D: Vector2D,
  Pixel: Pixel,
  CarControl: CarControl,
  ObstacleProjectedDetection: ObstacleProjectedDetection,
  DiagnosticsRosLink: DiagnosticsRosLink,
  DisplayFragment: DisplayFragment,
  ThetaDotSample: ThetaDotSample,
  Trajectory: Trajectory,
  LanePose: LanePose,
  DiagnosticsCodeProfiling: DiagnosticsCodeProfiling,
  DiagnosticsCodeProfilingArray: DiagnosticsCodeProfilingArray,
  AprilTagDetectionArray: AprilTagDetectionArray,
  ButtonEvent: ButtonEvent,
  NodeParameter: NodeParameter,
  IntersectionPose: IntersectionPose,
  DroneMode: DroneMode,
  Rects: Rects,
  FSMState: FSMState,
  SignalsDetection: SignalsDetection,
  WheelsCmdStamped: WheelsCmdStamped,
  WheelsCmdDBV2Stamped: WheelsCmdDBV2Stamped,
  DuckiebotLED: DuckiebotLED,
  EncoderStamped: EncoderStamped,
  AntiInstagramThresholds: AntiInstagramThresholds,
  BoolStamped: BoolStamped,
  SourceTargetNodes: SourceTargetNodes,
  ObstacleProjectedDetectionList: ObstacleProjectedDetectionList,
};
