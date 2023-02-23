; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AntiInstagramThresholds.msg.html

(cl:defclass <AntiInstagramThresholds> (roslisp-msg-protocol:ros-message)
  ((low
    :reader low
    :initarg :low
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 3 :element-type 'cl:fixnum :initial-element 0))
   (high
    :reader high
    :initarg :high
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 3 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass AntiInstagramThresholds (<AntiInstagramThresholds>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AntiInstagramThresholds>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AntiInstagramThresholds)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AntiInstagramThresholds> is deprecated: use duckietown_msgs-msg:AntiInstagramThresholds instead.")))

(cl:ensure-generic-function 'low-val :lambda-list '(m))
(cl:defmethod low-val ((m <AntiInstagramThresholds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:low-val is deprecated.  Use duckietown_msgs-msg:low instead.")
  (low m))

(cl:ensure-generic-function 'high-val :lambda-list '(m))
(cl:defmethod high-val ((m <AntiInstagramThresholds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:high-val is deprecated.  Use duckietown_msgs-msg:high instead.")
  (high m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AntiInstagramThresholds>) ostream)
  "Serializes a message object of type '<AntiInstagramThresholds>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'low))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'high))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AntiInstagramThresholds>) istream)
  "Deserializes a message object of type '<AntiInstagramThresholds>"
  (cl:setf (cl:slot-value msg 'low) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'low)))
    (cl:dotimes (i 3)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  (cl:setf (cl:slot-value msg 'high) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'high)))
    (cl:dotimes (i 3)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AntiInstagramThresholds>)))
  "Returns string type for a message object of type '<AntiInstagramThresholds>"
  "duckietown_msgs/AntiInstagramThresholds")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AntiInstagramThresholds)))
  "Returns string type for a message object of type 'AntiInstagramThresholds"
  "duckietown_msgs/AntiInstagramThresholds")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AntiInstagramThresholds>)))
  "Returns md5sum for a message object of type '<AntiInstagramThresholds>"
  "bcde9d2f8b33a444d7909aaaa7563290")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AntiInstagramThresholds)))
  "Returns md5sum for a message object of type 'AntiInstagramThresholds"
  "bcde9d2f8b33a444d7909aaaa7563290")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AntiInstagramThresholds>)))
  "Returns full string definition for message of type '<AntiInstagramThresholds>"
  (cl:format cl:nil "int16[3] low~%int16[3] high~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AntiInstagramThresholds)))
  "Returns full string definition for message of type 'AntiInstagramThresholds"
  (cl:format cl:nil "int16[3] low~%int16[3] high~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AntiInstagramThresholds>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'low) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'high) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AntiInstagramThresholds>))
  "Converts a ROS message object to a list"
  (cl:list 'AntiInstagramThresholds
    (cl:cons ':low (low msg))
    (cl:cons ':high (high msg))
))
