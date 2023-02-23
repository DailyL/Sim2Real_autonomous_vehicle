; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude FSMState.msg.html

(cl:defclass <FSMState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state
    :reader state
    :initarg :state
    :type cl:string
    :initform ""))
)

(cl:defclass FSMState (<FSMState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FSMState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FSMState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<FSMState> is deprecated: use duckietown_msgs-msg:FSMState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FSMState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <FSMState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:state-val is deprecated.  Use duckietown_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<FSMState>)))
    "Constants for message type '<FSMState>"
  '((:LANE_FOLLOWING . "\"LANE_FOLLOWING\"")
    (:INTERSECTION_COORDINATION . "\"INTERSECTION_COORDINATION\"")
    (:INTERSECTION_CONTROL . "\"INTERSECTION_CONTROL\"")
    (:NORMAL_JOYSTICK_CONTROL . "\"NORMAL_JOYSTICK_CONTROL\"")
    (:SAFE_JOYSTICK_CONTROL . "\"SAFE_JOYSTICK_CONTROL\"")
    (:PARKING . "\"PARKING\"")
    (:ARRIVE_AT_STOP_LINE . "\"ARRIVE_AT_STOP_LINE\"")
    (:LANE_RECOVERY . "\"LANE_RECOVERY\"")
    (:INTERSECTION_RECOVERY . "\"INTERSECTION_RECOVERY\"")
    (:CALIBRATING . "\"CALIBRATING\"")
    (:CALIBRATING_CALC . "\"CALIBRATING_CALC\""))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'FSMState)))
    "Constants for message type 'FSMState"
  '((:LANE_FOLLOWING . "\"LANE_FOLLOWING\"")
    (:INTERSECTION_COORDINATION . "\"INTERSECTION_COORDINATION\"")
    (:INTERSECTION_CONTROL . "\"INTERSECTION_CONTROL\"")
    (:NORMAL_JOYSTICK_CONTROL . "\"NORMAL_JOYSTICK_CONTROL\"")
    (:SAFE_JOYSTICK_CONTROL . "\"SAFE_JOYSTICK_CONTROL\"")
    (:PARKING . "\"PARKING\"")
    (:ARRIVE_AT_STOP_LINE . "\"ARRIVE_AT_STOP_LINE\"")
    (:LANE_RECOVERY . "\"LANE_RECOVERY\"")
    (:INTERSECTION_RECOVERY . "\"INTERSECTION_RECOVERY\"")
    (:CALIBRATING . "\"CALIBRATING\"")
    (:CALIBRATING_CALC . "\"CALIBRATING_CALC\""))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FSMState>) ostream)
  "Serializes a message object of type '<FSMState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FSMState>) istream)
  "Deserializes a message object of type '<FSMState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FSMState>)))
  "Returns string type for a message object of type '<FSMState>"
  "duckietown_msgs/FSMState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FSMState)))
  "Returns string type for a message object of type 'FSMState"
  "duckietown_msgs/FSMState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FSMState>)))
  "Returns md5sum for a message object of type '<FSMState>"
  "3c94938238cecfe40fdf747aae8abbaa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FSMState)))
  "Returns md5sum for a message object of type 'FSMState"
  "3c94938238cecfe40fdf747aae8abbaa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FSMState>)))
  "Returns full string definition for message of type '<FSMState>"
  (cl:format cl:nil "Header header~%string state~%~%# pseudo constants~%string LANE_FOLLOWING=\"LANE_FOLLOWING\"~%string INTERSECTION_COORDINATION=\"INTERSECTION_COORDINATION\"~%string INTERSECTION_CONTROL=\"INTERSECTION_CONTROL\"~%string NORMAL_JOYSTICK_CONTROL=\"NORMAL_JOYSTICK_CONTROL\"~%string SAFE_JOYSTICK_CONTROL=\"SAFE_JOYSTICK_CONTROL\"~%string PARKING=\"PARKING\"~%string ARRIVE_AT_STOP_LINE=\"ARRIVE_AT_STOP_LINE\"~%string LANE_RECOVERY=\"LANE_RECOVERY\"~%string INTERSECTION_RECOVERY=\"INTERSECTION_RECOVERY\"~%string CALIBRATING=\"CALIBRATING\"~%string CALIBRATING_CALC=\"CALIBRATING_CALC\"~%~%#List of states~%# LANE_FOLLOWING~%# INTERSECTION_COORDINATION~%# INTERSECTION_CONTROL~%# NORMAL_JOYSTICK_CONTROL~%# SAFE_JOYSTICK_CONTROL~%# PARKING~%# ARRIVE_AT_STOP_LINE~%# LANE_RECOVERY~%# INTERSECTION_RECOVERY~%# CALIBRATING~%# CALIBRATING_CALC~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FSMState)))
  "Returns full string definition for message of type 'FSMState"
  (cl:format cl:nil "Header header~%string state~%~%# pseudo constants~%string LANE_FOLLOWING=\"LANE_FOLLOWING\"~%string INTERSECTION_COORDINATION=\"INTERSECTION_COORDINATION\"~%string INTERSECTION_CONTROL=\"INTERSECTION_CONTROL\"~%string NORMAL_JOYSTICK_CONTROL=\"NORMAL_JOYSTICK_CONTROL\"~%string SAFE_JOYSTICK_CONTROL=\"SAFE_JOYSTICK_CONTROL\"~%string PARKING=\"PARKING\"~%string ARRIVE_AT_STOP_LINE=\"ARRIVE_AT_STOP_LINE\"~%string LANE_RECOVERY=\"LANE_RECOVERY\"~%string INTERSECTION_RECOVERY=\"INTERSECTION_RECOVERY\"~%string CALIBRATING=\"CALIBRATING\"~%string CALIBRATING_CALC=\"CALIBRATING_CALC\"~%~%#List of states~%# LANE_FOLLOWING~%# INTERSECTION_COORDINATION~%# INTERSECTION_CONTROL~%# NORMAL_JOYSTICK_CONTROL~%# SAFE_JOYSTICK_CONTROL~%# PARKING~%# ARRIVE_AT_STOP_LINE~%# LANE_RECOVERY~%# INTERSECTION_RECOVERY~%# CALIBRATING~%# CALIBRATING_CALC~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FSMState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FSMState>))
  "Converts a ROS message object to a list"
  (cl:list 'FSMState
    (cl:cons ':header (header msg))
    (cl:cons ':state (state msg))
))
