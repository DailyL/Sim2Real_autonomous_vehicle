// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class TagInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.tag_type = null;
      this.street_name = null;
      this.traffic_sign_type = null;
      this.vehicle_name = null;
      this.location = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('tag_type')) {
        this.tag_type = initObj.tag_type
      }
      else {
        this.tag_type = 0;
      }
      if (initObj.hasOwnProperty('street_name')) {
        this.street_name = initObj.street_name
      }
      else {
        this.street_name = '';
      }
      if (initObj.hasOwnProperty('traffic_sign_type')) {
        this.traffic_sign_type = initObj.traffic_sign_type
      }
      else {
        this.traffic_sign_type = 0;
      }
      if (initObj.hasOwnProperty('vehicle_name')) {
        this.vehicle_name = initObj.vehicle_name
      }
      else {
        this.vehicle_name = '';
      }
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TagInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [tag_type]
    bufferOffset = _serializer.uint8(obj.tag_type, buffer, bufferOffset);
    // Serialize message field [street_name]
    bufferOffset = _serializer.string(obj.street_name, buffer, bufferOffset);
    // Serialize message field [traffic_sign_type]
    bufferOffset = _serializer.uint8(obj.traffic_sign_type, buffer, bufferOffset);
    // Serialize message field [vehicle_name]
    bufferOffset = _serializer.string(obj.vehicle_name, buffer, bufferOffset);
    // Serialize message field [location]
    bufferOffset = _serializer.float32(obj.location, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TagInfo
    let len;
    let data = new TagInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tag_type]
    data.tag_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [street_name]
    data.street_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [traffic_sign_type]
    data.traffic_sign_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vehicle_name]
    data.vehicle_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [location]
    data.location = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.street_name);
    length += _getByteLength(object.vehicle_name);
    return length + 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/TagInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd194db19dc43ddeaa93486d02f120934';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TagInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.tag_type !== undefined) {
      resolved.tag_type = msg.tag_type;
    }
    else {
      resolved.tag_type = 0
    }

    if (msg.street_name !== undefined) {
      resolved.street_name = msg.street_name;
    }
    else {
      resolved.street_name = ''
    }

    if (msg.traffic_sign_type !== undefined) {
      resolved.traffic_sign_type = msg.traffic_sign_type;
    }
    else {
      resolved.traffic_sign_type = 0
    }

    if (msg.vehicle_name !== undefined) {
      resolved.vehicle_name = msg.vehicle_name;
    }
    else {
      resolved.vehicle_name = ''
    }

    if (msg.location !== undefined) {
      resolved.location = msg.location;
    }
    else {
      resolved.location = 0.0
    }

    return resolved;
    }
};

// Constants for message
TagInfo.Constants = {
  S_NAME: 0,
  SIGN: 1,
  LIGHT: 2,
  LOCALIZE: 3,
  VEHICLE: 4,
  STOP: 5,
  YIELD: 6,
  NO_RIGHT_TURN: 7,
  NO_LEFT_TURN: 8,
  ONEWAY_RIGHT: 9,
  ONEWAY_LEFT: 10,
  FOUR_WAY: 11,
  RIGHT_T_INTERSECT: 12,
  LEFT_T_INTERSECT: 13,
  T_INTERSECTION: 14,
  DO_NOT_ENTER: 15,
  PEDESTRIAN: 16,
  T_LIGHT_AHEAD: 17,
  DUCK_CROSSING: 18,
  PARKING: 19,
}

module.exports = TagInfo;
