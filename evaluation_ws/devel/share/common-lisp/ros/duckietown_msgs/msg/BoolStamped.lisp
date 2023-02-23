; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude BoolStamped.msg.html

(cl:defclass <BoolStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BoolStamped (<BoolStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoolStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoolStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<BoolStamped> is deprecated: use duckietown_msgs-msg:BoolStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoolStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <BoolStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:data-val is deprecated.  Use duckietown_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoolStamped>) ostream)
  "Serializes a message object of type '<BoolStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoolStamped>) istream)
  "Deserializes a message object of type '<BoolStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoolStamped>)))
  "Returns string type for a message object of type '<BoolStamped>"
  "duckietown_msgs/BoolStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoolStamped)))
  "Returns string type for a message object of type 'BoolStamped"
  "duckietown_msgs/BoolStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoolStamped>)))
  "Returns md5sum for a message object of type '<BoolStamped>"
  "542e22b190dc8e6eb476d50dda88feb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoolStamped)))
  "Returns md5sum for a message object of type 'BoolStamped"
  "542e22b190dc8e6eb476d50dda88feb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoolStamped>)))
  "Returns full string definition for message of type '<BoolStamped>"
  (cl:format cl:nil "Header header~%bool data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoolStamped)))
  "Returns full string definition for message of type 'BoolStamped"
  (cl:format cl:nil "Header header~%bool data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoolStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoolStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'BoolStamped
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
