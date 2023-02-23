; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AntiInstagramTransform.msg.html

(cl:defclass <AntiInstagramTransform> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (s
    :reader s
    :initarg :s
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass AntiInstagramTransform (<AntiInstagramTransform>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AntiInstagramTransform>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AntiInstagramTransform)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AntiInstagramTransform> is deprecated: use duckietown_msgs-msg:AntiInstagramTransform instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AntiInstagramTransform>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 's-val :lambda-list '(m))
(cl:defmethod s-val ((m <AntiInstagramTransform>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:s-val is deprecated.  Use duckietown_msgs-msg:s instead.")
  (s m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AntiInstagramTransform>) ostream)
  "Serializes a message object of type '<AntiInstagramTransform>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 's))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AntiInstagramTransform>) istream)
  "Deserializes a message object of type '<AntiInstagramTransform>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 's) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 's)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AntiInstagramTransform>)))
  "Returns string type for a message object of type '<AntiInstagramTransform>"
  "duckietown_msgs/AntiInstagramTransform")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AntiInstagramTransform)))
  "Returns string type for a message object of type 'AntiInstagramTransform"
  "duckietown_msgs/AntiInstagramTransform")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AntiInstagramTransform>)))
  "Returns md5sum for a message object of type '<AntiInstagramTransform>"
  "d8691e07ae6615fec4d91101863288cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AntiInstagramTransform)))
  "Returns md5sum for a message object of type 'AntiInstagramTransform"
  "d8691e07ae6615fec4d91101863288cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AntiInstagramTransform>)))
  "Returns full string definition for message of type '<AntiInstagramTransform>"
  (cl:format cl:nil "Header header~%float64[6] s~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AntiInstagramTransform)))
  "Returns full string definition for message of type 'AntiInstagramTransform"
  (cl:format cl:nil "Header header~%float64[6] s~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AntiInstagramTransform>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 's) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AntiInstagramTransform>))
  "Converts a ROS message object to a list"
  (cl:list 'AntiInstagramTransform
    (cl:cons ':header (header msg))
    (cl:cons ':s (s msg))
))
