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

class SourceTargetNodes {
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
    // Serializes a message object of type SourceTargetNodes
    // Serialize message field [source_node]
    bufferOffset = _serializer.string(obj.source_node, buffer, bufferOffset);
    // Serialize message field [target_node]
    bufferOffset = _serializer.string(obj.target_node, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SourceTargetNodes
    let len;
    let data = new SourceTargetNodes(null);
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
    // Returns string type for a message object
    return 'duckietown_msgs/SourceTargetNodes';
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
    const resolved = new SourceTargetNodes(null);
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

module.exports = SourceTargetNodes;
