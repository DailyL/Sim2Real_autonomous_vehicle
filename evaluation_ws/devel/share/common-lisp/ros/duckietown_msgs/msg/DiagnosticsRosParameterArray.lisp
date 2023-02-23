; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsRosParameterArray.msg.html

(cl:defclass <DiagnosticsRosParameterArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (params
    :reader params
    :initarg :params
    :type (cl:vector duckietown_msgs-msg:NodeParameter)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:NodeParameter :initial-element (cl:make-instance 'duckietown_msgs-msg:NodeParameter))))
)

(cl:defclass DiagnosticsRosParameterArray (<DiagnosticsRosParameterArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsRosParameterArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsRosParameterArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsRosParameterArray> is deprecated: use duckietown_msgs-msg:DiagnosticsRosParameterArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DiagnosticsRosParameterArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <DiagnosticsRosParameterArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:params-val is deprecated.  Use duckietown_msgs-msg:params instead.")
  (params m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsRosParameterArray>) ostream)
  "Serializes a message object of type '<DiagnosticsRosParameterArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'params))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'params))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsRosParameterArray>) istream)
  "Deserializes a message object of type '<DiagnosticsRosParameterArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'params) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'params)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:NodeParameter))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsRosParameterArray>)))
  "Returns string type for a message object of type '<DiagnosticsRosParameterArray>"
  "duckietown_msgs/DiagnosticsRosParameterArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsRosParameterArray)))
  "Returns string type for a message object of type 'DiagnosticsRosParameterArray"
  "duckietown_msgs/DiagnosticsRosParameterArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsRosParameterArray>)))
  "Returns md5sum for a message object of type '<DiagnosticsRosParameterArray>"
  "3cce38c64acfe087a9363ff4d78b53a5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsRosParameterArray)))
  "Returns md5sum for a message object of type 'DiagnosticsRosParameterArray"
  "3cce38c64acfe087a9363ff4d78b53a5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsRosParameterArray>)))
  "Returns full string definition for message of type '<DiagnosticsRosParameterArray>"
  (cl:format cl:nil "Header header~%duckietown_msgs/NodeParameter[] params             # List of parameters~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/NodeParameter~%# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsRosParameterArray)))
  "Returns full string definition for message of type 'DiagnosticsRosParameterArray"
  (cl:format cl:nil "Header header~%duckietown_msgs/NodeParameter[] params             # List of parameters~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/NodeParameter~%# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsRosParameterArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'params) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsRosParameterArray>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsRosParameterArray
    (cl:cons ':header (header msg))
    (cl:cons ':params (params msg))
))
