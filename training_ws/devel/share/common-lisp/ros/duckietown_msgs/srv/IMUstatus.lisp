; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude IMUstatus-request.msg.html

(cl:defclass <IMUstatus-request> (roslisp-msg-protocol:ros-message)
  ((sensor_position
    :reader sensor_position
    :initarg :sensor_position
    :type cl:string
    :initform ""))
)

(cl:defclass IMUstatus-request (<IMUstatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IMUstatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IMUstatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<IMUstatus-request> is deprecated: use duckietown_msgs-srv:IMUstatus-request instead.")))

(cl:ensure-generic-function 'sensor_position-val :lambda-list '(m))
(cl:defmethod sensor_position-val ((m <IMUstatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:sensor_position-val is deprecated.  Use duckietown_msgs-srv:sensor_position instead.")
  (sensor_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IMUstatus-request>) ostream)
  "Serializes a message object of type '<IMUstatus-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sensor_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sensor_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IMUstatus-request>) istream)
  "Deserializes a message object of type '<IMUstatus-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IMUstatus-request>)))
  "Returns string type for a service object of type '<IMUstatus-request>"
  "duckietown_msgs/IMUstatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IMUstatus-request)))
  "Returns string type for a service object of type 'IMUstatus-request"
  "duckietown_msgs/IMUstatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IMUstatus-request>)))
  "Returns md5sum for a message object of type '<IMUstatus-request>"
  "508fbfdea8b0319f1b2a5826eac9a6e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IMUstatus-request)))
  "Returns md5sum for a message object of type 'IMUstatus-request"
  "508fbfdea8b0319f1b2a5826eac9a6e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IMUstatus-request>)))
  "Returns full string definition for message of type '<IMUstatus-request>"
  (cl:format cl:nil "string sensor_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IMUstatus-request)))
  "Returns full string definition for message of type 'IMUstatus-request"
  (cl:format cl:nil "string sensor_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IMUstatus-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sensor_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IMUstatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'IMUstatus-request
    (cl:cons ':sensor_position (sensor_position msg))
))
;//! \htmlinclude IMUstatus-response.msg.html

(cl:defclass <IMUstatus-response> (roslisp-msg-protocol:ros-message)
  ((acceleration_x
    :reader acceleration_x
    :initarg :acceleration_x
    :type cl:float
    :initform 0.0)
   (acceleration_y
    :reader acceleration_y
    :initarg :acceleration_y
    :type cl:float
    :initform 0.0)
   (acceleration_z
    :reader acceleration_z
    :initarg :acceleration_z
    :type cl:float
    :initform 0.0)
   (timestamp_acceleration
    :reader timestamp_acceleration
    :initarg :timestamp_acceleration
    :type cl:string
    :initform "")
   (gyro_x
    :reader gyro_x
    :initarg :gyro_x
    :type cl:float
    :initform 0.0)
   (gyro_y
    :reader gyro_y
    :initarg :gyro_y
    :type cl:float
    :initform 0.0)
   (gyro_z
    :reader gyro_z
    :initarg :gyro_z
    :type cl:float
    :initform 0.0)
   (timestamp_gyro
    :reader timestamp_gyro
    :initarg :timestamp_gyro
    :type cl:string
    :initform "")
   (magentic_field_x
    :reader magentic_field_x
    :initarg :magentic_field_x
    :type cl:float
    :initform 0.0)
   (magentic_field_y
    :reader magentic_field_y
    :initarg :magentic_field_y
    :type cl:float
    :initform 0.0)
   (magentic_field_z
    :reader magentic_field_z
    :initarg :magentic_field_z
    :type cl:float
    :initform 0.0)
   (timestamp_magnetic_field
    :reader timestamp_magnetic_field
    :initarg :timestamp_magnetic_field
    :type cl:string
    :initform "")
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass IMUstatus-response (<IMUstatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IMUstatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IMUstatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<IMUstatus-response> is deprecated: use duckietown_msgs-srv:IMUstatus-response instead.")))

(cl:ensure-generic-function 'acceleration_x-val :lambda-list '(m))
(cl:defmethod acceleration_x-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:acceleration_x-val is deprecated.  Use duckietown_msgs-srv:acceleration_x instead.")
  (acceleration_x m))

(cl:ensure-generic-function 'acceleration_y-val :lambda-list '(m))
(cl:defmethod acceleration_y-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:acceleration_y-val is deprecated.  Use duckietown_msgs-srv:acceleration_y instead.")
  (acceleration_y m))

(cl:ensure-generic-function 'acceleration_z-val :lambda-list '(m))
(cl:defmethod acceleration_z-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:acceleration_z-val is deprecated.  Use duckietown_msgs-srv:acceleration_z instead.")
  (acceleration_z m))

(cl:ensure-generic-function 'timestamp_acceleration-val :lambda-list '(m))
(cl:defmethod timestamp_acceleration-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:timestamp_acceleration-val is deprecated.  Use duckietown_msgs-srv:timestamp_acceleration instead.")
  (timestamp_acceleration m))

(cl:ensure-generic-function 'gyro_x-val :lambda-list '(m))
(cl:defmethod gyro_x-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:gyro_x-val is deprecated.  Use duckietown_msgs-srv:gyro_x instead.")
  (gyro_x m))

(cl:ensure-generic-function 'gyro_y-val :lambda-list '(m))
(cl:defmethod gyro_y-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:gyro_y-val is deprecated.  Use duckietown_msgs-srv:gyro_y instead.")
  (gyro_y m))

(cl:ensure-generic-function 'gyro_z-val :lambda-list '(m))
(cl:defmethod gyro_z-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:gyro_z-val is deprecated.  Use duckietown_msgs-srv:gyro_z instead.")
  (gyro_z m))

(cl:ensure-generic-function 'timestamp_gyro-val :lambda-list '(m))
(cl:defmethod timestamp_gyro-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:timestamp_gyro-val is deprecated.  Use duckietown_msgs-srv:timestamp_gyro instead.")
  (timestamp_gyro m))

(cl:ensure-generic-function 'magentic_field_x-val :lambda-list '(m))
(cl:defmethod magentic_field_x-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:magentic_field_x-val is deprecated.  Use duckietown_msgs-srv:magentic_field_x instead.")
  (magentic_field_x m))

(cl:ensure-generic-function 'magentic_field_y-val :lambda-list '(m))
(cl:defmethod magentic_field_y-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:magentic_field_y-val is deprecated.  Use duckietown_msgs-srv:magentic_field_y instead.")
  (magentic_field_y m))

(cl:ensure-generic-function 'magentic_field_z-val :lambda-list '(m))
(cl:defmethod magentic_field_z-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:magentic_field_z-val is deprecated.  Use duckietown_msgs-srv:magentic_field_z instead.")
  (magentic_field_z m))

(cl:ensure-generic-function 'timestamp_magnetic_field-val :lambda-list '(m))
(cl:defmethod timestamp_magnetic_field-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:timestamp_magnetic_field-val is deprecated.  Use duckietown_msgs-srv:timestamp_magnetic_field instead.")
  (timestamp_magnetic_field m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <IMUstatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:temperature-val is deprecated.  Use duckietown_msgs-srv:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IMUstatus-response>) ostream)
  "Serializes a message object of type '<IMUstatus-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timestamp_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timestamp_acceleration))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyro_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyro_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gyro_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timestamp_gyro))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timestamp_gyro))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'magentic_field_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'magentic_field_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'magentic_field_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'timestamp_magnetic_field))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'timestamp_magnetic_field))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IMUstatus-response>) istream)
  "Deserializes a message object of type '<IMUstatus-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_acceleration) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timestamp_acceleration) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyro_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyro_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gyro_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_gyro) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timestamp_gyro) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'magentic_field_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'magentic_field_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'magentic_field_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_magnetic_field) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'timestamp_magnetic_field) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IMUstatus-response>)))
  "Returns string type for a service object of type '<IMUstatus-response>"
  "duckietown_msgs/IMUstatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IMUstatus-response)))
  "Returns string type for a service object of type 'IMUstatus-response"
  "duckietown_msgs/IMUstatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IMUstatus-response>)))
  "Returns md5sum for a message object of type '<IMUstatus-response>"
  "508fbfdea8b0319f1b2a5826eac9a6e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IMUstatus-response)))
  "Returns md5sum for a message object of type 'IMUstatus-response"
  "508fbfdea8b0319f1b2a5826eac9a6e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IMUstatus-response>)))
  "Returns full string definition for message of type '<IMUstatus-response>"
  (cl:format cl:nil "float32 acceleration_x~%float32 acceleration_y~%float32 acceleration_z~%string timestamp_acceleration~%float32 gyro_x~%float32 gyro_y~%float32 gyro_z~%string timestamp_gyro~%float32 magentic_field_x~%float32 magentic_field_y~%float32 magentic_field_z~%string timestamp_magnetic_field~%float32 temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IMUstatus-response)))
  "Returns full string definition for message of type 'IMUstatus-response"
  (cl:format cl:nil "float32 acceleration_x~%float32 acceleration_y~%float32 acceleration_z~%string timestamp_acceleration~%float32 gyro_x~%float32 gyro_y~%float32 gyro_z~%string timestamp_gyro~%float32 magentic_field_x~%float32 magentic_field_y~%float32 magentic_field_z~%string timestamp_magnetic_field~%float32 temperature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IMUstatus-response>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'timestamp_acceleration))
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'timestamp_gyro))
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'timestamp_magnetic_field))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IMUstatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'IMUstatus-response
    (cl:cons ':acceleration_x (acceleration_x msg))
    (cl:cons ':acceleration_y (acceleration_y msg))
    (cl:cons ':acceleration_z (acceleration_z msg))
    (cl:cons ':timestamp_acceleration (timestamp_acceleration msg))
    (cl:cons ':gyro_x (gyro_x msg))
    (cl:cons ':gyro_y (gyro_y msg))
    (cl:cons ':gyro_z (gyro_z msg))
    (cl:cons ':timestamp_gyro (timestamp_gyro msg))
    (cl:cons ':magentic_field_x (magentic_field_x msg))
    (cl:cons ':magentic_field_y (magentic_field_y msg))
    (cl:cons ':magentic_field_z (magentic_field_z msg))
    (cl:cons ':timestamp_magnetic_field (timestamp_magnetic_field msg))
    (cl:cons ':temperature (temperature msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'IMUstatus)))
  'IMUstatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'IMUstatus)))
  'IMUstatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IMUstatus)))
  "Returns string type for a service object of type '<IMUstatus>"
  "duckietown_msgs/IMUstatus")