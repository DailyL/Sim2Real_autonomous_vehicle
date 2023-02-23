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

class GetVariableRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name_json = null;
    }
    else {
      if (initObj.hasOwnProperty('name_json')) {
        this.name_json = initObj.name_json
      }
      else {
        this.name_json = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetVariableRequest
    // Serialize message field [name_json]
    bufferOffset = std_msgs.msg.String.serialize(obj.name_json, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetVariableRequest
    let len;
    let data = new GetVariableRequest(null);
    // Deserialize message field [name_json]
    data.name_json = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.name_json);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/GetVariableRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e62a392e1985c0f620cc4494f046ad84';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String name_json
    
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
    const resolved = new GetVariableRequest(null);
    if (msg.name_json !== undefined) {
      resolved.name_json = std_msgs.msg.String.Resolve(msg.name_json)
    }
    else {
      resolved.name_json = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class GetVariableResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value_json = null;
    }
    else {
      if (initObj.hasOwnProperty('value_json')) {
        this.value_json = initObj.value_json
      }
      else {
        this.value_json = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetVariableResponse
    // Serialize message field [value_json]
    bufferOffset = std_msgs.msg.String.serialize(obj.value_json, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetVariableResponse
    let len;
    let data = new GetVariableResponse(null);
    // Deserialize message field [value_json]
    data.value_json = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.value_json);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/GetVariableResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8570e70d8c775be7006dff91bf8174b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String value_json
    
    
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
    const resolved = new GetVariableResponse(null);
    if (msg.value_json !== undefined) {
      resolved.value_json = std_msgs.msg.String.Resolve(msg.value_json)
    }
    else {
      resolved.value_json = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetVariableRequest,
  Response: GetVariableResponse,
  md5sum() { return '685a8058475bb3a593fd8f9319066e6a'; },
  datatype() { return 'duckietown_msgs/GetVariable'; }
};
