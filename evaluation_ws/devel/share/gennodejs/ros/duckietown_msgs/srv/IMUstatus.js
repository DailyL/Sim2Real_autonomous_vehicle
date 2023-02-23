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

class IMUstatusRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sensor_position = null;
    }
    else {
      if (initObj.hasOwnProperty('sensor_position')) {
        this.sensor_position = initObj.sensor_position
      }
      else {
        this.sensor_position = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IMUstatusRequest
    // Serialize message field [sensor_position]
    bufferOffset = _serializer.string(obj.sensor_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IMUstatusRequest
    let len;
    let data = new IMUstatusRequest(null);
    // Deserialize message field [sensor_position]
    data.sensor_position = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.sensor_position);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/IMUstatusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92d95aecfa07c3669b7ca7c238562a18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sensor_position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IMUstatusRequest(null);
    if (msg.sensor_position !== undefined) {
      resolved.sensor_position = msg.sensor_position;
    }
    else {
      resolved.sensor_position = ''
    }

    return resolved;
    }
};

class IMUstatusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.acceleration_x = null;
      this.acceleration_y = null;
      this.acceleration_z = null;
      this.timestamp_acceleration = null;
      this.gyro_x = null;
      this.gyro_y = null;
      this.gyro_z = null;
      this.timestamp_gyro = null;
      this.magentic_field_x = null;
      this.magentic_field_y = null;
      this.magentic_field_z = null;
      this.timestamp_magnetic_field = null;
      this.temperature = null;
    }
    else {
      if (initObj.hasOwnProperty('acceleration_x')) {
        this.acceleration_x = initObj.acceleration_x
      }
      else {
        this.acceleration_x = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_y')) {
        this.acceleration_y = initObj.acceleration_y
      }
      else {
        this.acceleration_y = 0.0;
      }
      if (initObj.hasOwnProperty('acceleration_z')) {
        this.acceleration_z = initObj.acceleration_z
      }
      else {
        this.acceleration_z = 0.0;
      }
      if (initObj.hasOwnProperty('timestamp_acceleration')) {
        this.timestamp_acceleration = initObj.timestamp_acceleration
      }
      else {
        this.timestamp_acceleration = '';
      }
      if (initObj.hasOwnProperty('gyro_x')) {
        this.gyro_x = initObj.gyro_x
      }
      else {
        this.gyro_x = 0.0;
      }
      if (initObj.hasOwnProperty('gyro_y')) {
        this.gyro_y = initObj.gyro_y
      }
      else {
        this.gyro_y = 0.0;
      }
      if (initObj.hasOwnProperty('gyro_z')) {
        this.gyro_z = initObj.gyro_z
      }
      else {
        this.gyro_z = 0.0;
      }
      if (initObj.hasOwnProperty('timestamp_gyro')) {
        this.timestamp_gyro = initObj.timestamp_gyro
      }
      else {
        this.timestamp_gyro = '';
      }
      if (initObj.hasOwnProperty('magentic_field_x')) {
        this.magentic_field_x = initObj.magentic_field_x
      }
      else {
        this.magentic_field_x = 0.0;
      }
      if (initObj.hasOwnProperty('magentic_field_y')) {
        this.magentic_field_y = initObj.magentic_field_y
      }
      else {
        this.magentic_field_y = 0.0;
      }
      if (initObj.hasOwnProperty('magentic_field_z')) {
        this.magentic_field_z = initObj.magentic_field_z
      }
      else {
        this.magentic_field_z = 0.0;
      }
      if (initObj.hasOwnProperty('timestamp_magnetic_field')) {
        this.timestamp_magnetic_field = initObj.timestamp_magnetic_field
      }
      else {
        this.timestamp_magnetic_field = '';
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IMUstatusResponse
    // Serialize message field [acceleration_x]
    bufferOffset = _serializer.float32(obj.acceleration_x, buffer, bufferOffset);
    // Serialize message field [acceleration_y]
    bufferOffset = _serializer.float32(obj.acceleration_y, buffer, bufferOffset);
    // Serialize message field [acceleration_z]
    bufferOffset = _serializer.float32(obj.acceleration_z, buffer, bufferOffset);
    // Serialize message field [timestamp_acceleration]
    bufferOffset = _serializer.string(obj.timestamp_acceleration, buffer, bufferOffset);
    // Serialize message field [gyro_x]
    bufferOffset = _serializer.float32(obj.gyro_x, buffer, bufferOffset);
    // Serialize message field [gyro_y]
    bufferOffset = _serializer.float32(obj.gyro_y, buffer, bufferOffset);
    // Serialize message field [gyro_z]
    bufferOffset = _serializer.float32(obj.gyro_z, buffer, bufferOffset);
    // Serialize message field [timestamp_gyro]
    bufferOffset = _serializer.string(obj.timestamp_gyro, buffer, bufferOffset);
    // Serialize message field [magentic_field_x]
    bufferOffset = _serializer.float32(obj.magentic_field_x, buffer, bufferOffset);
    // Serialize message field [magentic_field_y]
    bufferOffset = _serializer.float32(obj.magentic_field_y, buffer, bufferOffset);
    // Serialize message field [magentic_field_z]
    bufferOffset = _serializer.float32(obj.magentic_field_z, buffer, bufferOffset);
    // Serialize message field [timestamp_magnetic_field]
    bufferOffset = _serializer.string(obj.timestamp_magnetic_field, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.float32(obj.temperature, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IMUstatusResponse
    let len;
    let data = new IMUstatusResponse(null);
    // Deserialize message field [acceleration_x]
    data.acceleration_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration_y]
    data.acceleration_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [acceleration_z]
    data.acceleration_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timestamp_acceleration]
    data.timestamp_acceleration = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [gyro_x]
    data.gyro_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyro_y]
    data.gyro_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyro_z]
    data.gyro_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timestamp_gyro]
    data.timestamp_gyro = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [magentic_field_x]
    data.magentic_field_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [magentic_field_y]
    data.magentic_field_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [magentic_field_z]
    data.magentic_field_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timestamp_magnetic_field]
    data.timestamp_magnetic_field = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.timestamp_acceleration);
    length += _getByteLength(object.timestamp_gyro);
    length += _getByteLength(object.timestamp_magnetic_field);
    return length + 52;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/IMUstatusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9684a2de93e62838d97f3820fbe82aee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 acceleration_x
    float32 acceleration_y
    float32 acceleration_z
    string timestamp_acceleration
    float32 gyro_x
    float32 gyro_y
    float32 gyro_z
    string timestamp_gyro
    float32 magentic_field_x
    float32 magentic_field_y
    float32 magentic_field_z
    string timestamp_magnetic_field
    float32 temperature
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IMUstatusResponse(null);
    if (msg.acceleration_x !== undefined) {
      resolved.acceleration_x = msg.acceleration_x;
    }
    else {
      resolved.acceleration_x = 0.0
    }

    if (msg.acceleration_y !== undefined) {
      resolved.acceleration_y = msg.acceleration_y;
    }
    else {
      resolved.acceleration_y = 0.0
    }

    if (msg.acceleration_z !== undefined) {
      resolved.acceleration_z = msg.acceleration_z;
    }
    else {
      resolved.acceleration_z = 0.0
    }

    if (msg.timestamp_acceleration !== undefined) {
      resolved.timestamp_acceleration = msg.timestamp_acceleration;
    }
    else {
      resolved.timestamp_acceleration = ''
    }

    if (msg.gyro_x !== undefined) {
      resolved.gyro_x = msg.gyro_x;
    }
    else {
      resolved.gyro_x = 0.0
    }

    if (msg.gyro_y !== undefined) {
      resolved.gyro_y = msg.gyro_y;
    }
    else {
      resolved.gyro_y = 0.0
    }

    if (msg.gyro_z !== undefined) {
      resolved.gyro_z = msg.gyro_z;
    }
    else {
      resolved.gyro_z = 0.0
    }

    if (msg.timestamp_gyro !== undefined) {
      resolved.timestamp_gyro = msg.timestamp_gyro;
    }
    else {
      resolved.timestamp_gyro = ''
    }

    if (msg.magentic_field_x !== undefined) {
      resolved.magentic_field_x = msg.magentic_field_x;
    }
    else {
      resolved.magentic_field_x = 0.0
    }

    if (msg.magentic_field_y !== undefined) {
      resolved.magentic_field_y = msg.magentic_field_y;
    }
    else {
      resolved.magentic_field_y = 0.0
    }

    if (msg.magentic_field_z !== undefined) {
      resolved.magentic_field_z = msg.magentic_field_z;
    }
    else {
      resolved.magentic_field_z = 0.0
    }

    if (msg.timestamp_magnetic_field !== undefined) {
      resolved.timestamp_magnetic_field = msg.timestamp_magnetic_field;
    }
    else {
      resolved.timestamp_magnetic_field = ''
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: IMUstatusRequest,
  Response: IMUstatusResponse,
  md5sum() { return '508fbfdea8b0319f1b2a5826eac9a6e6'; },
  datatype() { return 'duckietown_msgs/IMUstatus'; }
};
