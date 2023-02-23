// Auto-generated. Do not edit!

// (in-package hector_mapping.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ResetMappingRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initial_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('initial_pose')) {
        this.initial_pose = initObj.initial_pose
      }
      else {
        this.initial_pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetMappingRequest
    // Serialize message field [initial_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.initial_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetMappingRequest
    let len;
    let data = new ResetMappingRequest(null);
    // Deserialize message field [initial_pose]
    data.initial_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hector_mapping/ResetMappingRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3423647d14c6c84592eef8b1184a5974';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose initial_pose
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetMappingRequest(null);
    if (msg.initial_pose !== undefined) {
      resolved.initial_pose = geometry_msgs.msg.Pose.Resolve(msg.initial_pose)
    }
    else {
      resolved.initial_pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

class ResetMappingResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResetMappingResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResetMappingResponse
    let len;
    let data = new ResetMappingResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hector_mapping/ResetMappingResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResetMappingResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: ResetMappingRequest,
  Response: ResetMappingResponse,
  md5sum() { return '3423647d14c6c84592eef8b1184a5974'; },
  datatype() { return 'hector_mapping/ResetMapping'; }
};
