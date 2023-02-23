; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude IntersectionPoseImgDebug.msg.html

(cl:defclass <IntersectionPoseImgDebug> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0)
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (likelihood
    :reader likelihood
    :initarg :likelihood
    :type cl:float
    :initform 0.0)
   (x_init
    :reader x_init
    :initarg :x_init
    :type cl:float
    :initform 0.0)
   (y_init
    :reader y_init
    :initarg :y_init
    :type cl:float
    :initform 0.0)
   (theta_init
    :reader theta_init
    :initarg :theta_init
    :type cl:float
    :initform 0.0)
   (img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage)))
)

(cl:defclass IntersectionPoseImgDebug (<IntersectionPoseImgDebug>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IntersectionPoseImgDebug>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IntersectionPoseImgDebug)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<IntersectionPoseImgDebug> is deprecated: use duckietown_msgs-msg:IntersectionPoseImgDebug instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:x-val is deprecated.  Use duckietown_msgs-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:y-val is deprecated.  Use duckietown_msgs-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:theta-val is deprecated.  Use duckietown_msgs-msg:theta instead.")
  (theta m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:type-val is deprecated.  Use duckietown_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'likelihood-val :lambda-list '(m))
(cl:defmethod likelihood-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:likelihood-val is deprecated.  Use duckietown_msgs-msg:likelihood instead.")
  (likelihood m))

(cl:ensure-generic-function 'x_init-val :lambda-list '(m))
(cl:defmethod x_init-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:x_init-val is deprecated.  Use duckietown_msgs-msg:x_init instead.")
  (x_init m))

(cl:ensure-generic-function 'y_init-val :lambda-list '(m))
(cl:defmethod y_init-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:y_init-val is deprecated.  Use duckietown_msgs-msg:y_init instead.")
  (y_init m))

(cl:ensure-generic-function 'theta_init-val :lambda-list '(m))
(cl:defmethod theta_init-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:theta_init-val is deprecated.  Use duckietown_msgs-msg:theta_init instead.")
  (theta_init m))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <IntersectionPoseImgDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:img-val is deprecated.  Use duckietown_msgs-msg:img instead.")
  (img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IntersectionPoseImgDebug>) ostream)
  "Serializes a message object of type '<IntersectionPoseImgDebug>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'likelihood))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_init))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_init))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta_init))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IntersectionPoseImgDebug>) istream)
  "Deserializes a message object of type '<IntersectionPoseImgDebug>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'likelihood) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_init) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_init) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta_init) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IntersectionPoseImgDebug>)))
  "Returns string type for a message object of type '<IntersectionPoseImgDebug>"
  "duckietown_msgs/IntersectionPoseImgDebug")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IntersectionPoseImgDebug)))
  "Returns string type for a message object of type 'IntersectionPoseImgDebug"
  "duckietown_msgs/IntersectionPoseImgDebug")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IntersectionPoseImgDebug>)))
  "Returns md5sum for a message object of type '<IntersectionPoseImgDebug>"
  "0027b9b3f880873af8e49663f8172f1a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IntersectionPoseImgDebug)))
  "Returns md5sum for a message object of type 'IntersectionPoseImgDebug"
  "0027b9b3f880873af8e49663f8172f1a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IntersectionPoseImgDebug>)))
  "Returns full string definition for message of type '<IntersectionPoseImgDebug>"
  (cl:format cl:nil "Header header~%float32 x~%float32 y~%float32 theta~%uint8 type~%float32 likelihood~%float32 x_init~%float32 y_init~%float32 theta_init~%sensor_msgs/CompressedImage img~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IntersectionPoseImgDebug)))
  "Returns full string definition for message of type 'IntersectionPoseImgDebug"
  (cl:format cl:nil "Header header~%float32 x~%float32 y~%float32 theta~%uint8 type~%float32 likelihood~%float32 x_init~%float32 y_init~%float32 theta_init~%sensor_msgs/CompressedImage img~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IntersectionPoseImgDebug>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     1
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IntersectionPoseImgDebug>))
  "Converts a ROS message object to a list"
  (cl:list 'IntersectionPoseImgDebug
    (cl:cons ':header (header msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':type (type msg))
    (cl:cons ':likelihood (likelihood msg))
    (cl:cons ':x_init (x_init msg))
    (cl:cons ':y_init (y_init msg))
    (cl:cons ':theta_init (theta_init msg))
    (cl:cons ':img (img msg))
))
