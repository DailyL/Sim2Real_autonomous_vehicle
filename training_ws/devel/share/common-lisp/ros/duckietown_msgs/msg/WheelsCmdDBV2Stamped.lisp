; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude WheelsCmdDBV2Stamped.msg.html

(cl:defclass <WheelsCmdDBV2Stamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (gamma
    :reader gamma
    :initarg :gamma
    :type cl:float
    :initform 0.0)
   (vel_wheel
    :reader vel_wheel
    :initarg :vel_wheel
    :type cl:float
    :initform 0.0)
   (trim
    :reader trim
    :initarg :trim
    :type cl:float
    :initform 0.0))
)

(cl:defclass WheelsCmdDBV2Stamped (<WheelsCmdDBV2Stamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WheelsCmdDBV2Stamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WheelsCmdDBV2Stamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<WheelsCmdDBV2Stamped> is deprecated: use duckietown_msgs-msg:WheelsCmdDBV2Stamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WheelsCmdDBV2Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'gamma-val :lambda-list '(m))
(cl:defmethod gamma-val ((m <WheelsCmdDBV2Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:gamma-val is deprecated.  Use duckietown_msgs-msg:gamma instead.")
  (gamma m))

(cl:ensure-generic-function 'vel_wheel-val :lambda-list '(m))
(cl:defmethod vel_wheel-val ((m <WheelsCmdDBV2Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:vel_wheel-val is deprecated.  Use duckietown_msgs-msg:vel_wheel instead.")
  (vel_wheel m))

(cl:ensure-generic-function 'trim-val :lambda-list '(m))
(cl:defmethod trim-val ((m <WheelsCmdDBV2Stamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:trim-val is deprecated.  Use duckietown_msgs-msg:trim instead.")
  (trim m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WheelsCmdDBV2Stamped>) ostream)
  "Serializes a message object of type '<WheelsCmdDBV2Stamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gamma))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_wheel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'trim))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WheelsCmdDBV2Stamped>) istream)
  "Deserializes a message object of type '<WheelsCmdDBV2Stamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gamma) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_wheel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trim) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WheelsCmdDBV2Stamped>)))
  "Returns string type for a message object of type '<WheelsCmdDBV2Stamped>"
  "duckietown_msgs/WheelsCmdDBV2Stamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WheelsCmdDBV2Stamped)))
  "Returns string type for a message object of type 'WheelsCmdDBV2Stamped"
  "duckietown_msgs/WheelsCmdDBV2Stamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WheelsCmdDBV2Stamped>)))
  "Returns md5sum for a message object of type '<WheelsCmdDBV2Stamped>"
  "7da28061cc173091cc0253decf17895d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WheelsCmdDBV2Stamped)))
  "Returns md5sum for a message object of type 'WheelsCmdDBV2Stamped"
  "7da28061cc173091cc0253decf17895d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WheelsCmdDBV2Stamped>)))
  "Returns full string definition for message of type '<WheelsCmdDBV2Stamped>"
  (cl:format cl:nil "Header header~%float32 gamma           #\"vel_left\" changed to \"gamma\", RFMH_2019_02_26~%float32 vel_wheel       #\"vel_right\" changed to \"vel_wheel\", RFMH_2019_02_26~%float32 trim            #included \"trim\" to be accessible in the wheels_driver_node as well, RFMH_2019_04_01~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WheelsCmdDBV2Stamped)))
  "Returns full string definition for message of type 'WheelsCmdDBV2Stamped"
  (cl:format cl:nil "Header header~%float32 gamma           #\"vel_left\" changed to \"gamma\", RFMH_2019_02_26~%float32 vel_wheel       #\"vel_right\" changed to \"vel_wheel\", RFMH_2019_02_26~%float32 trim            #included \"trim\" to be accessible in the wheels_driver_node as well, RFMH_2019_04_01~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WheelsCmdDBV2Stamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WheelsCmdDBV2Stamped>))
  "Converts a ROS message object to a list"
  (cl:list 'WheelsCmdDBV2Stamped
    (cl:cons ':header (header msg))
    (cl:cons ':gamma (gamma msg))
    (cl:cons ':vel_wheel (vel_wheel msg))
    (cl:cons ':trim (trim msg))
))
