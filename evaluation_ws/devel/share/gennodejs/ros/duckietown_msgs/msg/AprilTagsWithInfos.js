// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AprilTagDetection = require('./AprilTagDetection.js');
let TagInfo = require('./TagInfo.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class AprilTagsWithInfos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.detections = null;
      this.infos = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('detections')) {
        this.detections = initObj.detections
      }
      else {
        this.detections = [];
      }
      if (initObj.hasOwnProperty('infos')) {
        this.infos = initObj.infos
      }
      else {
        this.infos = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AprilTagsWithInfos
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [detections]
    // Serialize the length for message field [detections]
    bufferOffset = _serializer.uint32(obj.detections.length, buffer, bufferOffset);
    obj.detections.forEach((val) => {
      bufferOffset = AprilTagDetection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [infos]
    // Serialize the length for message field [infos]
    bufferOffset = _serializer.uint32(obj.infos.length, buffer, bufferOffset);
    obj.infos.forEach((val) => {
      bufferOffset = TagInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AprilTagsWithInfos
    let len;
    let data = new AprilTagsWithInfos(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [detections]
    // Deserialize array length for message field [detections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detections[i] = AprilTagDetection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [infos]
    // Deserialize array length for message field [infos]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.infos = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.infos[i] = TagInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.detections.forEach((val) => {
      length += AprilTagDetection.getMessageSize(val);
    });
    object.infos.forEach((val) => {
      length += TagInfo.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/AprilTagsWithInfos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77712a218c71ce85b76155ff87db1adb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/AprilTagDetection[] detections
    duckietown_msgs/TagInfo[] infos
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: duckietown_msgs/AprilTagDetection
    geometry_msgs/Transform transform
    int32 tag_id
    string tag_family
    int32 hamming
    float32 decision_margin
    float32[9] homography
    float32[2] center
    float32[8] corners
    float32 pose_error
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: duckietown_msgs/TagInfo
    Header header
    int32 id
    
    #(StreetName, TrafficSign, Localization, Vehicle)
    uint8 tag_type
    
    uint8 S_NAME=0
    uint8 SIGN=1	
    uint8 LIGHT=2
    uint8 LOCALIZE=3
    uint8 VEHICLE=4
    
    string street_name
    
    uint8 traffic_sign_type
    # (12 possible traffic sign types)
    
    uint8 STOP=5
    uint8 YIELD=6
    uint8 NO_RIGHT_TURN=7
    uint8 NO_LEFT_TURN=8
    uint8 ONEWAY_RIGHT=9
    uint8 ONEWAY_LEFT=10
    uint8 FOUR_WAY=11
    uint8 RIGHT_T_INTERSECT=12
    uint8 LEFT_T_INTERSECT=13
    uint8 T_INTERSECTION=14
    uint8 DO_NOT_ENTER=15
    uint8 PEDESTRIAN=16
    uint8 T_LIGHT_AHEAD=17
    uint8 DUCK_CROSSING=18
    uint8 PARKING=19
    
    string vehicle_name
    
    # Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.
    float32 location
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AprilTagsWithInfos(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.detections !== undefined) {
      resolved.detections = new Array(msg.detections.length);
      for (let i = 0; i < resolved.detections.length; ++i) {
        resolved.detections[i] = AprilTagDetection.Resolve(msg.detections[i]);
      }
    }
    else {
      resolved.detections = []
    }

    if (msg.infos !== undefined) {
      resolved.infos = new Array(msg.infos.length);
      for (let i = 0; i < resolved.infos.length; ++i) {
        resolved.infos[i] = TagInfo.Resolve(msg.infos[i]);
      }
    }
    else {
      resolved.infos = []
    }

    return resolved;
    }
};

module.exports = AprilTagsWithInfos;
