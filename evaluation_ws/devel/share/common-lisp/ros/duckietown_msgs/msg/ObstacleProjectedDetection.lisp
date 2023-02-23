; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ObstacleProjectedDetection.msg.html

(cl:defclass <ObstacleProjectedDetection> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (type
    :reader type
    :initarg :type
    :type duckietown_msgs-msg:ObstacleType
    :initform (cl:make-instance 'duckietown_msgs-msg:ObstacleType))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ObstacleProjectedDetection (<ObstacleProjectedDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleProjectedDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleProjectedDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ObstacleProjectedDetection> is deprecated: use duckietown_msgs-msg:ObstacleProjectedDetection instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <ObstacleProjectedDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:location-val is deprecated.  Use duckietown_msgs-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <ObstacleProjectedDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ObstacleProjectedDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:distance-val is deprecated.  Use duckietown_msgs-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleProjectedDetection>) ostream)
  "Serializes a message object of type '<ObstacleProjectedDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'type) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleProjectedDetection>) istream)
  "Deserializes a message object of type '<ObstacleProjectedDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'type) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleProjectedDetection>)))
  "Returns string type for a message object of type '<ObstacleProjectedDetection>"
  "duckietown_msgs/ObstacleProjectedDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleProjectedDetection)))
  "Returns string type for a message object of type 'ObstacleProjectedDetection"
  "duckietown_msgs/ObstacleProjectedDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleProjectedDetection>)))
  "Returns md5sum for a message object of type '<ObstacleProjectedDetection>"
  "cb503445da742d4aa1f69f0b72163c00")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleProjectedDetection)))
  "Returns md5sum for a message object of type 'ObstacleProjectedDetection"
  "cb503445da742d4aa1f69f0b72163c00")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleProjectedDetection>)))
  "Returns full string definition for message of type '<ObstacleProjectedDetection>"
  (cl:format cl:nil "geometry_msgs/Point location~%duckietown_msgs/ObstacleType type~%float32 distance~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleProjectedDetection)))
  "Returns full string definition for message of type 'ObstacleProjectedDetection"
  (cl:format cl:nil "geometry_msgs/Point location~%duckietown_msgs/ObstacleType type~%float32 distance~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleProjectedDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'type))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleProjectedDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleProjectedDetection
    (cl:cons ':location (location msg))
    (cl:cons ':type (type msg))
    (cl:cons ':distance (distance msg))
))
