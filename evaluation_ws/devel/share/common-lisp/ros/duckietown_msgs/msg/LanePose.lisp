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
   (d_ref
    :reader d_ref
    :initarg :d_ref
    :type cl:float
    :initform 0.0)
   (phi
    :reader phi
    :initarg :phi
    :type cl:float
    :initform 0.0)
   (phi_ref
    :reader phi_ref
    :initarg :phi_ref
    :type cl:float
    :initform 0.0)
   (d_phi_covariance
    :reader d_phi_covariance
    :initarg :d_phi_covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (curvature
    :reader curvature
    :initarg :curvature
    :type cl:float
    :initform 0.0)
   (curvature_ref
    :reader curvature_ref
    :initarg :curvature_ref
    :type cl:float
    :initform 0.0)
   (v_ref
    :reader v_ref
    :initarg :v_ref
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

(cl:ensure-generic-function 'd_ref-val :lambda-list '(m))
(cl:defmethod d_ref-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:d_ref-val is deprecated.  Use duckietown_msgs-msg:d_ref instead.")
  (d_ref m))

(cl:ensure-generic-function 'phi-val :lambda-list '(m))
(cl:defmethod phi-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:phi-val is deprecated.  Use duckietown_msgs-msg:phi instead.")
  (phi m))

(cl:ensure-generic-function 'phi_ref-val :lambda-list '(m))
(cl:defmethod phi_ref-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:phi_ref-val is deprecated.  Use duckietown_msgs-msg:phi_ref instead.")
  (phi_ref m))

(cl:ensure-generic-function 'd_phi_covariance-val :lambda-list '(m))
(cl:defmethod d_phi_covariance-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:d_phi_covariance-val is deprecated.  Use duckietown_msgs-msg:d_phi_covariance instead.")
  (d_phi_covariance m))

(cl:ensure-generic-function 'curvature-val :lambda-list '(m))
(cl:defmethod curvature-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:curvature-val is deprecated.  Use duckietown_msgs-msg:curvature instead.")
  (curvature m))

(cl:ensure-generic-function 'curvature_ref-val :lambda-list '(m))
(cl:defmethod curvature_ref-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:curvature_ref-val is deprecated.  Use duckietown_msgs-msg:curvature_ref instead.")
  (curvature_ref m))

(cl:ensure-generic-function 'v_ref-val :lambda-list '(m))
(cl:defmethod v_ref-val ((m <LanePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:v_ref-val is deprecated.  Use duckietown_msgs-msg:v_ref instead.")
  (v_ref m))

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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'd_ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'phi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'phi_ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'd_phi_covariance))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'curvature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'curvature_ref))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_ref))))
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
    (cl:setf (cl:slot-value msg 'd_ref) (roslisp-utils:decode-single-float-bits bits)))
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
    (cl:setf (cl:slot-value msg 'phi_ref) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'd_phi_covariance) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'd_phi_covariance)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'curvature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'curvature_ref) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_ref) (roslisp-utils:decode-single-float-bits bits)))
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
  "382fe0e0d5dea7350bfa93535592e68a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LanePose)))
  "Returns md5sum for a message object of type 'LanePose"
  "382fe0e0d5dea7350bfa93535592e68a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LanePose>)))
  "Returns full string definition for message of type '<LanePose>"
  (cl:format cl:nil "Header header~%float32 d   #lateral offset~%float32 d_ref #lateral offset reference~%float32 phi #heading error~%float32 phi_ref #heading error reference~%float32[4] d_phi_covariance~%float32 curvature~%float32 curvature_ref # Refernece Curvature~%float32 v_ref # Referenece Velocity~%int32 status #Status of duckietbot 0 if normal, 1 if error is encountered~%bool in_lane #Status of duckietbot in lane~%~%#Enum for status~%int32 NORMAL=0~%int32 ERROR=1~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LanePose)))
  "Returns full string definition for message of type 'LanePose"
  (cl:format cl:nil "Header header~%float32 d   #lateral offset~%float32 d_ref #lateral offset reference~%float32 phi #heading error~%float32 phi_ref #heading error reference~%float32[4] d_phi_covariance~%float32 curvature~%float32 curvature_ref # Refernece Curvature~%float32 v_ref # Referenece Velocity~%int32 status #Status of duckietbot 0 if normal, 1 if error is encountered~%bool in_lane #Status of duckietbot in lane~%~%#Enum for status~%int32 NORMAL=0~%int32 ERROR=1~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LanePose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'd_phi_covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
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
    (cl:cons ':d_ref (d_ref msg))
    (cl:cons ':phi (phi msg))
    (cl:cons ':phi_ref (phi_ref msg))
    (cl:cons ':d_phi_covariance (d_phi_covariance msg))
    (cl:cons ':curvature (curvature msg))
    (cl:cons ':curvature_ref (curvature_ref msg))
    (cl:cons ':v_ref (v_ref msg))
    (cl:cons ':status (status msg))
    (cl:cons ':in_lane (in_lane msg))
))
