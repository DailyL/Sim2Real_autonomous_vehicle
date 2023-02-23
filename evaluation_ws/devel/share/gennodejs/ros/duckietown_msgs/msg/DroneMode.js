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

class DroneMode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.drone_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('drone_mode')) {
        this.drone_mode = initObj.drone_mode
      }
      else {
        this.drone_mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DroneMode
    // Serialize message field [drone_mode]
    bufferOffset = _serializer.uint8(obj.drone_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DroneMode
    let len;
    let data = new DroneMode(null);
    // Deserialize message field [drone_mode]
    data.drone_mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DroneMode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b59b67ae59d5510222e083f7dcf98328';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Power supply status constants
    uint8 DRONE_MODE_DISARMED = 0
    uint8 DRONE_MODE_ARMED = 1
    uint8 DRONE_MODE_FLYING = 2
    
    # The drone status  as reported. Values defined above
    uint8 drone_mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DroneMode(null);
    if (msg.drone_mode !== undefined) {
      resolved.drone_mode = msg.drone_mode;
    }
    else {
      resolved.drone_mode = 0
    }

    return resolved;
    }
};

// Constants for message
DroneMode.Constants = {
  DRONE_MODE_DISARMED: 0,
  DRONE_MODE_ARMED: 1,
  DRONE_MODE_FLYING: 2,
}

module.exports = DroneMode;
