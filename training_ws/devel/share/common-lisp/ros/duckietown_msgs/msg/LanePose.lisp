; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude LanePose.msg.html

(cl:defclass <LanePose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (d
    :reader d
    :initarg :d
    :type cl:float
    :initform 0.0)
   (sigma_d
    :reader sigma_d
    :initarg :sigma_d
    :type cl:float
    :initform 0.0)
   (phi
    :reader phi
    :initarg :phi
    :type cl:float
    :initform 0.0)
   (sigma_phi
    :reader sigma_phi
    :initarg :sigma_phi
    :type cl:float
    :initform 0.0)
   (status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0)
   (in_lane
    :reader in_lane
    :initarg :in_lane
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LanePose (<LanePose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LanePose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LanePose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<LanePose> is deprecated: use duckietown_msgs-msg:LanePose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'd-val :lambda-list '(m))
(cl:defmethod d-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:d-val is deprecated.  Use duckietown_msgs-msg:d instead.")
  (d m))

(cl:ensure-generic-function 'sigma_d-val :lambda-list '(m))
(cl:defmethod sigma_d-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:sigma_d-val is deprecated.  Use duckietown_msgs-msg:sigma_d instead.")
  (sigma_d m))

(cl:ensure-generic-function 'phi-val :lambda-list '(m))
(cl:defmethod phi-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:phi-val is deprecated.  Use duckietown_msgs-msg:phi instead.")
  (phi m))

(cl:ensure-generic-function 'sigma_phi-val :lambda-list '(m))
(cl:defmethod sigma_phi-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:sigma_phi-val is deprecated.  Use duckietown_msgs-msg:sigma_phi instead.")
  (sigma_phi m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:status-val is deprecated.  Use duckietown_msgs-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'in_lane-val :lambda-list '(m))
(cl:defmethod in_lane-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:in_lane-val is deprecated.  Use duckietown_msgs-msg:in_lane instead.")
  (in_lane m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LanePose>)))
    "Constants for message type '<LanePose>"
  '((:NORMAL . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LanePose)))
    "Constants for message type 'LanePose"
  '((:NORMAL . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LanePose>) ostream)
  "Serializes a message object of type '<LanePose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'phi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sigma_phi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'in_lane) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LanePose>) istream)
  "Deserializes a message object of type '<LanePose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'd) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_d) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'phi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sigma_phi) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'in_lane) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LanePose>)))
  "Returns string type for a message object of type '<LanePose>"
  "duckietown_msgs/LanePose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LanePose)))
  "Returns string type for a message object of type 'LanePose"
  "duckietown_msgs/LanePose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LanePose>)))
  "Returns md5sum for a message object of type '<LanePose>"
  "248b875aed9afcb389413014f9465bf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LanePose)))
  "Returns md5sum for a message object of type 'LanePose"
  "248b875aed9afcb389413014f9465bf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LanePose>)))
  "Returns full string definition for message of type '<LanePose>"
  (cl:format cl:nil "Header header~%float32 d   #lateral offset~%float32 sigma_d~%float32 phi #heading error~%float32 sigma_phi~%int32 status~%bool in_lane~%#Enum for status~%int32 NORMAL=0~%int32 ERROR=1 ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LanePose)))
  "Returns full string definition for message of type 'LanePose"
  (cl:format cl:nil "Header header~%float32 d   #lateral offset~%float32 sigma_d~%float32 phi #heading error~%float32 sigma_phi~%int32 status~%bool in_lane~%#Enum for status~%int32 NORMAL=0~%int32 ERROR=1 ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LanePose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LanePose>))
  "Converts a ROS message object to a list"
  (cl:list 'LanePose
    (cl:cons ':header (header msg))
    (cl:cons ':d (d msg))
    (cl:cons ':sigma_d (sigma_d msg))
    (cl:cons ':phi (phi msg))
    (cl:cons ':sigma_phi (sigma_phi msg))
    (cl:cons ':status (status msg))
    (cl:cons ':in_lane (in_lane msg))
))
