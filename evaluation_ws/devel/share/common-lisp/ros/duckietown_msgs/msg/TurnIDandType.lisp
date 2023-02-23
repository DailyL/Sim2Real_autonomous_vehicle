; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude TurnIDandType.msg.html

(cl:defclass <TurnIDandType> (roslisp-msg-protocol:ros-message)
  ((tag_id
    :reader tag_id
    :initarg :tag_id
    :type cl:fixnum
    :initform 0)
   (turn_type
    :reader turn_type
    :initarg :turn_type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TurnIDandType (<TurnIDandType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurnIDandType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurnIDandType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<TurnIDandType> is deprecated: use duckietown_msgs-msg:TurnIDandType instead.")))

(cl:ensure-generic-function 'tag_id-val :lambda-list '(m))
(cl:defmethod tag_id-val ((m <TurnIDandType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:tag_id-val is deprecated.  Use duckietown_msgs-msg:tag_id instead.")
  (tag_id m))

(cl:ensure-generic-function 'turn_type-val :lambda-list '(m))
(cl:defmethod turn_type-val ((m <TurnIDandType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:turn_type-val is deprecated.  Use duckietown_msgs-msg:turn_type instead.")
  (turn_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurnIDandType>) ostream)
  "Serializes a message object of type '<TurnIDandType>"
  (cl:let* ((signed (cl:slot-value msg 'tag_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'turn_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurnIDandType>) istream)
  "Deserializes a message object of type '<TurnIDandType>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'turn_type) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurnIDandType>)))
  "Returns string type for a message object of type '<TurnIDandType>"
  "duckietown_msgs/TurnIDandType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurnIDandType)))
  "Returns string type for a message object of type 'TurnIDandType"
  "duckietown_msgs/TurnIDandType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurnIDandType>)))
  "Returns md5sum for a message object of type '<TurnIDandType>"
  "999e690d54f4de1ab02b7e874091d0ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurnIDandType)))
  "Returns md5sum for a message object of type 'TurnIDandType"
  "999e690d54f4de1ab02b7e874091d0ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurnIDandType>)))
  "Returns full string definition for message of type '<TurnIDandType>"
  (cl:format cl:nil "int16 tag_id~%int16 turn_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurnIDandType)))
  "Returns full string definition for message of type 'TurnIDandType"
  (cl:format cl:nil "int16 tag_id~%int16 turn_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurnIDandType>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurnIDandType>))
  "Converts a ROS message object to a list"
  (cl:list 'TurnIDandType
    (cl:cons ':tag_id (tag_id msg))
    (cl:cons ':turn_type (turn_type msg))
))
