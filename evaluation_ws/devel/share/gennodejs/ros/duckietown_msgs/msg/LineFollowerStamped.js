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

class LineFollowerStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.valid = null;
      this.outer_right = null;
      this.inner_right = null;
      this.inner_left = null;
      this.outer_left = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
      if (initObj.hasOwnProperty('outer_right')) {
        this.outer_right = initObj.outer_right
      }
      else {
        this.outer_right = 0.0;
      }
      if (initObj.hasOwnProperty('inner_right')) {
        this.inner_right = initObj.inner_right
      }
      else {
        this.inner_right = 0.0;
      }
      if (initObj.hasOwnProperty('inner_left')) {
        this.inner_left = initObj.inner_left
      }
      else {
        this.inner_left = 0.0;
      }
      if (initObj.hasOwnProperty('outer_left')) {
        this.outer_left = initObj.outer_left
      }
      else {
        this.outer_left = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LineFollowerStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    // Serialize message field [outer_right]
    bufferOffset = _serializer.float32(obj.outer_right, buffer, bufferOffset);
    // Serialize message field [inner_right]
    bufferOffset = _serializer.float32(obj.inner_right, buffer, bufferOffset);
    // Serialize message field [inner_left]
    bufferOffset = _serializer.float32(obj.inner_left, buffer, bufferOffset);
    // Serialize message field [outer_left]
    bufferOffset = _serializer.float32(obj.outer_left, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LineFollowerStamped
    let len;
    let data = new LineFollowerStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [outer_right]
    data.outer_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [inner_right]
    data.inner_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [inner_left]
    data.inner_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [outer_left]
    data.outer_left = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LineFollowerStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '296fc5d7868bac377ab0a7300283e5f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    bool valid  # True iff the ADC reading was valid
    # All of the following values are normalized line brightness, between 0 and 1.
    # Specifically, an ADC voltage of 0 is mapped to 0, and 3.3V is mapped to 1.0.
    float32 outer_right
    float32 inner_right
    float32 inner_left
    float32 outer_left
    
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
    const resolved = new LineFollowerStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    if (msg.outer_right !== undefined) {
      resolved.outer_right = msg.outer_right;
    }
    else {
      resolved.outer_right = 0.0
    }

    if (msg.inner_right !== undefined) {
      resolved.inner_right = msg.inner_right;
    }
    else {
      resolved.inner_right = 0.0
    }

    if (msg.inner_left !== undefined) {
      resolved.inner_left = msg.inner_left;
    }
    else {
      resolved.inner_left = 0.0
    }

    if (msg.outer_left !== undefined) {
      resolved.outer_left = msg.outer_left;
    }
    else {
      resolved.outer_left = 0.0
    }

    return resolved;
    }
};

module.exports = LineFollowerStamped;
