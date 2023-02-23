// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class AprilTagDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.transform = null;
      this.tag_id = null;
      this.tag_family = null;
      this.hamming = null;
      this.decision_margin = null;
      this.homography = null;
      this.center = null;
      this.corners = null;
      this.pose_error = null;
    }
    else {
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new geometry_msgs.msg.Transform();
      }
      if (initObj.hasOwnProperty('tag_id')) {
        this.tag_id = initObj.tag_id
      }
      else {
        this.tag_id = 0;
      }
      if (initObj.hasOwnProperty('tag_family')) {
        this.tag_family = initObj.tag_family
      }
      else {
        this.tag_family = '';
      }
      if (initObj.hasOwnProperty('hamming')) {
        this.hamming = initObj.hamming
      }
      else {
        this.hamming = 0;
      }
      if (initObj.hasOwnProperty('decision_margin')) {
        this.decision_margin = initObj.decision_margin
      }
      else {
        this.decision_margin = 0.0;
      }
      if (initObj.hasOwnProperty('homography')) {
        this.homography = initObj.homography
      }
      else {
        this.homography = new Array(9).fill(0);
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('corners')) {
        this.corners = initObj.corners
      }
      else {
        this.corners = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('pose_error')) {
        this.pose_error = initObj.pose_error
      }
      else {
        this.pose_error = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AprilTagDetection
    // Serialize message field [transform]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.transform, buffer, bufferOffset);
    // Serialize message field [tag_id]
    bufferOffset = _serializer.int32(obj.tag_id, buffer, bufferOffset);
    // Serialize message field [tag_family]
    bufferOffset = _serializer.string(obj.tag_family, buffer, bufferOffset);
    // Serialize message field [hamming]
    bufferOffset = _serializer.int32(obj.hamming, buffer, bufferOffset);
    // Serialize message field [decision_margin]
    bufferOffset = _serializer.float32(obj.decision_margin, buffer, bufferOffset);
    // Check that the constant length array field [homography] has the right length
    if (obj.homography.length !== 9) {
      throw new Error('Unable to serialize array field homography - length must be 9')
    }
    // Serialize message field [homography]
    bufferOffset = _arraySerializer.float32(obj.homography, buffer, bufferOffset, 9);
    // Check that the constant length array field [center] has the right length
    if (obj.center.length !== 2) {
      throw new Error('Unable to serialize array field center - length must be 2')
    }
    // Serialize message field [center]
    bufferOffset = _arraySerializer.float32(obj.center, buffer, bufferOffset, 2);
    // Check that the constant length array field [corners] has the right length
    if (obj.corners.length !== 8) {
      throw new Error('Unable to serialize array field corners - length must be 8')
    }
    // Serialize message field [corners]
    bufferOffset = _arraySerializer.float32(obj.corners, buffer, bufferOffset, 8);
    // Serialize message field [pose_error]
    bufferOffset = _serializer.float32(obj.pose_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AprilTagDetection
    let len;
    let data = new AprilTagDetection(null);
    // Deserialize message field [transform]
    data.transform = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [tag_id]
    data.tag_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tag_family]
    data.tag_family = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hamming]
    data.hamming = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [decision_margin]
    data.decision_margin = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [homography]
    data.homography = _arrayDeserializer.float32(buffer, bufferOffset, 9)
    // Deserialize message field [center]
    data.center = _arrayDeserializer.float32(buffer, bufferOffset, 2)
    // Deserialize message field [corners]
    data.corners = _arrayDeserializer.float32(buffer, bufferOffset, 8)
    // Deserialize message field [pose_error]
    data.pose_error = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.tag_family);
    return length + 152;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/AprilTagDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a831190390fbef881c141df7b86598db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Transform transform
    int32 tag_id
    string tag_family
    int32 hamming
    float32 decision_margin
    float32[9] homography
    float32[2] center
    float32[8] corners
    float32 pose_error
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
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
    const resolved = new AprilTagDetection(null);
    if (msg.transform !== undefined) {
      resolved.transform = geometry_msgs.msg.Transform.Resolve(msg.transform)
    }
    else {
      resolved.transform = new geometry_msgs.msg.Transform()
    }

    if (msg.tag_id !== undefined) {
      resolved.tag_id = msg.tag_id;
    }
    else {
      resolved.tag_id = 0
    }

    if (msg.tag_family !== undefined) {
      resolved.tag_family = msg.tag_family;
    }
    else {
      resolved.tag_family = ''
    }

    if (msg.hamming !== undefined) {
      resolved.hamming = msg.hamming;
    }
    else {
      resolved.hamming = 0
    }

    if (msg.decision_margin !== undefined) {
      resolved.decision_margin = msg.decision_margin;
    }
    else {
      resolved.decision_margin = 0.0
    }

    if (msg.homography !== undefined) {
      resolved.homography = msg.homography;
    }
    else {
      resolved.homography = new Array(9).fill(0)
    }

    if (msg.center !== undefined) {
      resolved.center = msg.center;
    }
    else {
      resolved.center = new Array(2).fill(0)
    }

    if (msg.corners !== undefined) {
      resolved.corners = msg.corners;
    }
    else {
      resolved.corners = new Array(8).fill(0)
    }

    if (msg.pose_error !== undefined) {
      resolved.pose_error = msg.pose_error;
    }
    else {
      resolved.pose_error = 0.0
    }

    return resolved;
    }
};

module.exports = AprilTagDetection;
