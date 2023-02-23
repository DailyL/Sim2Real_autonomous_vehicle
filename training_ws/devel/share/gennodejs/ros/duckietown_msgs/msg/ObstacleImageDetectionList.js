// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ObstacleImageDetection = require('./ObstacleImageDetection.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ObstacleImageDetectionList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.list = null;
      this.imwidth = null;
      this.imheight = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('list')) {
        this.list = initObj.list
      }
      else {
        this.list = [];
      }
      if (initObj.hasOwnProperty('imwidth')) {
        this.imwidth = initObj.imwidth
      }
      else {
        this.imwidth = 0.0;
      }
      if (initObj.hasOwnProperty('imheight')) {
        this.imheight = initObj.imheight
      }
      else {
        this.imheight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleImageDetectionList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [list]
    // Serialize the length for message field [list]
    bufferOffset = _serializer.uint32(obj.list.length, buffer, bufferOffset);
    obj.list.forEach((val) => {
      bufferOffset = ObstacleImageDetection.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [imwidth]
    bufferOffset = _serializer.float32(obj.imwidth, buffer, bufferOffset);
    // Serialize message field [imheight]
    bufferOffset = _serializer.float32(obj.imheight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleImageDetectionList
    let len;
    let data = new ObstacleImageDetectionList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [list]
    // Deserialize array length for message field [list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.list[i] = ObstacleImageDetection.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [imwidth]
    data.imwidth = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imheight]
    data.imheight = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 17 * object.list.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/ObstacleImageDetectionList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb443595d23936bacf0f853c0dbaa48c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/ObstacleImageDetection[] list
    float32 imwidth
    float32 imheight
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: duckietown_msgs/ObstacleImageDetection
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
    const resolved = new ObstacleImageDetectionList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.list !== undefined) {
      resolved.list = new Array(msg.list.length);
      for (let i = 0; i < resolved.list.length; ++i) {
        resolved.list[i] = ObstacleImageDetection.Resolve(msg.list[i]);
      }
    }
    else {
      resolved.list = []
    }

    if (msg.imwidth !== undefined) {
      resolved.imwidth = msg.imwidth;
    }
    else {
      resolved.imwidth = 0.0
    }

    if (msg.imheight !== undefined) {
      resolved.imheight = msg.imheight;
    }
    else {
      resolved.imheight = 0.0
    }

    return resolved;
    }
};

module.exports = ObstacleImageDetectionList;
