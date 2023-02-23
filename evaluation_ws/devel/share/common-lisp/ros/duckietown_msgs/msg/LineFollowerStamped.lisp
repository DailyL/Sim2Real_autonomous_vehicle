; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude LineFollowerStamped.msg.html

(cl:defclass <LineFollowerStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil)
   (outer_right
    :reader outer_right
    :initarg :outer_right
    :type cl:float
    :initform 0.0)
   (inner_right
    :reader inner_right
    :initarg :inner_right
    :type cl:float
    :initform 0.0)
   (inner_left
    :reader inner_left
    :initarg :inner_left
    :type cl:float
    :initform 0.0)
   (outer_left
    :reader outer_left
    :initarg :outer_left
    :type cl:float
    :initform 0.0))
)

(cl:defclass LineFollowerStamped (<LineFollowerStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LineFollowerStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LineFollowerStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<LineFollowerStamped> is deprecated: use duckietown_msgs-msg:LineFollowerStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:valid-val is deprecated.  Use duckietown_msgs-msg:valid instead.")
  (valid m))

(cl:ensure-generic-function 'outer_right-val :lambda-list '(m))
(cl:defmethod outer_right-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:outer_right-val is deprecated.  Use duckietown_msgs-msg:outer_right instead.")
  (outer_right m))

(cl:ensure-generic-function 'inner_right-val :lambda-list '(m))
(cl:defmethod inner_right-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:inner_right-val is deprecated.  Use duckietown_msgs-msg:inner_right instead.")
  (inner_right m))

(cl:ensure-generic-function 'inner_left-val :lambda-list '(m))
(cl:defmethod inner_left-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:inner_left-val is deprecated.  Use duckietown_msgs-msg:inner_left instead.")
  (inner_left m))

(cl:ensure-generic-function 'outer_left-val :lambda-list '(m))
(cl:defmethod outer_left-val ((m <LineFollowerStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:outer_left-val is deprecated.  Use duckietown_msgs-msg:outer_left instead.")
  (outer_left m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LineFollowerStamped>) ostream)
  "Serializes a message object of type '<LineFollowerStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'outer_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'inner_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'inner_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'outer_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LineFollowerStamped>) istream)
  "Deserializes a message object of type '<LineFollowerStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'outer_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'inner_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'inner_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'outer_left) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LineFollowerStamped>)))
  "Returns string type for a message object of type '<LineFollowerStamped>"
  "duckietown_msgs/LineFollowerStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LineFollowerStamped)))
  "Returns string type for a message object of type 'LineFollowerStamped"
  "duckietown_msgs/LineFollowerStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LineFollowerStamped>)))
  "Returns md5sum for a message object of type '<LineFollowerStamped>"
  "296fc5d7868bac377ab0a7300283e5f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LineFollowerStamped)))
  "Returns md5sum for a message object of type 'LineFollowerStamped"
  "296fc5d7868bac377ab0a7300283e5f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LineFollowerStamped>)))
  "Returns full string definition for message of type '<LineFollowerStamped>"
  (cl:format cl:nil "Header header~%~%bool valid  # True iff the ADC reading was valid~%# All of the following values are normalized line brightness, between 0 and 1.~%# Specifically, an ADC voltage of 0 is mapped to 0, and 3.3V is mapped to 1.0.~%float32 outer_right~%float32 inner_right~%float32 inner_left~%float32 outer_left~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LineFollowerStamped)))
  "Returns full string definition for message of type 'LineFollowerStamped"
  (cl:format cl:nil "Header header~%~%bool valid  # True iff the ADC reading was valid~%# All of the following values are normalized line brightness, between 0 and 1.~%# Specifically, an ADC voltage of 0 is mapped to 0, and 3.3V is mapped to 1.0.~%float32 outer_right~%float32 inner_right~%float32 inner_left~%float32 outer_left~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LineFollowerStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LineFollowerStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'LineFollowerStamped
    (cl:cons ':header (header msg))
    (cl:cons ':valid (valid msg))
    (cl:cons ':outer_right (outer_right msg))
    (cl:cons ':inner_right (inner_right msg))
    (cl:cons ':inner_left (inner_left msg))
    (cl:cons ':outer_left (outer_left msg))
))
