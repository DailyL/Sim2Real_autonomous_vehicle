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
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class DisplayFragment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.region = null;
      this.page = null;
      this.data = null;
      this.location = null;
      this.z = null;
      this.ttl = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('region')) {
        this.region = initObj.region
      }
      else {
        this.region = 0;
      }
      if (initObj.hasOwnProperty('page')) {
        this.page = initObj.page
      }
      else {
        this.page = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new sensor_msgs.msg.Image();
      }
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = new sensor_msgs.msg.RegionOfInterest();
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0;
      }
      if (initObj.hasOwnProperty('ttl')) {
        this.ttl = initObj.ttl
      }
      else {
        this.ttl = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DisplayFragment
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [region]
    bufferOffset = _serializer.uint8(obj.region, buffer, bufferOffset);
    // Serialize message field [page]
    bufferOffset = _serializer.uint8(obj.page, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.data, buffer, bufferOffset);
    // Serialize message field [location]
    bufferOffset = sensor_msgs.msg.RegionOfInterest.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.uint8(obj.z, buffer, bufferOffset);
    // Serialize message field [ttl]
    bufferOffset = _serializer.int8(obj.ttl, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DisplayFragment
    let len;
    let data = new DisplayFragment(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [region]
    data.region = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [page]
    data.page = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    // Deserialize message field [location]
    data.location = sensor_msgs.msg.RegionOfInterest.deserialize(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [ttl]
    data.ttl = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.id);
    length += sensor_msgs.msg.Image.getMessageSize(object.data);
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DisplayFragment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b47577c93ca4c0ee8514639ef90c78dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    # Enum: region
    uint8 REGION_FULL=0
    uint8 REGION_HEADER=1
    uint8 REGION_BODY=2
    uint8 REGION_FOOTER=3
    
    # Enum: page
    uint8 PAGE_ALL=255
    
    # fragment ID and destination page and region
    string id
    uint8 region
    uint8 page
    
    # fragment content
    sensor_msgs/Image data
    
    # location on the display where to show the fragment
    sensor_msgs/RegionOfInterest location
    
    # Z index in the Z-buffer of the segment
    uint8 z
    
    # Time-to-Live in seconds of the fragment (-1 for infinite, do not abuse)
    int8 ttl
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
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    ================================================================================
    MSG: sensor_msgs/RegionOfInterest
    # This message is used to specify a region of interest within an image.
    #
    # When used to specify the ROI setting of the camera when the image was
    # taken, the height and width fields should either match the height and
    # width fields for the associated image; or height = width = 0
    # indicates that the full resolution image was captured.
    
    uint32 x_offset  # Leftmost pixel of the ROI
                     # (0 if the ROI includes the left edge of the image)
    uint32 y_offset  # Topmost pixel of the ROI
                     # (0 if the ROI includes the top edge of the image)
    uint32 height    # Height of ROI
    uint32 width     # Width of ROI
    
    # True if a distinct rectified ROI should be calculated from the "raw"
    # ROI in this message. Typically this should be False if the full image
    # is captured (ROI not used), and True if a subwindow is captured (ROI
    # used).
    bool do_rectify
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DisplayFragment(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.region !== undefined) {
      resolved.region = msg.region;
    }
    else {
      resolved.region = 0
    }

    if (msg.page !== undefined) {
      resolved.page = msg.page;
    }
    else {
      resolved.page = 0
    }

    if (msg.data !== undefined) {
      resolved.data = sensor_msgs.msg.Image.Resolve(msg.data)
    }
    else {
      resolved.data = new sensor_msgs.msg.Image()
    }

    if (msg.location !== undefined) {
      resolved.location = sensor_msgs.msg.RegionOfInterest.Resolve(msg.location)
    }
    else {
      resolved.location = new sensor_msgs.msg.RegionOfInterest()
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0
    }

    if (msg.ttl !== undefined) {
      resolved.ttl = msg.ttl;
    }
    else {
      resolved.ttl = 0
    }

    return resolved;
    }
};

// Constants for message
DisplayFragment.Constants = {
  REGION_FULL: 0,
  REGION_HEADER: 1,
  REGION_BODY: 2,
  REGION_FOOTER: 3,
  PAGE_ALL: 255,
}

module.exports = DisplayFragment;
