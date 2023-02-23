// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DiagnosticsRosTopic {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node = null;
      this.name = null;
      this.help = null;
      this.type = null;
      this.direction = null;
      this.frequency = null;
      this.effective_frequency = null;
      this.healthy_frequency = null;
      this.bandwidth = null;
      this.enabled = null;
    }
    else {
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = '';
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('help')) {
        this.help = initObj.help
      }
      else {
        this.help = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0;
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('effective_frequency')) {
        this.effective_frequency = initObj.effective_frequency
      }
      else {
        this.effective_frequency = 0.0;
      }
      if (initObj.hasOwnProperty('healthy_frequency')) {
        this.healthy_frequency = initObj.healthy_frequency
      }
      else {
        this.healthy_frequency = 0.0;
      }
      if (initObj.hasOwnProperty('bandwidth')) {
        this.bandwidth = initObj.bandwidth
      }
      else {
        this.bandwidth = 0.0;
      }
      if (initObj.hasOwnProperty('enabled')) {
        this.enabled = initObj.enabled
      }
      else {
        this.enabled = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsRosTopic
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [help]
    bufferOffset = _serializer.string(obj.help, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.uint8(obj.direction, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float32(obj.frequency, buffer, bufferOffset);
    // Serialize message field [effective_frequency]
    bufferOffset = _serializer.float32(obj.effective_frequency, buffer, bufferOffset);
    // Serialize message field [healthy_frequency]
    bufferOffset = _serializer.float32(obj.healthy_frequency, buffer, bufferOffset);
    // Serialize message field [bandwidth]
    bufferOffset = _serializer.float32(obj.bandwidth, buffer, bufferOffset);
    // Serialize message field [enabled]
    bufferOffset = _serializer.bool(obj.enabled, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsRosTopic
    let len;
    let data = new DiagnosticsRosTopic(null);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [help]
    data.help = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [effective_frequency]
    data.effective_frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [healthy_frequency]
    data.healthy_frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bandwidth]
    data.bandwidth = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enabled]
    data.enabled = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.node);
    length += _getByteLength(object.name);
    length += _getByteLength(object.help);
    return length + 31;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsRosTopic';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c3a6c5501489fa1a1f348c31cffc641a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new DiagnosticsRosTopic(null);
    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = ''
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.help !== undefined) {
      resolved.help = msg.help;
    }
    else {
      resolved.help = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.effective_frequency !== undefined) {
      resolved.effective_frequency = msg.effective_frequency;
    }
    else {
      resolved.effective_frequency = 0.0
    }

    if (msg.healthy_frequency !== undefined) {
      resolved.healthy_frequency = msg.healthy_frequency;
    }
    else {
      resolved.healthy_frequency = 0.0
    }

    if (msg.bandwidth !== undefined) {
      resolved.bandwidth = msg.bandwidth;
    }
    else {
      resolved.bandwidth = 0.0
    }

    if (msg.enabled !== undefined) {
      resolved.enabled = msg.enabled;
    }
    else {
      resolved.enabled = false
    }

    return resolved;
    }
};

// Constants for message
DiagnosticsRosTopic.Constants = {
  TOPIC_DIRECTION_INBOUND: 0,
  TOPIC_DIRECTION_OUTBOUND: 1,
  TOPIC_TYPE_GENERIC: 0,
  TOPIC_TYPE_DRIVER: 1,
  TOPIC_TYPE_PERCEPTION: 2,
  TOPIC_TYPE_CONTROL: 3,
  TOPIC_TYPE_PLANNING: 4,
  TOPIC_TYPE_LOCALIZATION: 5,
  TOPIC_TYPE_MAPPING: 6,
  TOPIC_TYPE_SWARM: 7,
  TOPIC_TYPE_BEHAVIOR: 8,
  TOPIC_TYPE_VISUALIZATION: 9,
  TOPIC_TYPE_INFRASTRUCTURE: 10,
  TOPIC_TYPE_COMMUNICATION: 11,
  TOPIC_TYPE_DIAGNOSTICS: 12,
  TOPIC_TYPE_DEBUG: 20,
}

module.exports = DiagnosticsRosTopic;
