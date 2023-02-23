; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ObstacleImageDetectionList.msg.html

(cl:defclass <ObstacleImageDetectionList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (list
    :reader list
    :initarg :list
    :type (cl:vector duckietown_msgs-msg:ObstacleImageDetection)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:ObstacleImageDetection :initial-element (cl:make-instance 'duckietown_msgs-msg:ObstacleImageDetection)))
   (imwidth
    :reader imwidth
    :initarg :imwidth
    :type cl:float
    :initform 0.0)
   (imheight
    :reader imheight
    :initarg :imheight
    :type cl:float
    :initform 0.0))
)

(cl:defclass ObstacleImageDetectionList (<ObstacleImageDetectionList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleImageDetectionList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleImageDetectionList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ObstacleImageDetectionList> is deprecated: use duckietown_msgs-msg:ObstacleImageDetectionList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ObstacleImageDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <ObstacleImageDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:list-val is deprecated.  Use duckietown_msgs-msg:list instead.")
  (list m))

(cl:ensure-generic-function 'imwidth-val :lambda-list '(m))
(cl:defmethod imwidth-val ((m <ObstacleImageDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:imwidth-val is deprecated.  Use duckietown_msgs-msg:imwidth instead.")
  (imwidth m))

(cl:ensure-generic-function 'imheight-val :lambda-list '(m))
(cl:defmethod imheight-val ((m <ObstacleImageDetectionList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:imheight-val is deprecated.  Use duckietown_msgs-msg:imheight instead.")
  (imheight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleImageDetectionList>) ostream)
  "Serializes a message object of type '<ObstacleImageDetectionList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'list))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imwidth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'imheight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleImageDetectionList>) istream)
  "Deserializes a message object of type '<ObstacleImageDetectionList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:ObstacleImageDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imwidth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'imheight) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleImageDetectionList>)))
  "Returns string type for a message object of type '<ObstacleImageDetectionList>"
  "duckietown_msgs/ObstacleImageDetectionList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleImageDetectionList)))
  "Returns string type for a message object of type 'ObstacleImageDetectionList"
  "duckietown_msgs/ObstacleImageDetectionList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleImageDetectionList>)))
  "Returns md5sum for a message object of type '<ObstacleImageDetectionList>"
  "bb443595d23936bacf0f853c0dbaa48c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleImageDetectionList)))
  "Returns md5sum for a message object of type 'ObstacleImageDetectionList"
  "bb443595d23936bacf0f853c0dbaa48c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleImageDetectionList>)))
  "Returns full string definition for message of type '<ObstacleImageDetectionList>"
  (cl:format cl:nil "Header header~%duckietown_msgs/ObstacleImageDetection[] list~%float32 imwidth~%float32 imheight~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/ObstacleImageDetection~%duckietown_msgs/Rect bounding_box~%duckietown_msgs/ObstacleType type~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleImageDetectionList)))
  "Returns full string definition for message of type 'ObstacleImageDetectionList"
  (cl:format cl:nil "Header header~%duckietown_msgs/ObstacleImageDetection[] list~%float32 imwidth~%float32 imheight~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/ObstacleImageDetection~%duckietown_msgs/Rect bounding_box~%duckietown_msgs/ObstacleType type~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%================================================================================~%MSG: duckietown_msgs/ObstacleType~%uint8 DUCKIE=0~%uint8 CONE=1~%uint8 type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleImageDetectionList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleImageDetectionList>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleImageDetectionList
    (cl:cons ':header (header msg))
    (cl:cons ':list (list msg))
    (cl:cons ':imwidth (imwidth msg))
    (cl:cons ':imheight (imheight msg))
))
