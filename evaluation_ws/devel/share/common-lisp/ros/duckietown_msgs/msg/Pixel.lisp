; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude Pixel.msg.html

(cl:defclass <Pixel> (roslisp-msg-protocol:ros-message)
  ((u
    :reader u
    :initarg :u
    :type cl:integer
    :initform 0)
   (v
    :reader v
    :initarg :v
    :type cl:integer
    :initform 0))
)

(cl:defclass Pixel (<Pixel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pixel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pixel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<Pixel> is deprecated: use duckietown_msgs-msg:Pixel instead.")))

(cl:ensure-generic-function 'u-val :lambda-list '(m))
(cl:defmethod u-val ((m <Pixel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:u-val is deprecated.  Use duckietown_msgs-msg:u instead.")
  (u m))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <Pixel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:v-val is deprecated.  Use duckietown_msgs-msg:v instead.")
  (v m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pixel>) ostream)
  "Serializes a message object of type '<Pixel>"
  (cl:let* ((signed (cl:slot-value msg 'u)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'v)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pixel>) istream)
  "Deserializes a message object of type '<Pixel>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'u) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'v) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pixel>)))
  "Returns string type for a message object of type '<Pixel>"
  "duckietown_msgs/Pixel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pixel)))
  "Returns string type for a message object of type 'Pixel"
  "duckietown_msgs/Pixel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pixel>)))
  "Returns md5sum for a message object of type '<Pixel>"
  "f06a7e8dd345ffb826d71a489782114b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pixel)))
  "Returns md5sum for a message object of type 'Pixel"
  "f06a7e8dd345ffb826d71a489782114b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pixel>)))
  "Returns full string definition for message of type '<Pixel>"
  (cl:format cl:nil "int32 u~%int32 v~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pixel)))
  "Returns full string definition for message of type 'Pixel"
  (cl:format cl:nil "int32 u~%int32 v~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pixel>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pixel>))
  "Converts a ROS message object to a list"
  (cl:list 'Pixel
    (cl:cons ':u (u msg))
    (cl:cons ':v (v msg))
))
