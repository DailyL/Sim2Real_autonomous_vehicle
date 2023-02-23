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

class LanePose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.d = null;
      this.d_ref = null;
      this.phi = null;
      this.phi_ref = null;
      this.d_phi_covariance = null;
      this.curvature = null;
      this.curvature_ref = null;
      this.v_ref = null;
      this.status = null;
      this.in_lane = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0.0;
      }
      if (initObj.hasOwnProperty('d_ref')) {
        this.d_ref = initObj.d_ref
      }
      else {
        this.d_ref = 0.0;
      }
      if (initObj.hasOwnProperty('phi')) {
        this.phi = initObj.phi
      }
      else {
        this.phi = 0.0;
      }
      if (initObj.hasOwnProperty('phi_ref')) {
        this.phi_ref = initObj.phi_ref
      }
      else {
        this.phi_ref = 0.0;
      }
      if (initObj.hasOwnProperty('d_phi_covariance')) {
        this.d_phi_covariance = initObj.d_phi_covariance
      }
      else {
        this.d_phi_covariance = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('curvature')) {
        this.curvature = initObj.curvature
      }
      else {
        this.curvature = 0.0;
      }
      if (initObj.hasOwnProperty('curvature_ref')) {
        this.curvature_ref = initObj.curvature_ref
      }
      else {
        this.curvature_ref = 0.0;
      }
      if (initObj.hasOwnProperty('v_ref')) {
        this.v_ref = initObj.v_ref
      }
      else {
        this.v_ref = 0.0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('in_lane')) {
        this.in_lane = initObj.in_lane
      }
      else {
        this.in_lane = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LanePose
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [d]
    bufferOffset = _serializer.float32(obj.d, buffer, bufferOffset);
    // Serialize message field [d_ref]
    bufferOffset = _serializer.float32(obj.d_ref, buffer, bufferOffset);
    // Serialize message field [phi]
    bufferOffset = _serializer.float32(obj.phi, buffer, bufferOffset);
    // Serialize message field [phi_ref]
    bufferOffset = _serializer.float32(obj.phi_ref, buffer, bufferOffset);
    // Check that the constant length array field [d_phi_covariance] has the right length
    if (obj.d_phi_covariance.length !== 4) {
      throw new Error('Unable to serialize array field d_phi_covariance - length must be 4')
    }
    // Serialize message field [d_phi_covariance]
    bufferOffset = _arraySerializer.float32(obj.d_phi_covariance, buffer, bufferOffset, 4);
    // Serialize message field [curvature]
    bufferOffset = _serializer.float32(obj.curvature, buffer, bufferOffset);
    // Serialize message field [curvature_ref]
    bufferOffset = _serializer.float32(obj.curvature_ref, buffer, bufferOffset);
    // Serialize message field [v_ref]
    bufferOffset = _serializer.float32(obj.v_ref, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.int32(obj.status, buffer, bufferOffset);
    // Serialize message field [in_lane]
    bufferOffset = _serializer.bool(obj.in_lane, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LanePose
    let len;
    let data = new LanePose(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [d]
    data.d = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_ref]
    data.d_ref = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [phi]
    data.phi = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [phi_ref]
    data.phi_ref = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_phi_covariance]
    data.d_phi_covariance = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [curvature]
    data.curvature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [curvature_ref]
    data.curvature_ref = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v_ref]
    data.v_ref = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [in_lane]
    data.in_lane = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 49;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LanePose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '382fe0e0d5dea7350bfa93535592e68a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 d   #lateral offset
    float32 d_ref #lateral offset reference
    float32 phi #heading error
    float32 phi_ref #heading error reference
    float32[4] d_phi_covariance
    float32 curvature
    float32 curvature_ref # Refernece Curvature
    float32 v_ref # Referenece Velocity
    int32 status #Status of duckietbot 0 if normal, 1 if error is encountered
    bool in_lane #Status of duckietbot in lane
    
    #Enum for status
    int32 NORMAL=0
    int32 ERROR=1
    
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
    const resolved = new LanePose(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0.0
    }

    if (msg.d_ref !== undefined) {
      resolved.d_ref = msg.d_ref;
    }
    else {
      resolved.d_ref = 0.0
    }

    if (msg.phi !== undefined) {
      resolved.phi = msg.phi;
    }
    else {
      resolved.phi = 0.0
    }

    if (msg.phi_ref !== undefined) {
      resolved.phi_ref = msg.phi_ref;
    }
    else {
      resolved.phi_ref = 0.0
    }

    if (msg.d_phi_covariance !== undefined) {
      resolved.d_phi_covariance = msg.d_phi_covariance;
    }
    else {
      resolved.d_phi_covariance = new Array(4).fill(0)
    }

    if (msg.curvature !== undefined) {
      resolved.curvature = msg.curvature;
    }
    else {
      resolved.curvature = 0.0
    }

    if (msg.curvature_ref !== undefined) {
      resolved.curvature_ref = msg.curvature_ref;
    }
    else {
      resolved.curvature_ref = 0.0
    }

    if (msg.v_ref !== undefined) {
      resolved.v_ref = msg.v_ref;
    }
    else {
      resolved.v_ref = 0.0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.in_lane !== undefined) {
      resolved.in_lane = msg.in_lane;
    }
    else {
      resolved.in_lane = false
    }

    return resolved;
    }
};

// Constants for message
LanePose.Constants = {
  NORMAL: 0,
  ERROR: 1,
}

module.exports = LanePose;
