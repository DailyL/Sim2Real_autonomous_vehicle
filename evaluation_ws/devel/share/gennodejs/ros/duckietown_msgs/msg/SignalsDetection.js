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

class SignalsDetection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.front = null;
      this.right = null;
      this.left = null;
      this.traffic_light_state = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('front')) {
        this.front = initObj.front
      }
      else {
        this.front = '';
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = '';
      }
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = '';
      }
      if (initObj.hasOwnProperty('traffic_light_state')) {
        this.traffic_light_state = initObj.traffic_light_state
      }
      else {
        this.traffic_light_state = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SignalsDetection
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [front]
    bufferOffset = _serializer.string(obj.front, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = _serializer.string(obj.right, buffer, bufferOffset);
    // Serialize message field [left]
    bufferOffset = _serializer.string(obj.left, buffer, bufferOffset);
    // Serialize message field [traffic_light_state]
    bufferOffset = _serializer.string(obj.traffic_light_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SignalsDetection
    let len;
    let data = new SignalsDetection(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [front]
    data.front = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [left]
    data.left = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [traffic_light_state]
    data.traffic_light_state = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.front);
    length += _getByteLength(object.right);
    length += _getByteLength(object.left);
    length += _getByteLength(object.traffic_light_state);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/SignalsDetection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a3bb73ea77191f1c0ddd7e196f27c75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # this is what we can see at the intersection:
    string front
    string right
    string left
    
    # For the first backoff approach
    # string led_detected
    # string no_led_detected
    
    # Each of these can be:
    string NO_CAR='no_car_detected'
    string SIGNAL_A='car_signal_A'
    string SIGNAL_B='car_signal_B'
    string SIGNAL_C='car_signal_C'
    string SIGNAL_PRIORITY='car_signal_priority'
    string SIGNAL_SACRIFICE_FOR_PRIORITY='car_signal_sacrifice_for_priority'
    
    string NO_CARS='no_cars_detected'
    string CARS   ='cars_detected'
    
    
    # Plus we can see the traffic light
    
    # for the moment we assume that no traffic light exists
    
    string traffic_light_state
    
    string NO_TRAFFIC_LIGHT='no_traffic_light'
    string STOP='tl_stop'
    string GO='tl_go'
    string YIELD='tl_yield'
    
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
    const resolved = new SignalsDetection(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.front !== undefined) {
      resolved.front = msg.front;
    }
    else {
      resolved.front = ''
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = ''
    }

    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = ''
    }

    if (msg.traffic_light_state !== undefined) {
      resolved.traffic_light_state = msg.traffic_light_state;
    }
    else {
      resolved.traffic_light_state = ''
    }

    return resolved;
    }
};

// Constants for message
SignalsDetection.Constants = {
  NO_CAR: '\'no_car_detected\'',
  SIGNAL_A: '\'car_signal_A\'',
  SIGNAL_B: '\'car_signal_B\'',
  SIGNAL_C: '\'car_signal_C\'',
  SIGNAL_PRIORITY: '\'car_signal_priority\'',
  SIGNAL_SACRIFICE_FOR_PRIORITY: '\'car_signal_sacrifice_for_priority\'',
  NO_CARS: '\'no_cars_detected\'',
  CARS: '\'cars_detected\'',
  NO_TRAFFIC_LIGHT: '\'no_traffic_light\'',
  STOP: '\'tl_stop\'',
  GO: '\'tl_go\'',
  YIELD: '\'tl_yield\'',
}

module.exports = SignalsDetection;
