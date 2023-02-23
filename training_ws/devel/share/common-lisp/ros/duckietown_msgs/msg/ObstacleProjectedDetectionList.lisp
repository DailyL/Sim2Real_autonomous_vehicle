; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ObstacleProjectedDetectionList.msg.html

(cl:defclass <ObstacleProjectedDetectionList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (list
    :reader list
    :initarg :list
    :type (cl:vector duckietown_msgs-msg:ObstacleProjectedDetection)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:ObstacleProjectedDetection :initial-element (cl:make-instance 'duckietown_msgs-msg:ObstacleProjectedDetection))))
)

(cl:defclass ObstacleProjectedDetectionList (<ObstacleProjectedDetectionList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleProjectedDetectionList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleProjectedDetectionList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ObstacleProjectedDetectionList> is deprecated: use duckietown_msgs-msg:ObstacleProjectedDetectionList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObstacleProjectedDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <ObstacleProjectedDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:list-val is deprecated.  Use duckietown_msgs-msg:list instead.")
  (list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleProjectedDetectionList>) ostream)
  "Serializes a message object of type '<ObstacleProjectedDetectionList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleProjectedDetectionList>) istream)
  "Deserializes a message object of type '<ObstacleProjectedDetectionList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:ObstacleProjectedDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleProjectedDetectionList>)))
  "Returns string type for a message object of type '<ObstacleProjectedDetectionList>"
  "duckietown_msgs/ObstacleProjectedDetectionList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleProjectedDetectionList)))
  "Returns string type for a message object of type 'ObstacleProjectedDetectionList"
  "duckietown_msgs/ObstacleProjectedDetectionList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleProjectedDetectionList>)))
  "Returns md5sum for a message object of type '<ObstacleProjectedDetectionList>"
  "11b067403fefa6151edc8b44e25edac3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleProjectedDetectionList)))
  "Returns md5sum for a message object of type 'ObstacleProjectedDetectionList"
  "11b067403fefa6151edc8b44e25edac3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleProjectedDetectionList>)))
  "Returns full string definition for message of type '<ObstacleProjectedDetectionList>"
  (cl:format cl:nil "Header header~%duckietown_msgs/ObstacleProjectedDetection[] list~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/ObstacleProjectedDetection~%geometry_msgs/Point location~%duckietown_msgs/ObstacleType type~%float32 distance~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleProjectedDetectionList)))
  "Returns full string definition for message of type 'ObstacleProjectedDetectionList"
  (cl:format cl:nil "Header header~%duckietown_msgs/ObstacleProjectedDetection[] list~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/ObstacleProjectedDetection~%geometry_msgs/Point location~%duckietown_msgs/ObstacleType type~%float32 distance~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleProjectedDetectionList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleProjectedDetectionList>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleProjectedDetectionList
    (cl:cons ':header (header msg))
    (cl:cons ':list (list msg))
))
