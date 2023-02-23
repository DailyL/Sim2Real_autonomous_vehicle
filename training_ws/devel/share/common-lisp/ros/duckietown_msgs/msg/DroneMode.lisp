; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DroneMode.msg.html

(cl:defclass <DroneMode> (roslisp-msg-protocol:ros-message)
  ((drone_mode
    :reader drone_mode
    :initarg :drone_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DroneMode (<DroneMode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DroneMode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DroneMode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DroneMode> is deprecated: use duckietown_msgs-msg:DroneMode instead.")))

(cl:ensure-generic-function 'drone_mode-val :lambda-list '(m))
(cl:defmethod drone_mode-val ((m <DroneMode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:drone_mode-val is deprecated.  Use duckietown_msgs-msg:drone_mode instead.")
  (drone_mode m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DroneMode>)))
    "Constants for message type '<DroneMode>"
  '((:DRONE_MODE_DISARMED . 0)
    (:DRONE_MODE_ARMED . 1)
    (:DRONE_MODE_FLYING . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DroneMode)))
    "Constants for message type 'DroneMode"
  '((:DRONE_MODE_DISARMED . 0)
    (:DRONE_MODE_ARMED . 1)
    (:DRONE_MODE_FLYING . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DroneMode>) ostream)
  "Serializes a message object of type '<DroneMode>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drone_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DroneMode>) istream)
  "Deserializes a message object of type '<DroneMode>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drone_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DroneMode>)))
  "Returns string type for a message object of type '<DroneMode>"
  "duckietown_msgs/DroneMode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DroneMode)))
  "Returns string type for a message object of type 'DroneMode"
  "duckietown_msgs/DroneMode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DroneMode>)))
  "Returns md5sum for a message object of type '<DroneMode>"
  "b59b67ae59d5510222e083f7dcf98328")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DroneMode)))
  "Returns md5sum for a message object of type 'DroneMode"
  "b59b67ae59d5510222e083f7dcf98328")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DroneMode>)))
  "Returns full string definition for message of type '<DroneMode>"
  (cl:format cl:nil "# Power supply status constants~%uint8 DRONE_MODE_DISARMED = 0~%uint8 DRONE_MODE_ARMED = 1~%uint8 DRONE_MODE_FLYING = 2~%~%# The drone status  as reported. Values defined above~%uint8 drone_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DroneMode)))
  "Returns full string definition for message of type 'DroneMode"
  (cl:format cl:nil "# Power supply status constants~%uint8 DRONE_MODE_DISARMED = 0~%uint8 DRONE_MODE_ARMED = 1~%uint8 DRONE_MODE_FLYING = 2~%~%# The drone status  as reported. Values defined above~%uint8 drone_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DroneMode>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DroneMode>))
  "Converts a ROS message object to a list"
  (cl:list 'DroneMode
    (cl:cons ':drone_mode (drone_mode msg))
))
