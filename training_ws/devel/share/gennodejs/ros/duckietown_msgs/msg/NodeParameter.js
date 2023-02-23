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

class NodeParameter {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node = null;
      this.name = null;
      this.help = null;
      this.type = null;
      this.min_value = null;
      this.max_value = null;
      this.editable = null;
    }
    else {
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = '';
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('help')) {
        this.help = initObj.help
      }
      else {
        this.help = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('min_value')) {
        this.min_value = initObj.min_value
      }
      else {
        this.min_value = 0.0;
      }
      if (initObj.hasOwnProperty('max_value')) {
        this.max_value = initObj.max_value
      }
      else {
        this.max_value = 0.0;
      }
      if (initObj.hasOwnProperty('editable')) {
        this.editable = initObj.editable
      }
      else {
        this.editable = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NodeParameter
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [help]
    bufferOffset = _serializer.string(obj.help, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [min_value]
    bufferOffset = _serializer.float32(obj.min_value, buffer, bufferOffset);
    // Serialize message field [max_value]
    bufferOffset = _serializer.float32(obj.max_value, buffer, bufferOffset);
    // Serialize message field [editable]
    bufferOffset = _serializer.bool(obj.editable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NodeParameter
    let len;
    let data = new NodeParameter(null);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [help]
    data.help = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [min_value]
    data.min_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_value]
    data.max_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [editable]
    data.editable = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.node);
    length += _getByteLength(object.name);
    length += _getByteLength(object.help);
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/NodeParameter';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '871c14dc09d7cdeffeca9173f51f84f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new NodeParameter(null);
    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = ''
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.help !== undefined) {
      resolved.help = msg.help;
    }
    else {
      resolved.help = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.min_value !== undefined) {
      resolved.min_value = msg.min_value;
    }
    else {
      resolved.min_value = 0.0
    }

    if (msg.max_value !== undefined) {
      resolved.max_value = msg.max_value;
    }
    else {
      resolved.max_value = 0.0
    }

    if (msg.editable !== undefined) {
      resolved.editable = msg.editable;
    }
    else {
      resolved.editable = false
    }

    return resolved;
    }
};

// Constants for message
NodeParameter.Constants = {
  PARAM_TYPE_UNKNOWN: 0,
  PARAM_TYPE_STRING: 1,
  PARAM_TYPE_INT: 2,
  PARAM_TYPE_FLOAT: 3,
  PARAM_TYPE_BOOL: 4,
}

module.exports = NodeParameter;
