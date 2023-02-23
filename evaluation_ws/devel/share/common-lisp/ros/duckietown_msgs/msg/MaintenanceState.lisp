; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude MaintenanceState.msg.html

(cl:defclass <MaintenanceState> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:string
    :initform ""))
)

(cl:defclass MaintenanceState (<MaintenanceState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MaintenanceState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MaintenanceState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<MaintenanceState> is deprecated: use duckietown_msgs-msg:MaintenanceState instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <MaintenanceState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:state-val is deprecated.  Use duckietown_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MaintenanceState>)))
    "Constants for message type '<MaintenanceState>"
  '((:WAY_TO_MAINTENANCE . "\"WAY_TO_MAINTENANCE\"")
    (:WAY_TO_CHARGING . "\"WAY_TO_CHARGING\"")
    (:CHARGING . "\"CHARGING\"")
    (:WAY_TO_CALIBRATING . "\"WAY_TO_CALIBRATING\"")
    (:CALIBRATING . "\"CALIBRATING\"")
    (:WAY_TO_CITY . "\"WAY_TO_CITY\"")
    (:NONE . "\"NONE\""))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MaintenanceState)))
    "Constants for message type 'MaintenanceState"
  '((:WAY_TO_MAINTENANCE . "\"WAY_TO_MAINTENANCE\"")
    (:WAY_TO_CHARGING . "\"WAY_TO_CHARGING\"")
    (:CHARGING . "\"CHARGING\"")
    (:WAY_TO_CALIBRATING . "\"WAY_TO_CALIBRATING\"")
    (:CALIBRATING . "\"CALIBRATING\"")
    (:WAY_TO_CITY . "\"WAY_TO_CITY\"")
    (:NONE . "\"NONE\""))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MaintenanceState>) ostream)
  "Serializes a message object of type '<MaintenanceState>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MaintenanceState>) istream)
  "Deserializes a message object of type '<MaintenanceState>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MaintenanceState>)))
  "Returns string type for a message object of type '<MaintenanceState>"
  "duckietown_msgs/MaintenanceState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaintenanceState)))
  "Returns string type for a message object of type 'MaintenanceState"
  "duckietown_msgs/MaintenanceState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MaintenanceState>)))
  "Returns md5sum for a message object of type '<MaintenanceState>"
  "076259ec4d51665ce2a0b26c9055f2df")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MaintenanceState)))
  "Returns md5sum for a message object of type 'MaintenanceState"
  "076259ec4d51665ce2a0b26c9055f2df")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MaintenanceState>)))
  "Returns full string definition for message of type '<MaintenanceState>"
  (cl:format cl:nil "#Header header~%string state~%~%# pseudo constants~%string WAY_TO_MAINTENANCE=\"WAY_TO_MAINTENANCE\"~%string WAY_TO_CHARGING=\"WAY_TO_CHARGING\"~%string CHARGING=\"CHARGING\"~%string WAY_TO_CALIBRATING=\"WAY_TO_CALIBRATING\"	~%string CALIBRATING=\"CALIBRATING\"	~%string WAY_TO_CITY=\"WAY_TO_CITY\"~%string NONE=\"NONE\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MaintenanceState)))
  "Returns full string definition for message of type 'MaintenanceState"
  (cl:format cl:nil "#Header header~%string state~%~%# pseudo constants~%string WAY_TO_MAINTENANCE=\"WAY_TO_MAINTENANCE\"~%string WAY_TO_CHARGING=\"WAY_TO_CHARGING\"~%string CHARGING=\"CHARGING\"~%string WAY_TO_CALIBRATING=\"WAY_TO_CALIBRATING\"	~%string CALIBRATING=\"CALIBRATING\"	~%string WAY_TO_CITY=\"WAY_TO_CITY\"~%string NONE=\"NONE\"~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MaintenanceState>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MaintenanceState>))
  "Converts a ROS message object to a list"
  (cl:list 'MaintenanceState
    (cl:cons ':state (state msg))
))
