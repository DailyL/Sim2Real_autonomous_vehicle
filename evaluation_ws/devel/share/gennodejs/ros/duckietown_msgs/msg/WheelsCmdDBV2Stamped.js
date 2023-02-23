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

class WheelsCmdDBV2Stamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gamma = null;
      this.vel_wheel = null;
      this.trim = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gamma')) {
        this.gamma = initObj.gamma
      }
      else {
        this.gamma = 0.0;
      }
      if (initObj.hasOwnProperty('vel_wheel')) {
        this.vel_wheel = initObj.vel_wheel
      }
      else {
        this.vel_wheel = 0.0;
      }
      if (initObj.hasOwnProperty('trim')) {
        this.trim = initObj.trim
      }
      else {
        this.trim = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WheelsCmdDBV2Stamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gamma]
    bufferOffset = _serializer.float32(obj.gamma, buffer, bufferOffset);
    // Serialize message field [vel_wheel]
    bufferOffset = _serializer.float32(obj.vel_wheel, buffer, bufferOffset);
    // Serialize message field [trim]
    bufferOffset = _serializer.float32(obj.trim, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WheelsCmdDBV2Stamped
    let len;
    let data = new WheelsCmdDBV2Stamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gamma]
    data.gamma = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_wheel]
    data.vel_wheel = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [trim]
    data.trim = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/WheelsCmdDBV2Stamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7da28061cc173091cc0253decf17895d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 gamma           #"vel_left" changed to "gamma", RFMH_2019_02_26
    float32 vel_wheel       #"vel_right" changed to "vel_wheel", RFMH_2019_02_26
    float32 trim            #included "trim" to be accessible in the wheels_driver_node as well, RFMH_2019_04_01
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
    const resolved = new WheelsCmdDBV2Stamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gamma !== undefined) {
      resolved.gamma = msg.gamma;
    }
    else {
      resolved.gamma = 0.0
    }

    if (msg.vel_wheel !== undefined) {
      resolved.vel_wheel = msg.vel_wheel;
    }
    else {
      resolved.vel_wheel = 0.0
    }

    if (msg.trim !== undefined) {
      resolved.trim = msg.trim;
    }
    else {
      resolved.trim = 0.0
    }

    return resolved;
    }
};

module.exports = WheelsCmdDBV2Stamped;
