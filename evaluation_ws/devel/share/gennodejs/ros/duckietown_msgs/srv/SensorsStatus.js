// Auto-generated. Do not edit!

// (in-package duckietown_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SensorsStatusRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorsStatusRequest
    // Serialize message field [state]
    bufferOffset = _serializer.bool(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorsStatusRequest
    let len;
    let data = new SensorsStatusRequest(null);
    // Deserialize message field [state]
    data.state = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SensorsStatusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '001fde3cab9e313a150416ff09c08ee4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorsStatusRequest(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = false
    }

    return resolved;
    }
};

class SensorsStatusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state_front_bumper = null;
      this.state_camera = null;
      this.state_imu = null;
      this.state_tof_fl = null;
      this.state_tof_fm = null;
      this.state_tof_fr = null;
      this.state_tof_sl = null;
      this.state_tof_sr = null;
      this.state_tof_bl = null;
      this.state_tof_bm = null;
      this.state_tof_br = null;
      this.state_lf_outer_left = null;
      this.state_lf_outer_right = null;
      this.state_lf_inner_left = null;
      this.state_lf_inner_right = null;
      this.state_encoder_and_motor = null;
    }
    else {
      if (initObj.hasOwnProperty('state_front_bumper')) {
        this.state_front_bumper = initObj.state_front_bumper
      }
      else {
        this.state_front_bumper = false;
      }
      if (initObj.hasOwnProperty('state_camera')) {
        this.state_camera = initObj.state_camera
      }
      else {
        this.state_camera = false;
      }
      if (initObj.hasOwnProperty('state_imu')) {
        this.state_imu = initObj.state_imu
      }
      else {
        this.state_imu = false;
      }
      if (initObj.hasOwnProperty('state_tof_fl')) {
        this.state_tof_fl = initObj.state_tof_fl
      }
      else {
        this.state_tof_fl = false;
      }
      if (initObj.hasOwnProperty('state_tof_fm')) {
        this.state_tof_fm = initObj.state_tof_fm
      }
      else {
        this.state_tof_fm = false;
      }
      if (initObj.hasOwnProperty('state_tof_fr')) {
        this.state_tof_fr = initObj.state_tof_fr
      }
      else {
        this.state_tof_fr = false;
      }
      if (initObj.hasOwnProperty('state_tof_sl')) {
        this.state_tof_sl = initObj.state_tof_sl
      }
      else {
        this.state_tof_sl = false;
      }
      if (initObj.hasOwnProperty('state_tof_sr')) {
        this.state_tof_sr = initObj.state_tof_sr
      }
      else {
        this.state_tof_sr = false;
      }
      if (initObj.hasOwnProperty('state_tof_bl')) {
        this.state_tof_bl = initObj.state_tof_bl
      }
      else {
        this.state_tof_bl = false;
      }
      if (initObj.hasOwnProperty('state_tof_bm')) {
        this.state_tof_bm = initObj.state_tof_bm
      }
      else {
        this.state_tof_bm = false;
      }
      if (initObj.hasOwnProperty('state_tof_br')) {
        this.state_tof_br = initObj.state_tof_br
      }
      else {
        this.state_tof_br = false;
      }
      if (initObj.hasOwnProperty('state_lf_outer_left')) {
        this.state_lf_outer_left = initObj.state_lf_outer_left
      }
      else {
        this.state_lf_outer_left = false;
      }
      if (initObj.hasOwnProperty('state_lf_outer_right')) {
        this.state_lf_outer_right = initObj.state_lf_outer_right
      }
      else {
        this.state_lf_outer_right = false;
      }
      if (initObj.hasOwnProperty('state_lf_inner_left')) {
        this.state_lf_inner_left = initObj.state_lf_inner_left
      }
      else {
        this.state_lf_inner_left = false;
      }
      if (initObj.hasOwnProperty('state_lf_inner_right')) {
        this.state_lf_inner_right = initObj.state_lf_inner_right
      }
      else {
        this.state_lf_inner_right = false;
      }
      if (initObj.hasOwnProperty('state_encoder_and_motor')) {
        this.state_encoder_and_motor = initObj.state_encoder_and_motor
      }
      else {
        this.state_encoder_and_motor = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorsStatusResponse
    // Serialize message field [state_front_bumper]
    bufferOffset = _serializer.bool(obj.state_front_bumper, buffer, bufferOffset);
    // Serialize message field [state_camera]
    bufferOffset = _serializer.bool(obj.state_camera, buffer, bufferOffset);
    // Serialize message field [state_imu]
    bufferOffset = _serializer.bool(obj.state_imu, buffer, bufferOffset);
    // Serialize message field [state_tof_fl]
    bufferOffset = _serializer.bool(obj.state_tof_fl, buffer, bufferOffset);
    // Serialize message field [state_tof_fm]
    bufferOffset = _serializer.bool(obj.state_tof_fm, buffer, bufferOffset);
    // Serialize message field [state_tof_fr]
    bufferOffset = _serializer.bool(obj.state_tof_fr, buffer, bufferOffset);
    // Serialize message field [state_tof_sl]
    bufferOffset = _serializer.bool(obj.state_tof_sl, buffer, bufferOffset);
    // Serialize message field [state_tof_sr]
    bufferOffset = _serializer.bool(obj.state_tof_sr, buffer, bufferOffset);
    // Serialize message field [state_tof_bl]
    bufferOffset = _serializer.bool(obj.state_tof_bl, buffer, bufferOffset);
    // Serialize message field [state_tof_bm]
    bufferOffset = _serializer.bool(obj.state_tof_bm, buffer, bufferOffset);
    // Serialize message field [state_tof_br]
    bufferOffset = _serializer.bool(obj.state_tof_br, buffer, bufferOffset);
    // Serialize message field [state_lf_outer_left]
    bufferOffset = _serializer.bool(obj.state_lf_outer_left, buffer, bufferOffset);
    // Serialize message field [state_lf_outer_right]
    bufferOffset = _serializer.bool(obj.state_lf_outer_right, buffer, bufferOffset);
    // Serialize message field [state_lf_inner_left]
    bufferOffset = _serializer.bool(obj.state_lf_inner_left, buffer, bufferOffset);
    // Serialize message field [state_lf_inner_right]
    bufferOffset = _serializer.bool(obj.state_lf_inner_right, buffer, bufferOffset);
    // Serialize message field [state_encoder_and_motor]
    bufferOffset = _serializer.bool(obj.state_encoder_and_motor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorsStatusResponse
    let len;
    let data = new SensorsStatusResponse(null);
    // Deserialize message field [state_front_bumper]
    data.state_front_bumper = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_camera]
    data.state_camera = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_imu]
    data.state_imu = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_fl]
    data.state_tof_fl = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_fm]
    data.state_tof_fm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_fr]
    data.state_tof_fr = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_sl]
    data.state_tof_sl = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_sr]
    data.state_tof_sr = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_bl]
    data.state_tof_bl = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_bm]
    data.state_tof_bm = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_tof_br]
    data.state_tof_br = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_lf_outer_left]
    data.state_lf_outer_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_lf_outer_right]
    data.state_lf_outer_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_lf_inner_left]
    data.state_lf_inner_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_lf_inner_right]
    data.state_lf_inner_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [state_encoder_and_motor]
    data.state_encoder_and_motor = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SensorsStatusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3c1ff78cc992d6d1e8b220245aad6f6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool state_front_bumper
    bool state_camera
    bool state_imu
    bool state_tof_fl
    bool state_tof_fm
    bool state_tof_fr
    bool state_tof_sl
    bool state_tof_sr
    bool state_tof_bl
    bool state_tof_bm
    bool state_tof_br
    bool state_lf_outer_left
    bool state_lf_outer_right
    bool state_lf_inner_left
    bool state_lf_inner_right
    bool state_encoder_and_motor
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorsStatusResponse(null);
    if (msg.state_front_bumper !== undefined) {
      resolved.state_front_bumper = msg.state_front_bumper;
    }
    else {
      resolved.state_front_bumper = false
    }

    if (msg.state_camera !== undefined) {
      resolved.state_camera = msg.state_camera;
    }
    else {
      resolved.state_camera = false
    }

    if (msg.state_imu !== undefined) {
      resolved.state_imu = msg.state_imu;
    }
    else {
      resolved.state_imu = false
    }

    if (msg.state_tof_fl !== undefined) {
      resolved.state_tof_fl = msg.state_tof_fl;
    }
    else {
      resolved.state_tof_fl = false
    }

    if (msg.state_tof_fm !== undefined) {
      resolved.state_tof_fm = msg.state_tof_fm;
    }
    else {
      resolved.state_tof_fm = false
    }

    if (msg.state_tof_fr !== undefined) {
      resolved.state_tof_fr = msg.state_tof_fr;
    }
    else {
      resolved.state_tof_fr = false
    }

    if (msg.state_tof_sl !== undefined) {
      resolved.state_tof_sl = msg.state_tof_sl;
    }
    else {
      resolved.state_tof_sl = false
    }

    if (msg.state_tof_sr !== undefined) {
      resolved.state_tof_sr = msg.state_tof_sr;
    }
    else {
      resolved.state_tof_sr = false
    }

    if (msg.state_tof_bl !== undefined) {
      resolved.state_tof_bl = msg.state_tof_bl;
    }
    else {
      resolved.state_tof_bl = false
    }

    if (msg.state_tof_bm !== undefined) {
      resolved.state_tof_bm = msg.state_tof_bm;
    }
    else {
      resolved.state_tof_bm = false
    }

    if (msg.state_tof_br !== undefined) {
      resolved.state_tof_br = msg.state_tof_br;
    }
    else {
      resolved.state_tof_br = false
    }

    if (msg.state_lf_outer_left !== undefined) {
      resolved.state_lf_outer_left = msg.state_lf_outer_left;
    }
    else {
      resolved.state_lf_outer_left = false
    }

    if (msg.state_lf_outer_right !== undefined) {
      resolved.state_lf_outer_right = msg.state_lf_outer_right;
    }
    else {
      resolved.state_lf_outer_right = false
    }

    if (msg.state_lf_inner_left !== undefined) {
      resolved.state_lf_inner_left = msg.state_lf_inner_left;
    }
    else {
      resolved.state_lf_inner_left = false
    }

    if (msg.state_lf_inner_right !== undefined) {
      resolved.state_lf_inner_right = msg.state_lf_inner_right;
    }
    else {
      resolved.state_lf_inner_right = false
    }

    if (msg.state_encoder_and_motor !== undefined) {
      resolved.state_encoder_and_motor = msg.state_encoder_and_motor;
    }
    else {
      resolved.state_encoder_and_motor = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SensorsStatusRequest,
  Response: SensorsStatusResponse,
  md5sum() { return 'd8dd1fcbd833d76004def4493c2acff3'; },
  datatype() { return 'duckietown_msgs/SensorsStatus'; }
};
