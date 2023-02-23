// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class IntersectionPoseImgDebug {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.theta = null;
      this.type = null;
      this.likelihood = null;
      this.x_init = null;
      this.y_init = null;
      this.theta_init = null;
      this.img = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('theta')) {
        this.theta = initObj.theta
      }
      else {
        this.theta = 0.0;
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('likelihood')) {
        this.likelihood = initObj.likelihood
      }
      else {
        this.likelihood = 0.0;
      }
      if (initObj.hasOwnProperty('x_init')) {
        this.x_init = initObj.x_init
      }
      else {
        this.x_init = 0.0;
      }
      if (initObj.hasOwnProperty('y_init')) {
        this.y_init = initObj.y_init
      }
      else {
        this.y_init = 0.0;
      }
      if (initObj.hasOwnProperty('theta_init')) {
        this.theta_init = initObj.theta_init
      }
      else {
        this.theta_init = 0.0;
      }
      if (initObj.hasOwnProperty('img')) {
        this.img = initObj.img
      }
      else {
        this.img = new sensor_msgs.msg.CompressedImage();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IntersectionPoseImgDebug
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [theta]
    bufferOffset = _serializer.float32(obj.theta, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [likelihood]
    bufferOffset = _serializer.float32(obj.likelihood, buffer, bufferOffset);
    // Serialize message field [x_init]
    bufferOffset = _serializer.float32(obj.x_init, buffer, bufferOffset);
    // Serialize message field [y_init]
    bufferOffset = _serializer.float32(obj.y_init, buffer, bufferOffset);
    // Serialize message field [theta_init]
    bufferOffset = _serializer.float32(obj.theta_init, buffer, bufferOffset);
    // Serialize message field [img]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.img, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IntersectionPoseImgDebug
    let len;
    let data = new IntersectionPoseImgDebug(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta]
    data.theta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [likelihood]
    data.likelihood = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x_init]
    data.x_init = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_init]
    data.y_init = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [theta_init]
    data.theta_init = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [img]
    data.img = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.img);
    return length + 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/IntersectionPoseImgDebug';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0027b9b3f880873af8e49663f8172f1a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 x
    float32 y
    float32 theta
    uint8 type
    float32 likelihood
    float32 x_init
    float32 y_init
    float32 theta_init
    sensor_msgs/CompressedImage img
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
    MSG: sensor_msgs/CompressedImage
    # This message contains a compressed image
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
    
    string format        # Specifies the format of the data
                         #   Acceptable values:
                         #     jpeg, png
    uint8[] data         # Compressed image buffer
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IntersectionPoseImgDebug(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.theta !== undefined) {
      resolved.theta = msg.theta;
    }
    else {
      resolved.theta = 0.0
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.likelihood !== undefined) {
      resolved.likelihood = msg.likelihood;
    }
    else {
      resolved.likelihood = 0.0
    }

    if (msg.x_init !== undefined) {
      resolved.x_init = msg.x_init;
    }
    else {
      resolved.x_init = 0.0
    }

    if (msg.y_init !== undefined) {
      resolved.y_init = msg.y_init;
    }
    else {
      resolved.y_init = 0.0
    }

    if (msg.theta_init !== undefined) {
      resolved.theta_init = msg.theta_init;
    }
    else {
      resolved.theta_init = 0.0
    }

    if (msg.img !== undefined) {
      resolved.img = sensor_msgs.msg.CompressedImage.Resolve(msg.img)
    }
    else {
      resolved.img = new sensor_msgs.msg.CompressedImage()
    }

    return resolved;
    }
};

module.exports = IntersectionPoseImgDebug;
