// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Trajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pos = null;
      this.vel = null;
      this.acc = null;
      this.jerk = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = [];
      }
      if (initObj.hasOwnProperty('vel')) {
        this.vel = initObj.vel
      }
      else {
        this.vel = [];
      }
      if (initObj.hasOwnProperty('acc')) {
        this.acc = initObj.acc
      }
      else {
        this.acc = [];
      }
      if (initObj.hasOwnProperty('jerk')) {
        this.jerk = initObj.jerk
      }
      else {
        this.jerk = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Trajectory
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pos]
    // Serialize the length for message field [pos]
    bufferOffset = _serializer.uint32(obj.pos.length, buffer, bufferOffset);
    obj.pos.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3Stamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [vel]
    // Serialize the length for message field [vel]
    bufferOffset = _serializer.uint32(obj.vel.length, buffer, bufferOffset);
    obj.vel.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3Stamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [acc]
    // Serialize the length for message field [acc]
    bufferOffset = _serializer.uint32(obj.acc.length, buffer, bufferOffset);
    obj.acc.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3Stamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [jerk]
    // Serialize the length for message field [jerk]
    bufferOffset = _serializer.uint32(obj.jerk.length, buffer, bufferOffset);
    obj.jerk.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3Stamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Trajectory
    let len;
    let data = new Trajectory(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pos]
    // Deserialize array length for message field [pos]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pos = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pos[i] = geometry_msgs.msg.Vector3Stamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [vel]
    // Deserialize array length for message field [vel]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.vel = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.vel[i] = geometry_msgs.msg.Vector3Stamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [acc]
    // Deserialize array length for message field [acc]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.acc = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.acc[i] = geometry_msgs.msg.Vector3Stamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [jerk]
    // Deserialize array length for message field [jerk]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.jerk = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.jerk[i] = geometry_msgs.msg.Vector3Stamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.pos.forEach((val) => {
      length += geometry_msgs.msg.Vector3Stamped.getMessageSize(val);
    });
    object.vel.forEach((val) => {
      length += geometry_msgs.msg.Vector3Stamped.getMessageSize(val);
    });
    object.acc.forEach((val) => {
      length += geometry_msgs.msg.Vector3Stamped.getMessageSize(val);
    });
    object.jerk.forEach((val) => {
      length += geometry_msgs.msg.Vector3Stamped.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/Trajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a5c4bf7a2bfb37b947e3dfa585ede51';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Vector3Stamped[] pos
    geometry_msgs/Vector3Stamped[] vel
    geometry_msgs/Vector3Stamped[] acc
    geometry_msgs/Vector3Stamped[] jerk
    
    
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
    MSG: geometry_msgs/Vector3Stamped
    # This represents a Vector3 with reference coordinate frame and timestamp
    Header header
    Vector3 vector
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Trajectory(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pos !== undefined) {
      resolved.pos = new Array(msg.pos.length);
      for (let i = 0; i < resolved.pos.length; ++i) {
        resolved.pos[i] = geometry_msgs.msg.Vector3Stamped.Resolve(msg.pos[i]);
      }
    }
    else {
      resolved.pos = []
    }

    if (msg.vel !== undefined) {
      resolved.vel = new Array(msg.vel.length);
      for (let i = 0; i < resolved.vel.length; ++i) {
        resolved.vel[i] = geometry_msgs.msg.Vector3Stamped.Resolve(msg.vel[i]);
      }
    }
    else {
      resolved.vel = []
    }

    if (msg.acc !== undefined) {
      resolved.acc = new Array(msg.acc.length);
      for (let i = 0; i < resolved.acc.length; ++i) {
        resolved.acc[i] = geometry_msgs.msg.Vector3Stamped.Resolve(msg.acc[i]);
      }
    }
    else {
      resolved.acc = []
    }

    if (msg.jerk !== undefined) {
      resolved.jerk = new Array(msg.jerk.length);
      for (let i = 0; i < resolved.jerk.length; ++i) {
        resolved.jerk[i] = geometry_msgs.msg.Vector3Stamped.Resolve(msg.jerk[i]);
      }
    }
    else {
      resolved.jerk = []
    }

    return resolved;
    }
};

module.exports = Trajectory;
