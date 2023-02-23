// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DiagnosticsCodeProfiling = require('./DiagnosticsCodeProfiling.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DiagnosticsCodeProfilingArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.blocks = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('blocks')) {
        this.blocks = initObj.blocks
      }
      else {
        this.blocks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsCodeProfilingArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [blocks]
    // Serialize the length for message field [blocks]
    bufferOffset = _serializer.uint32(obj.blocks.length, buffer, bufferOffset);
    obj.blocks.forEach((val) => {
      bufferOffset = DiagnosticsCodeProfiling.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsCodeProfilingArray
    let len;
    let data = new DiagnosticsCodeProfilingArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [blocks]
    // Deserialize array length for message field [blocks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.blocks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.blocks[i] = DiagnosticsCodeProfiling.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.blocks.forEach((val) => {
      length += DiagnosticsCodeProfiling.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsCodeProfilingArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57dca0d37f20880e0dee9358611e6e75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/DiagnosticsCodeProfiling[] blocks
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: duckietown_msgs/DiagnosticsCodeProfiling
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
    const resolved = new DiagnosticsCodeProfilingArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.blocks !== undefined) {
      resolved.blocks = new Array(msg.blocks.length);
      for (let i = 0; i < resolved.blocks.length; ++i) {
        resolved.blocks[i] = DiagnosticsCodeProfiling.Resolve(msg.blocks[i]);
      }
    }
    else {
      resolved.blocks = []
    }

    return resolved;
    }
};

module.exports = DiagnosticsCodeProfilingArray;
