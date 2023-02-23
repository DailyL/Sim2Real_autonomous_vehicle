; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AprilTagDetectionArray.msg.html

(cl:defclass <AprilTagDetectionArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector duckietown_msgs-msg:AprilTagDetection)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:AprilTagDetection :initial-element (cl:make-instance 'duckietown_msgs-msg:AprilTagDetection))))
)

(cl:defclass AprilTagDetectionArray (<AprilTagDetectionArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AprilTagDetectionArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AprilTagDetectionArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AprilTagDetectionArray> is deprecated: use duckietown_msgs-msg:AprilTagDetectionArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AprilTagDetectionArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <AprilTagDetectionArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:detections-val is deprecated.  Use duckietown_msgs-msg:detections instead.")
  (detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AprilTagDetectionArray>) ostream)
  "Serializes a message object of type '<AprilTagDetectionArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AprilTagDetectionArray>) istream)
  "Deserializes a message object of type '<AprilTagDetectionArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:AprilTagDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AprilTagDetectionArray>)))
  "Returns string type for a message object of type '<AprilTagDetectionArray>"
  "duckietown_msgs/AprilTagDetectionArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AprilTagDetectionArray)))
  "Returns string type for a message object of type 'AprilTagDetectionArray"
  "duckietown_msgs/AprilTagDetectionArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AprilTagDetectionArray>)))
  "Returns md5sum for a message object of type '<AprilTagDetectionArray>"
  "21f977fd1654c0bf67532acd641c3d4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AprilTagDetectionArray)))
  "Returns md5sum for a message object of type 'AprilTagDetectionArray"
  "21f977fd1654c0bf67532acd641c3d4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AprilTagDetectionArray>)))
  "Returns full string definition for message of type '<AprilTagDetectionArray>"
  (cl:format cl:nil "Header header~%AprilTagDetection[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/AprilTagDetection~%geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AprilTagDetectionArray)))
  "Returns full string definition for message of type 'AprilTagDetectionArray"
  (cl:format cl:nil "Header header~%AprilTagDetection[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/AprilTagDetection~%geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AprilTagDetectionArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AprilTagDetectionArray>))
  "Converts a ROS message object to a list"
  (cl:list 'AprilTagDetectionArray
    (cl:cons ':header (header msg))
    (cl:cons ':detections (detections msg))
))
