// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Segment = require('./Segment.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SegmentList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.segments = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('segments')) {
        this.segments = initObj.segments
      }
      else {
        this.segments = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegmentList
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [segments]
    // Serialize the length for message field [segments]
    bufferOffset = _serializer.uint32(obj.segments.length, buffer, bufferOffset);
    obj.segments.forEach((val) => {
      bufferOffset = Segment.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegmentList
    let len;
    let data = new SegmentList(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [segments]
    // Deserialize array length for message field [segments]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.segments = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.segments[i] = Segment.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 41 * object.segments.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/SegmentList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1cefc32a4bc9039bf09d40c6c13beace';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/Segment[] segments
    
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
    MSG: duckietown_msgs/Segment
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
    const resolved = new SegmentList(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.segments !== undefined) {
      resolved.segments = new Array(msg.segments.length);
      for (let i = 0; i < resolved.segments.length; ++i) {
        resolved.segments[i] = Segment.Resolve(msg.segments[i]);
      }
    }
    else {
      resolved.segments = []
    }

    return resolved;
    }
};

module.exports = SegmentList;
