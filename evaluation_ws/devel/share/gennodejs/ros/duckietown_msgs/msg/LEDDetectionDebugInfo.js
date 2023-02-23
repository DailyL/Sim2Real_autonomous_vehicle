// Auto-generated. Do not edit!

// (in-package duckietown_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector2D = require('./Vector2D.js');
let LEDDetectionArray = require('./LEDDetectionArray.js');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class LEDDetectionDebugInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
      this.capture_progress = null;
      this.cell_size = null;
      this.crop_rect_norm = null;
      this.variance_map = null;
      this.candidates = null;
      this.led_all_unfiltered = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
      if (initObj.hasOwnProperty('capture_progress')) {
        this.capture_progress = initObj.capture_progress
      }
      else {
        this.capture_progress = 0.0;
      }
      if (initObj.hasOwnProperty('cell_size')) {
        this.cell_size = initObj.cell_size
      }
      else {
        this.cell_size = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('crop_rect_norm')) {
        this.crop_rect_norm = initObj.crop_rect_norm
      }
      else {
        this.crop_rect_norm = new Array(4).fill(0);
      }
      if (initObj.hasOwnProperty('variance_map')) {
        this.variance_map = initObj.variance_map
      }
      else {
        this.variance_map = new sensor_msgs.msg.CompressedImage();
      }
      if (initObj.hasOwnProperty('candidates')) {
        this.candidates = initObj.candidates
      }
      else {
        this.candidates = [];
      }
      if (initObj.hasOwnProperty('led_all_unfiltered')) {
        this.led_all_unfiltered = initObj.led_all_unfiltered
      }
      else {
        this.led_all_unfiltered = new LEDDetectionArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LEDDetectionDebugInfo
    // Serialize message field [state]
    bufferOffset = _serializer.uint8(obj.state, buffer, bufferOffset);
    // Serialize message field [capture_progress]
    bufferOffset = _serializer.float32(obj.capture_progress, buffer, bufferOffset);
    // Check that the constant length array field [cell_size] has the right length
    if (obj.cell_size.length !== 2) {
      throw new Error('Unable to serialize array field cell_size - length must be 2')
    }
    // Serialize message field [cell_size]
    bufferOffset = _arraySerializer.uint32(obj.cell_size, buffer, bufferOffset, 2);
    // Check that the constant length array field [crop_rect_norm] has the right length
    if (obj.crop_rect_norm.length !== 4) {
      throw new Error('Unable to serialize array field crop_rect_norm - length must be 4')
    }
    // Serialize message field [crop_rect_norm]
    bufferOffset = _arraySerializer.float32(obj.crop_rect_norm, buffer, bufferOffset, 4);
    // Serialize message field [variance_map]
    bufferOffset = sensor_msgs.msg.CompressedImage.serialize(obj.variance_map, buffer, bufferOffset);
    // Serialize message field [candidates]
    // Serialize the length for message field [candidates]
    bufferOffset = _serializer.uint32(obj.candidates.length, buffer, bufferOffset);
    obj.candidates.forEach((val) => {
      bufferOffset = Vector2D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [led_all_unfiltered]
    bufferOffset = LEDDetectionArray.serialize(obj.led_all_unfiltered, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LEDDetectionDebugInfo
    let len;
    let data = new LEDDetectionDebugInfo(null);
    // Deserialize message field [state]
    data.state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [capture_progress]
    data.capture_progress = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cell_size]
    data.cell_size = _arrayDeserializer.uint32(buffer, bufferOffset, 2)
    // Deserialize message field [crop_rect_norm]
    data.crop_rect_norm = _arrayDeserializer.float32(buffer, bufferOffset, 4)
    // Deserialize message field [variance_map]
    data.variance_map = sensor_msgs.msg.CompressedImage.deserialize(buffer, bufferOffset);
    // Deserialize message field [candidates]
    // Deserialize array length for message field [candidates]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.candidates = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.candidates[i] = Vector2D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [led_all_unfiltered]
    data.led_all_unfiltered = LEDDetectionArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.CompressedImage.getMessageSize(object.variance_map);
    length += 8 * object.candidates.length;
    length += LEDDetectionArray.getMessageSize(object.led_all_unfiltered);
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/LEDDetectionDebugInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'be212adc91f6527a99fc828df2018200';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 state # 0: idle, 1: capturing, 2: processing
    float32 capture_progress
    
    uint32[2] cell_size
    float32[4] crop_rect_norm
    
    sensor_msgs/CompressedImage variance_map
    Vector2D[] candidates
    
    LEDDetectionArray led_all_unfiltered
    
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
    MSG: duckietown_msgs/Vector2D
    float32 x
    float32 y
    
    ================================================================================
    MSG: duckietown_msgs/LEDDetectionArray
    LEDDetection[] detections
    ================================================================================
    MSG: duckietown_msgs/LEDDetection
    time timestamp1		# initial timestamp of the camera stream used 
    time timestamp2		# final timestamp of the camera stream used 
    Vector2D pixels_normalized
    float32 frequency 
    string color        # will be r, g or b 
    float32 confidence  # some value of confidence for the detection (TBD)
    
    # for debug/visualization
    float64[] signal_ts
    float32[] signal
    float32[] fft_fs
    float32[] fft
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LEDDetectionDebugInfo(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    if (msg.capture_progress !== undefined) {
      resolved.capture_progress = msg.capture_progress;
    }
    else {
      resolved.capture_progress = 0.0
    }

    if (msg.cell_size !== undefined) {
      resolved.cell_size = msg.cell_size;
    }
    else {
      resolved.cell_size = new Array(2).fill(0)
    }

    if (msg.crop_rect_norm !== undefined) {
      resolved.crop_rect_norm = msg.crop_rect_norm;
    }
    else {
      resolved.crop_rect_norm = new Array(4).fill(0)
    }

    if (msg.variance_map !== undefined) {
      resolved.variance_map = sensor_msgs.msg.CompressedImage.Resolve(msg.variance_map)
    }
    else {
      resolved.variance_map = new sensor_msgs.msg.CompressedImage()
    }

    if (msg.candidates !== undefined) {
      resolved.candidates = new Array(msg.candidates.length);
      for (let i = 0; i < resolved.candidates.length; ++i) {
        resolved.candidates[i] = Vector2D.Resolve(msg.candidates[i]);
      }
    }
    else {
      resolved.candidates = []
    }

    if (msg.led_all_unfiltered !== undefined) {
      resolved.led_all_unfiltered = LEDDetectionArray.Resolve(msg.led_all_unfiltered)
    }
    else {
      resolved.led_all_unfiltered = new LEDDetectionArray()
    }

    return resolved;
    }
};

module.exports = LEDDetectionDebugInfo;
