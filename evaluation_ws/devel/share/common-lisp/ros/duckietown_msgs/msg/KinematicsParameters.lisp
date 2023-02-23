; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude KinematicsParameters.msg.html

(cl:defclass <KinematicsParameters> (roslisp-msg-protocol:ros-message)
  ((parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass KinematicsParameters (<KinematicsParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KinematicsParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KinematicsParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<KinematicsParameters> is deprecated: use duckietown_msgs-msg:KinematicsParameters instead.")))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <KinematicsParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:parameters-val is deprecated.  Use duckietown_msgs-msg:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KinematicsParameters>) ostream)
  "Serializes a message object of type '<KinematicsParameters>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
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
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KinematicsParameters>) istream)
  "Deserializes a message object of type '<KinematicsParameters>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KinematicsParameters>)))
  "Returns string type for a message object of type '<KinematicsParameters>"
  "duckietown_msgs/KinematicsParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KinematicsParameters)))
  "Returns string type for a message object of type 'KinematicsParameters"
  "duckietown_msgs/KinematicsParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KinematicsParameters>)))
  "Returns md5sum for a message object of type '<KinematicsParameters>"
  "cbca57679564ab84ca723072e3bf6226")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KinematicsParameters)))
  "Returns md5sum for a message object of type 'KinematicsParameters"
  "cbca57679564ab84ca723072e3bf6226")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KinematicsParameters>)))
  "Returns full string definition for message of type '<KinematicsParameters>"
  (cl:format cl:nil "float64[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KinematicsParameters)))
  "Returns full string definition for message of type 'KinematicsParameters"
  (cl:format cl:nil "float64[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KinematicsParameters>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KinematicsParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'KinematicsParameters
    (cl:cons ':parameters (parameters msg))
))
