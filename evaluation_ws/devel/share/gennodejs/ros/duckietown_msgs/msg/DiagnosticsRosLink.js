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

class DiagnosticsRosLink {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.node = null;
      this.topic = null;
      this.remote = null;
      this.direction = null;
      this.connected = null;
      this.transport = null;
      this.messages = null;
      this.dropped = null;
      this.bytes = null;
      this.frequency = null;
      this.bandwidth = null;
    }
    else {
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = '';
      }
      if (initObj.hasOwnProperty('topic')) {
        this.topic = initObj.topic
      }
      else {
        this.topic = '';
      }
      if (initObj.hasOwnProperty('remote')) {
        this.remote = initObj.remote
      }
      else {
        this.remote = '';
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0;
      }
      if (initObj.hasOwnProperty('connected')) {
        this.connected = initObj.connected
      }
      else {
        this.connected = false;
      }
      if (initObj.hasOwnProperty('transport')) {
        this.transport = initObj.transport
      }
      else {
        this.transport = '';
      }
      if (initObj.hasOwnProperty('messages')) {
        this.messages = initObj.messages
      }
      else {
        this.messages = 0;
      }
      if (initObj.hasOwnProperty('dropped')) {
        this.dropped = initObj.dropped
      }
      else {
        this.dropped = 0;
      }
      if (initObj.hasOwnProperty('bytes')) {
        this.bytes = initObj.bytes
      }
      else {
        this.bytes = 0.0;
      }
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = 0.0;
      }
      if (initObj.hasOwnProperty('bandwidth')) {
        this.bandwidth = initObj.bandwidth
      }
      else {
        this.bandwidth = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsRosLink
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    // Serialize message field [topic]
    bufferOffset = _serializer.string(obj.topic, buffer, bufferOffset);
    // Serialize message field [remote]
    bufferOffset = _serializer.string(obj.remote, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.uint8(obj.direction, buffer, bufferOffset);
    // Serialize message field [connected]
    bufferOffset = _serializer.bool(obj.connected, buffer, bufferOffset);
    // Serialize message field [transport]
    bufferOffset = _serializer.string(obj.transport, buffer, bufferOffset);
    // Serialize message field [messages]
    bufferOffset = _serializer.uint64(obj.messages, buffer, bufferOffset);
    // Serialize message field [dropped]
    bufferOffset = _serializer.uint64(obj.dropped, buffer, bufferOffset);
    // Serialize message field [bytes]
    bufferOffset = _serializer.float32(obj.bytes, buffer, bufferOffset);
    // Serialize message field [frequency]
    bufferOffset = _serializer.float32(obj.frequency, buffer, bufferOffset);
    // Serialize message field [bandwidth]
    bufferOffset = _serializer.float32(obj.bandwidth, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsRosLink
    let len;
    let data = new DiagnosticsRosLink(null);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [topic]
    data.topic = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [remote]
    data.remote = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [connected]
    data.connected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [transport]
    data.transport = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [messages]
    data.messages = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [dropped]
    data.dropped = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [bytes]
    data.bytes = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [frequency]
    data.frequency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bandwidth]
    data.bandwidth = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.node);
    length += _getByteLength(object.topic);
    length += _getByteLength(object.remote);
    length += _getByteLength(object.transport);
    return length + 46;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsRosLink';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '53a9a85eb8565abb4ba439662041c3aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Link direction
    uint8 LINK_DIRECTION_INBOUND = 0
    uint8 LINK_DIRECTION_OUTBOUND = 1
    
    string node         # Node publishing this message
    string topic        # Topic transferred over the link
    string remote       # Remote end of this link
    uint8 direction     # Link direction
    bool connected      # Status of the link
    string transport    # Type of transport used for this link
    uint64 messages     # Number of messages transferred over this link
    uint64 dropped      # Number of messages dropped over this link
    float32 bytes       # Volume of data transferred over this link
    float32 frequency   # Link frequency (Hz)
    float32 bandwidth   # Link bandwidth (byte/s)
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DiagnosticsRosLink(null);
    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = ''
    }

    if (msg.topic !== undefined) {
      resolved.topic = msg.topic;
    }
    else {
      resolved.topic = ''
    }

    if (msg.remote !== undefined) {
      resolved.remote = msg.remote;
    }
    else {
      resolved.remote = ''
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0
    }

    if (msg.connected !== undefined) {
      resolved.connected = msg.connected;
    }
    else {
      resolved.connected = false
    }

    if (msg.transport !== undefined) {
      resolved.transport = msg.transport;
    }
    else {
      resolved.transport = ''
    }

    if (msg.messages !== undefined) {
      resolved.messages = msg.messages;
    }
    else {
      resolved.messages = 0
    }

    if (msg.dropped !== undefined) {
      resolved.dropped = msg.dropped;
    }
    else {
      resolved.dropped = 0
    }

    if (msg.bytes !== undefined) {
      resolved.bytes = msg.bytes;
    }
    else {
      resolved.bytes = 0.0
    }

    if (msg.frequency !== undefined) {
      resolved.frequency = msg.frequency;
    }
    else {
      resolved.frequency = 0.0
    }

    if (msg.bandwidth !== undefined) {
      resolved.bandwidth = msg.bandwidth;
    }
    else {
      resolved.bandwidth = 0.0
    }

    return resolved;
    }
};

// Constants for message
DiagnosticsRosLink.Constants = {
  LINK_DIRECTION_INBOUND: 0,
  LINK_DIRECTION_OUTBOUND: 1,
}

module.exports = DiagnosticsRosLink;
