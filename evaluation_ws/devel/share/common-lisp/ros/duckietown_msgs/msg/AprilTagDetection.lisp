; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AprilTagDetection.msg.html

(cl:defclass <AprilTagDetection> (roslisp-msg-protocol:ros-message)
  ((transform
    :reader transform
    :initarg :transform
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform))
   (tag_id
    :reader tag_id
    :initarg :tag_id
    :type cl:integer
    :initform 0)
   (tag_family
    :reader tag_family
    :initarg :tag_family
    :type cl:string
    :initform "")
   (hamming
    :reader hamming
    :initarg :hamming
    :type cl:integer
    :initform 0)
   (decision_margin
    :reader decision_margin
    :initarg :decision_margin
    :type cl:float
    :initform 0.0)
   (homography
    :reader homography
    :initarg :homography
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0))
   (center
    :reader center
    :initarg :center
    :type (cl:vector cl:float)
   :initform (cl:make-array 2 :element-type 'cl:float :initial-element 0.0))
   (corners
    :reader corners
    :initarg :corners
    :type (cl:vector cl:float)
   :initform (cl:make-array 8 :element-type 'cl:float :initial-element 0.0))
   (pose_error
    :reader pose_error
    :initarg :pose_error
    :type cl:float
    :initform 0.0))
)

(cl:defclass AprilTagDetection (<AprilTagDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AprilTagDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AprilTagDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AprilTagDetection> is deprecated: use duckietown_msgs-msg:AprilTagDetection instead.")))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:transform-val is deprecated.  Use duckietown_msgs-msg:transform instead.")
  (transform m))

(cl:ensure-generic-function 'tag_id-val :lambda-list '(m))
(cl:defmethod tag_id-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:tag_id-val is deprecated.  Use duckietown_msgs-msg:tag_id instead.")
  (tag_id m))

(cl:ensure-generic-function 'tag_family-val :lambda-list '(m))
(cl:defmethod tag_family-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:tag_family-val is deprecated.  Use duckietown_msgs-msg:tag_family instead.")
  (tag_family m))

(cl:ensure-generic-function 'hamming-val :lambda-list '(m))
(cl:defmethod hamming-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:hamming-val is deprecated.  Use duckietown_msgs-msg:hamming instead.")
  (hamming m))

(cl:ensure-generic-function 'decision_margin-val :lambda-list '(m))
(cl:defmethod decision_margin-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:decision_margin-val is deprecated.  Use duckietown_msgs-msg:decision_margin instead.")
  (decision_margin m))

(cl:ensure-generic-function 'homography-val :lambda-list '(m))
(cl:defmethod homography-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:homography-val is deprecated.  Use duckietown_msgs-msg:homography instead.")
  (homography m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:center-val is deprecated.  Use duckietown_msgs-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'corners-val :lambda-list '(m))
(cl:defmethod corners-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:corners-val is deprecated.  Use duckietown_msgs-msg:corners instead.")
  (corners m))

(cl:ensure-generic-function 'pose_error-val :lambda-list '(m))
(cl:defmethod pose_error-val ((m <AprilTagDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:pose_error-val is deprecated.  Use duckietown_msgs-msg:pose_error instead.")
  (pose_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AprilTagDetection>) ostream)
  "Serializes a message object of type '<AprilTagDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform) ostream)
  (cl:let* ((signed (cl:slot-value msg 'tag_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tag_family))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tag_family))
  (cl:let* ((signed (cl:slot-value msg 'hamming)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'decision_margin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'homography))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'center))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'corners))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pose_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AprilTagDetection>) istream)
  "Deserializes a message object of type '<AprilTagDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tag_family) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tag_family) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hamming) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'decision_margin) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'homography) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'homography)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'center) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'center)))
    (cl:dotimes (i 2)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'corners) (cl:make-array 8))
  (cl:let ((vals (cl:slot-value msg 'corners)))
    (cl:dotimes (i 8)
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
    (cl:setf (cl:slot-value msg 'pose_error) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AprilTagDetection>)))
  "Returns string type for a message object of type '<AprilTagDetection>"
  "duckietown_msgs/AprilTagDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AprilTagDetection)))
  "Returns string type for a message object of type 'AprilTagDetection"
  "duckietown_msgs/AprilTagDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AprilTagDetection>)))
  "Returns md5sum for a message object of type '<AprilTagDetection>"
  "a831190390fbef881c141df7b86598db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AprilTagDetection)))
  "Returns md5sum for a message object of type 'AprilTagDetection"
  "a831190390fbef881c141df7b86598db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AprilTagDetection>)))
  "Returns full string definition for message of type '<AprilTagDetection>"
  (cl:format cl:nil "geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AprilTagDetection)))
  "Returns full string definition for message of type 'AprilTagDetection"
  (cl:format cl:nil "geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AprilTagDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform))
     4
     4 (cl:length (cl:slot-value msg 'tag_family))
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'homography) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'center) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'corners) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AprilTagDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'AprilTagDetection
    (cl:cons ':transform (transform msg))
    (cl:cons ':tag_id (tag_id msg))
    (cl:cons ':tag_family (tag_family msg))
    (cl:cons ':hamming (hamming msg))
    (cl:cons ':decision_margin (decision_margin msg))
    (cl:cons ':homography (homography msg))
    (cl:cons ':center (center msg))
    (cl:cons ':corners (corners msg))
    (cl:cons ':pose_error (pose_error msg))
))
