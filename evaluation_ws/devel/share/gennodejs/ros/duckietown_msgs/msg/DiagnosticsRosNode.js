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

class DiagnosticsRosNode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.help = null;
      this.type = null;
      this.health = null;
      this.health_reason = null;
      this.health_stamp = null;
      this.enabled = null;
      this.uri = null;
      this.machine = null;
      this.module_type = null;
      this.module_instance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('help')) {
        this.help = initObj.help
      }
      else {
        this.help = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('health')) {
        this.health = initObj.health
      }
      else {
        this.health = 0;
      }
      if (initObj.hasOwnProperty('health_reason')) {
        this.health_reason = initObj.health_reason
      }
      else {
        this.health_reason = '';
      }
      if (initObj.hasOwnProperty('health_stamp')) {
        this.health_stamp = initObj.health_stamp
      }
      else {
        this.health_stamp = 0.0;
      }
      if (initObj.hasOwnProperty('enabled')) {
        this.enabled = initObj.enabled
      }
      else {
        this.enabled = false;
      }
      if (initObj.hasOwnProperty('uri')) {
        this.uri = initObj.uri
      }
      else {
        this.uri = '';
      }
      if (initObj.hasOwnProperty('machine')) {
        this.machine = initObj.machine
      }
      else {
        this.machine = '';
      }
      if (initObj.hasOwnProperty('module_type')) {
        this.module_type = initObj.module_type
      }
      else {
        this.module_type = '';
      }
      if (initObj.hasOwnProperty('module_instance')) {
        this.module_instance = initObj.module_instance
      }
      else {
        this.module_instance = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DiagnosticsRosNode
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [help]
    bufferOffset = _serializer.string(obj.help, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [health]
    bufferOffset = _serializer.uint8(obj.health, buffer, bufferOffset);
    // Serialize message field [health_reason]
    bufferOffset = _serializer.string(obj.health_reason, buffer, bufferOffset);
    // Serialize message field [health_stamp]
    bufferOffset = _serializer.float32(obj.health_stamp, buffer, bufferOffset);
    // Serialize message field [enabled]
    bufferOffset = _serializer.bool(obj.enabled, buffer, bufferOffset);
    // Serialize message field [uri]
    bufferOffset = _serializer.string(obj.uri, buffer, bufferOffset);
    // Serialize message field [machine]
    bufferOffset = _serializer.string(obj.machine, buffer, bufferOffset);
    // Serialize message field [module_type]
    bufferOffset = _serializer.string(obj.module_type, buffer, bufferOffset);
    // Serialize message field [module_instance]
    bufferOffset = _serializer.string(obj.module_instance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DiagnosticsRosNode
    let len;
    let data = new DiagnosticsRosNode(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [help]
    data.help = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [health]
    data.health = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [health_reason]
    data.health_reason = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [health_stamp]
    data.health_stamp = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [enabled]
    data.enabled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [uri]
    data.uri = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [machine]
    data.machine = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [module_type]
    data.module_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [module_instance]
    data.module_instance = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.name);
    length += _getByteLength(object.help);
    length += _getByteLength(object.health_reason);
    length += _getByteLength(object.uri);
    length += _getByteLength(object.machine);
    length += _getByteLength(object.module_type);
    length += _getByteLength(object.module_instance);
    return length + 35;
  }

  static datatype() {
    // Returns string type for a message object
    return 'duckietown_msgs/DiagnosticsRosNode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd51c0fa0a1d1899eebe4bf3476ab3439';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Node type (this has to match duckietown.NodeType)
    uint8 NODE_TYPE_GENERIC = 0
    uint8 NODE_TYPE_DRIVER = 1
    uint8 NODE_TYPE_PERCEPTION = 2
    uint8 NODE_TYPE_CONTROL = 3
    uint8 NODE_TYPE_PLANNING = 4
    uint8 NODE_TYPE_LOCALIZATION = 5
    uint8 NODE_TYPE_MAPPING = 6
    uint8 NODE_TYPE_SWARM = 7
    uint8 NODE_TYPE_BEHAVIOR = 8
    uint8 NODE_TYPE_VISUALIZATION = 9
    uint8 NODE_TYPE_INFRASTRUCTURE = 10
    uint8 NODE_TYPE_COMMUNICATION = 11
    uint8 NODE_TYPE_DIAGNOSTICS = 12
    uint8 NODE_TYPE_DEBUG = 20
    
    # Node health (this has to match duckietown.NodeHealth)
    uint8 NODE_HEALTH_UNKNOWN = 0
    uint8 NODE_HEALTH_STARTING = 5
    uint8 NODE_HEALTH_STARTED = 6
    uint8 NODE_HEALTH_HEALTHY = 10
    uint8 NODE_HEALTH_WARNING = 20
    uint8 NODE_HEALTH_ERROR = 30
    uint8 NODE_HEALTH_FATAL = 40
    
    Header header
    string name             # Node publishing this message
    string help             # Node description
    uint8 type              # Node type (see NODE_TYPE_X above)
    uint8 health            # Node health (see NODE_HEALTH_X above)
    string health_reason    # String describing the reason for this health status (if any)
    float32 health_stamp    # Time when the health status changed into the current
    bool enabled            # Status of the switch
    string uri              # RPC URI of the node
    string machine          # Machine hostname or IP where this node is running
    string module_type      # Module containing this node
    string module_instance  # ID of the instance of the module running this node
    
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
    const resolved = new DiagnosticsRosNode(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.help !== undefined) {
      resolved.help = msg.help;
    }
    else {
      resolved.help = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.health !== undefined) {
      resolved.health = msg.health;
    }
    else {
      resolved.health = 0
    }

    if (msg.health_reason !== undefined) {
      resolved.health_reason = msg.health_reason;
    }
    else {
      resolved.health_reason = ''
    }

    if (msg.health_stamp !== undefined) {
      resolved.health_stamp = msg.health_stamp;
    }
    else {
      resolved.health_stamp = 0.0
    }

    if (msg.enabled !== undefined) {
      resolved.enabled = msg.enabled;
    }
    else {
      resolved.enabled = false
    }

    if (msg.uri !== undefined) {
      resolved.uri = msg.uri;
    }
    else {
      resolved.uri = ''
    }

    if (msg.machine !== undefined) {
      resolved.machine = msg.machine;
    }
    else {
      resolved.machine = ''
    }

    if (msg.module_type !== undefined) {
      resolved.module_type = msg.module_type;
    }
    else {
      resolved.module_type = ''
    }

    if (msg.module_instance !== undefined) {
      resolved.module_instance = msg.module_instance;
    }
    else {
      resolved.module_instance = ''
    }

    return resolved;
    }
};

// Constants for message
DiagnosticsRosNode.Constants = {
  NODE_TYPE_GENERIC: 0,
  NODE_TYPE_DRIVER: 1,
  NODE_TYPE_PERCEPTION: 2,
  NODE_TYPE_CONTROL: 3,
  NODE_TYPE_PLANNING: 4,
  NODE_TYPE_LOCALIZATION: 5,
  NODE_TYPE_MAPPING: 6,
  NODE_TYPE_SWARM: 7,
  NODE_TYPE_BEHAVIOR: 8,
  NODE_TYPE_VISUALIZATION: 9,
  NODE_TYPE_INFRASTRUCTURE: 10,
  NODE_TYPE_COMMUNICATION: 11,
  NODE_TYPE_DIAGNOSTICS: 12,
  NODE_TYPE_DEBUG: 20,
  NODE_HEALTH_UNKNOWN: 0,
  NODE_HEALTH_STARTING: 5,
  NODE_HEALTH_STARTED: 6,
  NODE_HEALTH_HEALTHY: 10,
  NODE_HEALTH_WARNING: 20,
  NODE_HEALTH_ERROR: 30,
  NODE_HEALTH_FATAL: 40,
}

module.exports = DiagnosticsRosNode;
