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

class AntiInstagramHealth {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.J1 = null;
      this.J2 = null;
      this.J3 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('J1')) {
        this.J1 = initObj.J1
      }
      else {
        this.J1 = 0.0;
      }
      if (initObj.hasOwnProperty('J2')) {
        this.J2 = initObj.J2
      }
      else {
        this.J2 = 0.0;
      }
      if (initObj.hasOwnProperty('J3')) {
        this.J3 = initObj.J3
      }
      else {
        this.J3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AntiInstagramHealth
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [J1]
    bufferOffset = _serializer.float32(obj.J1, buffer, bufferOffset);
    // Serialize message field [J2]
    bufferOffset = _serializer.float32(obj.J2, buffer, bufferOffset);
    // Serialize message field [J3]
    bufferOffset = _serializer.float32(obj.J3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AntiInstagramHealth
    let len;
    let data = new AntiInstagramHealth(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [J1]
    data.J1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [J2]
    data.J2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [J3]
    data.J3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/AntiInstagramHealth';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a6e17ea173536e892b4dde76e515fb4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 J1
    float32 J2
    float32 J3
    
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
    const resolved = new AntiInstagramHealth(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.J1 !== undefined) {
      resolved.J1 = msg.J1;
    }
    else {
      resolved.J1 = 0.0
    }

    if (msg.J2 !== undefined) {
      resolved.J2 = msg.J2;
    }
    else {
      resolved.J2 = 0.0
    }

    if (msg.J3 !== undefined) {
      resolved.J3 = msg.J3;
    }
    else {
      resolved.J3 = 0.0
    }

    return resolved;
    }
};

module.exports = AntiInstagramHealth;
