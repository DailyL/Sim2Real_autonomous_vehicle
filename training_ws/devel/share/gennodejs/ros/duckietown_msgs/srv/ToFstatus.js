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

class ToFstatusRequest {
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
    // Serializes a message object of type ToFstatusRequest
    // Serialize message field [sensor_position]
    bufferOffset = _serializer.string(obj.sensor_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ToFstatusRequest
    let len;
    let data = new ToFstatusRequest(null);
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
    return 'duckietown_msgs/ToFstatusRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92d95aecfa07c3669b7ca7c238562a18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sensor_position    #expect tof_fl, tof_fm, tof_fr, tof_sl, tof_sr, tof_bl, tof_br
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ToFstatusRequest(null);
    if (msg.sensor_position !== undefined) {
      resolved.sensor_position = msg.sensor_position;
    }
    else {
      resolved.sensor_position = ''
    }

    return resolved;
    }
};

class ToFstatusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.distance = null;
      this.confidenceValue = null;
      this.validPixels = null;
      this.timeStamp = null;
    }
    else {
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0;
      }
      if (initObj.hasOwnProperty('confidenceValue')) {
        this.confidenceValue = initObj.confidenceValue
      }
      else {
        this.confidenceValue = 0;
      }
      if (initObj.hasOwnProperty('validPixels')) {
        this.validPixels = initObj.validPixels
      }
      else {
        this.validPixels = 0;
      }
      if (initObj.hasOwnProperty('timeStamp')) {
        this.timeStamp = initObj.timeStamp
      }
      else {
        this.timeStamp = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ToFstatusResponse
    // Serialize message field [distance]
    bufferOffset = _serializer.uint16(obj.distance, buffer, bufferOffset);
    // Serialize message field [confidenceValue]
    bufferOffset = _serializer.uint16(obj.confidenceValue, buffer, bufferOffset);
    // Serialize message field [validPixels]
    bufferOffset = _serializer.uint16(obj.validPixels, buffer, bufferOffset);
    // Serialize message field [timeStamp]
    bufferOffset = _serializer.string(obj.timeStamp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ToFstatusResponse
    let len;
    let data = new ToFstatusResponse(null);
    // Deserialize message field [distance]
    data.distance = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [confidenceValue]
    data.confidenceValue = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [validPixels]
    data.validPixels = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [timeStamp]
    data.timeStamp = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.timeStamp);
    return length + 10;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/ToFstatusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75c794c88e433fe9bd58d4fd1130a714';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 distance
    uint16 confidenceValue
    uint16 validPixels
    string timeStamp
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ToFstatusResponse(null);
    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0
    }

    if (msg.confidenceValue !== undefined) {
      resolved.confidenceValue = msg.confidenceValue;
    }
    else {
      resolved.confidenceValue = 0
    }

    if (msg.validPixels !== undefined) {
      resolved.validPixels = msg.validPixels;
    }
    else {
      resolved.validPixels = 0
    }

    if (msg.timeStamp !== undefined) {
      resolved.timeStamp = msg.timeStamp;
    }
    else {
      resolved.timeStamp = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ToFstatusRequest,
  Response: ToFstatusResponse,
  md5sum() { return '123f458c8760917a4db65e882cc7f43c'; },
  datatype() { return 'duckietown_msgs/ToFstatus'; }
};
