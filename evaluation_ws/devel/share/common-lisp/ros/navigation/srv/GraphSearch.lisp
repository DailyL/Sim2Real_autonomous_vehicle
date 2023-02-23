; Auto-generated. Do not edit!


(cl:in-package navigation-srv)


;//! \htmlinclude GraphSearch-request.msg.html

(cl:defclass <GraphSearch-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GraphSearch-request (<GraphSearch-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphSearch-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphSearch-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name navigation-srv:<GraphSearch-request> is deprecated: use navigation-srv:GraphSearch-request instead.")))

(cl:ensure-generic-function 'source_node-val :lambda-list '(m))
(cl:defmethod source_node-val ((m <GraphSearch-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-srv:source_node-val is deprecated.  Use navigation-srv:source_node instead.")
  (source_node m))

(cl:ensure-generic-function 'target_node-val :lambda-list '(m))
(cl:defmethod target_node-val ((m <GraphSearch-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-srv:target_node-val is deprecated.  Use navigation-srv:target_node instead.")
  (target_node m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphSearch-request>) ostream)
  "Serializes a message object of type '<GraphSearch-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphSearch-request>) istream)
  "Deserializes a message object of type '<GraphSearch-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphSearch-request>)))
  "Returns string type for a service object of type '<GraphSearch-request>"
  "navigation/GraphSearchRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphSearch-request)))
  "Returns string type for a service object of type 'GraphSearch-request"
  "navigation/GraphSearchRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphSearch-request>)))
  "Returns md5sum for a message object of type '<GraphSearch-request>"
  "09a6e880a7e29d5f1df1f6f7be49541d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphSearch-request)))
  "Returns md5sum for a message object of type 'GraphSearch-request"
  "09a6e880a7e29d5f1df1f6f7be49541d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphSearch-request>)))
  "Returns full string definition for message of type '<GraphSearch-request>"
  (cl:format cl:nil "string source_node~%string target_node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphSearch-request)))
  "Returns full string definition for message of type 'GraphSearch-request"
  (cl:format cl:nil "string source_node~%string target_node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphSearch-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'source_node))
     4 (cl:length (cl:slot-value msg 'target_node))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphSearch-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphSearch-request
    (cl:cons ':source_node (source_node msg))
    (cl:cons ':target_node (target_node msg))
))
;//! \htmlinclude GraphSearch-response.msg.html

(cl:defclass <GraphSearch-response> (roslisp-msg-protocol:ros-message)
  ((actions
    :reader actions
    :initarg :actions
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GraphSearch-response (<GraphSearch-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphSearch-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphSearch-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name navigation-srv:<GraphSearch-response> is deprecated: use navigation-srv:GraphSearch-response instead.")))

(cl:ensure-generic-function 'actions-val :lambda-list '(m))
(cl:defmethod actions-val ((m <GraphSearch-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader navigation-srv:actions-val is deprecated.  Use navigation-srv:actions instead.")
  (actions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphSearch-response>) ostream)
  "Serializes a message object of type '<GraphSearch-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'actions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'actions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphSearch-response>) istream)
  "Deserializes a message object of type '<GraphSearch-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'actions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'actions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphSearch-response>)))
  "Returns string type for a service object of type '<GraphSearch-response>"
  "navigation/GraphSearchResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphSearch-response)))
  "Returns string type for a service object of type 'GraphSearch-response"
  "navigation/GraphSearchResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphSearch-response>)))
  "Returns md5sum for a message object of type '<GraphSearch-response>"
  "09a6e880a7e29d5f1df1f6f7be49541d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphSearch-response)))
  "Returns md5sum for a message object of type 'GraphSearch-response"
  "09a6e880a7e29d5f1df1f6f7be49541d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphSearch-response>)))
  "Returns full string definition for message of type '<GraphSearch-response>"
  (cl:format cl:nil "string[] actions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphSearch-response)))
  "Returns full string definition for message of type 'GraphSearch-response"
  (cl:format cl:nil "string[] actions~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphSearch-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'actions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphSearch-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphSearch-response
    (cl:cons ':actions (actions msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GraphSearch)))
  'GraphSearch-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GraphSearch)))
  'GraphSearch-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphSearch)))
  "Returns string type for a service object of type '<GraphSearch>"
  "navigation/GraphSearch")