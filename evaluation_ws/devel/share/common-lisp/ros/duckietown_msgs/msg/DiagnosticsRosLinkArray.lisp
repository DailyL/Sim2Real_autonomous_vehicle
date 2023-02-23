; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsRosLinkArray.msg.html

(cl:defclass <DiagnosticsRosLinkArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (links
    :reader links
    :initarg :links
    :type (cl:vector duckietown_msgs-msg:DiagnosticsRosLink)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:DiagnosticsRosLink :initial-element (cl:make-instance 'duckietown_msgs-msg:DiagnosticsRosLink))))
)

(cl:defclass DiagnosticsRosLinkArray (<DiagnosticsRosLinkArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsRosLinkArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsRosLinkArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsRosLinkArray> is deprecated: use duckietown_msgs-msg:DiagnosticsRosLinkArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DiagnosticsRosLinkArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'links-val :lambda-list '(m))
(cl:defmethod links-val ((m <DiagnosticsRosLinkArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:links-val is deprecated.  Use duckietown_msgs-msg:links instead.")
  (links m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsRosLinkArray>) ostream)
  "Serializes a message object of type '<DiagnosticsRosLinkArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'links))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'links))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsRosLinkArray>) istream)
  "Deserializes a message object of type '<DiagnosticsRosLinkArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'links) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'links)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:DiagnosticsRosLink))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsRosLinkArray>)))
  "Returns string type for a message object of type '<DiagnosticsRosLinkArray>"
  "duckietown_msgs/DiagnosticsRosLinkArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsRosLinkArray)))
  "Returns string type for a message object of type 'DiagnosticsRosLinkArray"
  "duckietown_msgs/DiagnosticsRosLinkArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsRosLinkArray>)))
  "Returns md5sum for a message object of type '<DiagnosticsRosLinkArray>"
  "429f5aa0771b8b09d6913175d25517ec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsRosLinkArray)))
  "Returns md5sum for a message object of type 'DiagnosticsRosLinkArray"
  "429f5aa0771b8b09d6913175d25517ec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsRosLinkArray>)))
  "Returns full string definition for message of type '<DiagnosticsRosLinkArray>"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsRosLink[] links~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsRosLink~%# Link direction~%uint8 LINK_DIRECTION_INBOUND = 0~%uint8 LINK_DIRECTION_OUTBOUND = 1~%~%string node         # Node publishing this message~%string topic        # Topic transferred over the link~%string remote       # Remote end of this link~%uint8 direction     # Link direction~%bool connected      # Status of the link~%string transport    # Type of transport used for this link~%uint64 messages     # Number of messages transferred over this link~%uint64 dropped      # Number of messages dropped over this link~%float32 bytes       # Volume of data transferred over this link~%float32 frequency   # Link frequency (Hz)~%float32 bandwidth   # Link bandwidth (byte/s)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsRosLinkArray)))
  "Returns full string definition for message of type 'DiagnosticsRosLinkArray"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsRosLink[] links~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsRosLink~%# Link direction~%uint8 LINK_DIRECTION_INBOUND = 0~%uint8 LINK_DIRECTION_OUTBOUND = 1~%~%string node         # Node publishing this message~%string topic        # Topic transferred over the link~%string remote       # Remote end of this link~%uint8 direction     # Link direction~%bool connected      # Status of the link~%string transport    # Type of transport used for this link~%uint64 messages     # Number of messages transferred over this link~%uint64 dropped      # Number of messages dropped over this link~%float32 bytes       # Volume of data transferred over this link~%float32 frequency   # Link frequency (Hz)~%float32 bandwidth   # Link bandwidth (byte/s)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsRosLinkArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'links) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsRosLinkArray>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsRosLinkArray
    (cl:cons ':header (header msg))
    (cl:cons ':links (links msg))
))
