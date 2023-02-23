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
let ObstacleType = require('./ObstacleType.js');

//-----------------------------------------------------------

class ObstacleImageDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bounding_box = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('bounding_box')) {
        this.bounding_box = initObj.bounding_box
      }
      else {
        this.bounding_box = new Rect();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = new ObstacleType();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleImageDetection
    // Serialize message field [bounding_box]
    bufferOffset = Rect.serialize(obj.bounding_box, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = ObstacleType.serialize(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleImageDetection
    let len;
    let data = new ObstacleImageDetection(null);
    // Deserialize message field [bounding_box]
    data.bounding_box = Rect.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = ObstacleType.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/ObstacleImageDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e532bfbd15e6046dab5e4261999811a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    duckietown_msgs/Rect bounding_box
    duckietown_msgs/ObstacleType type
    ================================================================================
    MSG: duckietown_msgs/Rect
    # all in pixel coordinate
    # (x, y, w, h) defines a rectangle
    int32 x
    int32 y
    int32 w
    int32 h
    
    ================================================================================
    MSG: duckietown_msgs/ObstacleType
    uint8 DUCKIE=0
    uint8 CONE=1
    uint8 type
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleImageDetection(null);
    if (msg.bounding_box !== undefined) {
      resolved.bounding_box = Rect.Resolve(msg.bounding_box)
    }
    else {
      resolved.bounding_box = new Rect()
    }

    if (msg.type !== undefined) {
      resolved.type = ObstacleType.Resolve(msg.type)
    }
    else {
      resolved.type = new ObstacleType()
    }

    return resolved;
    }
};

module.exports = ObstacleImageDetection;
