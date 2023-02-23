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

class SetVariableRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name_json = null;
      this.value_json = null;
    }
    else {
      if (initObj.hasOwnProperty('name_json')) {
        this.name_json = initObj.name_json
      }
      else {
        this.name_json = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('value_json')) {
        this.value_json = initObj.value_json
      }
      else {
        this.value_json = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetVariableRequest
    // Serialize message field [name_json]
    bufferOffset = std_msgs.msg.String.serialize(obj.name_json, buffer, bufferOffset);
    // Serialize message field [value_json]
    bufferOffset = std_msgs.msg.String.serialize(obj.value_json, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetVariableRequest
    let len;
    let data = new SetVariableRequest(null);
    // Deserialize message field [name_json]
    data.name_json = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [value_json]
    data.value_json = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.name_json);
    length += std_msgs.msg.String.getMessageSize(object.value_json);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SetVariableRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ff1d830472a201c84516b10d8265cb7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String name_json
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
    const resolved = new SetVariableRequest(null);
    if (msg.name_json !== undefined) {
      resolved.name_json = std_msgs.msg.String.Resolve(msg.name_json)
    }
    else {
      resolved.name_json = new std_msgs.msg.String()
    }

    if (msg.value_json !== undefined) {
      resolved.value_json = std_msgs.msg.String.Resolve(msg.value_json)
    }
    else {
      resolved.value_json = new std_msgs.msg.String()
    }

    return resolved;
    }
};

class SetVariableResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success_json = null;
    }
    else {
      if (initObj.hasOwnProperty('success_json')) {
        this.success_json = initObj.success_json
      }
      else {
        this.success_json = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetVariableResponse
    // Serialize message field [success_json]
    bufferOffset = std_msgs.msg.String.serialize(obj.success_json, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetVariableResponse
    let len;
    let data = new SetVariableResponse(null);
    // Deserialize message field [success_json]
    data.success_json = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.success_json);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SetVariableResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9b40e451a7c63a6647ba8c4c52db0f4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/String success_json
    
    
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
    const resolved = new SetVariableResponse(null);
    if (msg.success_json !== undefined) {
      resolved.success_json = std_msgs.msg.String.Resolve(msg.success_json)
    }
    else {
      resolved.success_json = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = {
  Request: SetVariableRequest,
  Response: SetVariableResponse,
  md5sum() { return 'b9596f8691f82d6cddb450d38ac5e5af'; },
  datatype() { return 'duckietown_msgs/SetVariable'; }
};
