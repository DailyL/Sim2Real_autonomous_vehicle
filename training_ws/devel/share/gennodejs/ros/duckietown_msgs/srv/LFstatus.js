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

class LFstatusRequest {
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
    // Serializes a message object of type LFstatusRequest
    // Serialize message field [sensor_position]
    bufferOffset = _serializer.string(obj.sensor_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LFstatusRequest
    let len;
    let data = new LFstatusRequest(null);
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
    return 'duckietown_msgs/LFstatusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92d95aecfa07c3669b7ca7c238562a18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sensor_position    #expect sensor position to be one of the following strings: lf_il, lf_ol, lf_ir, lf_ol
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LFstatusRequest(null);
    if (msg.sensor_position !== undefined) {
      resolved.sensor_position = msg.sensor_position;
    }
    else {
      resolved.sensor_position = ''
    }

    return resolved;
    }
};

class LFstatusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.voltage = null;
    }
    else {
      if (initObj.hasOwnProperty('voltage')) {
        this.voltage = initObj.voltage
      }
      else {
        this.voltage = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LFstatusResponse
    // Serialize message field [voltage]
    bufferOffset = _serializer.uint16(obj.voltage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LFstatusResponse
    let len;
    let data = new LFstatusResponse(null);
    // Deserialize message field [voltage]
    data.voltage = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/LFstatusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7ae362a2353c0f79b3f4102dac1ca3d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 voltage
    #string timeStamp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LFstatusResponse(null);
    if (msg.voltage !== undefined) {
      resolved.voltage = msg.voltage;
    }
    else {
      resolved.voltage = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: LFstatusRequest,
  Response: LFstatusResponse,
  md5sum() { return 'b59a0adbfa1b994feb973fdc4fcbe6db'; },
  datatype() { return 'duckietown_msgs/LFstatus'; }
};
