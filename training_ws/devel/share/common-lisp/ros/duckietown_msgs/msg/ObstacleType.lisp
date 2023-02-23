; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ObstacleType.msg.html

(cl:defclass <ObstacleType> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ObstacleType (<ObstacleType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ObstacleType> is deprecated: use duckietown_msgs-msg:ObstacleType instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <ObstacleType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ObstacleType>)))
    "Constants for message type '<ObstacleType>"
  '((:DUCKIE . 0)
    (:CONE . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ObstacleType)))
    "Constants for message type 'ObstacleType"
  '((:DUCKIE . 0)
    (:CONE . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleType>) ostream)
  "Serializes a message object of type '<ObstacleType>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleType>) istream)
  "Deserializes a message object of type '<ObstacleType>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleType>)))
  "Returns string type for a message object of type '<ObstacleType>"
  "duckietown_msgs/ObstacleType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleType)))
  "Returns string type for a message object of type 'ObstacleType"
  "duckietown_msgs/ObstacleType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleType>)))
  "Returns md5sum for a message object of type '<ObstacleType>"
  "9ebfbd5f069d46cb29c52358b5e953fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleType)))
  "Returns md5sum for a message object of type 'ObstacleType"
  "9ebfbd5f069d46cb29c52358b5e953fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleType>)))
  "Returns full string definition for message of type '<ObstacleType>"
  (cl:format cl:nil "uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleType)))
  "Returns full string definition for message of type 'ObstacleType"
  (cl:format cl:nil "uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleType>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleType>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleType
    (cl:cons ':type (type msg))
))
