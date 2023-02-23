; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude CoordinationSignal.msg.html

(cl:defclass <CoordinationSignal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (signal
    :reader signal
    :initarg :signal
    :type cl:string
    :initform ""))
)

(cl:defclass CoordinationSignal (<CoordinationSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CoordinationSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CoordinationSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<CoordinationSignal> is deprecated: use duckietown_msgs-msg:CoordinationSignal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CoordinationSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'signal-val :lambda-list '(m))
(cl:defmethod signal-val ((m <CoordinationSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:signal-val is deprecated.  Use duckietown_msgs-msg:signal instead.")
  (signal m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CoordinationSignal>)))
    "Constants for message type '<CoordinationSignal>"
  '((:OFF . "light_off")
    (:ON . "traffic_light_go")
    (:SIGNAL_A . "CAR_SIGNAL_A")
    (:SIGNAL_B . "CAR_SIGNAL_B")
    (:SIGNAL_C . "CAR_SIGNAL_C")
    (:SIGNAL_GREEN . "CAR_SIGNAL_GREEN")
    (:SIGNAL_PRIORITY . "CAR_SIGNAL_PRIORITY")
    (:SIGNAL_SACRIFICE_FOR_PRIORITY . "CAR_SIGNAL_SACRIFICE_FOR_PRIORITY")
    (:TL_GO_ALL . "tl_go_all")
    (:TL_STOP_ALL . "tl_stop_all")
    (:TL_GO_N . "tl_go_N")
    (:TL_GO_S . "tl_go_S")
    (:TL_GO_W . "tl_go_W")
    (:TL_GO_E . "tl_go_E")
    (:TL_YIELD . "tl_yield"))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CoordinationSignal)))
    "Constants for message type 'CoordinationSignal"
  '((:OFF . "light_off")
    (:ON . "traffic_light_go")
    (:SIGNAL_A . "CAR_SIGNAL_A")
    (:SIGNAL_B . "CAR_SIGNAL_B")
    (:SIGNAL_C . "CAR_SIGNAL_C")
    (:SIGNAL_GREEN . "CAR_SIGNAL_GREEN")
    (:SIGNAL_PRIORITY . "CAR_SIGNAL_PRIORITY")
    (:SIGNAL_SACRIFICE_FOR_PRIORITY . "CAR_SIGNAL_SACRIFICE_FOR_PRIORITY")
    (:TL_GO_ALL . "tl_go_all")
    (:TL_STOP_ALL . "tl_stop_all")
    (:TL_GO_N . "tl_go_N")
    (:TL_GO_S . "tl_go_S")
    (:TL_GO_W . "tl_go_W")
    (:TL_GO_E . "tl_go_E")
    (:TL_YIELD . "tl_yield"))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CoordinationSignal>) ostream)
  "Serializes a message object of type '<CoordinationSignal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'signal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'signal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CoordinationSignal>) istream)
  "Deserializes a message object of type '<CoordinationSignal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'signal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'signal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CoordinationSignal>)))
  "Returns string type for a message object of type '<CoordinationSignal>"
  "duckietown_msgs/CoordinationSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CoordinationSignal)))
  "Returns string type for a message object of type 'CoordinationSignal"
  "duckietown_msgs/CoordinationSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CoordinationSignal>)))
  "Returns md5sum for a message object of type '<CoordinationSignal>"
  "3caa78ed5f7d2e4ac24db630f8ee77a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CoordinationSignal)))
  "Returns md5sum for a message object of type 'CoordinationSignal"
  "3caa78ed5f7d2e4ac24db630f8ee77a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CoordinationSignal>)))
  "Returns full string definition for message of type '<CoordinationSignal>"
  (cl:format cl:nil "Header header~%~%string signal~%~%# these must match with LED_protocol.yaml~%string OFF=light_off~%#string ON = light_on~%string ON=traffic_light_go~%string SIGNAL_A=CAR_SIGNAL_A~%string SIGNAL_B=CAR_SIGNAL_B~%string SIGNAL_C=CAR_SIGNAL_C~%string SIGNAL_GREEN = CAR_SIGNAL_GREEN~%string SIGNAL_PRIORITY = CAR_SIGNAL_PRIORITY~%string SIGNAL_SACRIFICE_FOR_PRIORITY = CAR_SIGNAL_SACRIFICE_FOR_PRIORITY~%~%string TL_GO_ALL=tl_go_all~%string TL_STOP_ALL=tl_stop_all~%string TL_GO_N=tl_go_N~%string TL_GO_S=tl_go_S~%string TL_GO_W=tl_go_W~%string TL_GO_E=tl_go_E~%string TL_YIELD=tl_yield~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CoordinationSignal)))
  "Returns full string definition for message of type 'CoordinationSignal"
  (cl:format cl:nil "Header header~%~%string signal~%~%# these must match with LED_protocol.yaml~%string OFF=light_off~%#string ON = light_on~%string ON=traffic_light_go~%string SIGNAL_A=CAR_SIGNAL_A~%string SIGNAL_B=CAR_SIGNAL_B~%string SIGNAL_C=CAR_SIGNAL_C~%string SIGNAL_GREEN = CAR_SIGNAL_GREEN~%string SIGNAL_PRIORITY = CAR_SIGNAL_PRIORITY~%string SIGNAL_SACRIFICE_FOR_PRIORITY = CAR_SIGNAL_SACRIFICE_FOR_PRIORITY~%~%string TL_GO_ALL=tl_go_all~%string TL_STOP_ALL=tl_stop_all~%string TL_GO_N=tl_go_N~%string TL_GO_S=tl_go_S~%string TL_GO_W=tl_go_W~%string TL_GO_E=tl_go_E~%string TL_YIELD=tl_yield~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CoordinationSignal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'signal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CoordinationSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'CoordinationSignal
    (cl:cons ':header (header msg))
    (cl:cons ':signal (signal msg))
))
