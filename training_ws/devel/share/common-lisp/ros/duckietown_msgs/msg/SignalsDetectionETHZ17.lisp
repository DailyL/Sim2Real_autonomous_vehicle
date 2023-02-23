; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude SignalsDetectionETHZ17.msg.html

(cl:defclass <SignalsDetectionETHZ17> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (led_detected
    :reader led_detected
    :initarg :led_detected
    :type cl:string
    :initform "")
   (no_led_detected
    :reader no_led_detected
    :initarg :no_led_detected
    :type cl:string
    :initform ""))
)

(cl:defclass SignalsDetectionETHZ17 (<SignalsDetectionETHZ17>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SignalsDetectionETHZ17>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SignalsDetectionETHZ17)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<SignalsDetectionETHZ17> is deprecated: use duckietown_msgs-msg:SignalsDetectionETHZ17 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SignalsDetectionETHZ17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'led_detected-val :lambda-list '(m))
(cl:defmethod led_detected-val ((m <SignalsDetectionETHZ17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:led_detected-val is deprecated.  Use duckietown_msgs-msg:led_detected instead.")
  (led_detected m))

(cl:ensure-generic-function 'no_led_detected-val :lambda-list '(m))
(cl:defmethod no_led_detected-val ((m <SignalsDetectionETHZ17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:no_led_detected-val is deprecated.  Use duckietown_msgs-msg:no_led_detected instead.")
  (no_led_detected m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SignalsDetectionETHZ17>)))
    "Constants for message type '<SignalsDetectionETHZ17>"
  '((:SIGNAL_A . "'car_signal_A'")
    (:SIGNAL_B . "'car_signal_B'")
    (:SIGNAL_C . "'car_signal_C'")
    (:NO_CARS . "'no_cars_detected'")
    (:CARS . "'cars_detected'")
    (:GO . "'tl_go'"))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SignalsDetectionETHZ17)))
    "Constants for message type 'SignalsDetectionETHZ17"
  '((:SIGNAL_A . "'car_signal_A'")
    (:SIGNAL_B . "'car_signal_B'")
    (:SIGNAL_C . "'car_signal_C'")
    (:NO_CARS . "'no_cars_detected'")
    (:CARS . "'cars_detected'")
    (:GO . "'tl_go'"))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SignalsDetectionETHZ17>) ostream)
  "Serializes a message object of type '<SignalsDetectionETHZ17>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'led_detected))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'led_detected))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'no_led_detected))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'no_led_detected))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SignalsDetectionETHZ17>) istream)
  "Deserializes a message object of type '<SignalsDetectionETHZ17>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'led_detected) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'led_detected) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'no_led_detected) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'no_led_detected) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SignalsDetectionETHZ17>)))
  "Returns string type for a message object of type '<SignalsDetectionETHZ17>"
  "duckietown_msgs/SignalsDetectionETHZ17")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SignalsDetectionETHZ17)))
  "Returns string type for a message object of type 'SignalsDetectionETHZ17"
  "duckietown_msgs/SignalsDetectionETHZ17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SignalsDetectionETHZ17>)))
  "Returns md5sum for a message object of type '<SignalsDetectionETHZ17>"
  "c1b7d3a54f028811e1c3b2366af85c0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SignalsDetectionETHZ17)))
  "Returns md5sum for a message object of type 'SignalsDetectionETHZ17"
  "c1b7d3a54f028811e1c3b2366af85c0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SignalsDetectionETHZ17>)))
  "Returns full string definition for message of type '<SignalsDetectionETHZ17>"
  (cl:format cl:nil "Header header~%~%# this is what we can see at the intersection:~%#string front~%#string right~%#string left ~%~%# For the first backoff approach~%string led_detected~%string no_led_detected~%~%# Each of these can be:~%#string NO_CAR='no_car_detected'~%string SIGNAL_A='car_signal_A'~%string SIGNAL_B='car_signal_B'~%string SIGNAL_C='car_signal_C'~%~%string NO_CARS='no_cars_detected'~%string CARS   ='cars_detected'~%~%~%# Plus we can see the traffic light~%~%# for the moment we assume that no traffic light exists~%~%#string traffic_light_state~%~%#string NO_TRAFFIC_LIGHT='no_traffic_light'~%#string STOP='tl_stop'~%string GO='tl_go'~%#string YIELD='tl_yield'~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SignalsDetectionETHZ17)))
  "Returns full string definition for message of type 'SignalsDetectionETHZ17"
  (cl:format cl:nil "Header header~%~%# this is what we can see at the intersection:~%#string front~%#string right~%#string left ~%~%# For the first backoff approach~%string led_detected~%string no_led_detected~%~%# Each of these can be:~%#string NO_CAR='no_car_detected'~%string SIGNAL_A='car_signal_A'~%string SIGNAL_B='car_signal_B'~%string SIGNAL_C='car_signal_C'~%~%string NO_CARS='no_cars_detected'~%string CARS   ='cars_detected'~%~%~%# Plus we can see the traffic light~%~%# for the moment we assume that no traffic light exists~%~%#string traffic_light_state~%~%#string NO_TRAFFIC_LIGHT='no_traffic_light'~%#string STOP='tl_stop'~%string GO='tl_go'~%#string YIELD='tl_yield'~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SignalsDetectionETHZ17>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'led_detected))
     4 (cl:length (cl:slot-value msg 'no_led_detected))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SignalsDetectionETHZ17>))
  "Converts a ROS message object to a list"
  (cl:list 'SignalsDetectionETHZ17
    (cl:cons ':header (header msg))
    (cl:cons ':led_detected (led_detected msg))
    (cl:cons ':no_led_detected (no_led_detected msg))
))
