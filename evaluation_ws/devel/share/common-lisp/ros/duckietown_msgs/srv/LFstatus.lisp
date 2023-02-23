; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude LFstatus-request.msg.html

(cl:defclass <LFstatus-request> (roslisp-msg-protocol:ros-message)
  ((sensor_position
    :reader sensor_position
    :initarg :sensor_position
    :type cl:string
    :initform ""))
)

(cl:defclass LFstatus-request (<LFstatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LFstatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LFstatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<LFstatus-request> is deprecated: use duckietown_msgs-srv:LFstatus-request instead.")))

(cl:ensure-generic-function 'sensor_position-val :lambda-list '(m))
(cl:defmethod sensor_position-val ((m <LFstatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:sensor_position-val is deprecated.  Use duckietown_msgs-srv:sensor_position instead.")
  (sensor_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LFstatus-request>) ostream)
  "Serializes a message object of type '<LFstatus-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sensor_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sensor_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LFstatus-request>) istream)
  "Deserializes a message object of type '<LFstatus-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_position) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sensor_position) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LFstatus-request>)))
  "Returns string type for a service object of type '<LFstatus-request>"
  "duckietown_msgs/LFstatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LFstatus-request)))
  "Returns string type for a service object of type 'LFstatus-request"
  "duckietown_msgs/LFstatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LFstatus-request>)))
  "Returns md5sum for a message object of type '<LFstatus-request>"
  "b59a0adbfa1b994feb973fdc4fcbe6db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LFstatus-request)))
  "Returns md5sum for a message object of type 'LFstatus-request"
  "b59a0adbfa1b994feb973fdc4fcbe6db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LFstatus-request>)))
  "Returns full string definition for message of type '<LFstatus-request>"
  (cl:format cl:nil "string sensor_position    #expect sensor position to be one of the following strings: lf_il, lf_ol, lf_ir, lf_ol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LFstatus-request)))
  "Returns full string definition for message of type 'LFstatus-request"
  (cl:format cl:nil "string sensor_position    #expect sensor position to be one of the following strings: lf_il, lf_ol, lf_ir, lf_ol~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LFstatus-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sensor_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LFstatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LFstatus-request
    (cl:cons ':sensor_position (sensor_position msg))
))
;//! \htmlinclude LFstatus-response.msg.html

(cl:defclass <LFstatus-response> (roslisp-msg-protocol:ros-message)
  ((voltage
    :reader voltage
    :initarg :voltage
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LFstatus-response (<LFstatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LFstatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LFstatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<LFstatus-response> is deprecated: use duckietown_msgs-srv:LFstatus-response instead.")))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <LFstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:voltage-val is deprecated.  Use duckietown_msgs-srv:voltage instead.")
  (voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LFstatus-response>) ostream)
  "Serializes a message object of type '<LFstatus-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'voltage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'voltage)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LFstatus-response>) istream)
  "Deserializes a message object of type '<LFstatus-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'voltage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'voltage)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LFstatus-response>)))
  "Returns string type for a service object of type '<LFstatus-response>"
  "duckietown_msgs/LFstatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LFstatus-response)))
  "Returns string type for a service object of type 'LFstatus-response"
  "duckietown_msgs/LFstatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LFstatus-response>)))
  "Returns md5sum for a message object of type '<LFstatus-response>"
  "b59a0adbfa1b994feb973fdc4fcbe6db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LFstatus-response)))
  "Returns md5sum for a message object of type 'LFstatus-response"
  "b59a0adbfa1b994feb973fdc4fcbe6db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LFstatus-response>)))
  "Returns full string definition for message of type '<LFstatus-response>"
  (cl:format cl:nil "uint16 voltage~%#string timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LFstatus-response)))
  "Returns full string definition for message of type 'LFstatus-response"
  (cl:format cl:nil "uint16 voltage~%#string timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LFstatus-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LFstatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LFstatus-response
    (cl:cons ':voltage (voltage msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LFstatus)))
  'LFstatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LFstatus)))
  'LFstatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LFstatus)))
  "Returns string type for a service object of type '<LFstatus>"
  "duckietown_msgs/LFstatus")