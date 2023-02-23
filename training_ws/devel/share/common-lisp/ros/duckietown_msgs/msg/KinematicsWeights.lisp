; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude KinematicsWeights.msg.html

(cl:defclass <KinematicsWeights> (roslisp-msg-protocol:ros-message)
  ((weights
    :reader weights
    :initarg :weights
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass KinematicsWeights (<KinematicsWeights>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KinematicsWeights>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KinematicsWeights)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<KinematicsWeights> is deprecated: use duckietown_msgs-msg:KinematicsWeights instead.")))

(cl:ensure-generic-function 'weights-val :lambda-list '(m))
(cl:defmethod weights-val ((m <KinematicsWeights>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:weights-val is deprecated.  Use duckietown_msgs-msg:weights instead.")
  (weights m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KinematicsWeights>) ostream)
  "Serializes a message object of type '<KinematicsWeights>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'weights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'weights))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KinematicsWeights>) istream)
  "Deserializes a message object of type '<KinematicsWeights>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'weights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'weights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KinematicsWeights>)))
  "Returns string type for a message object of type '<KinematicsWeights>"
  "duckietown_msgs/KinematicsWeights")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KinematicsWeights)))
  "Returns string type for a message object of type 'KinematicsWeights"
  "duckietown_msgs/KinematicsWeights")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KinematicsWeights>)))
  "Returns md5sum for a message object of type '<KinematicsWeights>"
  "6904a09d2a677bf07bc600ffaa092ae8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KinematicsWeights)))
  "Returns md5sum for a message object of type 'KinematicsWeights"
  "6904a09d2a677bf07bc600ffaa092ae8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KinematicsWeights>)))
  "Returns full string definition for message of type '<KinematicsWeights>"
  (cl:format cl:nil "float64[] weights~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KinematicsWeights)))
  "Returns full string definition for message of type 'KinematicsWeights"
  (cl:format cl:nil "float64[] weights~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KinematicsWeights>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'weights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KinematicsWeights>))
  "Converts a ROS message object to a list"
  (cl:list 'KinematicsWeights
    (cl:cons ':weights (weights msg))
))
