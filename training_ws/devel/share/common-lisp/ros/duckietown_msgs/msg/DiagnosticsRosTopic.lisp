; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsRosTopic.msg.html

(cl:defclass <DiagnosticsRosTopic> (roslisp-msg-protocol:ros-message)
  ((node
    :reader node
    :initarg :node
    :type cl:string
    :initform "")
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
   (direction
    :reader direction
    :initarg :direction
    :type cl:fixnum
    :initform 0)
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (effective_frequency
    :reader effective_frequency
    :initarg :effective_frequency
    :type cl:float
    :initform 0.0)
   (healthy_frequency
    :reader healthy_frequency
    :initarg :healthy_frequency
    :type cl:float
    :initform 0.0)
   (bandwidth
    :reader bandwidth
    :initarg :bandwidth
    :type cl:float
    :initform 0.0)
   (enabled
    :reader enabled
    :initarg :enabled
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DiagnosticsRosTopic (<DiagnosticsRosTopic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsRosTopic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsRosTopic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsRosTopic> is deprecated: use duckietown_msgs-msg:DiagnosticsRosTopic instead.")))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:node-val is deprecated.  Use duckietown_msgs-msg:node instead.")
  (node m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:name-val is deprecated.  Use duckietown_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'help-val :lambda-list '(m))
(cl:defmethod help-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:help-val is deprecated.  Use duckietown_msgs-msg:help instead.")
  (help m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:direction-val is deprecated.  Use duckietown_msgs-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:frequency-val is deprecated.  Use duckietown_msgs-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'effective_frequency-val :lambda-list '(m))
(cl:defmethod effective_frequency-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:effective_frequency-val is deprecated.  Use duckietown_msgs-msg:effective_frequency instead.")
  (effective_frequency m))

(cl:ensure-generic-function 'healthy_frequency-val :lambda-list '(m))
(cl:defmethod healthy_frequency-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:healthy_frequency-val is deprecated.  Use duckietown_msgs-msg:healthy_frequency instead.")
  (healthy_frequency m))

(cl:ensure-generic-function 'bandwidth-val :lambda-list '(m))
(cl:defmethod bandwidth-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:bandwidth-val is deprecated.  Use duckietown_msgs-msg:bandwidth instead.")
  (bandwidth m))

(cl:ensure-generic-function 'enabled-val :lambda-list '(m))
(cl:defmethod enabled-val ((m <DiagnosticsRosTopic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:enabled-val is deprecated.  Use duckietown_msgs-msg:enabled instead.")
  (enabled m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DiagnosticsRosTopic>)))
    "Constants for message type '<DiagnosticsRosTopic>"
  '((:TOPIC_DIRECTION_INBOUND . 0)
    (:TOPIC_DIRECTION_OUTBOUND . 1)
    (:TOPIC_TYPE_GENERIC . 0)
    (:TOPIC_TYPE_DRIVER . 1)
    (:TOPIC_TYPE_PERCEPTION . 2)
    (:TOPIC_TYPE_CONTROL . 3)
    (:TOPIC_TYPE_PLANNING . 4)
    (:TOPIC_TYPE_LOCALIZATION . 5)
    (:TOPIC_TYPE_MAPPING . 6)
    (:TOPIC_TYPE_SWARM . 7)
    (:TOPIC_TYPE_BEHAVIOR . 8)
    (:TOPIC_TYPE_VISUALIZATION . 9)
    (:TOPIC_TYPE_INFRASTRUCTURE . 10)
    (:TOPIC_TYPE_COMMUNICATION . 11)
    (:TOPIC_TYPE_DIAGNOSTICS . 12)
    (:TOPIC_TYPE_DEBUG . 20))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DiagnosticsRosTopic)))
    "Constants for message type 'DiagnosticsRosTopic"
  '((:TOPIC_DIRECTION_INBOUND . 0)
    (:TOPIC_DIRECTION_OUTBOUND . 1)
    (:TOPIC_TYPE_GENERIC . 0)
    (:TOPIC_TYPE_DRIVER . 1)
    (:TOPIC_TYPE_PERCEPTION . 2)
    (:TOPIC_TYPE_CONTROL . 3)
    (:TOPIC_TYPE_PLANNING . 4)
    (:TOPIC_TYPE_LOCALIZATION . 5)
    (:TOPIC_TYPE_MAPPING . 6)
    (:TOPIC_TYPE_SWARM . 7)
    (:TOPIC_TYPE_BEHAVIOR . 8)
    (:TOPIC_TYPE_VISUALIZATION . 9)
    (:TOPIC_TYPE_INFRASTRUCTURE . 10)
    (:TOPIC_TYPE_COMMUNICATION . 11)
    (:TOPIC_TYPE_DIAGNOSTICS . 12)
    (:TOPIC_TYPE_DEBUG . 20))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsRosTopic>) ostream)
  "Serializes a message object of type '<DiagnosticsRosTopic>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node))
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'direction)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'effective_frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'healthy_frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bandwidth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enabled) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsRosTopic>) istream)
  "Deserializes a message object of type '<DiagnosticsRosTopic>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'direction)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'effective_frequency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'healthy_frequency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bandwidth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'enabled) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsRosTopic>)))
  "Returns string type for a message object of type '<DiagnosticsRosTopic>"
  "duckietown_msgs/DiagnosticsRosTopic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsRosTopic)))
  "Returns string type for a message object of type 'DiagnosticsRosTopic"
  "duckietown_msgs/DiagnosticsRosTopic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsRosTopic>)))
  "Returns md5sum for a message object of type '<DiagnosticsRosTopic>"
  "c3a6c5501489fa1a1f348c31cffc641a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsRosTopic)))
  "Returns md5sum for a message object of type 'DiagnosticsRosTopic"
  "c3a6c5501489fa1a1f348c31cffc641a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsRosTopic>)))
  "Returns full string definition for message of type '<DiagnosticsRosTopic>"
  (cl:format cl:nil "# Topic direction (this has to match duckietown.TopicDirection)~%uint8 TOPIC_DIRECTION_INBOUND = 0~%uint8 TOPIC_DIRECTION_OUTBOUND = 1~%~%# Topic type (this has to match duckietown.TopicType)~%uint8 TOPIC_TYPE_GENERIC = 0~%uint8 TOPIC_TYPE_DRIVER = 1~%uint8 TOPIC_TYPE_PERCEPTION = 2~%uint8 TOPIC_TYPE_CONTROL = 3~%uint8 TOPIC_TYPE_PLANNING = 4~%uint8 TOPIC_TYPE_LOCALIZATION = 5~%uint8 TOPIC_TYPE_MAPPING = 6~%uint8 TOPIC_TYPE_SWARM = 7~%uint8 TOPIC_TYPE_BEHAVIOR = 8~%uint8 TOPIC_TYPE_VISUALIZATION = 9~%uint8 TOPIC_TYPE_INFRASTRUCTURE = 10~%uint8 TOPIC_TYPE_COMMUNICATION = 11~%uint8 TOPIC_TYPE_DIAGNOSTICS = 12~%uint8 TOPIC_TYPE_DEBUG = 20~%~%string node                     # Node publishing this message~%string name                     # Topic object of the diagnostics~%string help                     # Topic description~%uint8 type                      # Topic type~%uint8 direction                 # Topic direction~%float32 frequency               # Topic frequency (Hz)~%float32 effective_frequency     # Topic (effective) frequency (Hz)~%float32 healthy_frequency       # Frequency at which this topic can be considered healthy~%float32 bandwidth               # Topic bandwidth (byte/s)~%bool enabled                    # Topic switch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsRosTopic)))
  "Returns full string definition for message of type 'DiagnosticsRosTopic"
  (cl:format cl:nil "# Topic direction (this has to match duckietown.TopicDirection)~%uint8 TOPIC_DIRECTION_INBOUND = 0~%uint8 TOPIC_DIRECTION_OUTBOUND = 1~%~%# Topic type (this has to match duckietown.TopicType)~%uint8 TOPIC_TYPE_GENERIC = 0~%uint8 TOPIC_TYPE_DRIVER = 1~%uint8 TOPIC_TYPE_PERCEPTION = 2~%uint8 TOPIC_TYPE_CONTROL = 3~%uint8 TOPIC_TYPE_PLANNING = 4~%uint8 TOPIC_TYPE_LOCALIZATION = 5~%uint8 TOPIC_TYPE_MAPPING = 6~%uint8 TOPIC_TYPE_SWARM = 7~%uint8 TOPIC_TYPE_BEHAVIOR = 8~%uint8 TOPIC_TYPE_VISUALIZATION = 9~%uint8 TOPIC_TYPE_INFRASTRUCTURE = 10~%uint8 TOPIC_TYPE_COMMUNICATION = 11~%uint8 TOPIC_TYPE_DIAGNOSTICS = 12~%uint8 TOPIC_TYPE_DEBUG = 20~%~%string node                     # Node publishing this message~%string name                     # Topic object of the diagnostics~%string help                     # Topic description~%uint8 type                      # Topic type~%uint8 direction                 # Topic direction~%float32 frequency               # Topic frequency (Hz)~%float32 effective_frequency     # Topic (effective) frequency (Hz)~%float32 healthy_frequency       # Frequency at which this topic can be considered healthy~%float32 bandwidth               # Topic bandwidth (byte/s)~%bool enabled                    # Topic switch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsRosTopic>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'node))
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'help))
     1
     1
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsRosTopic>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsRosTopic
    (cl:cons ':node (node msg))
    (cl:cons ':name (name msg))
    (cl:cons ':help (help msg))
    (cl:cons ':type (type msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':effective_frequency (effective_frequency msg))
    (cl:cons ':healthy_frequency (healthy_frequency msg))
    (cl:cons ':bandwidth (bandwidth msg))
    (cl:cons ':enabled (enabled msg))
))
