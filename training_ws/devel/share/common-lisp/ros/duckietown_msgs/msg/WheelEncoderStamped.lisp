; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude WheelEncoderStamped.msg.html

(cl:defclass <WheelEncoderStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:integer
    :initform 0)
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:fixnum
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass WheelEncoderStamped (<WheelEncoderStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelEncoderStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelEncoderStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<WheelEncoderStamped> is deprecated: use duckietown_msgs-msg:WheelEncoderStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WheelEncoderStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <WheelEncoderStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:data-val is deprecated.  Use duckietown_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <WheelEncoderStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:resolution-val is deprecated.  Use duckietown_msgs-msg:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <WheelEncoderStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<WheelEncoderStamped>)))
    "Constants for message type '<WheelEncoderStamped>"
  '((:ENCODER_TYPE_ABSOLUTE . 0)
    (:ENCODER_TYPE_INCREMENTAL . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'WheelEncoderStamped)))
    "Constants for message type 'WheelEncoderStamped"
  '((:ENCODER_TYPE_ABSOLUTE . 0)
    (:ENCODER_TYPE_INCREMENTAL . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelEncoderStamped>) ostream)
  "Serializes a message object of type '<WheelEncoderStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelEncoderStamped>) istream)
  "Deserializes a message object of type '<WheelEncoderStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelEncoderStamped>)))
  "Returns string type for a message object of type '<WheelEncoderStamped>"
  "duckietown_msgs/WheelEncoderStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelEncoderStamped)))
  "Returns string type for a message object of type 'WheelEncoderStamped"
  "duckietown_msgs/WheelEncoderStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelEncoderStamped>)))
  "Returns md5sum for a message object of type '<WheelEncoderStamped>"
  "141b74ec2cc3bde8c38b5e3bdb694d12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelEncoderStamped)))
  "Returns md5sum for a message object of type 'WheelEncoderStamped"
  "141b74ec2cc3bde8c38b5e3bdb694d12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelEncoderStamped>)))
  "Returns full string definition for message of type '<WheelEncoderStamped>"
  (cl:format cl:nil "# Enum: encoder type~%uint8 ENCODER_TYPE_ABSOLUTE = 0~%uint8 ENCODER_TYPE_INCREMENTAL = 1~%~%Header header~%int32 data~%uint16 resolution~%uint8 type~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelEncoderStamped)))
  "Returns full string definition for message of type 'WheelEncoderStamped"
  (cl:format cl:nil "# Enum: encoder type~%uint8 ENCODER_TYPE_ABSOLUTE = 0~%uint8 ENCODER_TYPE_INCREMENTAL = 1~%~%Header header~%int32 data~%uint16 resolution~%uint8 type~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelEncoderStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     2
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelEncoderStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelEncoderStamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':type (type msg))
))
