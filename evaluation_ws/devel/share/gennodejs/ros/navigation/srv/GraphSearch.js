// Auto-generated. Do not edit!

// (in-package navigation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GraphSearchRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.source_node = null;
      this.target_node = null;
    }
    else {
      if (initObj.hasOwnProperty('source_node')) {
        this.source_node = initObj.source_node
      }
      else {
        this.source_node = '';
      }
      if (initObj.hasOwnProperty('target_node')) {
        this.target_node = initObj.target_node
      }
      else {
        this.target_node = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphSearchRequest
    // Serialize message field [source_node]
    bufferOffset = _serializer.string(obj.source_node, buffer, bufferOffset);
    // Serialize message field [target_node]
    bufferOffset = _serializer.string(obj.target_node, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphSearchRequest
    let len;
    let data = new GraphSearchRequest(null);
    // Deserialize message field [source_node]
    data.source_node = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [target_node]
    data.target_node = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.source_node);
    length += _getByteLength(object.target_node);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'navigation/GraphSearchRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f05fda47731d8da1f80e3a499a42edf9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string source_node
    string target_node
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphSearchRequest(null);
    if (msg.source_node !== undefined) {
      resolved.source_node = msg.source_node;
    }
    else {
      resolved.source_node = ''
    }

    if (msg.target_node !== undefined) {
      resolved.target_node = msg.target_node;
    }
    else {
      resolved.target_node = ''
    }

    return resolved;
    }
};

class GraphSearchResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.actions = null;
    }
    else {
      if (initObj.hasOwnProperty('actions')) {
        this.actions = initObj.actions
      }
      else {
        this.actions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphSearchResponse
    // Serialize message field [actions]
    bufferOffset = _arraySerializer.string(obj.actions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphSearchResponse
    let len;
    let data = new GraphSearchResponse(null);
    // Deserialize message field [actions]
    data.actions = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.actions.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'navigation/GraphSearchResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f07885866f2898e1d5d5a009ea44ae10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] actions
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphSearchResponse(null);
    if (msg.actions !== undefined) {
      resolved.actions = msg.actions;
    }
    else {
      resolved.actions = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GraphSearchRequest,
  Response: GraphSearchResponse,
  md5sum() { return '09a6e880a7e29d5f1df1f6f7be49541d'; },
  datatype() { return 'navigation/GraphSearch'; }
};
