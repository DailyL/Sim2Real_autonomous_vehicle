; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude NodeRequestParamsUpdate-request.msg.html

(cl:defclass <NodeRequestParamsUpdate-request> (roslisp-msg-protocol:ros-message)
  ((parameter
    :reader parameter
    :initarg :parameter
    :type cl:string
    :initform ""))
)

(cl:defclass NodeRequestParamsUpdate-request (<NodeRequestParamsUpdate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeRequestParamsUpdate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeRequestParamsUpdate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<NodeRequestParamsUpdate-request> is deprecated: use duckietown_msgs-srv:NodeRequestParamsUpdate-request instead.")))

(cl:ensure-generic-function 'parameter-val :lambda-list '(m))
(cl:defmethod parameter-val ((m <NodeRequestParamsUpdate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:parameter-val is deprecated.  Use duckietown_msgs-srv:parameter instead.")
  (parameter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeRequestParamsUpdate-request>) ostream)
  "Serializes a message object of type '<NodeRequestParamsUpdate-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parameter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parameter))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeRequestParamsUpdate-request>) istream)
  "Deserializes a message object of type '<NodeRequestParamsUpdate-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parameter) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parameter) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeRequestParamsUpdate-request>)))
  "Returns string type for a service object of type '<NodeRequestParamsUpdate-request>"
  "duckietown_msgs/NodeRequestParamsUpdateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeRequestParamsUpdate-request)))
  "Returns string type for a service object of type 'NodeRequestParamsUpdate-request"
  "duckietown_msgs/NodeRequestParamsUpdateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeRequestParamsUpdate-request>)))
  "Returns md5sum for a message object of type '<NodeRequestParamsUpdate-request>"
  "e8496433f08c35370e7779defca9aa19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeRequestParamsUpdate-request)))
  "Returns md5sum for a message object of type 'NodeRequestParamsUpdate-request"
  "e8496433f08c35370e7779defca9aa19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeRequestParamsUpdate-request>)))
  "Returns full string definition for message of type '<NodeRequestParamsUpdate-request>"
  (cl:format cl:nil "string parameter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeRequestParamsUpdate-request)))
  "Returns full string definition for message of type 'NodeRequestParamsUpdate-request"
  (cl:format cl:nil "string parameter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeRequestParamsUpdate-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'parameter))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeRequestParamsUpdate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeRequestParamsUpdate-request
    (cl:cons ':parameter (parameter msg))
))
;//! \htmlinclude NodeRequestParamsUpdate-response.msg.html

(cl:defclass <NodeRequestParamsUpdate-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NodeRequestParamsUpdate-response (<NodeRequestParamsUpdate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeRequestParamsUpdate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeRequestParamsUpdate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<NodeRequestParamsUpdate-response> is deprecated: use duckietown_msgs-srv:NodeRequestParamsUpdate-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <NodeRequestParamsUpdate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:success-val is deprecated.  Use duckietown_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeRequestParamsUpdate-response>) ostream)
  "Serializes a message object of type '<NodeRequestParamsUpdate-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeRequestParamsUpdate-response>) istream)
  "Deserializes a message object of type '<NodeRequestParamsUpdate-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeRequestParamsUpdate-response>)))
  "Returns string type for a service object of type '<NodeRequestParamsUpdate-response>"
  "duckietown_msgs/NodeRequestParamsUpdateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeRequestParamsUpdate-response)))
  "Returns string type for a service object of type 'NodeRequestParamsUpdate-response"
  "duckietown_msgs/NodeRequestParamsUpdateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeRequestParamsUpdate-response>)))
  "Returns md5sum for a message object of type '<NodeRequestParamsUpdate-response>"
  "e8496433f08c35370e7779defca9aa19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeRequestParamsUpdate-response)))
  "Returns md5sum for a message object of type 'NodeRequestParamsUpdate-response"
  "e8496433f08c35370e7779defca9aa19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeRequestParamsUpdate-response>)))
  "Returns full string definition for message of type '<NodeRequestParamsUpdate-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeRequestParamsUpdate-response)))
  "Returns full string definition for message of type 'NodeRequestParamsUpdate-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeRequestParamsUpdate-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeRequestParamsUpdate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeRequestParamsUpdate-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NodeRequestParamsUpdate)))
  'NodeRequestParamsUpdate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NodeRequestParamsUpdate)))
  'NodeRequestParamsUpdate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeRequestParamsUpdate)))
  "Returns string type for a service object of type '<NodeRequestParamsUpdate>"
  "duckietown_msgs/NodeRequestParamsUpdate")