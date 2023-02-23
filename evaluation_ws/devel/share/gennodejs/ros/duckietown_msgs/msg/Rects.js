// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Rect = require('./Rect.js');

//-----------------------------------------------------------

class Rects {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rects = null;
    }
    else {
      if (initObj.hasOwnProperty('rects')) {
        this.rects = initObj.rects
      }
      else {
        this.rects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Rects
    // Serialize message field [rects]
    // Serialize the length for message field [rects]
    bufferOffset = _serializer.uint32(obj.rects.length, buffer, bufferOffset);
    obj.rects.forEach((val) => {
      bufferOffset = Rect.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Rects
    let len;
    let data = new Rects(null);
    // Deserialize message field [rects]
    // Deserialize array length for message field [rects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rects[i] = Rect.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.rects.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/Rects';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f5b74b2b15b5d4d2f299389f9f4ca7f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    duckietown_msgs/Rect[] rects
    ================================================================================
    MSG: duckietown_msgs/Rect
    # all in pixel coordinate
    # (x, y, w, h) defines a rectangle
    int32 x
    int32 y
    int32 w
    int32 h
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Rects(null);
    if (msg.rects !== undefined) {
      resolved.rects = new Array(msg.rects.length);
      for (let i = 0; i < resolved.rects.length; ++i) {
        resolved.rects[i] = Rect.Resolve(msg.rects[i]);
      }
    }
    else {
      resolved.rects = []
    }

    return resolved;
    }
};

module.exports = Rects;
