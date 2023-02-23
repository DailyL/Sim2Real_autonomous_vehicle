; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude NodeGetParamsList-request.msg.html

(cl:defclass <NodeGetParamsList-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass NodeGetParamsList-request (<NodeGetParamsList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeGetParamsList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeGetParamsList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<NodeGetParamsList-request> is deprecated: use duckietown_msgs-srv:NodeGetParamsList-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeGetParamsList-request>) ostream)
  "Serializes a message object of type '<NodeGetParamsList-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeGetParamsList-request>) istream)
  "Deserializes a message object of type '<NodeGetParamsList-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeGetParamsList-request>)))
  "Returns string type for a service object of type '<NodeGetParamsList-request>"
  "duckietown_msgs/NodeGetParamsListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeGetParamsList-request)))
  "Returns string type for a service object of type 'NodeGetParamsList-request"
  "duckietown_msgs/NodeGetParamsListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeGetParamsList-request>)))
  "Returns md5sum for a message object of type '<NodeGetParamsList-request>"
  "6d0f5ba1e047603a0b1306ec478bb3e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeGetParamsList-request)))
  "Returns md5sum for a message object of type 'NodeGetParamsList-request"
  "6d0f5ba1e047603a0b1306ec478bb3e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeGetParamsList-request>)))
  "Returns full string definition for message of type '<NodeGetParamsList-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeGetParamsList-request)))
  "Returns full string definition for message of type 'NodeGetParamsList-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeGetParamsList-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeGetParamsList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeGetParamsList-request
))
;//! \htmlinclude NodeGetParamsList-response.msg.html

(cl:defclass <NodeGetParamsList-response> (roslisp-msg-protocol:ros-message)
  ((parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector duckietown_msgs-msg:NodeParameter)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:NodeParameter :initial-element (cl:make-instance 'duckietown_msgs-msg:NodeParameter))))
)

(cl:defclass NodeGetParamsList-response (<NodeGetParamsList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeGetParamsList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeGetParamsList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<NodeGetParamsList-response> is deprecated: use duckietown_msgs-srv:NodeGetParamsList-response instead.")))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <NodeGetParamsList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:parameters-val is deprecated.  Use duckietown_msgs-srv:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeGetParamsList-response>) ostream)
  "Serializes a message object of type '<NodeGetParamsList-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeGetParamsList-response>) istream)
  "Deserializes a message object of type '<NodeGetParamsList-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:NodeParameter))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeGetParamsList-response>)))
  "Returns string type for a service object of type '<NodeGetParamsList-response>"
  "duckietown_msgs/NodeGetParamsListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeGetParamsList-response)))
  "Returns string type for a service object of type 'NodeGetParamsList-response"
  "duckietown_msgs/NodeGetParamsListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeGetParamsList-response>)))
  "Returns md5sum for a message object of type '<NodeGetParamsList-response>"
  "6d0f5ba1e047603a0b1306ec478bb3e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeGetParamsList-response)))
  "Returns md5sum for a message object of type 'NodeGetParamsList-response"
  "6d0f5ba1e047603a0b1306ec478bb3e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeGetParamsList-response>)))
  "Returns full string definition for message of type '<NodeGetParamsList-response>"
  (cl:format cl:nil "duckietown_msgs/NodeParameter[] parameters~%~%~%================================================================================~%MSG: duckietown_msgs/NodeParameter~%# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeGetParamsList-response)))
  "Returns full string definition for message of type 'NodeGetParamsList-response"
  (cl:format cl:nil "duckietown_msgs/NodeParameter[] parameters~%~%~%================================================================================~%MSG: duckietown_msgs/NodeParameter~%# Parameter type (this has to match duckietown.TopicType)~%uint8 PARAM_TYPE_UNKNOWN = 0~%uint8 PARAM_TYPE_STRING = 1~%uint8 PARAM_TYPE_INT = 2~%uint8 PARAM_TYPE_FLOAT = 3~%uint8 PARAM_TYPE_BOOL = 4~%~%string node         # Name of the node~%string name         # Name of the parameter (fully resolved)~%string help         # Description of the parameter~%uint8 type          # Type of the parameter (see PARAM_TYPE_X above)~%float32 min_value   # Min value (for type INT, UINT, and FLOAT)~%float32 max_value   # Max value (for type INT, UINT, and FLOAT)~%bool editable       # Editable (it means that the node will be notified for changes)~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeGetParamsList-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeGetParamsList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeGetParamsList-response
    (cl:cons ':parameters (parameters msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NodeGetParamsList)))
  'NodeGetParamsList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NodeGetParamsList)))
  'NodeGetParamsList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeGetParamsList)))
  "Returns string type for a service object of type '<NodeGetParamsList>"
  "duckietown_msgs/NodeGetParamsList")