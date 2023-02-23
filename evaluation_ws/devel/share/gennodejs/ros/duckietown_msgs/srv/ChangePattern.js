// Auto-generated. Do not edit!

// (in-package duckietown_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ChangePatternRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pattern_name = null;
    }
    else {
      if (initObj.hasOwnProperty('pattern_name')) {
        this.pattern_name = initObj.pattern_name
      }
      else {
        this.pattern_name = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangePatternRequest
    // Serialize message field [pattern_name]
    bufferOffset = std_msgs.msg.String.serialize(obj.pattern_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangePatternRequest
    let len;
    let data = new ChangePatternRequest(null);
    // Deserialize message field [pattern_name]
    data.pattern_name = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.pattern_name);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/ChangePatternRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '678f2d65b1bda577ab0910fd9c7414ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String pattern_name
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangePatternRequest(null);
    if (msg.pattern_name !== undefined) {
      resolved.pattern_name = std_msgs.msg.String.Resolve(msg.pattern_name)
    }
    else {
      resolved.pattern_name = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class ChangePatternResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangePatternResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangePatternResponse
    let len;
    let data = new ChangePatternResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/ChangePatternResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangePatternResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: ChangePatternRequest,
  Response: ChangePatternResponse,
  md5sum() { return '678f2d65b1bda577ab0910fd9c7414ba'; },
  datatype() { return 'duckietown_msgs/ChangePattern'; }
};
