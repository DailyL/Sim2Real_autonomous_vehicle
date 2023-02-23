; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude TagInfo.msg.html

(cl:defclass <TagInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (tag_type
    :reader tag_type
    :initarg :tag_type
    :type cl:fixnum
    :initform 0)
   (street_name
    :reader street_name
    :initarg :street_name
    :type cl:string
    :initform "")
   (traffic_sign_type
    :reader traffic_sign_type
    :initarg :traffic_sign_type
    :type cl:fixnum
    :initform 0)
   (vehicle_name
    :reader vehicle_name
    :initarg :vehicle_name
    :type cl:string
    :initform "")
   (location
    :reader location
    :initarg :location
    :type cl:float
    :initform 0.0))
)

(cl:defclass TagInfo (<TagInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TagInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TagInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<TagInfo> is deprecated: use duckietown_msgs-msg:TagInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:id-val is deprecated.  Use duckietown_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'tag_type-val :lambda-list '(m))
(cl:defmethod tag_type-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:tag_type-val is deprecated.  Use duckietown_msgs-msg:tag_type instead.")
  (tag_type m))

(cl:ensure-generic-function 'street_name-val :lambda-list '(m))
(cl:defmethod street_name-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:street_name-val is deprecated.  Use duckietown_msgs-msg:street_name instead.")
  (street_name m))

(cl:ensure-generic-function 'traffic_sign_type-val :lambda-list '(m))
(cl:defmethod traffic_sign_type-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:traffic_sign_type-val is deprecated.  Use duckietown_msgs-msg:traffic_sign_type instead.")
  (traffic_sign_type m))

(cl:ensure-generic-function 'vehicle_name-val :lambda-list '(m))
(cl:defmethod vehicle_name-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:vehicle_name-val is deprecated.  Use duckietown_msgs-msg:vehicle_name instead.")
  (vehicle_name m))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <TagInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:location-val is deprecated.  Use duckietown_msgs-msg:location instead.")
  (location m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<TagInfo>)))
    "Constants for message type '<TagInfo>"
  '((:S_NAME . 0)
    (:SIGN . 1)
    (:LIGHT . 2)
    (:LOCALIZE . 3)
    (:VEHICLE . 4)
    (:STOP . 5)
    (:YIELD . 6)
    (:NO_RIGHT_TURN . 7)
    (:NO_LEFT_TURN . 8)
    (:ONEWAY_RIGHT . 9)
    (:ONEWAY_LEFT . 10)
    (:FOUR_WAY . 11)
    (:RIGHT_T_INTERSECT . 12)
    (:LEFT_T_INTERSECT . 13)
    (:T_INTERSECTION . 14)
    (:DO_NOT_ENTER . 15)
    (:PEDESTRIAN . 16)
    (:T_LIGHT_AHEAD . 17)
    (:DUCK_CROSSING . 18)
    (:PARKING . 19))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'TagInfo)))
    "Constants for message type 'TagInfo"
  '((:S_NAME . 0)
    (:SIGN . 1)
    (:LIGHT . 2)
    (:LOCALIZE . 3)
    (:VEHICLE . 4)
    (:STOP . 5)
    (:YIELD . 6)
    (:NO_RIGHT_TURN . 7)
    (:NO_LEFT_TURN . 8)
    (:ONEWAY_RIGHT . 9)
    (:ONEWAY_LEFT . 10)
    (:FOUR_WAY . 11)
    (:RIGHT_T_INTERSECT . 12)
    (:LEFT_T_INTERSECT . 13)
    (:T_INTERSECTION . 14)
    (:DO_NOT_ENTER . 15)
    (:PEDESTRIAN . 16)
    (:T_LIGHT_AHEAD . 17)
    (:DUCK_CROSSING . 18)
    (:PARKING . 19))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TagInfo>) ostream)
  "Serializes a message object of type '<TagInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag_type)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'street_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'street_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'traffic_sign_type)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vehicle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vehicle_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'location))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TagInfo>) istream)
  "Deserializes a message object of type '<TagInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tag_type)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'street_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'street_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'traffic_sign_type)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vehicle_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vehicle_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'location) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TagInfo>)))
  "Returns string type for a message object of type '<TagInfo>"
  "duckietown_msgs/TagInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TagInfo)))
  "Returns string type for a message object of type 'TagInfo"
  "duckietown_msgs/TagInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TagInfo>)))
  "Returns md5sum for a message object of type '<TagInfo>"
  "d194db19dc43ddeaa93486d02f120934")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TagInfo)))
  "Returns md5sum for a message object of type 'TagInfo"
  "d194db19dc43ddeaa93486d02f120934")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TagInfo>)))
  "Returns full string definition for message of type '<TagInfo>"
  (cl:format cl:nil "Header header~%int32 id~%~%#(StreetName, TrafficSign, Localization, Vehicle)~%uint8 tag_type~%~%uint8 S_NAME=0~%uint8 SIGN=1	~%uint8 LIGHT=2~%uint8 LOCALIZE=3~%uint8 VEHICLE=4~%~%string street_name~%~%uint8 traffic_sign_type~%# (12 possible traffic sign types)~%~%uint8 STOP=5~%uint8 YIELD=6~%uint8 NO_RIGHT_TURN=7~%uint8 NO_LEFT_TURN=8~%uint8 ONEWAY_RIGHT=9~%uint8 ONEWAY_LEFT=10~%uint8 FOUR_WAY=11~%uint8 RIGHT_T_INTERSECT=12~%uint8 LEFT_T_INTERSECT=13~%uint8 T_INTERSECTION=14~%uint8 DO_NOT_ENTER=15~%uint8 PEDESTRIAN=16~%uint8 T_LIGHT_AHEAD=17~%uint8 DUCK_CROSSING=18~%uint8 PARKING=19~%~%string vehicle_name~%~%# Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.~%float32 location~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TagInfo)))
  "Returns full string definition for message of type 'TagInfo"
  (cl:format cl:nil "Header header~%int32 id~%~%#(StreetName, TrafficSign, Localization, Vehicle)~%uint8 tag_type~%~%uint8 S_NAME=0~%uint8 SIGN=1	~%uint8 LIGHT=2~%uint8 LOCALIZE=3~%uint8 VEHICLE=4~%~%string street_name~%~%uint8 traffic_sign_type~%# (12 possible traffic sign types)~%~%uint8 STOP=5~%uint8 YIELD=6~%uint8 NO_RIGHT_TURN=7~%uint8 NO_LEFT_TURN=8~%uint8 ONEWAY_RIGHT=9~%uint8 ONEWAY_LEFT=10~%uint8 FOUR_WAY=11~%uint8 RIGHT_T_INTERSECT=12~%uint8 LEFT_T_INTERSECT=13~%uint8 T_INTERSECTION=14~%uint8 DO_NOT_ENTER=15~%uint8 PEDESTRIAN=16~%uint8 T_LIGHT_AHEAD=17~%uint8 DUCK_CROSSING=18~%uint8 PARKING=19~%~%string vehicle_name~%~%# Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.~%float32 location~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TagInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     1
     4 (cl:length (cl:slot-value msg 'street_name))
     1
     4 (cl:length (cl:slot-value msg 'vehicle_name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TagInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'TagInfo
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':tag_type (tag_type msg))
    (cl:cons ':street_name (street_name msg))
    (cl:cons ':traffic_sign_type (traffic_sign_type msg))
    (cl:cons ':vehicle_name (vehicle_name msg))
    (cl:cons ':location (location msg))
))
