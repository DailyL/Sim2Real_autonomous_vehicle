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

class VehiclePose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.rho = null;
      this.theta = null;
      this.psi = null;
      this.detection = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('rho')) {
        this.rho = initObj.rho
      }
      else {
        this.rho = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('psi')) {
        this.psi = initObj.psi
      }
      else {
        this.psi = new std_msgs.msg.Float32();
      }
      if (initObj.hasOwnProperty('detection')) {
        this.detection = initObj.detection
      }
      else {
        this.detection = new std_msgs.msg.Bool();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VehiclePose
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [rho]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.rho, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.theta, buffer, bufferOffset);
    // Serialize message field [psi]
    bufferOffset = std_msgs.msg.Float32.serialize(obj.psi, buffer, bufferOffset);
    // Serialize message field [detection]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.detection, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VehiclePose
    let len;
    let data = new VehiclePose(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [rho]
    data.rho = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [psi]
    data.psi = std_msgs.msg.Float32.deserialize(buffer, bufferOffset);
    // Deserialize message field [detection]
    data.detection = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/VehiclePose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '69c01ed5e84e0f58f795e563d073900d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    std_msgs/Float32 rho
    std_msgs/Float32 theta
    std_msgs/Float32 psi
    std_msgs/Bool detection
    
    
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
    MSG: std_msgs/Float32
    float32 data
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VehiclePose(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.rho !== undefined) {
      resolved.rho = std_msgs.msg.Float32.Resolve(msg.rho)
    }
    else {
      resolved.rho = new std_msgs.msg.Float32()
    }

    if (msg.theta !== undefined) {
      resolved.theta = std_msgs.msg.Float32.Resolve(msg.theta)
    }
    else {
      resolved.theta = new std_msgs.msg.Float32()
    }

    if (msg.psi !== undefined) {
      resolved.psi = std_msgs.msg.Float32.Resolve(msg.psi)
    }
    else {
      resolved.psi = new std_msgs.msg.Float32()
    }

    if (msg.detection !== undefined) {
      resolved.detection = std_msgs.msg.Bool.Resolve(msg.detection)
    }
    else {
      resolved.detection = new std_msgs.msg.Bool()
    }

    return resolved;
    }
};

module.exports = VehiclePose;
