// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector2D = require('./Vector2D.js');

//-----------------------------------------------------------

class LEDDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp1 = null;
      this.timestamp2 = null;
      this.pixels_normalized = null;
      this.frequency = null;
      this.color = null;
      this.confidence = null;
      this.signal_ts = null;
      this.signal = null;
      this.fft_fs = null;
      this.fft = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp1')) {
        this.timestamp1 = initObj.timestamp1
      }
      else {
        this.timestamp1 = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('timestamp2')) {
        this.timestamp2 = initObj.timestamp2
      }
      else {
        this.timestamp2 = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('pixels_normalized')) {
        this.pixels_normalized = initObj.pixels_normalized
      }
      else {
        this.pixels_normalized = new Vector2D();
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = '';
      }
      if (initObj.hasOwnProperty('confidence')) {
        this.confidence = initObj.confidence
      }
      else {
        this.confidence = 0.0;
      }
      if (initObj.hasOwnProperty('signal_ts')) {
        this.signal_ts = initObj.signal_ts
      }
      else {
        this.signal_ts = [];
      }
      if (initObj.hasOwnProperty('signal')) {
        this.signal = initObj.signal
      }
      else {
        this.signal = [];
      }
      if (initObj.hasOwnProperty('fft_fs')) {
        this.fft_fs = initObj.fft_fs
      }
      else {
        this.fft_fs = [];
      }
      if (initObj.hasOwnProperty('fft')) {
        this.fft = initObj.fft
      }
      else {
        this.fft = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LEDDetection
    // Serialize message field [timestamp1]
    bufferOffset = _serializer.time(obj.timestamp1, buffer, bufferOffset);
    // Serialize message field [timestamp2]
    bufferOffset = _serializer.time(obj.timestamp2, buffer, bufferOffset);
    // Serialize message field [pixels_normalized]
    bufferOffset = Vector2D.serialize(obj.pixels_normalized, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float32(obj.frequency, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = _serializer.string(obj.color, buffer, bufferOffset);
    // Serialize message field [confidence]
    bufferOffset = _serializer.float32(obj.confidence, buffer, bufferOffset);
    // Serialize message field [signal_ts]
    bufferOffset = _arraySerializer.float64(obj.signal_ts, buffer, bufferOffset, null);
    // Serialize message field [signal]
    bufferOffset = _arraySerializer.float32(obj.signal, buffer, bufferOffset, null);
    // Serialize message field [fft_fs]
    bufferOffset = _arraySerializer.float32(obj.fft_fs, buffer, bufferOffset, null);
    // Serialize message field [fft]
    bufferOffset = _arraySerializer.float32(obj.fft, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LEDDetection
    let len;
    let data = new LEDDetection(null);
    // Deserialize message field [timestamp1]
    data.timestamp1 = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [timestamp2]
    data.timestamp2 = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [pixels_normalized]
    data.pixels_normalized = Vector2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [confidence]
    data.confidence = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [signal_ts]
    data.signal_ts = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [signal]
    data.signal = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [fft_fs]
    data.fft_fs = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [fft]
    data.fft = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.color);
    length += 8 * object.signal_ts.length;
    length += 4 * object.signal.length;
    length += 4 * object.fft_fs.length;
    length += 4 * object.fft.length;
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LEDDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1ac8691d7a30e838dc372a724aee94b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new LEDDetection(null);
    if (msg.timestamp1 !== undefined) {
      resolved.timestamp1 = msg.timestamp1;
    }
    else {
      resolved.timestamp1 = {secs: 0, nsecs: 0}
    }

    if (msg.timestamp2 !== undefined) {
      resolved.timestamp2 = msg.timestamp2;
    }
    else {
      resolved.timestamp2 = {secs: 0, nsecs: 0}
    }

    if (msg.pixels_normalized !== undefined) {
      resolved.pixels_normalized = Vector2D.Resolve(msg.pixels_normalized)
    }
    else {
      resolved.pixels_normalized = new Vector2D()
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = ''
    }

    if (msg.confidence !== undefined) {
      resolved.confidence = msg.confidence;
    }
    else {
      resolved.confidence = 0.0
    }

    if (msg.signal_ts !== undefined) {
      resolved.signal_ts = msg.signal_ts;
    }
    else {
      resolved.signal_ts = []
    }

    if (msg.signal !== undefined) {
      resolved.signal = msg.signal;
    }
    else {
      resolved.signal = []
    }

    if (msg.fft_fs !== undefined) {
      resolved.fft_fs = msg.fft_fs;
    }
    else {
      resolved.fft_fs = []
    }

    if (msg.fft !== undefined) {
      resolved.fft = msg.fft;
    }
    else {
      resolved.fft = []
    }

    return resolved;
    }
};

module.exports = LEDDetection;
