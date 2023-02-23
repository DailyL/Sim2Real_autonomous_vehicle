; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude GetVariable-request.msg.html

(cl:defclass <GetVariable-request> (roslisp-msg-protocol:ros-message)
  ((name_json
    :reader name_json
    :initarg :name_json
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass GetVariable-request (<GetVariable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetVariable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetVariable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<GetVariable-request> is deprecated: use duckietown_msgs-srv:GetVariable-request instead.")))

(cl:ensure-generic-function 'name_json-val :lambda-list '(m))
(cl:defmethod name_json-val ((m <GetVariable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:name_json-val is deprecated.  Use duckietown_msgs-srv:name_json instead.")
  (name_json m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetVariable-request>) ostream)
  "Serializes a message object of type '<GetVariable-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'name_json) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetVariable-request>) istream)
  "Deserializes a message object of type '<GetVariable-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'name_json) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetVariable-request>)))
  "Returns string type for a service object of type '<GetVariable-request>"
  "duckietown_msgs/GetVariableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVariable-request)))
  "Returns string type for a service object of type 'GetVariable-request"
  "duckietown_msgs/GetVariableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetVariable-request>)))
  "Returns md5sum for a message object of type '<GetVariable-request>"
  "685a8058475bb3a593fd8f9319066e6a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetVariable-request)))
  "Returns md5sum for a message object of type 'GetVariable-request"
  "685a8058475bb3a593fd8f9319066e6a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetVariable-request>)))
  "Returns full string definition for message of type '<GetVariable-request>"
  (cl:format cl:nil "std_msgs/String name_json~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetVariable-request)))
  "Returns full string definition for message of type 'GetVariable-request"
  (cl:format cl:nil "std_msgs/String name_json~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetVariable-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'name_json))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetVariable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetVariable-request
    (cl:cons ':name_json (name_json msg))
))
;//! \htmlinclude GetVariable-response.msg.html

(cl:defclass <GetVariable-response> (roslisp-msg-protocol:ros-message)
  ((value_json
    :reader value_json
    :initarg :value_json
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass GetVariable-response (<GetVariable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetVariable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetVariable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<GetVariable-response> is deprecated: use duckietown_msgs-srv:GetVariable-response instead.")))

(cl:ensure-generic-function 'value_json-val :lambda-list '(m))
(cl:defmethod value_json-val ((m <GetVariable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:value_json-val is deprecated.  Use duckietown_msgs-srv:value_json instead.")
  (value_json m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetVariable-response>) ostream)
  "Serializes a message object of type '<GetVariable-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'value_json) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetVariable-response>) istream)
  "Deserializes a message object of type '<GetVariable-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'value_json) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetVariable-response>)))
  "Returns string type for a service object of type '<GetVariable-response>"
  "duckietown_msgs/GetVariableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVariable-response)))
  "Returns string type for a service object of type 'GetVariable-response"
  "duckietown_msgs/GetVariableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetVariable-response>)))
  "Returns md5sum for a message object of type '<GetVariable-response>"
  "685a8058475bb3a593fd8f9319066e6a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetVariable-response)))
  "Returns md5sum for a message object of type 'GetVariable-response"
  "685a8058475bb3a593fd8f9319066e6a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetVariable-response>)))
  "Returns full string definition for message of type '<GetVariable-response>"
  (cl:format cl:nil "std_msgs/String value_json~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetVariable-response)))
  "Returns full string definition for message of type 'GetVariable-response"
  (cl:format cl:nil "std_msgs/String value_json~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetVariable-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'value_json))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetVariable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetVariable-response
    (cl:cons ':value_json (value_json msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetVariable)))
  'GetVariable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetVariable)))
  'GetVariable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetVariable)))
  "Returns string type for a service object of type '<GetVariable>"
  "duckietown_msgs/GetVariable")