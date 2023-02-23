; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DiagnosticsCodeProfiling.msg.html

(cl:defclass <DiagnosticsCodeProfiling> (roslisp-msg-protocol:ros-message)
  ((node
    :reader node
    :initarg :node
    :type cl:string
    :initform "")
   (block
    :reader block
    :initarg :block
    :type cl:string
    :initform "")
   (frequency
    :reader frequency
    :initarg :frequency
    :type cl:float
    :initform 0.0)
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0)
   (filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform "")
   (line_nums
    :reader line_nums
    :initarg :line_nums
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (time_since_last_execution
    :reader time_since_last_execution
    :initarg :time_since_last_execution
    :type cl:float
    :initform 0.0))
)

(cl:defclass DiagnosticsCodeProfiling (<DiagnosticsCodeProfiling>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiagnosticsCodeProfiling>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiagnosticsCodeProfiling)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DiagnosticsCodeProfiling> is deprecated: use duckietown_msgs-msg:DiagnosticsCodeProfiling instead.")))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:node-val is deprecated.  Use duckietown_msgs-msg:node instead.")
  (node m))

(cl:ensure-generic-function 'block-val :lambda-list '(m))
(cl:defmethod block-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:block-val is deprecated.  Use duckietown_msgs-msg:block instead.")
  (block m))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:frequency-val is deprecated.  Use duckietown_msgs-msg:frequency instead.")
  (frequency m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:duration-val is deprecated.  Use duckietown_msgs-msg:duration instead.")
  (duration m))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:filename-val is deprecated.  Use duckietown_msgs-msg:filename instead.")
  (filename m))

(cl:ensure-generic-function 'line_nums-val :lambda-list '(m))
(cl:defmethod line_nums-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:line_nums-val is deprecated.  Use duckietown_msgs-msg:line_nums instead.")
  (line_nums m))

(cl:ensure-generic-function 'time_since_last_execution-val :lambda-list '(m))
(cl:defmethod time_since_last_execution-val ((m <DiagnosticsCodeProfiling>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:time_since_last_execution-val is deprecated.  Use duckietown_msgs-msg:time_since_last_execution instead.")
  (time_since_last_execution m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiagnosticsCodeProfiling>) ostream)
  "Serializes a message object of type '<DiagnosticsCodeProfiling>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'block))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'block))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'frequency))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'line_nums))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time_since_last_execution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiagnosticsCodeProfiling>) istream)
  "Deserializes a message object of type '<DiagnosticsCodeProfiling>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'block) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'block) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'frequency) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:setf (cl:slot-value msg 'line_nums) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'line_nums)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_since_last_execution) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiagnosticsCodeProfiling>)))
  "Returns string type for a message object of type '<DiagnosticsCodeProfiling>"
  "duckietown_msgs/DiagnosticsCodeProfiling")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiagnosticsCodeProfiling)))
  "Returns string type for a message object of type 'DiagnosticsCodeProfiling"
  "duckietown_msgs/DiagnosticsCodeProfiling")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiagnosticsCodeProfiling>)))
  "Returns md5sum for a message object of type '<DiagnosticsCodeProfiling>"
  "2f919bc6b39855368e96c3df59f3187f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiagnosticsCodeProfiling)))
  "Returns md5sum for a message object of type 'DiagnosticsCodeProfiling"
  "2f919bc6b39855368e96c3df59f3187f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiagnosticsCodeProfiling>)))
  "Returns full string definition for message of type '<DiagnosticsCodeProfiling>"
  (cl:format cl:nil "string node                             # Node publishing this message~%string block                            # Name of the profiled code block~%float32 frequency                       # Execution frequency of the block~%float32 duration                        # Last execution time of the block (in seconds)~%string filename                         # Filename in which this block resides~%uint16[2] line_nums                     # Start and end line of the block in the file~%float32 time_since_last_execution       # Seconds since last execution~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiagnosticsCodeProfiling)))
  "Returns full string definition for message of type 'DiagnosticsCodeProfiling"
  (cl:format cl:nil "string node                             # Node publishing this message~%string block                            # Name of the profiled code block~%float32 frequency                       # Execution frequency of the block~%float32 duration                        # Last execution time of the block (in seconds)~%string filename                         # Filename in which this block resides~%uint16[2] line_nums                     # Start and end line of the block in the file~%float32 time_since_last_execution       # Seconds since last execution~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiagnosticsCodeProfiling>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'node))
     4 (cl:length (cl:slot-value msg 'block))
     4
     4
     4 (cl:length (cl:slot-value msg 'filename))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'line_nums) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiagnosticsCodeProfiling>))
  "Converts a ROS message object to a list"
  (cl:list 'DiagnosticsCodeProfiling
    (cl:cons ':node (node msg))
    (cl:cons ':block (block msg))
    (cl:cons ':frequency (frequency msg))
    (cl:cons ':duration (duration msg))
    (cl:cons ':filename (filename msg))
    (cl:cons ':line_nums (line_nums msg))
    (cl:cons ':time_since_last_execution (time_since_last_execution msg))
))
