; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude SourceTargetNodes.msg.html

(cl:defclass <SourceTargetNodes> (roslisp-msg-protocol:ros-message)
  ((source_node
    :reader source_node
    :initarg :source_node
    :type cl:string
    :initform "")
   (target_node
    :reader target_node
    :initarg :target_node
    :type cl:string
    :initform ""))
)

(cl:defclass SourceTargetNodes (<SourceTargetNodes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SourceTargetNodes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SourceTargetNodes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<SourceTargetNodes> is deprecated: use duckietown_msgs-msg:SourceTargetNodes instead.")))

(cl:ensure-generic-function 'source_node-val :lambda-list '(m))
(cl:defmethod source_node-val ((m <SourceTargetNodes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:source_node-val is deprecated.  Use duckietown_msgs-msg:source_node instead.")
  (source_node m))

(cl:ensure-generic-function 'target_node-val :lambda-list '(m))
(cl:defmethod target_node-val ((m <SourceTargetNodes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:target_node-val is deprecated.  Use duckietown_msgs-msg:target_node instead.")
  (target_node m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SourceTargetNodes>) ostream)
  "Serializes a message object of type '<SourceTargetNodes>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source_node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source_node))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target_node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target_node))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SourceTargetNodes>) istream)
  "Deserializes a message object of type '<SourceTargetNodes>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source_node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'source_node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target_node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target_node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SourceTargetNodes>)))
  "Returns string type for a message object of type '<SourceTargetNodes>"
  "duckietown_msgs/SourceTargetNodes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SourceTargetNodes)))
  "Returns string type for a message object of type 'SourceTargetNodes"
  "duckietown_msgs/SourceTargetNodes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SourceTargetNodes>)))
  "Returns md5sum for a message object of type '<SourceTargetNodes>"
  "f05fda47731d8da1f80e3a499a42edf9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SourceTargetNodes)))
  "Returns md5sum for a message object of type 'SourceTargetNodes"
  "f05fda47731d8da1f80e3a499a42edf9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SourceTargetNodes>)))
  "Returns full string definition for message of type '<SourceTargetNodes>"
  (cl:format cl:nil "string source_node~%string target_node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SourceTargetNodes)))
  "Returns full string definition for message of type 'SourceTargetNodes"
  (cl:format cl:nil "string source_node~%string target_node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SourceTargetNodes>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'source_node))
     4 (cl:length (cl:slot-value msg 'target_node))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SourceTargetNodes>))
  "Converts a ROS message object to a list"
  (cl:list 'SourceTargetNodes
    (cl:cons ':source_node (source_node msg))
    (cl:cons ':target_node (target_node msg))
))
