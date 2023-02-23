; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude ToFstatus-request.msg.html

(cl:defclass <ToFstatus-request> (roslisp-msg-protocol:ros-message)
  ((sensor_position
    :reader sensor_position
    :initarg :sensor_position
    :type cl:string
    :initform ""))
)

(cl:defclass ToFstatus-request (<ToFstatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToFstatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToFstatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<ToFstatus-request> is deprecated: use duckietown_msgs-srv:ToFstatus-request instead.")))

(cl:ensure-generic-function 'sensor_position-val :lambda-list '(m))
(cl:defmethod sensor_position-val ((m <ToFstatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:sensor_position-val is deprecated.  Use duckietown_msgs-srv:sensor_position instead.")
  (sensor_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToFstatus-request>) ostream)
  "Serializes a message object of type '<ToFstatus-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sensor_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sensor_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToFstatus-request>) istream)
  "Deserializes a message object of type '<ToFstatus-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToFstatus-request>)))
  "Returns string type for a service object of type '<ToFstatus-request>"
  "duckietown_msgs/ToFstatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToFstatus-request)))
  "Returns string type for a service object of type 'ToFstatus-request"
  "duckietown_msgs/ToFstatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToFstatus-request>)))
  "Returns md5sum for a message object of type '<ToFstatus-request>"
  "123f458c8760917a4db65e882cc7f43c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToFstatus-request)))
  "Returns md5sum for a message object of type 'ToFstatus-request"
  "123f458c8760917a4db65e882cc7f43c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToFstatus-request>)))
  "Returns full string definition for message of type '<ToFstatus-request>"
  (cl:format cl:nil "string sensor_position    #expect tof_fl, tof_fm, tof_fr, tof_sl, tof_sr, tof_bl, tof_br~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToFstatus-request)))
  "Returns full string definition for message of type 'ToFstatus-request"
  (cl:format cl:nil "string sensor_position    #expect tof_fl, tof_fm, tof_fr, tof_sl, tof_sr, tof_bl, tof_br~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToFstatus-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sensor_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToFstatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ToFstatus-request
    (cl:cons ':sensor_position (sensor_position msg))
))
;//! \htmlinclude ToFstatus-response.msg.html

(cl:defclass <ToFstatus-response> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:fixnum
    :initform 0)
   (confidenceValue
    :reader confidenceValue
    :initarg :confidenceValue
    :type cl:fixnum
    :initform 0)
   (validPixels
    :reader validPixels
    :initarg :validPixels
    :type cl:fixnum
    :initform 0)
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:string
    :initform ""))
)

(cl:defclass ToFstatus-response (<ToFstatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ToFstatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ToFstatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<ToFstatus-response> is deprecated: use duckietown_msgs-srv:ToFstatus-response instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ToFstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:distance-val is deprecated.  Use duckietown_msgs-srv:distance instead.")
  (distance m))

(cl:ensure-generic-function 'confidenceValue-val :lambda-list '(m))
(cl:defmethod confidenceValue-val ((m <ToFstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:confidenceValue-val is deprecated.  Use duckietown_msgs-srv:confidenceValue instead.")
  (confidenceValue m))

(cl:ensure-generic-function 'validPixels-val :lambda-list '(m))
(cl:defmethod validPixels-val ((m <ToFstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:validPixels-val is deprecated.  Use duckietown_msgs-srv:validPixels instead.")
  (validPixels m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <ToFstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:timeStamp-val is deprecated.  Use duckietown_msgs-srv:timeStamp instead.")
  (timeStamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ToFstatus-response>) ostream)
  "Serializes a message object of type '<ToFstatus-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'confidenceValue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'confidenceValue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'validPixels)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'validPixels)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timeStamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timeStamp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ToFstatus-response>) istream)
  "Deserializes a message object of type '<ToFstatus-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'distance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'distance)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'confidenceValue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'confidenceValue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'validPixels)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'validPixels)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeStamp) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timeStamp) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ToFstatus-response>)))
  "Returns string type for a service object of type '<ToFstatus-response>"
  "duckietown_msgs/ToFstatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToFstatus-response)))
  "Returns string type for a service object of type 'ToFstatus-response"
  "duckietown_msgs/ToFstatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ToFstatus-response>)))
  "Returns md5sum for a message object of type '<ToFstatus-response>"
  "123f458c8760917a4db65e882cc7f43c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ToFstatus-response)))
  "Returns md5sum for a message object of type 'ToFstatus-response"
  "123f458c8760917a4db65e882cc7f43c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ToFstatus-response>)))
  "Returns full string definition for message of type '<ToFstatus-response>"
  (cl:format cl:nil "uint16 distance~%uint16 confidenceValue~%uint16 validPixels~%string timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ToFstatus-response)))
  "Returns full string definition for message of type 'ToFstatus-response"
  (cl:format cl:nil "uint16 distance~%uint16 confidenceValue~%uint16 validPixels~%string timeStamp~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ToFstatus-response>))
  (cl:+ 0
     2
     2
     2
     4 (cl:length (cl:slot-value msg 'timeStamp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ToFstatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ToFstatus-response
    (cl:cons ':distance (distance msg))
    (cl:cons ':confidenceValue (confidenceValue msg))
    (cl:cons ':validPixels (validPixels msg))
    (cl:cons ':timeStamp (timeStamp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ToFstatus)))
  'ToFstatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ToFstatus)))
  'ToFstatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ToFstatus)))
  "Returns string type for a service object of type '<ToFstatus>"
  "duckietown_msgs/ToFstatus")