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

class DiagnosticsCodeProfiling {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node = null;
      this.block = null;
      this.frequency = null;
      this.duration = null;
      this.filename = null;
      this.line_nums = null;
      this.time_since_last_execution = null;
    }
    else {
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = '';
      }
      if (initObj.hasOwnProperty('block')) {
        this.block = initObj.block
      }
      else {
        this.block = '';
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0.0;
      }
      if (initObj.hasOwnProperty('filename')) {
        this.filename = initObj.filename
      }
      else {
        this.filename = '';
      }
      if (initObj.hasOwnProperty('line_nums')) {
        this.line_nums = initObj.line_nums
      }
      else {
        this.line_nums = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('time_since_last_execution')) {
        this.time_since_last_execution = initObj.time_since_last_execution
      }
      else {
        this.time_since_last_execution = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsCodeProfiling
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    // Serialize message field [block]
    bufferOffset = _serializer.string(obj.block, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float32(obj.frequency, buffer, bufferOffset);
    // Serialize message field [duration]
    bufferOffset = _serializer.float32(obj.duration, buffer, bufferOffset);
    // Serialize message field [filename]
    bufferOffset = _serializer.string(obj.filename, buffer, bufferOffset);
    // Check that the constant length array field [line_nums] has the right length
    if (obj.line_nums.length !== 2) {
      throw new Error('Unable to serialize array field line_nums - length must be 2')
    }
    // Serialize message field [line_nums]
    bufferOffset = _arraySerializer.uint16(obj.line_nums, buffer, bufferOffset, 2);
    // Serialize message field [time_since_last_execution]
    bufferOffset = _serializer.float32(obj.time_since_last_execution, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsCodeProfiling
    let len;
    let data = new DiagnosticsCodeProfiling(null);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [block]
    data.block = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [duration]
    data.duration = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [filename]
    data.filename = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [line_nums]
    data.line_nums = _arrayDeserializer.uint16(buffer, bufferOffset, 2)
    // Deserialize message field [time_since_last_execution]
    data.time_since_last_execution = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.node);
    length += _getByteLength(object.block);
    length += _getByteLength(object.filename);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsCodeProfiling';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f919bc6b39855368e96c3df59f3187f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string node                             # Node publishing this message
    string block                            # Name of the profiled code block
    float32 frequency                       # Execution frequency of the block
    float32 duration                        # Last execution time of the block (in seconds)
    string filename                         # Filename in which this block resides
    uint16[2] line_nums                     # Start and end line of the block in the file
    float32 time_since_last_execution       # Seconds since last execution
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DiagnosticsCodeProfiling(null);
    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = ''
    }

    if (msg.block !== undefined) {
      resolved.block = msg.block;
    }
    else {
      resolved.block = ''
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0.0
    }

    if (msg.filename !== undefined) {
      resolved.filename = msg.filename;
    }
    else {
      resolved.filename = ''
    }

    if (msg.line_nums !== undefined) {
      resolved.line_nums = msg.line_nums;
    }
    else {
      resolved.line_nums = new Array(2).fill(0)
    }

    if (msg.time_since_last_execution !== undefined) {
      resolved.time_since_last_execution = msg.time_since_last_execution;
    }
    else {
      resolved.time_since_last_execution = 0.0
    }

    return resolved;
    }
};

module.exports = DiagnosticsCodeProfiling;
