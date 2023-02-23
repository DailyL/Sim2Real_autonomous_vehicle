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

class EpisodeStart {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.episode_name = null;
      this.other_payload_yaml = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('episode_name')) {
        this.episode_name = initObj.episode_name
      }
      else {
        this.episode_name = '';
      }
      if (initObj.hasOwnProperty('other_payload_yaml')) {
        this.other_payload_yaml = initObj.other_payload_yaml
      }
      else {
        this.other_payload_yaml = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EpisodeStart
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [episode_name]
    bufferOffset = _serializer.string(obj.episode_name, buffer, bufferOffset);
    // Serialize message field [other_payload_yaml]
    bufferOffset = _serializer.string(obj.other_payload_yaml, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EpisodeStart
    let len;
    let data = new EpisodeStart(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [episode_name]
    data.episode_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [other_payload_yaml]
    data.other_payload_yaml = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.episode_name);
    length += _getByteLength(object.other_payload_yaml);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/EpisodeStart';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9c9ddf1cb6334de0336392fe315bfa9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    string episode_name
    string other_payload_yaml
    
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
    const resolved = new EpisodeStart(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.episode_name !== undefined) {
      resolved.episode_name = msg.episode_name;
    }
    else {
      resolved.episode_name = ''
    }

    if (msg.other_payload_yaml !== undefined) {
      resolved.other_payload_yaml = msg.other_payload_yaml;
    }
    else {
      resolved.other_payload_yaml = ''
    }

    return resolved;
    }
};

module.exports = EpisodeStart;
