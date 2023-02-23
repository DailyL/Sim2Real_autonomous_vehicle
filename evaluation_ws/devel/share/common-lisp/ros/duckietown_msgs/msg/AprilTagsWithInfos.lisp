; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude AprilTagsWithInfos.msg.html

(cl:defclass <AprilTagsWithInfos> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector duckietown_msgs-msg:AprilTagDetection)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:AprilTagDetection :initial-element (cl:make-instance 'duckietown_msgs-msg:AprilTagDetection)))
   (infos
    :reader infos
    :initarg :infos
    :type (cl:vector duckietown_msgs-msg:TagInfo)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:TagInfo :initial-element (cl:make-instance 'duckietown_msgs-msg:TagInfo))))
)

(cl:defclass AprilTagsWithInfos (<AprilTagsWithInfos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AprilTagsWithInfos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AprilTagsWithInfos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<AprilTagsWithInfos> is deprecated: use duckietown_msgs-msg:AprilTagsWithInfos instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AprilTagsWithInfos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <AprilTagsWithInfos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:detections-val is deprecated.  Use duckietown_msgs-msg:detections instead.")
  (detections m))

(cl:ensure-generic-function 'infos-val :lambda-list '(m))
(cl:defmethod infos-val ((m <AprilTagsWithInfos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:infos-val is deprecated.  Use duckietown_msgs-msg:infos instead.")
  (infos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AprilTagsWithInfos>) ostream)
  "Serializes a message object of type '<AprilTagsWithInfos>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'infos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'infos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AprilTagsWithInfos>) istream)
  "Deserializes a message object of type '<AprilTagsWithInfos>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'infos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'infos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:TagInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AprilTagsWithInfos>)))
  "Returns string type for a message object of type '<AprilTagsWithInfos>"
  "duckietown_msgs/AprilTagsWithInfos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AprilTagsWithInfos)))
  "Returns string type for a message object of type 'AprilTagsWithInfos"
  "duckietown_msgs/AprilTagsWithInfos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AprilTagsWithInfos>)))
  "Returns md5sum for a message object of type '<AprilTagsWithInfos>"
  "77712a218c71ce85b76155ff87db1adb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AprilTagsWithInfos)))
  "Returns md5sum for a message object of type 'AprilTagsWithInfos"
  "77712a218c71ce85b76155ff87db1adb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AprilTagsWithInfos>)))
  "Returns full string definition for message of type '<AprilTagsWithInfos>"
  (cl:format cl:nil "Header header~%duckietown_msgs/AprilTagDetection[] detections~%duckietown_msgs/TagInfo[] infos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/AprilTagDetection~%geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: duckietown_msgs/TagInfo~%Header header~%int32 id~%~%#(StreetName, TrafficSign, Localization, Vehicle)~%uint8 tag_type~%~%uint8 S_NAME=0~%uint8 SIGN=1	~%uint8 LIGHT=2~%uint8 LOCALIZE=3~%uint8 VEHICLE=4~%~%string street_name~%~%uint8 traffic_sign_type~%# (12 possible traffic sign types)~%~%uint8 STOP=5~%uint8 YIELD=6~%uint8 NO_RIGHT_TURN=7~%uint8 NO_LEFT_TURN=8~%uint8 ONEWAY_RIGHT=9~%uint8 ONEWAY_LEFT=10~%uint8 FOUR_WAY=11~%uint8 RIGHT_T_INTERSECT=12~%uint8 LEFT_T_INTERSECT=13~%uint8 T_INTERSECTION=14~%uint8 DO_NOT_ENTER=15~%uint8 PEDESTRIAN=16~%uint8 T_LIGHT_AHEAD=17~%uint8 DUCK_CROSSING=18~%uint8 PARKING=19~%~%string vehicle_name~%~%# Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.~%float32 location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AprilTagsWithInfos)))
  "Returns full string definition for message of type 'AprilTagsWithInfos"
  (cl:format cl:nil "Header header~%duckietown_msgs/AprilTagDetection[] detections~%duckietown_msgs/TagInfo[] infos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/AprilTagDetection~%geometry_msgs/Transform transform~%int32 tag_id~%string tag_family~%int32 hamming~%float32 decision_margin~%float32[9] homography~%float32[2] center~%float32[8] corners~%float32 pose_error~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: duckietown_msgs/TagInfo~%Header header~%int32 id~%~%#(StreetName, TrafficSign, Localization, Vehicle)~%uint8 tag_type~%~%uint8 S_NAME=0~%uint8 SIGN=1	~%uint8 LIGHT=2~%uint8 LOCALIZE=3~%uint8 VEHICLE=4~%~%string street_name~%~%uint8 traffic_sign_type~%# (12 possible traffic sign types)~%~%uint8 STOP=5~%uint8 YIELD=6~%uint8 NO_RIGHT_TURN=7~%uint8 NO_LEFT_TURN=8~%uint8 ONEWAY_RIGHT=9~%uint8 ONEWAY_LEFT=10~%uint8 FOUR_WAY=11~%uint8 RIGHT_T_INTERSECT=12~%uint8 LEFT_T_INTERSECT=13~%uint8 T_INTERSECTION=14~%uint8 DO_NOT_ENTER=15~%uint8 PEDESTRIAN=16~%uint8 T_LIGHT_AHEAD=17~%uint8 DUCK_CROSSING=18~%uint8 PARKING=19~%~%string vehicle_name~%~%# Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.~%float32 location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AprilTagsWithInfos>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'infos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AprilTagsWithInfos>))
  "Converts a ROS message object to a list"
  (cl:list 'AprilTagsWithInfos
    (cl:cons ':header (header msg))
    (cl:cons ':detections (detections msg))
    (cl:cons ':infos (infos msg))
))
