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

class ButtonEvent {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.event = null;
    }
    else {
      if (initObj.hasOwnProperty('event')) {
        this.event = initObj.event
      }
      else {
        this.event = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ButtonEvent
    // Serialize message field [event]
    bufferOffset = _serializer.uint8(obj.event, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ButtonEvent
    let len;
    let data = new ButtonEvent(null);
    // Deserialize message field [event]
    data.event = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/ButtonEvent';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99a2e60dbe7b111394ec13b630081819';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 EVENT_SINGLE_CLICK = 0
    uint8 EVENT_HELD_3SEC = 10
    uint8 EVENT_HELD_10SEC = 20
    
    uint8 event
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ButtonEvent(null);
    if (msg.event !== undefined) {
      resolved.event = msg.event;
    }
    else {
      resolved.event = 0
    }

    return resolved;
    }
};

// Constants for message
ButtonEvent.Constants = {
  EVENT_SINGLE_CLICK: 0,
  EVENT_HELD_3SEC: 10,
  EVENT_HELD_10SEC: 20,
}

module.exports = ButtonEvent;
