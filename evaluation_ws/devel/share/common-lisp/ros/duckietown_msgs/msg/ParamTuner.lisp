; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ParamTuner.msg.html

(cl:defclass <ParamTuner> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (cross_track_err
    :reader cross_track_err
    :initarg :cross_track_err
    :type cl:float
    :initform 0.0)
   (cross_track_integral
    :reader cross_track_integral
    :initarg :cross_track_integral
    :type cl:float
    :initform 0.0)
   (diff_cross_track_err
    :reader diff_cross_track_err
    :initarg :diff_cross_track_err
    :type cl:float
    :initform 0.0)
   (heading_err
    :reader heading_err
    :initarg :heading_err
    :type cl:float
    :initform 0.0)
   (heading_integral
    :reader heading_integral
    :initarg :heading_integral
    :type cl:float
    :initform 0.0)
   (diff_heading_err
    :reader diff_heading_err
    :initarg :diff_heading_err
    :type cl:float
    :initform 0.0)
   (dt
    :reader dt
    :initarg :dt
    :type cl:float
    :initform 0.0))
)

(cl:defclass ParamTuner (<ParamTuner>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ParamTuner>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ParamTuner)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ParamTuner> is deprecated: use duckietown_msgs-msg:ParamTuner instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'cross_track_err-val :lambda-list '(m))
(cl:defmethod cross_track_err-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:cross_track_err-val is deprecated.  Use duckietown_msgs-msg:cross_track_err instead.")
  (cross_track_err m))

(cl:ensure-generic-function 'cross_track_integral-val :lambda-list '(m))
(cl:defmethod cross_track_integral-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:cross_track_integral-val is deprecated.  Use duckietown_msgs-msg:cross_track_integral instead.")
  (cross_track_integral m))

(cl:ensure-generic-function 'diff_cross_track_err-val :lambda-list '(m))
(cl:defmethod diff_cross_track_err-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:diff_cross_track_err-val is deprecated.  Use duckietown_msgs-msg:diff_cross_track_err instead.")
  (diff_cross_track_err m))

(cl:ensure-generic-function 'heading_err-val :lambda-list '(m))
(cl:defmethod heading_err-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:heading_err-val is deprecated.  Use duckietown_msgs-msg:heading_err instead.")
  (heading_err m))

(cl:ensure-generic-function 'heading_integral-val :lambda-list '(m))
(cl:defmethod heading_integral-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:heading_integral-val is deprecated.  Use duckietown_msgs-msg:heading_integral instead.")
  (heading_integral m))

(cl:ensure-generic-function 'diff_heading_err-val :lambda-list '(m))
(cl:defmethod diff_heading_err-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:diff_heading_err-val is deprecated.  Use duckietown_msgs-msg:diff_heading_err instead.")
  (diff_heading_err m))

(cl:ensure-generic-function 'dt-val :lambda-list '(m))
(cl:defmethod dt-val ((m <ParamTuner>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:dt-val is deprecated.  Use duckietown_msgs-msg:dt instead.")
  (dt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ParamTuner>) ostream)
  "Serializes a message object of type '<ParamTuner>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cross_track_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cross_track_integral))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'diff_cross_track_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading_integral))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'diff_heading_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ParamTuner>) istream)
  "Deserializes a message object of type '<ParamTuner>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cross_track_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cross_track_integral) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'diff_cross_track_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading_integral) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'diff_heading_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dt) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ParamTuner>)))
  "Returns string type for a message object of type '<ParamTuner>"
  "duckietown_msgs/ParamTuner")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ParamTuner)))
  "Returns string type for a message object of type 'ParamTuner"
  "duckietown_msgs/ParamTuner")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ParamTuner>)))
  "Returns md5sum for a message object of type '<ParamTuner>"
  "53c42bf2be1bd4386da34eca6088702d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ParamTuner)))
  "Returns md5sum for a message object of type 'ParamTuner"
  "53c42bf2be1bd4386da34eca6088702d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ParamTuner>)))
  "Returns full string definition for message of type '<ParamTuner>"
  (cl:format cl:nil "Header header~%float32 cross_track_err~%float32 cross_track_integral~%float32 diff_cross_track_err~%float32 heading_err~%float32 heading_integral~%float32 diff_heading_err~%float32 dt~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ParamTuner)))
  "Returns full string definition for message of type 'ParamTuner"
  (cl:format cl:nil "Header header~%float32 cross_track_err~%float32 cross_track_integral~%float32 diff_cross_track_err~%float32 heading_err~%float32 heading_integral~%float32 diff_heading_err~%float32 dt~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ParamTuner>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ParamTuner>))
  "Converts a ROS message object to a list"
  (cl:list 'ParamTuner
    (cl:cons ':header (header msg))
    (cl:cons ':cross_track_err (cross_track_err msg))
    (cl:cons ':cross_track_integral (cross_track_integral msg))
    (cl:cons ':diff_cross_track_err (diff_cross_track_err msg))
    (cl:cons ':heading_err (heading_err msg))
    (cl:cons ':heading_integral (heading_integral msg))
    (cl:cons ':diff_heading_err (diff_heading_err msg))
    (cl:cons ':dt (dt msg))
))
