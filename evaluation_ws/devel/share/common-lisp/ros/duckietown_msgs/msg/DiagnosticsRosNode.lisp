; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsRosNode.msg.html

(cl:defclass <DiagnosticsRosNode> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (help
    :reader help
    :initarg :help
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (health
    :reader health
    :initarg :health
    :type cl:fixnum
    :initform 0)
   (health_reason
    :reader health_reason
    :initarg :health_reason
    :type cl:string
    :initform "")
   (health_stamp
    :reader health_stamp
    :initarg :health_stamp
    :type cl:float
    :initform 0.0)
   (enabled
    :reader enabled
    :initarg :enabled
    :type cl:boolean
    :initform cl:nil)
   (uri
    :reader uri
    :initarg :uri
    :type cl:string
    :initform "")
   (machine
    :reader machine
    :initarg :machine
    :type cl:string
    :initform "")
   (module_type
    :reader module_type
    :initarg :module_type
    :type cl:string
    :initform "")
   (module_instance
    :reader module_instance
    :initarg :module_instance
    :type cl:string
    :initform ""))
)

(cl:defclass DiagnosticsRosNode (<DiagnosticsRosNode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsRosNode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsRosNode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsRosNode> is deprecated: use duckietown_msgs-msg:DiagnosticsRosNode instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:name-val is deprecated.  Use duckietown_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'help-val :lambda-list '(m))
(cl:defmethod help-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:help-val is deprecated.  Use duckietown_msgs-msg:help instead.")
  (help m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'health-val :lambda-list '(m))
(cl:defmethod health-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:health-val is deprecated.  Use duckietown_msgs-msg:health instead.")
  (health m))

(cl:ensure-generic-function 'health_reason-val :lambda-list '(m))
(cl:defmethod health_reason-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:health_reason-val is deprecated.  Use duckietown_msgs-msg:health_reason instead.")
  (health_reason m))

(cl:ensure-generic-function 'health_stamp-val :lambda-list '(m))
(cl:defmethod health_stamp-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:health_stamp-val is deprecated.  Use duckietown_msgs-msg:health_stamp instead.")
  (health_stamp m))

(cl:ensure-generic-function 'enabled-val :lambda-list '(m))
(cl:defmethod enabled-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:enabled-val is deprecated.  Use duckietown_msgs-msg:enabled instead.")
  (enabled m))

(cl:ensure-generic-function 'uri-val :lambda-list '(m))
(cl:defmethod uri-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:uri-val is deprecated.  Use duckietown_msgs-msg:uri instead.")
  (uri m))

(cl:ensure-generic-function 'machine-val :lambda-list '(m))
(cl:defmethod machine-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:machine-val is deprecated.  Use duckietown_msgs-msg:machine instead.")
  (machine m))

(cl:ensure-generic-function 'module_type-val :lambda-list '(m))
(cl:defmethod module_type-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:module_type-val is deprecated.  Use duckietown_msgs-msg:module_type instead.")
  (module_type m))

(cl:ensure-generic-function 'module_instance-val :lambda-list '(m))
(cl:defmethod module_instance-val ((m <DiagnosticsRosNode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:module_instance-val is deprecated.  Use duckietown_msgs-msg:module_instance instead.")
  (module_instance m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DiagnosticsRosNode>)))
    "Constants for message type '<DiagnosticsRosNode>"
  '((:NODE_TYPE_GENERIC . 0)
    (:NODE_TYPE_DRIVER . 1)
    (:NODE_TYPE_PERCEPTION . 2)
    (:NODE_TYPE_CONTROL . 3)
    (:NODE_TYPE_PLANNING . 4)
    (:NODE_TYPE_LOCALIZATION . 5)
    (:NODE_TYPE_MAPPING . 6)
    (:NODE_TYPE_SWARM . 7)
    (:NODE_TYPE_BEHAVIOR . 8)
    (:NODE_TYPE_VISUALIZATION . 9)
    (:NODE_TYPE_INFRASTRUCTURE . 10)
    (:NODE_TYPE_COMMUNICATION . 11)
    (:NODE_TYPE_DIAGNOSTICS . 12)
    (:NODE_TYPE_DEBUG . 20)
    (:NODE_HEALTH_UNKNOWN . 0)
    (:NODE_HEALTH_STARTING . 5)
    (:NODE_HEALTH_STARTED . 6)
    (:NODE_HEALTH_HEALTHY . 10)
    (:NODE_HEALTH_WARNING . 20)
    (:NODE_HEALTH_ERROR . 30)
    (:NODE_HEALTH_FATAL . 40))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DiagnosticsRosNode)))
    "Constants for message type 'DiagnosticsRosNode"
  '((:NODE_TYPE_GENERIC . 0)
    (:NODE_TYPE_DRIVER . 1)
    (:NODE_TYPE_PERCEPTION . 2)
    (:NODE_TYPE_CONTROL . 3)
    (:NODE_TYPE_PLANNING . 4)
    (:NODE_TYPE_LOCALIZATION . 5)
    (:NODE_TYPE_MAPPING . 6)
    (:NODE_TYPE_SWARM . 7)
    (:NODE_TYPE_BEHAVIOR . 8)
    (:NODE_TYPE_VISUALIZATION . 9)
    (:NODE_TYPE_INFRASTRUCTURE . 10)
    (:NODE_TYPE_COMMUNICATION . 11)
    (:NODE_TYPE_DIAGNOSTICS . 12)
    (:NODE_TYPE_DEBUG . 20)
    (:NODE_HEALTH_UNKNOWN . 0)
    (:NODE_HEALTH_STARTING . 5)
    (:NODE_HEALTH_STARTED . 6)
    (:NODE_HEALTH_HEALTHY . 10)
    (:NODE_HEALTH_WARNING . 20)
    (:NODE_HEALTH_ERROR . 30)
    (:NODE_HEALTH_FATAL . 40))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsRosNode>) ostream)
  "Serializes a message object of type '<DiagnosticsRosNode>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'help))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'help))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'health)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'health_reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'health_reason))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'health_stamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enabled) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'uri))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'uri))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'machine))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'machine))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'module_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'module_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'module_instance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'module_instance))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsRosNode>) istream)
  "Deserializes a message object of type '<DiagnosticsRosNode>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'help) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'help) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'health)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'health_reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'health_reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'health_stamp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'enabled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'uri) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'uri) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'machine) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'machine) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'module_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'module_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'module_instance) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'module_instance) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsRosNode>)))
  "Returns string type for a message object of type '<DiagnosticsRosNode>"
  "duckietown_msgs/DiagnosticsRosNode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsRosNode)))
  "Returns string type for a message object of type 'DiagnosticsRosNode"
  "duckietown_msgs/DiagnosticsRosNode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsRosNode>)))
  "Returns md5sum for a message object of type '<DiagnosticsRosNode>"
  "d51c0fa0a1d1899eebe4bf3476ab3439")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsRosNode)))
  "Returns md5sum for a message object of type 'DiagnosticsRosNode"
  "d51c0fa0a1d1899eebe4bf3476ab3439")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsRosNode>)))
  "Returns full string definition for message of type '<DiagnosticsRosNode>"
  (cl:format cl:nil "# Node type (this has to match duckietown.NodeType)~%uint8 NODE_TYPE_GENERIC = 0~%uint8 NODE_TYPE_DRIVER = 1~%uint8 NODE_TYPE_PERCEPTION = 2~%uint8 NODE_TYPE_CONTROL = 3~%uint8 NODE_TYPE_PLANNING = 4~%uint8 NODE_TYPE_LOCALIZATION = 5~%uint8 NODE_TYPE_MAPPING = 6~%uint8 NODE_TYPE_SWARM = 7~%uint8 NODE_TYPE_BEHAVIOR = 8~%uint8 NODE_TYPE_VISUALIZATION = 9~%uint8 NODE_TYPE_INFRASTRUCTURE = 10~%uint8 NODE_TYPE_COMMUNICATION = 11~%uint8 NODE_TYPE_DIAGNOSTICS = 12~%uint8 NODE_TYPE_DEBUG = 20~%~%# Node health (this has to match duckietown.NodeHealth)~%uint8 NODE_HEALTH_UNKNOWN = 0~%uint8 NODE_HEALTH_STARTING = 5~%uint8 NODE_HEALTH_STARTED = 6~%uint8 NODE_HEALTH_HEALTHY = 10~%uint8 NODE_HEALTH_WARNING = 20~%uint8 NODE_HEALTH_ERROR = 30~%uint8 NODE_HEALTH_FATAL = 40~%~%Header header~%string name             # Node publishing this message~%string help             # Node description~%uint8 type              # Node type (see NODE_TYPE_X above)~%uint8 health            # Node health (see NODE_HEALTH_X above)~%string health_reason    # String describing the reason for this health status (if any)~%float32 health_stamp    # Time when the health status changed into the current~%bool enabled            # Status of the switch~%string uri              # RPC URI of the node~%string machine          # Machine hostname or IP where this node is running~%string module_type      # Module containing this node~%string module_instance  # ID of the instance of the module running this node~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsRosNode)))
  "Returns full string definition for message of type 'DiagnosticsRosNode"
  (cl:format cl:nil "# Node type (this has to match duckietown.NodeType)~%uint8 NODE_TYPE_GENERIC = 0~%uint8 NODE_TYPE_DRIVER = 1~%uint8 NODE_TYPE_PERCEPTION = 2~%uint8 NODE_TYPE_CONTROL = 3~%uint8 NODE_TYPE_PLANNING = 4~%uint8 NODE_TYPE_LOCALIZATION = 5~%uint8 NODE_TYPE_MAPPING = 6~%uint8 NODE_TYPE_SWARM = 7~%uint8 NODE_TYPE_BEHAVIOR = 8~%uint8 NODE_TYPE_VISUALIZATION = 9~%uint8 NODE_TYPE_INFRASTRUCTURE = 10~%uint8 NODE_TYPE_COMMUNICATION = 11~%uint8 NODE_TYPE_DIAGNOSTICS = 12~%uint8 NODE_TYPE_DEBUG = 20~%~%# Node health (this has to match duckietown.NodeHealth)~%uint8 NODE_HEALTH_UNKNOWN = 0~%uint8 NODE_HEALTH_STARTING = 5~%uint8 NODE_HEALTH_STARTED = 6~%uint8 NODE_HEALTH_HEALTHY = 10~%uint8 NODE_HEALTH_WARNING = 20~%uint8 NODE_HEALTH_ERROR = 30~%uint8 NODE_HEALTH_FATAL = 40~%~%Header header~%string name             # Node publishing this message~%string help             # Node description~%uint8 type              # Node type (see NODE_TYPE_X above)~%uint8 health            # Node health (see NODE_HEALTH_X above)~%string health_reason    # String describing the reason for this health status (if any)~%float32 health_stamp    # Time when the health status changed into the current~%bool enabled            # Status of the switch~%string uri              # RPC URI of the node~%string machine          # Machine hostname or IP where this node is running~%string module_type      # Module containing this node~%string module_instance  # ID of the instance of the module running this node~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsRosNode>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'help))
     1
     1
     4 (cl:length (cl:slot-value msg 'health_reason))
     4
     1
     4 (cl:length (cl:slot-value msg 'uri))
     4 (cl:length (cl:slot-value msg 'machine))
     4 (cl:length (cl:slot-value msg 'module_type))
     4 (cl:length (cl:slot-value msg 'module_instance))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsRosNode>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsRosNode
    (cl:cons ':header (header msg))
    (cl:cons ':name (name msg))
    (cl:cons ':help (help msg))
    (cl:cons ':type (type msg))
    (cl:cons ':health (health msg))
    (cl:cons ':health_reason (health_reason msg))
    (cl:cons ':health_stamp (health_stamp msg))
    (cl:cons ':enabled (enabled msg))
    (cl:cons ':uri (uri msg))
    (cl:cons ':machine (machine msg))
    (cl:cons ':module_type (module_type msg))
    (cl:cons ':module_instance (module_instance msg))
))
