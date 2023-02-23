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

class TurnIDandType {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tag_id = null;
      this.turn_type = null;
    }
    else {
      if (initObj.hasOwnProperty('tag_id')) {
        this.tag_id = initObj.tag_id
      }
      else {
        this.tag_id = 0;
      }
      if (initObj.hasOwnProperty('turn_type')) {
        this.turn_type = initObj.turn_type
      }
      else {
        this.turn_type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurnIDandType
    // Serialize message field [tag_id]
    bufferOffset = _serializer.int16(obj.tag_id, buffer, bufferOffset);
    // Serialize message field [turn_type]
    bufferOffset = _serializer.int16(obj.turn_type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurnIDandType
    let len;
    let data = new TurnIDandType(null);
    // Deserialize message field [tag_id]
    data.tag_id = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [turn_type]
    data.turn_type = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/TurnIDandType';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '999e690d54f4de1ab02b7e874091d0ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 tag_id
    int16 turn_type
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurnIDandType(null);
    if (msg.tag_id !== undefined) {
      resolved.tag_id = msg.tag_id;
    }
    else {
      resolved.tag_id = 0
    }

    if (msg.turn_type !== undefined) {
      resolved.turn_type = msg.turn_type;
    }
    else {
      resolved.turn_type = 0
    }

    return resolved;
    }
};

module.exports = TurnIDandType;
