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

class ParamTuner {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.cross_track_err = null;
      this.cross_track_integral = null;
      this.diff_cross_track_err = null;
      this.heading_err = null;
      this.heading_integral = null;
      this.diff_heading_err = null;
      this.dt = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('cross_track_err')) {
        this.cross_track_err = initObj.cross_track_err
      }
      else {
        this.cross_track_err = 0.0;
      }
      if (initObj.hasOwnProperty('cross_track_integral')) {
        this.cross_track_integral = initObj.cross_track_integral
      }
      else {
        this.cross_track_integral = 0.0;
      }
      if (initObj.hasOwnProperty('diff_cross_track_err')) {
        this.diff_cross_track_err = initObj.diff_cross_track_err
      }
      else {
        this.diff_cross_track_err = 0.0;
      }
      if (initObj.hasOwnProperty('heading_err')) {
        this.heading_err = initObj.heading_err
      }
      else {
        this.heading_err = 0.0;
      }
      if (initObj.hasOwnProperty('heading_integral')) {
        this.heading_integral = initObj.heading_integral
      }
      else {
        this.heading_integral = 0.0;
      }
      if (initObj.hasOwnProperty('diff_heading_err')) {
        this.diff_heading_err = initObj.diff_heading_err
      }
      else {
        this.diff_heading_err = 0.0;
      }
      if (initObj.hasOwnProperty('dt')) {
        this.dt = initObj.dt
      }
      else {
        this.dt = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ParamTuner
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [cross_track_err]
    bufferOffset = _serializer.float32(obj.cross_track_err, buffer, bufferOffset);
    // Serialize message field [cross_track_integral]
    bufferOffset = _serializer.float32(obj.cross_track_integral, buffer, bufferOffset);
    // Serialize message field [diff_cross_track_err]
    bufferOffset = _serializer.float32(obj.diff_cross_track_err, buffer, bufferOffset);
    // Serialize message field [heading_err]
    bufferOffset = _serializer.float32(obj.heading_err, buffer, bufferOffset);
    // Serialize message field [heading_integral]
    bufferOffset = _serializer.float32(obj.heading_integral, buffer, bufferOffset);
    // Serialize message field [diff_heading_err]
    bufferOffset = _serializer.float32(obj.diff_heading_err, buffer, bufferOffset);
    // Serialize message field [dt]
    bufferOffset = _serializer.float32(obj.dt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ParamTuner
    let len;
    let data = new ParamTuner(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [cross_track_err]
    data.cross_track_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cross_track_integral]
    data.cross_track_integral = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [diff_cross_track_err]
    data.diff_cross_track_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading_err]
    data.heading_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading_integral]
    data.heading_integral = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [diff_heading_err]
    data.diff_heading_err = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dt]
    data.dt = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/ParamTuner';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '53c42bf2be1bd4386da34eca6088702d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 cross_track_err
    float32 cross_track_integral
    float32 diff_cross_track_err
    float32 heading_err
    float32 heading_integral
    float32 diff_heading_err
    float32 dt
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
    const resolved = new ParamTuner(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.cross_track_err !== undefined) {
      resolved.cross_track_err = msg.cross_track_err;
    }
    else {
      resolved.cross_track_err = 0.0
    }

    if (msg.cross_track_integral !== undefined) {
      resolved.cross_track_integral = msg.cross_track_integral;
    }
    else {
      resolved.cross_track_integral = 0.0
    }

    if (msg.diff_cross_track_err !== undefined) {
      resolved.diff_cross_track_err = msg.diff_cross_track_err;
    }
    else {
      resolved.diff_cross_track_err = 0.0
    }

    if (msg.heading_err !== undefined) {
      resolved.heading_err = msg.heading_err;
    }
    else {
      resolved.heading_err = 0.0
    }

    if (msg.heading_integral !== undefined) {
      resolved.heading_integral = msg.heading_integral;
    }
    else {
      resolved.heading_integral = 0.0
    }

    if (msg.diff_heading_err !== undefined) {
      resolved.diff_heading_err = msg.diff_heading_err;
    }
    else {
      resolved.diff_heading_err = 0.0
    }

    if (msg.dt !== undefined) {
      resolved.dt = msg.dt;
    }
    else {
      resolved.dt = 0.0
    }

    return resolved;
    }
};

module.exports = ParamTuner;
