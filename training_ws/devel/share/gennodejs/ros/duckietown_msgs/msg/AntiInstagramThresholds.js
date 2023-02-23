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

class AntiInstagramThresholds {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.low = null;
      this.high = null;
    }
    else {
      if (initObj.hasOwnProperty('low')) {
        this.low = initObj.low
      }
      else {
        this.low = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('high')) {
        this.high = initObj.high
      }
      else {
        this.high = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AntiInstagramThresholds
    // Check that the constant length array field [low] has the right length
    if (obj.low.length !== 3) {
      throw new Error('Unable to serialize array field low - length must be 3')
    }
    // Serialize message field [low]
    bufferOffset = _arraySerializer.int16(obj.low, buffer, bufferOffset, 3);
    // Check that the constant length array field [high] has the right length
    if (obj.high.length !== 3) {
      throw new Error('Unable to serialize array field high - length must be 3')
    }
    // Serialize message field [high]
    bufferOffset = _arraySerializer.int16(obj.high, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AntiInstagramThresholds
    let len;
    let data = new AntiInstagramThresholds(null);
    // Deserialize message field [low]
    data.low = _arrayDeserializer.int16(buffer, bufferOffset, 3)
    // Deserialize message field [high]
    data.high = _arrayDeserializer.int16(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/AntiInstagramThresholds';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcde9d2f8b33a444d7909aaaa7563290';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16[3] low
    int16[3] high
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AntiInstagramThresholds(null);
    if (msg.low !== undefined) {
      resolved.low = msg.low;
    }
    else {
      resolved.low = new Array(3).fill(0)
    }

    if (msg.high !== undefined) {
      resolved.high = msg.high;
    }
    else {
      resolved.high = new Array(3).fill(0)
    }

    return resolved;
    }
};

module.exports = AntiInstagramThresholds;
