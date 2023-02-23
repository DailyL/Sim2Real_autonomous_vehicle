; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude SetFSMState-request.msg.html

(cl:defclass <SetFSMState-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:string
    :initform ""))
)

(cl:defclass SetFSMState-request (<SetFSMState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFSMState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFSMState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetFSMState-request> is deprecated: use duckietown_msgs-srv:SetFSMState-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <SetFSMState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state-val is deprecated.  Use duckietown_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFSMState-request>) ostream)
  "Serializes a message object of type '<SetFSMState-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFSMState-request>) istream)
  "Deserializes a message object of type '<SetFSMState-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFSMState-request>)))
  "Returns string type for a service object of type '<SetFSMState-request>"
  "duckietown_msgs/SetFSMStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFSMState-request)))
  "Returns string type for a service object of type 'SetFSMState-request"
  "duckietown_msgs/SetFSMStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFSMState-request>)))
  "Returns md5sum for a message object of type '<SetFSMState-request>"
  "af6d3a99f0fbeb66d3248fa4b3e675fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFSMState-request)))
  "Returns md5sum for a message object of type 'SetFSMState-request"
  "af6d3a99f0fbeb66d3248fa4b3e675fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFSMState-request>)))
  "Returns full string definition for message of type '<SetFSMState-request>"
  (cl:format cl:nil "string state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFSMState-request)))
  "Returns full string definition for message of type 'SetFSMState-request"
  (cl:format cl:nil "string state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFSMState-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFSMState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFSMState-request
    (cl:cons ':state (state msg))
))
;//! \htmlinclude SetFSMState-response.msg.html

(cl:defclass <SetFSMState-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetFSMState-response (<SetFSMState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFSMState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFSMState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetFSMState-response> is deprecated: use duckietown_msgs-srv:SetFSMState-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFSMState-response>) ostream)
  "Serializes a message object of type '<SetFSMState-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFSMState-response>) istream)
  "Deserializes a message object of type '<SetFSMState-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFSMState-response>)))
  "Returns string type for a service object of type '<SetFSMState-response>"
  "duckietown_msgs/SetFSMStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFSMState-response)))
  "Returns string type for a service object of type 'SetFSMState-response"
  "duckietown_msgs/SetFSMStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFSMState-response>)))
  "Returns md5sum for a message object of type '<SetFSMState-response>"
  "af6d3a99f0fbeb66d3248fa4b3e675fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFSMState-response)))
  "Returns md5sum for a message object of type 'SetFSMState-response"
  "af6d3a99f0fbeb66d3248fa4b3e675fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFSMState-response>)))
  "Returns full string definition for message of type '<SetFSMState-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFSMState-response)))
  "Returns full string definition for message of type 'SetFSMState-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFSMState-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFSMState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFSMState-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetFSMState)))
  'SetFSMState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetFSMState)))
  'SetFSMState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFSMState)))
  "Returns string type for a service object of type '<SetFSMState>"
  "duckietown_msgs/SetFSMState")