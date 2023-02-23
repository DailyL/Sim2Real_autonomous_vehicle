; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude Twist2DStamped.msg.html

(cl:defclass <Twist2DStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (v
    :reader v
    :initarg :v
    :type cl:float
    :initform 0.0)
   (omega
    :reader omega
    :initarg :omega
    :type cl:float
    :initform 0.0))
)

(cl:defclass Twist2DStamped (<Twist2DStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Twist2DStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Twist2DStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<Twist2DStamped> is deprecated: use duckietown_msgs-msg:Twist2DStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Twist2DStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <Twist2DStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:v-val is deprecated.  Use duckietown_msgs-msg:v instead.")
  (v m))

(cl:ensure-generic-function 'omega-val :lambda-list '(m))
(cl:defmethod omega-val ((m <Twist2DStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:omega-val is deprecated.  Use duckietown_msgs-msg:omega instead.")
  (omega m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Twist2DStamped>) ostream)
  "Serializes a message object of type '<Twist2DStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Twist2DStamped>) istream)
  "Deserializes a message object of type '<Twist2DStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'omega) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Twist2DStamped>)))
  "Returns string type for a message object of type '<Twist2DStamped>"
  "duckietown_msgs/Twist2DStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Twist2DStamped)))
  "Returns string type for a message object of type 'Twist2DStamped"
  "duckietown_msgs/Twist2DStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Twist2DStamped>)))
  "Returns md5sum for a message object of type '<Twist2DStamped>"
  "3fc0942a3082e78d7ded4a58ea1e2d0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Twist2DStamped)))
  "Returns md5sum for a message object of type 'Twist2DStamped"
  "3fc0942a3082e78d7ded4a58ea1e2d0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Twist2DStamped>)))
  "Returns full string definition for message of type '<Twist2DStamped>"
  (cl:format cl:nil "Header header~%float32 v~%float32 omega~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Twist2DStamped)))
  "Returns full string definition for message of type 'Twist2DStamped"
  (cl:format cl:nil "Header header~%float32 v~%float32 omega~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Twist2DStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Twist2DStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'Twist2DStamped
    (cl:cons ':header (header msg))
    (cl:cons ':v (v msg))
    (cl:cons ':omega (omega msg))
))
