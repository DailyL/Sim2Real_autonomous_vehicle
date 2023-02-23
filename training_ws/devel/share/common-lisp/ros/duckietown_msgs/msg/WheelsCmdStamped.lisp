; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude WheelsCmdStamped.msg.html

(cl:defclass <WheelsCmdStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vel_left
    :reader vel_left
    :initarg :vel_left
    :type cl:float
    :initform 0.0)
   (vel_right
    :reader vel_right
    :initarg :vel_right
    :type cl:float
    :initform 0.0))
)

(cl:defclass WheelsCmdStamped (<WheelsCmdStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelsCmdStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelsCmdStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<WheelsCmdStamped> is deprecated: use duckietown_msgs-msg:WheelsCmdStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WheelsCmdStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vel_left-val :lambda-list '(m))
(cl:defmethod vel_left-val ((m <WheelsCmdStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:vel_left-val is deprecated.  Use duckietown_msgs-msg:vel_left instead.")
  (vel_left m))

(cl:ensure-generic-function 'vel_right-val :lambda-list '(m))
(cl:defmethod vel_right-val ((m <WheelsCmdStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:vel_right-val is deprecated.  Use duckietown_msgs-msg:vel_right instead.")
  (vel_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelsCmdStamped>) ostream)
  "Serializes a message object of type '<WheelsCmdStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelsCmdStamped>) istream)
  "Deserializes a message object of type '<WheelsCmdStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_right) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelsCmdStamped>)))
  "Returns string type for a message object of type '<WheelsCmdStamped>"
  "duckietown_msgs/WheelsCmdStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelsCmdStamped)))
  "Returns string type for a message object of type 'WheelsCmdStamped"
  "duckietown_msgs/WheelsCmdStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelsCmdStamped>)))
  "Returns md5sum for a message object of type '<WheelsCmdStamped>"
  "edbf8d24194d839b1982a6a991b552c6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelsCmdStamped)))
  "Returns md5sum for a message object of type 'WheelsCmdStamped"
  "edbf8d24194d839b1982a6a991b552c6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelsCmdStamped>)))
  "Returns full string definition for message of type '<WheelsCmdStamped>"
  (cl:format cl:nil "Header header~%float32 vel_left~%float32 vel_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelsCmdStamped)))
  "Returns full string definition for message of type 'WheelsCmdStamped"
  (cl:format cl:nil "Header header~%float32 vel_left~%float32 vel_right~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelsCmdStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelsCmdStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelsCmdStamped
    (cl:cons ':header (header msg))
    (cl:cons ':vel_left (vel_left msg))
    (cl:cons ':vel_right (vel_right msg))
))
