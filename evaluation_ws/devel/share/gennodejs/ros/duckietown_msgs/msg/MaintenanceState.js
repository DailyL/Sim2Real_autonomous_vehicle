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

class MaintenanceState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MaintenanceState
    // Serialize message field [state]
    bufferOffset = _serializer.string(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MaintenanceState
    let len;
    let data = new MaintenanceState(null);
    // Deserialize message field [state]
    data.state = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.state);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/MaintenanceState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '076259ec4d51665ce2a0b26c9055f2df';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Header header
    string state
    
    # pseudo constants
    string WAY_TO_MAINTENANCE="WAY_TO_MAINTENANCE"
    string WAY_TO_CHARGING="WAY_TO_CHARGING"
    string CHARGING="CHARGING"
    string WAY_TO_CALIBRATING="WAY_TO_CALIBRATING"	
    string CALIBRATING="CALIBRATING"	
    string WAY_TO_CITY="WAY_TO_CITY"
    string NONE="NONE"
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MaintenanceState(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = ''
    }

    return resolved;
    }
};

// Constants for message
MaintenanceState.Constants = {
  WAY_TO_MAINTENANCE: '"WAY_TO_MAINTENANCE"',
  WAY_TO_CHARGING: '"WAY_TO_CHARGING"',
  CHARGING: '"CHARGING"',
  WAY_TO_CALIBRATING: '"WAY_TO_CALIBRATING"',
  CALIBRATING: '"CALIBRATING"',
  WAY_TO_CITY: '"WAY_TO_CITY"',
  NONE: '"NONE"',
}

module.exports = MaintenanceState;
