; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsRosTopicArray.msg.html

(cl:defclass <DiagnosticsRosTopicArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (topics
    :reader topics
    :initarg :topics
    :type (cl:vector duckietown_msgs-msg:DiagnosticsRosTopic)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:DiagnosticsRosTopic :initial-element (cl:make-instance 'duckietown_msgs-msg:DiagnosticsRosTopic))))
)

(cl:defclass DiagnosticsRosTopicArray (<DiagnosticsRosTopicArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsRosTopicArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsRosTopicArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsRosTopicArray> is deprecated: use duckietown_msgs-msg:DiagnosticsRosTopicArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DiagnosticsRosTopicArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'topics-val :lambda-list '(m))
(cl:defmethod topics-val ((m <DiagnosticsRosTopicArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:topics-val is deprecated.  Use duckietown_msgs-msg:topics instead.")
  (topics m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsRosTopicArray>) ostream)
  "Serializes a message object of type '<DiagnosticsRosTopicArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'topics))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'topics))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsRosTopicArray>) istream)
  "Deserializes a message object of type '<DiagnosticsRosTopicArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'topics) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'topics)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:DiagnosticsRosTopic))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsRosTopicArray>)))
  "Returns string type for a message object of type '<DiagnosticsRosTopicArray>"
  "duckietown_msgs/DiagnosticsRosTopicArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsRosTopicArray)))
  "Returns string type for a message object of type 'DiagnosticsRosTopicArray"
  "duckietown_msgs/DiagnosticsRosTopicArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsRosTopicArray>)))
  "Returns md5sum for a message object of type '<DiagnosticsRosTopicArray>"
  "75d6b38d91572d9e365e9ae3cf66db75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsRosTopicArray)))
  "Returns md5sum for a message object of type 'DiagnosticsRosTopicArray"
  "75d6b38d91572d9e365e9ae3cf66db75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsRosTopicArray>)))
  "Returns full string definition for message of type '<DiagnosticsRosTopicArray>"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsRosTopic[] topics~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsRosTopic~%# Topic direction (this has to match duckietown.TopicDirection)~%uint8 TOPIC_DIRECTION_INBOUND = 0~%uint8 TOPIC_DIRECTION_OUTBOUND = 1~%~%# Topic type (this has to match duckietown.TopicType)~%uint8 TOPIC_TYPE_GENERIC = 0~%uint8 TOPIC_TYPE_DRIVER = 1~%uint8 TOPIC_TYPE_PERCEPTION = 2~%uint8 TOPIC_TYPE_CONTROL = 3~%uint8 TOPIC_TYPE_PLANNING = 4~%uint8 TOPIC_TYPE_LOCALIZATION = 5~%uint8 TOPIC_TYPE_MAPPING = 6~%uint8 TOPIC_TYPE_SWARM = 7~%uint8 TOPIC_TYPE_BEHAVIOR = 8~%uint8 TOPIC_TYPE_VISUALIZATION = 9~%uint8 TOPIC_TYPE_INFRASTRUCTURE = 10~%uint8 TOPIC_TYPE_COMMUNICATION = 11~%uint8 TOPIC_TYPE_DIAGNOSTICS = 12~%uint8 TOPIC_TYPE_DEBUG = 20~%~%string node                     # Node publishing this message~%string name                     # Topic object of the diagnostics~%string help                     # Topic description~%uint8 type                      # Topic type~%uint8 direction                 # Topic direction~%float32 frequency               # Topic frequency (Hz)~%float32 effective_frequency     # Topic (effective) frequency (Hz)~%float32 healthy_frequency       # Frequency at which this topic can be considered healthy~%float32 bandwidth               # Topic bandwidth (byte/s)~%bool enabled                    # Topic switch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsRosTopicArray)))
  "Returns full string definition for message of type 'DiagnosticsRosTopicArray"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsRosTopic[] topics~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsRosTopic~%# Topic direction (this has to match duckietown.TopicDirection)~%uint8 TOPIC_DIRECTION_INBOUND = 0~%uint8 TOPIC_DIRECTION_OUTBOUND = 1~%~%# Topic type (this has to match duckietown.TopicType)~%uint8 TOPIC_TYPE_GENERIC = 0~%uint8 TOPIC_TYPE_DRIVER = 1~%uint8 TOPIC_TYPE_PERCEPTION = 2~%uint8 TOPIC_TYPE_CONTROL = 3~%uint8 TOPIC_TYPE_PLANNING = 4~%uint8 TOPIC_TYPE_LOCALIZATION = 5~%uint8 TOPIC_TYPE_MAPPING = 6~%uint8 TOPIC_TYPE_SWARM = 7~%uint8 TOPIC_TYPE_BEHAVIOR = 8~%uint8 TOPIC_TYPE_VISUALIZATION = 9~%uint8 TOPIC_TYPE_INFRASTRUCTURE = 10~%uint8 TOPIC_TYPE_COMMUNICATION = 11~%uint8 TOPIC_TYPE_DIAGNOSTICS = 12~%uint8 TOPIC_TYPE_DEBUG = 20~%~%string node                     # Node publishing this message~%string name                     # Topic object of the diagnostics~%string help                     # Topic description~%uint8 type                      # Topic type~%uint8 direction                 # Topic direction~%float32 frequency               # Topic frequency (Hz)~%float32 effective_frequency     # Topic (effective) frequency (Hz)~%float32 healthy_frequency       # Frequency at which this topic can be considered healthy~%float32 bandwidth               # Topic bandwidth (byte/s)~%bool enabled                    # Topic switch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsRosTopicArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'topics) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsRosTopicArray>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsRosTopicArray
    (cl:cons ':header (header msg))
    (cl:cons ':topics (topics msg))
))
