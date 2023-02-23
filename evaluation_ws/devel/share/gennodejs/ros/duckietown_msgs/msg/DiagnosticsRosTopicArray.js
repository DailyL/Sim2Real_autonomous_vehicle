// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DiagnosticsRosTopic = require('./DiagnosticsRosTopic.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DiagnosticsRosTopicArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.topics = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('topics')) {
        this.topics = initObj.topics
      }
      else {
        this.topics = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsRosTopicArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [topics]
    // Serialize the length for message field [topics]
    bufferOffset = _serializer.uint32(obj.topics.length, buffer, bufferOffset);
    obj.topics.forEach((val) => {
      bufferOffset = DiagnosticsRosTopic.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsRosTopicArray
    let len;
    let data = new DiagnosticsRosTopicArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [topics]
    // Deserialize array length for message field [topics]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.topics = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.topics[i] = DiagnosticsRosTopic.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.topics.forEach((val) => {
      length += DiagnosticsRosTopic.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsRosTopicArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75d6b38d91572d9e365e9ae3cf66db75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    duckietown_msgs/DiagnosticsRosTopic[] topics
    
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
    MSG: duckietown_msgs/DiagnosticsRosTopic
    # Topic direction (this has to match duckietown.TopicDirection)
    uint8 TOPIC_DIRECTION_INBOUND = 0
    uint8 TOPIC_DIRECTION_OUTBOUND = 1
    
    # Topic type (this has to match duckietown.TopicType)
    uint8 TOPIC_TYPE_GENERIC = 0
    uint8 TOPIC_TYPE_DRIVER = 1
    uint8 TOPIC_TYPE_PERCEPTION = 2
    uint8 TOPIC_TYPE_CONTROL = 3
    uint8 TOPIC_TYPE_PLANNING = 4
    uint8 TOPIC_TYPE_LOCALIZATION = 5
    uint8 TOPIC_TYPE_MAPPING = 6
    uint8 TOPIC_TYPE_SWARM = 7
    uint8 TOPIC_TYPE_BEHAVIOR = 8
    uint8 TOPIC_TYPE_VISUALIZATION = 9
    uint8 TOPIC_TYPE_INFRASTRUCTURE = 10
    uint8 TOPIC_TYPE_COMMUNICATION = 11
    uint8 TOPIC_TYPE_DIAGNOSTICS = 12
    uint8 TOPIC_TYPE_DEBUG = 20
    
    string node                     # Node publishing this message
    string name                     # Topic object of the diagnostics
    string help                     # Topic description
    uint8 type                      # Topic type
    uint8 direction                 # Topic direction
    float32 frequency               # Topic frequency (Hz)
    float32 effective_frequency     # Topic (effective) frequency (Hz)
    float32 healthy_frequency       # Frequency at which this topic can be considered healthy
    float32 bandwidth               # Topic bandwidth (byte/s)
    bool enabled                    # Topic switch
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DiagnosticsRosTopicArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.topics !== undefined) {
      resolved.topics = new Array(msg.topics.length);
      for (let i = 0; i < resolved.topics.length; ++i) {
        resolved.topics[i] = DiagnosticsRosTopic.Resolve(msg.topics[i]);
      }
    }
    else {
      resolved.topics = []
    }

    return resolved;
    }
};

module.exports = DiagnosticsRosTopicArray;
