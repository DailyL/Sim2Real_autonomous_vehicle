// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DiagnosticsRosLink = require('./DiagnosticsRosLink.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DiagnosticsRosLinkArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.links = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('links')) {
        this.links = initObj.links
      }
      else {
        this.links = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsRosLinkArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [links]
    // Serialize the length for message field [links]
    bufferOffset = _serializer.uint32(obj.links.length, buffer, bufferOffset);
    obj.links.forEach((val) => {
      bufferOffset = DiagnosticsRosLink.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsRosLinkArray
    let len;
    let data = new DiagnosticsRosLinkArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [links]
    // Deserialize array length for message field [links]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.links = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.links[i] = DiagnosticsRosLink.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.links.forEach((val) => {
      length += DiagnosticsRosLink.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsRosLinkArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '429f5aa0771b8b09d6913175d25517ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/DiagnosticsRosLink[] links
    
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
    MSG: duckietown_msgs/DiagnosticsRosLink
    # Link direction
    uint8 LINK_DIRECTION_INBOUND = 0
    uint8 LINK_DIRECTION_OUTBOUND = 1
    
    string node         # Node publishing this message
    string topic        # Topic transferred over the link
    string remote       # Remote end of this link
    uint8 direction     # Link direction
    bool connected      # Status of the link
    string transport    # Type of transport used for this link
    uint64 messages     # Number of messages transferred over this link
    uint64 dropped      # Number of messages dropped over this link
    float32 bytes       # Volume of data transferred over this link
    float32 frequency   # Link frequency (Hz)
    float32 bandwidth   # Link bandwidth (byte/s)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DiagnosticsRosLinkArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.links !== undefined) {
      resolved.links = new Array(msg.links.length);
      for (let i = 0; i < resolved.links.length; ++i) {
        resolved.links[i] = DiagnosticsRosLink.Resolve(msg.links[i]);
      }
    }
    else {
      resolved.links = []
    }

    return resolved;
    }
};

module.exports = DiagnosticsRosLinkArray;
