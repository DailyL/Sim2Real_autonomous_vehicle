
"use strict";

let IntersectionPoseImgDebug = require('./IntersectionPoseImgDebug.js');
let DiagnosticsCodeProfiling = require('./DiagnosticsCodeProfiling.js');
let DroneMode = require('./DroneMode.js');
let ObstacleImageDetectionList = require('./ObstacleImageDetectionList.js');
let KinematicsParameters = require('./KinematicsParameters.js');
let DuckieSensor = require('./DuckieSensor.js');
let WheelEncoderStamped = require('./WheelEncoderStamped.js');
let LEDDetectionArray = require('./LEDDetectionArray.js');
let DiagnosticsRosLinkArray = require('./DiagnosticsRosLinkArray.js');
let DiagnosticsRosParameterArray = require('./DiagnosticsRosParameterArray.js');
let EncoderStamped = require('./EncoderStamped.js');
let SourceTargetNodes = require('./SourceTargetNodes.js');
let SignalsDetection = require('./SignalsDetection.js');
let ThetaDotSample = require('./ThetaDotSample.js');
let VehiclePose = require('./VehiclePose.js');
let CarControl = require('./CarControl.js');
let SceneSegments = require('./SceneSegments.js');
let StreetNameDetection = require('./StreetNameDetection.js');
let MaintenanceState = require('./MaintenanceState.js');
let StreetNames = require('./StreetNames.js');
let IntersectionPose = require('./IntersectionPose.js');
let LEDDetectionDebugInfo = require('./LEDDetectionDebugInfo.js');
let DuckiebotLED = require('./DuckiebotLED.js');
let ButtonEvent = require('./ButtonEvent.js');
let ObstacleImageDetection = require('./ObstacleImageDetection.js');
let BoolStamped = require('./BoolStamped.js');
let IntersectionPoseImg = require('./IntersectionPoseImg.js');
let LanePose = require('./LanePose.js');
let EpisodeStart = require('./EpisodeStart.js');
let Vsample = require('./Vsample.js');
let DiagnosticsRosTopic = require('./DiagnosticsRosTopic.js');
let LightSensor = require('./LightSensor.js');
let LEDPattern = require('./LEDPattern.js');
let LineFollowerStamped = require('./LineFollowerStamped.js');
let SegmentList = require('./SegmentList.js');
let DroneControl = require('./DroneControl.js');
let LEDDetection = require('./LEDDetection.js');
let KinematicsWeights = require('./KinematicsWeights.js');
let Segment = require('./Segment.js');
let Rects = require('./Rects.js');
let Pose2DStamped = require('./Pose2DStamped.js');
let DiagnosticsRosProfilingUnit = require('./DiagnosticsRosProfilingUnit.js');
let AntiInstagramThresholds = require('./AntiInstagramThresholds.js');
let LEDInterpreter = require('./LEDInterpreter.js');
let VehicleCorners = require('./VehicleCorners.js');
let AprilTagsWithInfos = require('./AprilTagsWithInfos.js');
let CoordinationSignal = require('./CoordinationSignal.js');
let FSMState = require('./FSMState.js');
let DiagnosticsRosTopicArray = require('./DiagnosticsRosTopicArray.js');
let Pixel = require('./Pixel.js');
let DiagnosticsRosNode = require('./DiagnosticsRosNode.js');
let WheelsCmdDBV2Stamped = require('./WheelsCmdDBV2Stamped.js');
let SignalsDetectionETHZ17 = require('./SignalsDetectionETHZ17.js');
let ObstacleProjectedDetectionList = require('./ObstacleProjectedDetectionList.js');
let Trajectory = require('./Trajectory.js');
let WheelsCmd = require('./WheelsCmd.js');
let DiagnosticsCodeProfilingArray = require('./DiagnosticsCodeProfilingArray.js');
let Twist2DStamped = require('./Twist2DStamped.js');
let ParamTuner = require('./ParamTuner.js');
let TurnIDandType = require('./TurnIDandType.js');
let ObstacleProjectedDetection = require('./ObstacleProjectedDetection.js');
let StopLineReading = require('./StopLineReading.js');
let NodeParameter = require('./NodeParameter.js');
let Vector2D = require('./Vector2D.js');
let CoordinationClearance = require('./CoordinationClearance.js');
let ObstacleType = require('./ObstacleType.js');
let Rect = require('./Rect.js');
let DiagnosticsRosProfiling = require('./DiagnosticsRosProfiling.js');
let WheelsCmdStamped = require('./WheelsCmdStamped.js');
let AprilTagDetection = require('./AprilTagDetection.js');
let DiagnosticsRosLink = require('./DiagnosticsRosLink.js');
let TagInfo = require('./TagInfo.js');
let DisplayFragment = require('./DisplayFragment.js');
let AprilTagDetectionArray = require('./AprilTagDetectionArray.js');

module.exports = {
  IntersectionPoseImgDebug: IntersectionPoseImgDebug,
  DiagnosticsCodeProfiling: DiagnosticsCodeProfiling,
  DroneMode: DroneMode,
  ObstacleImageDetectionList: ObstacleImageDetectionList,
  KinematicsParameters: KinematicsParameters,
  DuckieSensor: DuckieSensor,
  WheelEncoderStamped: WheelEncoderStamped,
  LEDDetectionArray: LEDDetectionArray,
  DiagnosticsRosLinkArray: DiagnosticsRosLinkArray,
  DiagnosticsRosParameterArray: DiagnosticsRosParameterArray,
  EncoderStamped: EncoderStamped,
  SourceTargetNodes: SourceTargetNodes,
  SignalsDetection: SignalsDetection,
  ThetaDotSample: ThetaDotSample,
  VehiclePose: VehiclePose,
  CarControl: CarControl,
  SceneSegments: SceneSegments,
  StreetNameDetection: StreetNameDetection,
  MaintenanceState: MaintenanceState,
  StreetNames: StreetNames,
  IntersectionPose: IntersectionPose,
  LEDDetectionDebugInfo: LEDDetectionDebugInfo,
  DuckiebotLED: DuckiebotLED,
  ButtonEvent: ButtonEvent,
  ObstacleImageDetection: ObstacleImageDetection,
  BoolStamped: BoolStamped,
  IntersectionPoseImg: IntersectionPoseImg,
  LanePose: LanePose,
  EpisodeStart: EpisodeStart,
  Vsample: Vsample,
  DiagnosticsRosTopic: DiagnosticsRosTopic,
  LightSensor: LightSensor,
  LEDPattern: LEDPattern,
  LineFollowerStamped: LineFollowerStamped,
  SegmentList: SegmentList,
  DroneControl: DroneControl,
  LEDDetection: LEDDetection,
  KinematicsWeights: KinematicsWeights,
  Segment: Segment,
  Rects: Rects,
  Pose2DStamped: Pose2DStamped,
  DiagnosticsRosProfilingUnit: DiagnosticsRosProfilingUnit,
  AntiInstagramThresholds: AntiInstagramThresholds,
  LEDInterpreter: LEDInterpreter,
  VehicleCorners: VehicleCorners,
  AprilTagsWithInfos: AprilTagsWithInfos,
  CoordinationSignal: CoordinationSignal,
  FSMState: FSMState,
  DiagnosticsRosTopicArray: DiagnosticsRosTopicArray,
  Pixel: Pixel,
  DiagnosticsRosNode: DiagnosticsRosNode,
  WheelsCmdDBV2Stamped: WheelsCmdDBV2Stamped,
  SignalsDetectionETHZ17: SignalsDetectionETHZ17,
  ObstacleProjectedDetectionList: ObstacleProjectedDetectionList,
  Trajectory: Trajectory,
  WheelsCmd: WheelsCmd,
  DiagnosticsCodeProfilingArray: DiagnosticsCodeProfilingArray,
  Twist2DStamped: Twist2DStamped,
  ParamTuner: ParamTuner,
  TurnIDandType: TurnIDandType,
  ObstacleProjectedDetection: ObstacleProjectedDetection,
  StopLineReading: StopLineReading,
  NodeParameter: NodeParameter,
  Vector2D: Vector2D,
  CoordinationClearance: CoordinationClearance,
  ObstacleType: ObstacleType,
  Rect: Rect,
  DiagnosticsRosProfiling: DiagnosticsRosProfiling,
  WheelsCmdStamped: WheelsCmdStamped,
  AprilTagDetection: AprilTagDetection,
  DiagnosticsRosLink: DiagnosticsRosLink,
  TagInfo: TagInfo,
  DisplayFragment: DisplayFragment,
  AprilTagDetectionArray: AprilTagDetectionArray,
};
