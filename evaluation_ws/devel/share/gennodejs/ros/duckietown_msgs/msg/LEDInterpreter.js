// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LEDInterpreter {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vehicle = null;
      this.trafficlight = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vehicle')) {
        this.vehicle = initObj.vehicle
      }
      else {
        this.vehicle = false;
      }
      if (initObj.hasOwnProperty('trafficlight')) {
        this.trafficlight = initObj.trafficlight
      }
      else {
        this.trafficlight = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LEDInterpreter
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vehicle]
    bufferOffset = _serializer.bool(obj.vehicle, buffer, bufferOffset);
    // Serialize message field [trafficlight]
    bufferOffset = _serializer.bool(obj.trafficlight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LEDInterpreter
    let len;
    let data = new LEDInterpreter(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vehicle]
    data.vehicle = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trafficlight]
    data.trafficlight = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LEDInterpreter';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '100d6a2c19dff0c3d52b5c327f7ecae9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool vehicle
    bool trafficlight
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LEDInterpreter(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vehicle !== undefined) {
      resolved.vehicle = msg.vehicle;
    }
    else {
      resolved.vehicle = false
    }

    if (msg.trafficlight !== undefined) {
      resolved.trafficlight = msg.trafficlight;
    }
    else {
      resolved.trafficlight = false
    }

    return resolved;
    }
};

module.exports = LEDInterpreter;
