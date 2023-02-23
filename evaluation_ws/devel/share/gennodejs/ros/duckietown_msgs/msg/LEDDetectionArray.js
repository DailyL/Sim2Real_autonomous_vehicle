// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LEDDetection = require('./LEDDetection.js');

//-----------------------------------------------------------

class LEDDetectionArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.detections = null;
    }
    else {
      if (initObj.hasOwnProperty('detections')) {
        this.detections = initObj.detections
      }
      else {
        this.detections = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LEDDetectionArray
    // Serialize message field [detections]
    // Serialize the length for message field [detections]
    bufferOffset = _serializer.uint32(obj.detections.length, buffer, bufferOffset);
    obj.detections.forEach((val) => {
      bufferOffset = LEDDetection.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LEDDetectionArray
    let len;
    let data = new LEDDetectionArray(null);
    // Deserialize message field [detections]
    // Deserialize array length for message field [detections]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.detections = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.detections[i] = LEDDetection.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.detections.forEach((val) => {
      length += LEDDetection.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LEDDetectionArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a95456786a73967a5a29fdbf726c022c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    LEDDetection[] detections
    ================================================================================
    MSG: duckietown_msgs/LEDDetection
    time timestamp1		# initial timestamp of the camera stream used 
    time timestamp2		# final timestamp of the camera stream used 
    Vector2D pixels_normalized
    float32 frequency 
    string color        # will be r, g or b 
    float32 confidence  # some value of confidence for the detection (TBD)
    
    # for debug/visualization
    float64[] signal_ts
    float32[] signal
    float32[] fft_fs
    float32[] fft
    
    ================================================================================
    MSG: duckietown_msgs/Vector2D
    float32 x
    float32 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LEDDetectionArray(null);
    if (msg.detections !== undefined) {
      resolved.detections = new Array(msg.detections.length);
      for (let i = 0; i < resolved.detections.length; ++i) {
        resolved.detections[i] = LEDDetection.Resolve(msg.detections[i]);
      }
    }
    else {
      resolved.detections = []
    }

    return resolved;
    }
};

module.exports = LEDDetectionArray;
