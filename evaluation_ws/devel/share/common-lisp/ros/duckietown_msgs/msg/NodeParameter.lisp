; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude NodeParameter.msg.html

(cl:defclass <NodeParameter> (roslisp-msg-protocol:ros-message)
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
   (min_value
    :reader min_value
    :initarg :min_value
    :type cl:float
    :initform 0.0)
   (max_value
    :reader max_value
    :initarg :max_value
    :type cl:float
    :initform 0.0)
   (editable
    :reader editable
    :initarg :editable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NodeParameter (<NodeParameter>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeParameter>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeParameter)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<NodeParameter> is deprecated: use duckietown_msgs-msg:NodeParameter instead.")))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:node-val is deprecated.  Use duckietown_msgs-msg:node instead.")
  (node m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:name-val is deprecated.  Use duckietown_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'help-val :lambda-list '(m))
(cl:defmethod help-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:help-val is deprecated.  Use duckietown_msgs-msg:help instead.")
  (help m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'min_value-val :lambda-list '(m))
(cl:defmethod min_value-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:min_value-val is deprecated.  Use duckietown_msgs-msg:min_value instead.")
  (min_value m))

(cl:ensure-generic-function 'max_value-val :lambda-list '(m))
(cl:defmethod max_value-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:max_value-val is deprecated.  Use duckietown_msgs-msg:max_value instead.")
  (max_value m))

(cl:ensure-generic-function 'editable-val :lambda-list '(m))
(cl:defmethod editable-val ((m <NodeParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:editable-val is deprecated.  Use duckietown_msgs-msg:editable instead.")
  (editable m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<NodeParameter>)))
    "Constants for message type '<NodeParameter>"
  '((:PARAM_TYPE_UNKNOWN . 0)
    (:PARAM_TYPE_STRING . 1)
    (:PARAM_TYPE_INT . 2)
    (:PARAM_TYPE_FLOAT . 3)
    (:PARAM_TYPE_BOOL . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'NodeParameter)))
    "Constants for message type 'NodeParameter"
  '((:PARAM_TYPE_UNKNOWN . 0)
    (:PARAM_TYPE_STRING . 1)
    (:PARAM_TYPE_INT . 2)
    (:PARAM_TYPE_FLOAT . 3)
    (:PARAM_TYPE_BOOL . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeParameter>) ostream)
  "Serializes a message object of type '<NodeParameter>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'editable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeParameter>) istream)
  "Deserializes a message object of type '<NodeParameter>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'editable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeParameter>)))
  "Returns string type for a message object of type '<NodeParameter>"
  "duckietown_msgs/NodeParameter")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeParameter)))
  "Returns string type for a message object of type 'NodeParameter"
  "duckietown_msgs/NodeParameter")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeParameter>)))
  "Returns md5sum for a message object of type '<NodeParameter>"
  "871c14dc09d7cdeffeca9173f51f84f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeParameter)))
  "Returns md5sum for a message object of type 'NodeParameter"
  "871c14dc09d7cdeffeca9173f51f84f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeParameter>)))
  "Returns full string definition for message of type '<NodeParameter>"
  (cl:format cl:nil "# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeParameter)))
  "Returns full string definition for message of type 'NodeParameter"
  (cl:format cl:nil "# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeParameter>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'node))
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'help))
     1
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeParameter>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeParameter
    (cl:cons ':node (node msg))
    (cl:cons ':name (name msg))
    (cl:cons ':help (help msg))
    (cl:cons ':type (type msg))
    (cl:cons ':min_value (min_value msg))
    (cl:cons ':max_value (max_value msg))
    (cl:cons ':editable (editable msg))
))
