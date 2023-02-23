// Auto-generated. Do not edit!

// (in-package duckietown_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let NodeParameter = require('../msg/NodeParameter.js');

//-----------------------------------------------------------

class NodeGetParamsListRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NodeGetParamsListRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NodeGetParamsListRequest
    let len;
    let data = new NodeGetParamsListRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/NodeGetParamsListRequest';
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
    const resolved = new NodeGetParamsListRequest(null);
    return resolved;
    }
};

class NodeGetParamsListResponse {
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
    // Serializes a message object of type NodeGetParamsListResponse
    // Serialize message field [parameters]
    // Serialize the length for message field [parameters]
    bufferOffset = _serializer.uint32(obj.parameters.length, buffer, bufferOffset);
    obj.parameters.forEach((val) => {
      bufferOffset = NodeParameter.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NodeGetParamsListResponse
    let len;
    let data = new NodeGetParamsListResponse(null);
    // Deserialize message field [parameters]
    // Deserialize array length for message field [parameters]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parameters = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parameters[i] = NodeParameter.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.parameters.forEach((val) => {
      length += NodeParameter.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/NodeGetParamsListResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d0f5ba1e047603a0b1306ec478bb3e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    duckietown_msgs/NodeParameter[] parameters
    
    
    ================================================================================
    MSG: duckietown_msgs/NodeParameter
    # Parameter type (this has to match duckietown.TopicType)
    uint8 PARAM_TYPE_UNKNOWN = 0
    uint8 PARAM_TYPE_STRING = 1
    uint8 PARAM_TYPE_INT = 2
    uint8 PARAM_TYPE_FLOAT = 3
    uint8 PARAM_TYPE_BOOL = 4
    
    string node         # Name of the node
    string name         # Name of the parameter (fully resolved)
    string help         # Description of the parameter
    uint8 type          # Type of the parameter (see PARAM_TYPE_X above)
    float32 min_value   # Min value (for type INT, UINT, and FLOAT)
    float32 max_value   # Max value (for type INT, UINT, and FLOAT)
    bool editable       # Editable (it means that the node will be notified for changes)
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NodeGetParamsListResponse(null);
    if (msg.parameters !== undefined) {
      resolved.parameters = new Array(msg.parameters.length);
      for (let i = 0; i < resolved.parameters.length; ++i) {
        resolved.parameters[i] = NodeParameter.Resolve(msg.parameters[i]);
      }
    }
    else {
      resolved.parameters = []
    }

    return resolved;
    }
};

module.exports = {
  Request: NodeGetParamsListRequest,
  Response: NodeGetParamsListResponse,
  md5sum() { return '6d0f5ba1e047603a0b1306ec478bb3e5'; },
  datatype() { return 'duckietown_msgs/NodeGetParamsList'; }
};
