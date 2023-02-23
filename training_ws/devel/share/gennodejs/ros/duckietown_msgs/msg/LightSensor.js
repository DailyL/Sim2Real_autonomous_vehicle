// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LightSensor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.r = null;
      this.g = null;
      this.b = null;
      this.c = null;
      this.real_lux = null;
      this.lux = null;
      this.temp = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('r')) {
        this.r = initObj.r
      }
      else {
        this.r = 0;
      }
      if (initObj.hasOwnProperty('g')) {
        this.g = initObj.g
      }
      else {
        this.g = 0;
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = 0;
      }
      if (initObj.hasOwnProperty('c')) {
        this.c = initObj.c
      }
      else {
        this.c = 0;
      }
      if (initObj.hasOwnProperty('real_lux')) {
        this.real_lux = initObj.real_lux
      }
      else {
        this.real_lux = 0;
      }
      if (initObj.hasOwnProperty('lux')) {
        this.lux = initObj.lux
      }
      else {
        this.lux = 0;
      }
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LightSensor
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [r]
    bufferOffset = _serializer.int32(obj.r, buffer, bufferOffset);
    // Serialize message field [g]
    bufferOffset = _serializer.int32(obj.g, buffer, bufferOffset);
    // Serialize message field [b]
    bufferOffset = _serializer.int32(obj.b, buffer, bufferOffset);
    // Serialize message field [c]
    bufferOffset = _serializer.int32(obj.c, buffer, bufferOffset);
    // Serialize message field [real_lux]
    bufferOffset = _serializer.int32(obj.real_lux, buffer, bufferOffset);
    // Serialize message field [lux]
    bufferOffset = _serializer.int32(obj.lux, buffer, bufferOffset);
    // Serialize message field [temp]
    bufferOffset = _serializer.int32(obj.temp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LightSensor
    let len;
    let data = new LightSensor(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [r]
    data.r = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [g]
    data.g = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [b]
    data.b = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [c]
    data.c = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [real_lux]
    data.real_lux = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lux]
    data.lux = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [temp]
    data.temp = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LightSensor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7d3098cdc59f2c0a8f7c461ef10ca781';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int32 r
    int32 g
    int32 b
    int32 c
    int32 real_lux
    int32 lux
    int32 temp
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LightSensor(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.r !== undefined) {
      resolved.r = msg.r;
    }
    else {
      resolved.r = 0
    }

    if (msg.g !== undefined) {
      resolved.g = msg.g;
    }
    else {
      resolved.g = 0
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = 0
    }

    if (msg.c !== undefined) {
      resolved.c = msg.c;
    }
    else {
      resolved.c = 0
    }

    if (msg.real_lux !== undefined) {
      resolved.real_lux = msg.real_lux;
    }
    else {
      resolved.real_lux = 0
    }

    if (msg.lux !== undefined) {
      resolved.lux = msg.lux;
    }
    else {
      resolved.lux = 0
    }

    if (msg.temp !== undefined) {
      resolved.temp = msg.temp;
    }
    else {
      resolved.temp = 0
    }

    return resolved;
    }
};

module.exports = LightSensor;
