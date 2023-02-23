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

class KinematicsParameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.parameters = null;
    }
    else {
      if (initObj.hasOwnProperty('parameters')) {
        this.parameters = initObj.parameters
      }
      else {
        this.parameters = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KinematicsParameters
    // Serialize message field [parameters]
    bufferOffset = _arraySerializer.float64(obj.parameters, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KinematicsParameters
    let len;
    let data = new KinematicsParameters(null);
    // Deserialize message field [parameters]
    data.parameters = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.parameters.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/KinematicsParameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cbca57679564ab84ca723072e3bf6226';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] parameters
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new KinematicsParameters(null);
    if (msg.parameters !== undefined) {
      resolved.parameters = msg.parameters;
    }
    else {
      resolved.parameters = []
    }

    return resolved;
    }
};

module.exports = KinematicsParameters;
