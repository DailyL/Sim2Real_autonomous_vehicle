; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude SegmentList.msg.html

(cl:defclass <SegmentList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (segments
    :reader segments
    :initarg :segments
    :type (cl:vector duckietown_msgs-msg:Segment)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:Segment :initial-element (cl:make-instance 'duckietown_msgs-msg:Segment))))
)

(cl:defclass SegmentList (<SegmentList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<SegmentList> is deprecated: use duckietown_msgs-msg:SegmentList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SegmentList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'segments-val :lambda-list '(m))
(cl:defmethod segments-val ((m <SegmentList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:segments-val is deprecated.  Use duckietown_msgs-msg:segments instead.")
  (segments m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentList>) ostream)
  "Serializes a message object of type '<SegmentList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'segments))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'segments))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentList>) istream)
  "Deserializes a message object of type '<SegmentList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'segments) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'segments)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:Segment))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentList>)))
  "Returns string type for a message object of type '<SegmentList>"
  "duckietown_msgs/SegmentList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentList)))
  "Returns string type for a message object of type 'SegmentList"
  "duckietown_msgs/SegmentList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentList>)))
  "Returns md5sum for a message object of type '<SegmentList>"
  "1cefc32a4bc9039bf09d40c6c13beace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentList)))
  "Returns md5sum for a message object of type 'SegmentList"
  "1cefc32a4bc9039bf09d40c6c13beace")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentList>)))
  "Returns full string definition for message of type '<SegmentList>"
  (cl:format cl:nil "Header header~%duckietown_msgs/Segment[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Segment~%uint8 WHITE=0~%uint8 YELLOW=1	~%uint8 RED=2~%uint8 color~%duckietown_msgs/Vector2D[2] pixels_normalized~%duckietown_msgs/Vector2D normal~%~%geometry_msgs/Point[2] points~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentList)))
  "Returns full string definition for message of type 'SegmentList"
  (cl:format cl:nil "Header header~%duckietown_msgs/Segment[] segments~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Segment~%uint8 WHITE=0~%uint8 YELLOW=1	~%uint8 RED=2~%uint8 color~%duckietown_msgs/Vector2D[2] pixels_normalized~%duckietown_msgs/Vector2D normal~%~%geometry_msgs/Point[2] points~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'segments) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentList>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentList
    (cl:cons ':header (header msg))
    (cl:cons ':segments (segments msg))
))
