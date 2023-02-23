; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude SetValue-request.msg.html

(cl:defclass <SetValue-request> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetValue-request (<SetValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetValue-request> is deprecated: use duckietown_msgs-srv:SetValue-request instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SetValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:value-val is deprecated.  Use duckietown_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetValue-request>) ostream)
  "Serializes a message object of type '<SetValue-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetValue-request>) istream)
  "Deserializes a message object of type '<SetValue-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetValue-request>)))
  "Returns string type for a service object of type '<SetValue-request>"
  "duckietown_msgs/SetValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetValue-request)))
  "Returns string type for a service object of type 'SetValue-request"
  "duckietown_msgs/SetValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetValue-request>)))
  "Returns md5sum for a message object of type '<SetValue-request>"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetValue-request)))
  "Returns md5sum for a message object of type 'SetValue-request"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetValue-request>)))
  "Returns full string definition for message of type '<SetValue-request>"
  (cl:format cl:nil "float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetValue-request)))
  "Returns full string definition for message of type 'SetValue-request"
  (cl:format cl:nil "float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetValue-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetValue-request
    (cl:cons ':value (value msg))
))
;//! \htmlinclude SetValue-response.msg.html

(cl:defclass <SetValue-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetValue-response (<SetValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetValue-response> is deprecated: use duckietown_msgs-srv:SetValue-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetValue-response>) ostream)
  "Serializes a message object of type '<SetValue-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetValue-response>) istream)
  "Deserializes a message object of type '<SetValue-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetValue-response>)))
  "Returns string type for a service object of type '<SetValue-response>"
  "duckietown_msgs/SetValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetValue-response)))
  "Returns string type for a service object of type 'SetValue-response"
  "duckietown_msgs/SetValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetValue-response>)))
  "Returns md5sum for a message object of type '<SetValue-response>"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetValue-response)))
  "Returns md5sum for a message object of type 'SetValue-response"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetValue-response>)))
  "Returns full string definition for message of type '<SetValue-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetValue-response)))
  "Returns full string definition for message of type 'SetValue-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetValue-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetValue-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetValue)))
  'SetValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetValue)))
  'SetValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetValue)))
  "Returns string type for a service object of type '<SetValue>"
  "duckietown_msgs/SetValue")