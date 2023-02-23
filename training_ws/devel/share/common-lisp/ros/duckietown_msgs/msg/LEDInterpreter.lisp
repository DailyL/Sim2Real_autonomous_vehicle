; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude LEDInterpreter.msg.html

(cl:defclass <LEDInterpreter> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (vehicle
    :reader vehicle
    :initarg :vehicle
    :type cl:boolean
    :initform cl:nil)
   (trafficlight
    :reader trafficlight
    :initarg :trafficlight
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LEDInterpreter (<LEDInterpreter>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LEDInterpreter>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LEDInterpreter)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<LEDInterpreter> is deprecated: use duckietown_msgs-msg:LEDInterpreter instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LEDInterpreter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'vehicle-val :lambda-list '(m))
(cl:defmethod vehicle-val ((m <LEDInterpreter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:vehicle-val is deprecated.  Use duckietown_msgs-msg:vehicle instead.")
  (vehicle m))

(cl:ensure-generic-function 'trafficlight-val :lambda-list '(m))
(cl:defmethod trafficlight-val ((m <LEDInterpreter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:trafficlight-val is deprecated.  Use duckietown_msgs-msg:trafficlight instead.")
  (trafficlight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LEDInterpreter>) ostream)
  "Serializes a message object of type '<LEDInterpreter>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'vehicle) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'trafficlight) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LEDInterpreter>) istream)
  "Deserializes a message object of type '<LEDInterpreter>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'vehicle) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'trafficlight) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LEDInterpreter>)))
  "Returns string type for a message object of type '<LEDInterpreter>"
  "duckietown_msgs/LEDInterpreter")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LEDInterpreter)))
  "Returns string type for a message object of type 'LEDInterpreter"
  "duckietown_msgs/LEDInterpreter")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LEDInterpreter>)))
  "Returns md5sum for a message object of type '<LEDInterpreter>"
  "100d6a2c19dff0c3d52b5c327f7ecae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LEDInterpreter)))
  "Returns md5sum for a message object of type 'LEDInterpreter"
  "100d6a2c19dff0c3d52b5c327f7ecae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LEDInterpreter>)))
  "Returns full string definition for message of type '<LEDInterpreter>"
  (cl:format cl:nil "Header header~%bool vehicle~%bool trafficlight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LEDInterpreter)))
  "Returns full string definition for message of type 'LEDInterpreter"
  (cl:format cl:nil "Header header~%bool vehicle~%bool trafficlight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LEDInterpreter>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LEDInterpreter>))
  "Converts a ROS message object to a list"
  (cl:list 'LEDInterpreter
    (cl:cons ':header (header msg))
    (cl:cons ':vehicle (vehicle msg))
    (cl:cons ':trafficlight (trafficlight msg))
))
