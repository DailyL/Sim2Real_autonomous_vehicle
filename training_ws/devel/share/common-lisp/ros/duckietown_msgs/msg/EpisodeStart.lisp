; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude EpisodeStart.msg.html

(cl:defclass <EpisodeStart> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (episode_name
    :reader episode_name
    :initarg :episode_name
    :type cl:string
    :initform "")
   (other_payload_yaml
    :reader other_payload_yaml
    :initarg :other_payload_yaml
    :type cl:string
    :initform ""))
)

(cl:defclass EpisodeStart (<EpisodeStart>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EpisodeStart>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EpisodeStart)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<EpisodeStart> is deprecated: use duckietown_msgs-msg:EpisodeStart instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EpisodeStart>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'episode_name-val :lambda-list '(m))
(cl:defmethod episode_name-val ((m <EpisodeStart>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:episode_name-val is deprecated.  Use duckietown_msgs-msg:episode_name instead.")
  (episode_name m))

(cl:ensure-generic-function 'other_payload_yaml-val :lambda-list '(m))
(cl:defmethod other_payload_yaml-val ((m <EpisodeStart>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:other_payload_yaml-val is deprecated.  Use duckietown_msgs-msg:other_payload_yaml instead.")
  (other_payload_yaml m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EpisodeStart>) ostream)
  "Serializes a message object of type '<EpisodeStart>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'episode_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'episode_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'other_payload_yaml))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'other_payload_yaml))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EpisodeStart>) istream)
  "Deserializes a message object of type '<EpisodeStart>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'episode_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'episode_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'other_payload_yaml) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'other_payload_yaml) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EpisodeStart>)))
  "Returns string type for a message object of type '<EpisodeStart>"
  "duckietown_msgs/EpisodeStart")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EpisodeStart)))
  "Returns string type for a message object of type 'EpisodeStart"
  "duckietown_msgs/EpisodeStart")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EpisodeStart>)))
  "Returns md5sum for a message object of type '<EpisodeStart>"
  "d9c9ddf1cb6334de0336392fe315bfa9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EpisodeStart)))
  "Returns md5sum for a message object of type 'EpisodeStart"
  "d9c9ddf1cb6334de0336392fe315bfa9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EpisodeStart>)))
  "Returns full string definition for message of type '<EpisodeStart>"
  (cl:format cl:nil "Header header~%string episode_name~%string other_payload_yaml~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EpisodeStart)))
  "Returns full string definition for message of type 'EpisodeStart"
  (cl:format cl:nil "Header header~%string episode_name~%string other_payload_yaml~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EpisodeStart>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'episode_name))
     4 (cl:length (cl:slot-value msg 'other_payload_yaml))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EpisodeStart>))
  "Converts a ROS message object to a list"
  (cl:list 'EpisodeStart
    (cl:cons ':header (header msg))
    (cl:cons ':episode_name (episode_name msg))
    (cl:cons ':other_payload_yaml (other_payload_yaml msg))
))
