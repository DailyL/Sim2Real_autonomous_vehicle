; Auto-generated. Do not edit!


(cl:in-package hector_mapping-srv)


;//! \htmlinclude ResetMapping-request.msg.html

(cl:defclass <ResetMapping-request> (roslisp-msg-protocol:ros-message)
  ((initial_pose
    :reader initial_pose
    :initarg :initial_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass ResetMapping-request (<ResetMapping-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetMapping-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetMapping-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hector_mapping-srv:<ResetMapping-request> is deprecated: use hector_mapping-srv:ResetMapping-request instead.")))

(cl:ensure-generic-function 'initial_pose-val :lambda-list '(m))
(cl:defmethod initial_pose-val ((m <ResetMapping-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hector_mapping-srv:initial_pose-val is deprecated.  Use hector_mapping-srv:initial_pose instead.")
  (initial_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetMapping-request>) ostream)
  "Serializes a message object of type '<ResetMapping-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initial_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetMapping-request>) istream)
  "Deserializes a message object of type '<ResetMapping-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initial_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetMapping-request>)))
  "Returns string type for a service object of type '<ResetMapping-request>"
  "hector_mapping/ResetMappingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMapping-request)))
  "Returns string type for a service object of type 'ResetMapping-request"
  "hector_mapping/ResetMappingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetMapping-request>)))
  "Returns md5sum for a message object of type '<ResetMapping-request>"
  "3423647d14c6c84592eef8b1184a5974")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetMapping-request)))
  "Returns md5sum for a message object of type 'ResetMapping-request"
  "3423647d14c6c84592eef8b1184a5974")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetMapping-request>)))
  "Returns full string definition for message of type '<ResetMapping-request>"
  (cl:format cl:nil "geometry_msgs/Pose initial_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetMapping-request)))
  "Returns full string definition for message of type 'ResetMapping-request"
  (cl:format cl:nil "geometry_msgs/Pose initial_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetMapping-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initial_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetMapping-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetMapping-request
    (cl:cons ':initial_pose (initial_pose msg))
))
;//! \htmlinclude ResetMapping-response.msg.html

(cl:defclass <ResetMapping-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetMapping-response (<ResetMapping-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetMapping-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetMapping-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hector_mapping-srv:<ResetMapping-response> is deprecated: use hector_mapping-srv:ResetMapping-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetMapping-response>) ostream)
  "Serializes a message object of type '<ResetMapping-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetMapping-response>) istream)
  "Deserializes a message object of type '<ResetMapping-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetMapping-response>)))
  "Returns string type for a service object of type '<ResetMapping-response>"
  "hector_mapping/ResetMappingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMapping-response)))
  "Returns string type for a service object of type 'ResetMapping-response"
  "hector_mapping/ResetMappingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetMapping-response>)))
  "Returns md5sum for a message object of type '<ResetMapping-response>"
  "3423647d14c6c84592eef8b1184a5974")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetMapping-response)))
  "Returns md5sum for a message object of type 'ResetMapping-response"
  "3423647d14c6c84592eef8b1184a5974")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetMapping-response>)))
  "Returns full string definition for message of type '<ResetMapping-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetMapping-response)))
  "Returns full string definition for message of type 'ResetMapping-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetMapping-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetMapping-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetMapping-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetMapping)))
  'ResetMapping-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetMapping)))
  'ResetMapping-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMapping)))
  "Returns string type for a service object of type '<ResetMapping>"
  "hector_mapping/ResetMapping")