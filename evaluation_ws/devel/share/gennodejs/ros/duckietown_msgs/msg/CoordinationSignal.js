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

class CoordinationSignal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.signal = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('signal')) {
        this.signal = initObj.signal
      }
      else {
        this.signal = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CoordinationSignal
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [signal]
    bufferOffset = _serializer.string(obj.signal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CoordinationSignal
    let len;
    let data = new CoordinationSignal(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [signal]
    data.signal = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.signal);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/CoordinationSignal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3caa78ed5f7d2e4ac24db630f8ee77a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    string signal
    
    # these must match with LED_protocol.yaml
    string OFF=light_off
    #string ON = light_on
    string ON=traffic_light_go
    string SIGNAL_A=CAR_SIGNAL_A
    string SIGNAL_B=CAR_SIGNAL_B
    string SIGNAL_C=CAR_SIGNAL_C
    string SIGNAL_GREEN = CAR_SIGNAL_GREEN
    string SIGNAL_PRIORITY = CAR_SIGNAL_PRIORITY
    string SIGNAL_SACRIFICE_FOR_PRIORITY = CAR_SIGNAL_SACRIFICE_FOR_PRIORITY
    
    string TL_GO_ALL=tl_go_all
    string TL_STOP_ALL=tl_stop_all
    string TL_GO_N=tl_go_N
    string TL_GO_S=tl_go_S
    string TL_GO_W=tl_go_W
    string TL_GO_E=tl_go_E
    string TL_YIELD=tl_yield
    
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
    const resolved = new CoordinationSignal(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.signal !== undefined) {
      resolved.signal = msg.signal;
    }
    else {
      resolved.signal = ''
    }

    return resolved;
    }
};

// Constants for message
CoordinationSignal.Constants = {
  OFF: 'light_off',
  ON: 'traffic_light_go',
  SIGNAL_A: 'CAR_SIGNAL_A',
  SIGNAL_B: 'CAR_SIGNAL_B',
  SIGNAL_C: 'CAR_SIGNAL_C',
  SIGNAL_GREEN: 'CAR_SIGNAL_GREEN',
  SIGNAL_PRIORITY: 'CAR_SIGNAL_PRIORITY',
  SIGNAL_SACRIFICE_FOR_PRIORITY: 'CAR_SIGNAL_SACRIFICE_FOR_PRIORITY',
  TL_GO_ALL: 'tl_go_all',
  TL_STOP_ALL: 'tl_stop_all',
  TL_GO_N: 'tl_go_N',
  TL_GO_S: 'tl_go_S',
  TL_GO_W: 'tl_go_W',
  TL_GO_E: 'tl_go_E',
  TL_YIELD: 'tl_yield',
}

module.exports = CoordinationSignal;
