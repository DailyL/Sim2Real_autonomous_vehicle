// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class StopLineReading {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.stop_line_detected = null;
      this.at_stop_line = null;
      this.stop_line_point = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('stop_line_detected')) {
        this.stop_line_detected = initObj.stop_line_detected
      }
      else {
        this.stop_line_detected = false;
      }
      if (initObj.hasOwnProperty('at_stop_line')) {
        this.at_stop_line = initObj.at_stop_line
      }
      else {
        this.at_stop_line = false;
      }
      if (initObj.hasOwnProperty('stop_line_point')) {
        this.stop_line_point = initObj.stop_line_point
      }
      else {
        this.stop_line_point = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StopLineReading
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [stop_line_detected]
    bufferOffset = _serializer.bool(obj.stop_line_detected, buffer, bufferOffset);
    // Serialize message field [at_stop_line]
    bufferOffset = _serializer.bool(obj.at_stop_line, buffer, bufferOffset);
    // Serialize message field [stop_line_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.stop_line_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StopLineReading
    let len;
    let data = new StopLineReading(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop_line_detected]
    data.stop_line_detected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [at_stop_line]
    data.at_stop_line = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [stop_line_point]
    data.stop_line_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/StopLineReading';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '735fe9e9ff1e4d7460bbf69ab2720ae0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool stop_line_detected
    bool at_stop_line
    geometry_msgs/Point stop_line_point #this is in the "lane frame"
    
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
    const resolved = new StopLineReading(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.stop_line_detected !== undefined) {
      resolved.stop_line_detected = msg.stop_line_detected;
    }
    else {
      resolved.stop_line_detected = false
    }

    if (msg.at_stop_line !== undefined) {
      resolved.at_stop_line = msg.at_stop_line;
    }
    else {
      resolved.at_stop_line = false
    }

    if (msg.stop_line_point !== undefined) {
      resolved.stop_line_point = geometry_msgs.msg.Point.Resolve(msg.stop_line_point)
    }
    else {
      resolved.stop_line_point = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = StopLineReading;
