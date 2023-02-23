; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude SetVariable-request.msg.html

(cl:defclass <SetVariable-request> (roslisp-msg-protocol:ros-message)
  ((name_json
    :reader name_json
    :initarg :name_json
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (value_json
    :reader value_json
    :initarg :value_json
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass SetVariable-request (<SetVariable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetVariable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetVariable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetVariable-request> is deprecated: use duckietown_msgs-srv:SetVariable-request instead.")))

(cl:ensure-generic-function 'name_json-val :lambda-list '(m))
(cl:defmethod name_json-val ((m <SetVariable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:name_json-val is deprecated.  Use duckietown_msgs-srv:name_json instead.")
  (name_json m))

(cl:ensure-generic-function 'value_json-val :lambda-list '(m))
(cl:defmethod value_json-val ((m <SetVariable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:value_json-val is deprecated.  Use duckietown_msgs-srv:value_json instead.")
  (value_json m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetVariable-request>) ostream)
  "Serializes a message object of type '<SetVariable-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'name_json) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'value_json) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetVariable-request>) istream)
  "Deserializes a message object of type '<SetVariable-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'name_json) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'value_json) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetVariable-request>)))
  "Returns string type for a service object of type '<SetVariable-request>"
  "duckietown_msgs/SetVariableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetVariable-request)))
  "Returns string type for a service object of type 'SetVariable-request"
  "duckietown_msgs/SetVariableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetVariable-request>)))
  "Returns md5sum for a message object of type '<SetVariable-request>"
  "b9596f8691f82d6cddb450d38ac5e5af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetVariable-request)))
  "Returns md5sum for a message object of type 'SetVariable-request"
  "b9596f8691f82d6cddb450d38ac5e5af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetVariable-request>)))
  "Returns full string definition for message of type '<SetVariable-request>"
  (cl:format cl:nil "std_msgs/String name_json~%std_msgs/String value_json~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetVariable-request)))
  "Returns full string definition for message of type 'SetVariable-request"
  (cl:format cl:nil "std_msgs/String name_json~%std_msgs/String value_json~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetVariable-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'name_json))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'value_json))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetVariable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetVariable-request
    (cl:cons ':name_json (name_json msg))
    (cl:cons ':value_json (value_json msg))
))
;//! \htmlinclude SetVariable-response.msg.html

(cl:defclass <SetVariable-response> (roslisp-msg-protocol:ros-message)
  ((success_json
    :reader success_json
    :initarg :success_json
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass SetVariable-response (<SetVariable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetVariable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetVariable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SetVariable-response> is deprecated: use duckietown_msgs-srv:SetVariable-response instead.")))

(cl:ensure-generic-function 'success_json-val :lambda-list '(m))
(cl:defmethod success_json-val ((m <SetVariable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:success_json-val is deprecated.  Use duckietown_msgs-srv:success_json instead.")
  (success_json m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetVariable-response>) ostream)
  "Serializes a message object of type '<SetVariable-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'success_json) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetVariable-response>) istream)
  "Deserializes a message object of type '<SetVariable-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'success_json) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetVariable-response>)))
  "Returns string type for a service object of type '<SetVariable-response>"
  "duckietown_msgs/SetVariableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetVariable-response)))
  "Returns string type for a service object of type 'SetVariable-response"
  "duckietown_msgs/SetVariableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetVariable-response>)))
  "Returns md5sum for a message object of type '<SetVariable-response>"
  "b9596f8691f82d6cddb450d38ac5e5af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetVariable-response)))
  "Returns md5sum for a message object of type 'SetVariable-response"
  "b9596f8691f82d6cddb450d38ac5e5af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetVariable-response>)))
  "Returns full string definition for message of type '<SetVariable-response>"
  (cl:format cl:nil "std_msgs/String success_json~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetVariable-response)))
  "Returns full string definition for message of type 'SetVariable-response"
  (cl:format cl:nil "std_msgs/String success_json~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetVariable-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'success_json))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetVariable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetVariable-response
    (cl:cons ':success_json (success_json msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetVariable)))
  'SetVariable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetVariable)))
  'SetVariable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetVariable)))
  "Returns string type for a service object of type '<SetVariable>"
  "duckietown_msgs/SetVariable")