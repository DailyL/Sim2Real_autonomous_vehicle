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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Segment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color = null;
      this.pixels_normalized = null;
      this.normal = null;
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = 0;
      }
      if (initObj.hasOwnProperty('pixels_normalized')) {
        this.pixels_normalized = initObj.pixels_normalized
      }
      else {
        this.pixels_normalized = new Array(2).fill(new Vector2D());
      }
      if (initObj.hasOwnProperty('normal')) {
        this.normal = initObj.normal
      }
      else {
        this.normal = new Vector2D();
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = new Array(2).fill(new geometry_msgs.msg.Point());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Segment
    // Serialize message field [color]
    bufferOffset = _serializer.uint8(obj.color, buffer, bufferOffset);
    // Check that the constant length array field [pixels_normalized] has the right length
    if (obj.pixels_normalized.length !== 2) {
      throw new Error('Unable to serialize array field pixels_normalized - length must be 2')
    }
    // Serialize message field [pixels_normalized]
    obj.pixels_normalized.forEach((val) => {
      bufferOffset = Vector2D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [normal]
    bufferOffset = Vector2D.serialize(obj.normal, buffer, bufferOffset);
    // Check that the constant length array field [points] has the right length
    if (obj.points.length !== 2) {
      throw new Error('Unable to serialize array field points - length must be 2')
    }
    // Serialize message field [points]
    obj.points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Segment
    let len;
    let data = new Segment(null);
    // Deserialize message field [color]
    data.color = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [pixels_normalized]
    len = 2;
    data.pixels_normalized = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pixels_normalized[i] = Vector2D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [normal]
    data.normal = Vector2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [points]
    len = 2;
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/Segment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63449fcee6301e43c25adab0c5e5d117';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 WHITE=0
    uint8 YELLOW=1	
    uint8 RED=2
    uint8 color
    duckietown_msgs/Vector2D[2] pixels_normalized
    duckietown_msgs/Vector2D normal
    
    geometry_msgs/Point[2] points
    
    ================================================================================
    MSG: duckietown_msgs/Vector2D
    float32 x
    float32 y
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Segment(null);
    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = 0
    }

    if (msg.pixels_normalized !== undefined) {
      resolved.pixels_normalized = new Array(2)
      for (let i = 0; i < resolved.pixels_normalized.length; ++i) {
        if (msg.pixels_normalized.length > i) {
          resolved.pixels_normalized[i] = Vector2D.Resolve(msg.pixels_normalized[i]);
        }
        else {
          resolved.pixels_normalized[i] = new Vector2D();
        }
      }
    }
    else {
      resolved.pixels_normalized = new Array(2).fill(new Vector2D())
    }

    if (msg.normal !== undefined) {
      resolved.normal = Vector2D.Resolve(msg.normal)
    }
    else {
      resolved.normal = new Vector2D()
    }

    if (msg.points !== undefined) {
      resolved.points = new Array(2)
      for (let i = 0; i < resolved.points.length; ++i) {
        if (msg.points.length > i) {
          resolved.points[i] = geometry_msgs.msg.Point.Resolve(msg.points[i]);
        }
        else {
          resolved.points[i] = new geometry_msgs.msg.Point();
        }
      }
    }
    else {
      resolved.points = new Array(2).fill(new geometry_msgs.msg.Point())
    }

    return resolved;
    }
};

// Constants for message
Segment.Constants = {
  WHITE: 0,
  YELLOW: 1,
  RED: 2,
}

module.exports = Segment;
