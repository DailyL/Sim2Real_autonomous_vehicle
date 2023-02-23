// Auto-generated. Do not edit!

// (in-package duckietown_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LEDPattern = require('../msg/LEDPattern.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetCustomLEDPatternRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pattern = null;
    }
    else {
      if (initObj.hasOwnProperty('pattern')) {
        this.pattern = initObj.pattern
      }
      else {
        this.pattern = new LEDPattern();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCustomLEDPatternRequest
    // Serialize message field [pattern]
    bufferOffset = LEDPattern.serialize(obj.pattern, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCustomLEDPatternRequest
    let len;
    let data = new SetCustomLEDPatternRequest(null);
    // Deserialize message field [pattern]
    data.pattern = LEDPattern.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += LEDPattern.getMessageSize(object.pattern);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SetCustomLEDPatternRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80c491edc501f8f5b2f80aaecfd31b21';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    duckietown_msgs/LEDPattern pattern
    
    ================================================================================
    MSG: duckietown_msgs/LEDPattern
    Header header
    string[]  color_list
    std_msgs/ColorRGBA[]  rgb_vals
    int8[]    color_mask
    float32   frequency
    int8[]    frequency_mask
    
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
    MSG: std_msgs/ColorRGBA
    float32 r
    float32 g
    float32 b
    float32 a
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetCustomLEDPatternRequest(null);
    if (msg.pattern !== undefined) {
      resolved.pattern = LEDPattern.Resolve(msg.pattern)
    }
    else {
      resolved.pattern = new LEDPattern()
    }

    return resolved;
    }
};

class SetCustomLEDPatternResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCustomLEDPatternResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCustomLEDPatternResponse
    let len;
    let data = new SetCustomLEDPatternResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'duckietown_msgs/SetCustomLEDPatternResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetCustomLEDPatternResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetCustomLEDPatternRequest,
  Response: SetCustomLEDPatternResponse,
  md5sum() { return '80c491edc501f8f5b2f80aaecfd31b21'; },
  datatype() { return 'duckietown_msgs/SetCustomLEDPattern'; }
};
