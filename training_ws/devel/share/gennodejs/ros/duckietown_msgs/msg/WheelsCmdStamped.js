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

class WheelsCmdStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vel_left = null;
      this.vel_right = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vel_left')) {
        this.vel_left = initObj.vel_left
      }
      else {
        this.vel_left = 0.0;
      }
      if (initObj.hasOwnProperty('vel_right')) {
        this.vel_right = initObj.vel_right
      }
      else {
        this.vel_right = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WheelsCmdStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vel_left]
    bufferOffset = _serializer.float32(obj.vel_left, buffer, bufferOffset);
    // Serialize message field [vel_right]
    bufferOffset = _serializer.float32(obj.vel_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WheelsCmdStamped
    let len;
    let data = new WheelsCmdStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vel_left]
    data.vel_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_right]
    data.vel_right = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/WheelsCmdStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'edbf8d24194d839b1982a6a991b552c6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 vel_left
    float32 vel_right
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
    const resolved = new WheelsCmdStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vel_left !== undefined) {
      resolved.vel_left = msg.vel_left;
    }
    else {
      resolved.vel_left = 0.0
    }

    if (msg.vel_right !== undefined) {
      resolved.vel_right = msg.vel_right;
    }
    else {
      resolved.vel_right = 0.0
    }

    return resolved;
    }
};

module.exports = WheelsCmdStamped;
