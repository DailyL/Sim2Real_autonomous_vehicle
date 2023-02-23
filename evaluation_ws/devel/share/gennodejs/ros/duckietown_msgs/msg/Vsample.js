// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Vsample {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.d_L = null;
      this.d_R = null;
      this.dt = null;
      this.theta_angle_pose_delta = null;
      this.x_axis_pose_delta = null;
      this.y_axis_pose_delta = null;
    }
    else {
      if (initObj.hasOwnProperty('d_L')) {
        this.d_L = initObj.d_L
      }
      else {
        this.d_L = 0.0;
      }
      if (initObj.hasOwnProperty('d_R')) {
        this.d_R = initObj.d_R
      }
      else {
        this.d_R = 0.0;
      }
      if (initObj.hasOwnProperty('dt')) {
        this.dt = initObj.dt
      }
      else {
        this.dt = 0.0;
      }
      if (initObj.hasOwnProperty('theta_angle_pose_delta')) {
        this.theta_angle_pose_delta = initObj.theta_angle_pose_delta
      }
      else {
        this.theta_angle_pose_delta = 0.0;
      }
      if (initObj.hasOwnProperty('x_axis_pose_delta')) {
        this.x_axis_pose_delta = initObj.x_axis_pose_delta
      }
      else {
        this.x_axis_pose_delta = 0.0;
      }
      if (initObj.hasOwnProperty('y_axis_pose_delta')) {
        this.y_axis_pose_delta = initObj.y_axis_pose_delta
      }
      else {
        this.y_axis_pose_delta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Vsample
    // Serialize message field [d_L]
    bufferOffset = _serializer.float32(obj.d_L, buffer, bufferOffset);
    // Serialize message field [d_R]
    bufferOffset = _serializer.float32(obj.d_R, buffer, bufferOffset);
    // Serialize message field [dt]
    bufferOffset = _serializer.float32(obj.dt, buffer, bufferOffset);
    // Serialize message field [theta_angle_pose_delta]
    bufferOffset = _serializer.float32(obj.theta_angle_pose_delta, buffer, bufferOffset);
    // Serialize message field [x_axis_pose_delta]
    bufferOffset = _serializer.float32(obj.x_axis_pose_delta, buffer, bufferOffset);
    // Serialize message field [y_axis_pose_delta]
    bufferOffset = _serializer.float32(obj.y_axis_pose_delta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Vsample
    let len;
    let data = new Vsample(null);
    // Deserialize message field [d_L]
    data.d_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [d_R]
    data.d_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [dt]
    data.dt = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta_angle_pose_delta]
    data.theta_angle_pose_delta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x_axis_pose_delta]
    data.x_axis_pose_delta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_axis_pose_delta]
    data.y_axis_pose_delta = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/Vsample';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '636e6e791af118be8338c8ab7fbd00e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 d_L
    float32 d_R
    float32 dt
    float32 theta_angle_pose_delta
    float32 x_axis_pose_delta
    float32 y_axis_pose_delta
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Vsample(null);
    if (msg.d_L !== undefined) {
      resolved.d_L = msg.d_L;
    }
    else {
      resolved.d_L = 0.0
    }

    if (msg.d_R !== undefined) {
      resolved.d_R = msg.d_R;
    }
    else {
      resolved.d_R = 0.0
    }

    if (msg.dt !== undefined) {
      resolved.dt = msg.dt;
    }
    else {
      resolved.dt = 0.0
    }

    if (msg.theta_angle_pose_delta !== undefined) {
      resolved.theta_angle_pose_delta = msg.theta_angle_pose_delta;
    }
    else {
      resolved.theta_angle_pose_delta = 0.0
    }

    if (msg.x_axis_pose_delta !== undefined) {
      resolved.x_axis_pose_delta = msg.x_axis_pose_delta;
    }
    else {
      resolved.x_axis_pose_delta = 0.0
    }

    if (msg.y_axis_pose_delta !== undefined) {
      resolved.y_axis_pose_delta = msg.y_axis_pose_delta;
    }
    else {
      resolved.y_axis_pose_delta = 0.0
    }

    return resolved;
    }
};

module.exports = Vsample;
