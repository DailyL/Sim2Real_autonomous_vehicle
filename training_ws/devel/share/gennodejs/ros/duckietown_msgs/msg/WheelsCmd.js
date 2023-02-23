// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class WheelsCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vel_left = null;
      this.vel_right = null;
    }
    else {
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
    // Serializes a message object of type WheelsCmd
    // Serialize message field [vel_left]
    bufferOffset = _serializer.float32(obj.vel_left, buffer, bufferOffset);
    // Serialize message field [vel_right]
    bufferOffset = _serializer.float32(obj.vel_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WheelsCmd
    let len;
    let data = new WheelsCmd(null);
    // Deserialize message field [vel_left]
    data.vel_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_right]
    data.vel_right = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/WheelsCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95189a38cb8112e26fa8ced2d5359a0c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 vel_left
    float32 vel_right
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WheelsCmd(null);
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

module.exports = WheelsCmd;
