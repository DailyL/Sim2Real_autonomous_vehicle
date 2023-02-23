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

class SignalsDetectionETHZ17 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.led_detected = null;
      this.no_led_detected = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('led_detected')) {
        this.led_detected = initObj.led_detected
      }
      else {
        this.led_detected = '';
      }
      if (initObj.hasOwnProperty('no_led_detected')) {
        this.no_led_detected = initObj.no_led_detected
      }
      else {
        this.no_led_detected = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SignalsDetectionETHZ17
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [led_detected]
    bufferOffset = _serializer.string(obj.led_detected, buffer, bufferOffset);
    // Serialize message field [no_led_detected]
    bufferOffset = _serializer.string(obj.no_led_detected, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SignalsDetectionETHZ17
    let len;
    let data = new SignalsDetectionETHZ17(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [led_detected]
    data.led_detected = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [no_led_detected]
    data.no_led_detected = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.led_detected);
    length += _getByteLength(object.no_led_detected);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/SignalsDetectionETHZ17';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1b7d3a54f028811e1c3b2366af85c0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # this is what we can see at the intersection:
    #string front
    #string right
    #string left 
    
    # For the first backoff approach
    string led_detected
    string no_led_detected
    
    # Each of these can be:
    #string NO_CAR='no_car_detected'
    string SIGNAL_A='car_signal_A'
    string SIGNAL_B='car_signal_B'
    string SIGNAL_C='car_signal_C'
    
    string NO_CARS='no_cars_detected'
    string CARS   ='cars_detected'
    
    
    # Plus we can see the traffic light
    
    # for the moment we assume that no traffic light exists
    
    #string traffic_light_state
    
    #string NO_TRAFFIC_LIGHT='no_traffic_light'
    #string STOP='tl_stop'
    string GO='tl_go'
    #string YIELD='tl_yield'
    
    
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
    const resolved = new SignalsDetectionETHZ17(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.led_detected !== undefined) {
      resolved.led_detected = msg.led_detected;
    }
    else {
      resolved.led_detected = ''
    }

    if (msg.no_led_detected !== undefined) {
      resolved.no_led_detected = msg.no_led_detected;
    }
    else {
      resolved.no_led_detected = ''
    }

    return resolved;
    }
};

// Constants for message
SignalsDetectionETHZ17.Constants = {
  SIGNAL_A: '\'car_signal_A\'',
  SIGNAL_B: '\'car_signal_B\'',
  SIGNAL_C: '\'car_signal_C\'',
  NO_CARS: '\'no_cars_detected\'',
  CARS: '\'cars_detected\'',
  GO: '\'tl_go\'',
}

module.exports = SignalsDetectionETHZ17;
