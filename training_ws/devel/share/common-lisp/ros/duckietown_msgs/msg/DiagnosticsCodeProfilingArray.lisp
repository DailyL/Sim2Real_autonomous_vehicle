; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsCodeProfilingArray.msg.html

(cl:defclass <DiagnosticsCodeProfilingArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (blocks
    :reader blocks
    :initarg :blocks
    :type (cl:vector duckietown_msgs-msg:DiagnosticsCodeProfiling)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:DiagnosticsCodeProfiling :initial-element (cl:make-instance 'duckietown_msgs-msg:DiagnosticsCodeProfiling))))
)

(cl:defclass DiagnosticsCodeProfilingArray (<DiagnosticsCodeProfilingArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsCodeProfilingArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsCodeProfilingArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsCodeProfilingArray> is deprecated: use duckietown_msgs-msg:DiagnosticsCodeProfilingArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DiagnosticsCodeProfilingArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'blocks-val :lambda-list '(m))
(cl:defmethod blocks-val ((m <DiagnosticsCodeProfilingArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:blocks-val is deprecated.  Use duckietown_msgs-msg:blocks instead.")
  (blocks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsCodeProfilingArray>) ostream)
  "Serializes a message object of type '<DiagnosticsCodeProfilingArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blocks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'blocks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsCodeProfilingArray>) istream)
  "Deserializes a message object of type '<DiagnosticsCodeProfilingArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blocks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blocks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:DiagnosticsCodeProfiling))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsCodeProfilingArray>)))
  "Returns string type for a message object of type '<DiagnosticsCodeProfilingArray>"
  "duckietown_msgs/DiagnosticsCodeProfilingArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsCodeProfilingArray)))
  "Returns string type for a message object of type 'DiagnosticsCodeProfilingArray"
  "duckietown_msgs/DiagnosticsCodeProfilingArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsCodeProfilingArray>)))
  "Returns md5sum for a message object of type '<DiagnosticsCodeProfilingArray>"
  "57dca0d37f20880e0dee9358611e6e75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsCodeProfilingArray)))
  "Returns md5sum for a message object of type 'DiagnosticsCodeProfilingArray"
  "57dca0d37f20880e0dee9358611e6e75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsCodeProfilingArray>)))
  "Returns full string definition for message of type '<DiagnosticsCodeProfilingArray>"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsCodeProfiling[] blocks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsCodeProfiling~%string node                             # Node publishing this message~%string block                            # Name of the profiled code block~%float32 frequency                       # Execution frequency of the block~%float32 duration                        # Last execution time of the block (in seconds)~%string filename                         # Filename in which this block resides~%uint16[2] line_nums                     # Start and end line of the block in the file~%float32 time_since_last_execution       # Seconds since last execution~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsCodeProfilingArray)))
  "Returns full string definition for message of type 'DiagnosticsCodeProfilingArray"
  (cl:format cl:nil "Header header~%duckietown_msgs/DiagnosticsCodeProfiling[] blocks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/DiagnosticsCodeProfiling~%string node                             # Node publishing this message~%string block                            # Name of the profiled code block~%float32 frequency                       # Execution frequency of the block~%float32 duration                        # Last execution time of the block (in seconds)~%string filename                         # Filename in which this block resides~%uint16[2] line_nums                     # Start and end line of the block in the file~%float32 time_since_last_execution       # Seconds since last execution~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsCodeProfilingArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blocks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsCodeProfilingArray>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsCodeProfilingArray
    (cl:cons ':header (header msg))
    (cl:cons ':blocks (blocks msg))
))
