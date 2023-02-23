; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude ChangePattern-request.msg.html

(cl:defclass <ChangePattern-request> (roslisp-msg-protocol:ros-message)
  ((pattern_name
    :reader pattern_name
    :initarg :pattern_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass ChangePattern-request (<ChangePattern-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangePattern-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangePattern-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<ChangePattern-request> is deprecated: use duckietown_msgs-srv:ChangePattern-request instead.")))

(cl:ensure-generic-function 'pattern_name-val :lambda-list '(m))
(cl:defmethod pattern_name-val ((m <ChangePattern-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:pattern_name-val is deprecated.  Use duckietown_msgs-srv:pattern_name instead.")
  (pattern_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangePattern-request>) ostream)
  "Serializes a message object of type '<ChangePattern-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pattern_name) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangePattern-request>) istream)
  "Deserializes a message object of type '<ChangePattern-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pattern_name) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangePattern-request>)))
  "Returns string type for a service object of type '<ChangePattern-request>"
  "duckietown_msgs/ChangePatternRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangePattern-request)))
  "Returns string type for a service object of type 'ChangePattern-request"
  "duckietown_msgs/ChangePatternRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangePattern-request>)))
  "Returns md5sum for a message object of type '<ChangePattern-request>"
  "678f2d65b1bda577ab0910fd9c7414ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangePattern-request)))
  "Returns md5sum for a message object of type 'ChangePattern-request"
  "678f2d65b1bda577ab0910fd9c7414ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangePattern-request>)))
  "Returns full string definition for message of type '<ChangePattern-request>"
  (cl:format cl:nil "std_msgs/String pattern_name~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangePattern-request)))
  "Returns full string definition for message of type 'ChangePattern-request"
  (cl:format cl:nil "std_msgs/String pattern_name~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangePattern-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pattern_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangePattern-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangePattern-request
    (cl:cons ':pattern_name (pattern_name msg))
))
;//! \htmlinclude ChangePattern-response.msg.html

(cl:defclass <ChangePattern-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ChangePattern-response (<ChangePattern-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangePattern-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangePattern-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<ChangePattern-response> is deprecated: use duckietown_msgs-srv:ChangePattern-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangePattern-response>) ostream)
  "Serializes a message object of type '<ChangePattern-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangePattern-response>) istream)
  "Deserializes a message object of type '<ChangePattern-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangePattern-response>)))
  "Returns string type for a service object of type '<ChangePattern-response>"
  "duckietown_msgs/ChangePatternResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangePattern-response)))
  "Returns string type for a service object of type 'ChangePattern-response"
  "duckietown_msgs/ChangePatternResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangePattern-response>)))
  "Returns md5sum for a message object of type '<ChangePattern-response>"
  "678f2d65b1bda577ab0910fd9c7414ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangePattern-response)))
  "Returns md5sum for a message object of type 'ChangePattern-response"
  "678f2d65b1bda577ab0910fd9c7414ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangePattern-response>)))
  "Returns full string definition for message of type '<ChangePattern-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangePattern-response)))
  "Returns full string definition for message of type 'ChangePattern-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangePattern-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangePattern-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangePattern-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangePattern)))
  'ChangePattern-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangePattern)))
  'ChangePattern-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangePattern)))
  "Returns string type for a service object of type '<ChangePattern>"
  "duckietown_msgs/ChangePattern")