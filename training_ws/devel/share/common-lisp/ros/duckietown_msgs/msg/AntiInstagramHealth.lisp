; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AntiInstagramHealth.msg.html

(cl:defclass <AntiInstagramHealth> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (J1
    :reader J1
    :initarg :J1
    :type cl:float
    :initform 0.0)
   (J2
    :reader J2
    :initarg :J2
    :type cl:float
    :initform 0.0)
   (J3
    :reader J3
    :initarg :J3
    :type cl:float
    :initform 0.0))
)

(cl:defclass AntiInstagramHealth (<AntiInstagramHealth>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AntiInstagramHealth>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AntiInstagramHealth)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AntiInstagramHealth> is deprecated: use duckietown_msgs-msg:AntiInstagramHealth instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AntiInstagramHealth>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'J1-val :lambda-list '(m))
(cl:defmethod J1-val ((m <AntiInstagramHealth>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:J1-val is deprecated.  Use duckietown_msgs-msg:J1 instead.")
  (J1 m))

(cl:ensure-generic-function 'J2-val :lambda-list '(m))
(cl:defmethod J2-val ((m <AntiInstagramHealth>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:J2-val is deprecated.  Use duckietown_msgs-msg:J2 instead.")
  (J2 m))

(cl:ensure-generic-function 'J3-val :lambda-list '(m))
(cl:defmethod J3-val ((m <AntiInstagramHealth>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:J3-val is deprecated.  Use duckietown_msgs-msg:J3 instead.")
  (J3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AntiInstagramHealth>) ostream)
  "Serializes a message object of type '<AntiInstagramHealth>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'J1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'J2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'J3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AntiInstagramHealth>) istream)
  "Deserializes a message object of type '<AntiInstagramHealth>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'J1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'J2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'J3) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AntiInstagramHealth>)))
  "Returns string type for a message object of type '<AntiInstagramHealth>"
  "duckietown_msgs/AntiInstagramHealth")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AntiInstagramHealth)))
  "Returns string type for a message object of type 'AntiInstagramHealth"
  "duckietown_msgs/AntiInstagramHealth")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AntiInstagramHealth>)))
  "Returns md5sum for a message object of type '<AntiInstagramHealth>"
  "3a6e17ea173536e892b4dde76e515fb4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AntiInstagramHealth)))
  "Returns md5sum for a message object of type 'AntiInstagramHealth"
  "3a6e17ea173536e892b4dde76e515fb4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AntiInstagramHealth>)))
  "Returns full string definition for message of type '<AntiInstagramHealth>"
  (cl:format cl:nil "Header header~%float32 J1~%float32 J2~%float32 J3~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AntiInstagramHealth)))
  "Returns full string definition for message of type 'AntiInstagramHealth"
  (cl:format cl:nil "Header header~%float32 J1~%float32 J2~%float32 J3~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AntiInstagramHealth>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AntiInstagramHealth>))
  "Converts a ROS message object to a list"
  (cl:list 'AntiInstagramHealth
    (cl:cons ':header (header msg))
    (cl:cons ':J1 (J1 msg))
    (cl:cons ':J2 (J2 msg))
    (cl:cons ':J3 (J3 msg))
))
