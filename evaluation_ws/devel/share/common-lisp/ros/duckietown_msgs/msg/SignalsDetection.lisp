; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude SignalsDetection.msg.html

(cl:defclass <SignalsDetection> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (front
    :reader front
    :initarg :front
    :type cl:string
    :initform "")
   (right
    :reader right
    :initarg :right
    :type cl:string
    :initform "")
   (left
    :reader left
    :initarg :left
    :type cl:string
    :initform "")
   (traffic_light_state
    :reader traffic_light_state
    :initarg :traffic_light_state
    :type cl:string
    :initform ""))
)

(cl:defclass SignalsDetection (<SignalsDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SignalsDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SignalsDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<SignalsDetection> is deprecated: use duckietown_msgs-msg:SignalsDetection instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SignalsDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <SignalsDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:front-val is deprecated.  Use duckietown_msgs-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <SignalsDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:right-val is deprecated.  Use duckietown_msgs-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <SignalsDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:left-val is deprecated.  Use duckietown_msgs-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'traffic_light_state-val :lambda-list '(m))
(cl:defmethod traffic_light_state-val ((m <SignalsDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:traffic_light_state-val is deprecated.  Use duckietown_msgs-msg:traffic_light_state instead.")
  (traffic_light_state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SignalsDetection>)))
    "Constants for message type '<SignalsDetection>"
  '((:NO_CAR . "'no_car_detected'")
    (:SIGNAL_A . "'car_signal_A'")
    (:SIGNAL_B . "'car_signal_B'")
    (:SIGNAL_C . "'car_signal_C'")
    (:SIGNAL_PRIORITY . "'car_signal_priority'")
    (:SIGNAL_SACRIFICE_FOR_PRIORITY . "'car_signal_sacrifice_for_priority'")
    (:NO_CARS . "'no_cars_detected'")
    (:CARS . "'cars_detected'")
    (:NO_TRAFFIC_LIGHT . "'no_traffic_light'")
    (:STOP . "'tl_stop'")
    (:GO . "'tl_go'")
    (:YIELD . "'tl_yield'"))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SignalsDetection)))
    "Constants for message type 'SignalsDetection"
  '((:NO_CAR . "'no_car_detected'")
    (:SIGNAL_A . "'car_signal_A'")
    (:SIGNAL_B . "'car_signal_B'")
    (:SIGNAL_C . "'car_signal_C'")
    (:SIGNAL_PRIORITY . "'car_signal_priority'")
    (:SIGNAL_SACRIFICE_FOR_PRIORITY . "'car_signal_sacrifice_for_priority'")
    (:NO_CARS . "'no_cars_detected'")
    (:CARS . "'cars_detected'")
    (:NO_TRAFFIC_LIGHT . "'no_traffic_light'")
    (:STOP . "'tl_stop'")
    (:GO . "'tl_go'")
    (:YIELD . "'tl_yield'"))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SignalsDetection>) ostream)
  "Serializes a message object of type '<SignalsDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'front))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'front))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'right))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'left))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'traffic_light_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'traffic_light_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SignalsDetection>) istream)
  "Deserializes a message object of type '<SignalsDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'front) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'front) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'right) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'left) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traffic_light_state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'traffic_light_state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SignalsDetection>)))
  "Returns string type for a message object of type '<SignalsDetection>"
  "duckietown_msgs/SignalsDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SignalsDetection)))
  "Returns string type for a message object of type 'SignalsDetection"
  "duckietown_msgs/SignalsDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SignalsDetection>)))
  "Returns md5sum for a message object of type '<SignalsDetection>"
  "7a3bb73ea77191f1c0ddd7e196f27c75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SignalsDetection)))
  "Returns md5sum for a message object of type 'SignalsDetection"
  "7a3bb73ea77191f1c0ddd7e196f27c75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SignalsDetection>)))
  "Returns full string definition for message of type '<SignalsDetection>"
  (cl:format cl:nil "Header header~%~%# this is what we can see at the intersection:~%string front~%string right~%string left~%~%# For the first backoff approach~%# string led_detected~%# string no_led_detected~%~%# Each of these can be:~%string NO_CAR='no_car_detected'~%string SIGNAL_A='car_signal_A'~%string SIGNAL_B='car_signal_B'~%string SIGNAL_C='car_signal_C'~%string SIGNAL_PRIORITY='car_signal_priority'~%string SIGNAL_SACRIFICE_FOR_PRIORITY='car_signal_sacrifice_for_priority'~%~%string NO_CARS='no_cars_detected'~%string CARS   ='cars_detected'~%~%~%# Plus we can see the traffic light~%~%# for the moment we assume that no traffic light exists~%~%string traffic_light_state~%~%string NO_TRAFFIC_LIGHT='no_traffic_light'~%string STOP='tl_stop'~%string GO='tl_go'~%string YIELD='tl_yield'~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SignalsDetection)))
  "Returns full string definition for message of type 'SignalsDetection"
  (cl:format cl:nil "Header header~%~%# this is what we can see at the intersection:~%string front~%string right~%string left~%~%# For the first backoff approach~%# string led_detected~%# string no_led_detected~%~%# Each of these can be:~%string NO_CAR='no_car_detected'~%string SIGNAL_A='car_signal_A'~%string SIGNAL_B='car_signal_B'~%string SIGNAL_C='car_signal_C'~%string SIGNAL_PRIORITY='car_signal_priority'~%string SIGNAL_SACRIFICE_FOR_PRIORITY='car_signal_sacrifice_for_priority'~%~%string NO_CARS='no_cars_detected'~%string CARS   ='cars_detected'~%~%~%# Plus we can see the traffic light~%~%# for the moment we assume that no traffic light exists~%~%string traffic_light_state~%~%string NO_TRAFFIC_LIGHT='no_traffic_light'~%string STOP='tl_stop'~%string GO='tl_go'~%string YIELD='tl_yield'~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SignalsDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'front))
     4 (cl:length (cl:slot-value msg 'right))
     4 (cl:length (cl:slot-value msg 'left))
     4 (cl:length (cl:slot-value msg 'traffic_light_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SignalsDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'SignalsDetection
    (cl:cons ':header (header msg))
    (cl:cons ':front (front msg))
    (cl:cons ':right (right msg))
    (cl:cons ':left (left msg))
    (cl:cons ':traffic_light_state (traffic_light_state msg))
))
