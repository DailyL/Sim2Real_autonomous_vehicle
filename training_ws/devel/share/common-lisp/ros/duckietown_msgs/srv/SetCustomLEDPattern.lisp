; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude SetCustomLEDPattern-request.msg.html

(cl:defclass <SetCustomLEDPattern-request> (roslisp-msg-protocol:ros-message)
  ((pattern
    :reader pattern
    :initarg :pattern
    :type duckietown_msgs-msg:LEDPattern
    :initform (cl:make-instance 'duckietown_msgs-msg:LEDPattern)))
)

(cl:defclass SetCustomLEDPattern-request (<SetCustomLEDPattern-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCustomLEDPattern-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCustomLEDPattern-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetCustomLEDPattern-request> is deprecated: use duckietown_msgs-srv:SetCustomLEDPattern-request instead.")))

(cl:ensure-generic-function 'pattern-val :lambda-list '(m))
(cl:defmethod pattern-val ((m <SetCustomLEDPattern-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:pattern-val is deprecated.  Use duckietown_msgs-srv:pattern instead.")
  (pattern m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCustomLEDPattern-request>) ostream)
  "Serializes a message object of type '<SetCustomLEDPattern-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pattern) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCustomLEDPattern-request>) istream)
  "Deserializes a message object of type '<SetCustomLEDPattern-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pattern) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCustomLEDPattern-request>)))
  "Returns string type for a service object of type '<SetCustomLEDPattern-request>"
  "duckietown_msgs/SetCustomLEDPatternRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCustomLEDPattern-request)))
  "Returns string type for a service object of type 'SetCustomLEDPattern-request"
  "duckietown_msgs/SetCustomLEDPatternRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCustomLEDPattern-request>)))
  "Returns md5sum for a message object of type '<SetCustomLEDPattern-request>"
  "80c491edc501f8f5b2f80aaecfd31b21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCustomLEDPattern-request)))
  "Returns md5sum for a message object of type 'SetCustomLEDPattern-request"
  "80c491edc501f8f5b2f80aaecfd31b21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCustomLEDPattern-request>)))
  "Returns full string definition for message of type '<SetCustomLEDPattern-request>"
  (cl:format cl:nil "duckietown_msgs/LEDPattern pattern~%~%================================================================================~%MSG: duckietown_msgs/LEDPattern~%Header header~%string[]  color_list~%std_msgs/ColorRGBA[]  rgb_vals~%int8[]    color_mask~%float32   frequency~%int8[]    frequency_mask~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCustomLEDPattern-request)))
  "Returns full string definition for message of type 'SetCustomLEDPattern-request"
  (cl:format cl:nil "duckietown_msgs/LEDPattern pattern~%~%================================================================================~%MSG: duckietown_msgs/LEDPattern~%Header header~%string[]  color_list~%std_msgs/ColorRGBA[]  rgb_vals~%int8[]    color_mask~%float32   frequency~%int8[]    frequency_mask~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCustomLEDPattern-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pattern))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCustomLEDPattern-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCustomLEDPattern-request
    (cl:cons ':pattern (pattern msg))
))
;//! \htmlinclude SetCustomLEDPattern-response.msg.html

(cl:defclass <SetCustomLEDPattern-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetCustomLEDPattern-response (<SetCustomLEDPattern-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCustomLEDPattern-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCustomLEDPattern-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetCustomLEDPattern-response> is deprecated: use duckietown_msgs-srv:SetCustomLEDPattern-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCustomLEDPattern-response>) ostream)
  "Serializes a message object of type '<SetCustomLEDPattern-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCustomLEDPattern-response>) istream)
  "Deserializes a message object of type '<SetCustomLEDPattern-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCustomLEDPattern-response>)))
  "Returns string type for a service object of type '<SetCustomLEDPattern-response>"
  "duckietown_msgs/SetCustomLEDPatternResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCustomLEDPattern-response)))
  "Returns string type for a service object of type 'SetCustomLEDPattern-response"
  "duckietown_msgs/SetCustomLEDPatternResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCustomLEDPattern-response>)))
  "Returns md5sum for a message object of type '<SetCustomLEDPattern-response>"
  "80c491edc501f8f5b2f80aaecfd31b21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCustomLEDPattern-response)))
  "Returns md5sum for a message object of type 'SetCustomLEDPattern-response"
  "80c491edc501f8f5b2f80aaecfd31b21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCustomLEDPattern-response>)))
  "Returns full string definition for message of type '<SetCustomLEDPattern-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCustomLEDPattern-response)))
  "Returns full string definition for message of type 'SetCustomLEDPattern-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCustomLEDPattern-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCustomLEDPattern-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCustomLEDPattern-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetCustomLEDPattern)))
  'SetCustomLEDPattern-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetCustomLEDPattern)))
  'SetCustomLEDPattern-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCustomLEDPattern)))
  "Returns string type for a service object of type '<SetCustomLEDPattern>"
  "duckietown_msgs/SetCustomLEDPattern")