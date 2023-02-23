; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude VehiclePose.msg.html

(cl:defclass <VehiclePose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rho
    :reader rho
    :initarg :rho
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (theta
    :reader theta
    :initarg :theta
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (psi
    :reader psi
    :initarg :psi
    :type std_msgs-msg:Float32
    :initform (cl:make-instance 'std_msgs-msg:Float32))
   (detection
    :reader detection
    :initarg :detection
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool)))
)

(cl:defclass VehiclePose (<VehiclePose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VehiclePose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VehiclePose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<VehiclePose> is deprecated: use duckietown_msgs-msg:VehiclePose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VehiclePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rho-val :lambda-list '(m))
(cl:defmethod rho-val ((m <VehiclePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:rho-val is deprecated.  Use duckietown_msgs-msg:rho instead.")
  (rho m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <VehiclePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:theta-val is deprecated.  Use duckietown_msgs-msg:theta instead.")
  (theta m))

(cl:ensure-generic-function 'psi-val :lambda-list '(m))
(cl:defmethod psi-val ((m <VehiclePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:psi-val is deprecated.  Use duckietown_msgs-msg:psi instead.")
  (psi m))

(cl:ensure-generic-function 'detection-val :lambda-list '(m))
(cl:defmethod detection-val ((m <VehiclePose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:detection-val is deprecated.  Use duckietown_msgs-msg:detection instead.")
  (detection m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VehiclePose>) ostream)
  "Serializes a message object of type '<VehiclePose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rho) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'theta) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'psi) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'detection) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VehiclePose>) istream)
  "Deserializes a message object of type '<VehiclePose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rho) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'theta) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'psi) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'detection) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VehiclePose>)))
  "Returns string type for a message object of type '<VehiclePose>"
  "duckietown_msgs/VehiclePose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VehiclePose)))
  "Returns string type for a message object of type 'VehiclePose"
  "duckietown_msgs/VehiclePose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VehiclePose>)))
  "Returns md5sum for a message object of type '<VehiclePose>"
  "69c01ed5e84e0f58f795e563d073900d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VehiclePose)))
  "Returns md5sum for a message object of type 'VehiclePose"
  "69c01ed5e84e0f58f795e563d073900d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VehiclePose>)))
  "Returns full string definition for message of type '<VehiclePose>"
  (cl:format cl:nil "Header header~%std_msgs/Float32 rho~%std_msgs/Float32 theta~%std_msgs/Float32 psi~%std_msgs/Bool detection~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VehiclePose)))
  "Returns full string definition for message of type 'VehiclePose"
  (cl:format cl:nil "Header header~%std_msgs/Float32 rho~%std_msgs/Float32 theta~%std_msgs/Float32 psi~%std_msgs/Bool detection~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/Float32~%float32 data~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VehiclePose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rho))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'theta))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'psi))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'detection))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VehiclePose>))
  "Converts a ROS message object to a list"
  (cl:list 'VehiclePose
    (cl:cons ':header (header msg))
    (cl:cons ':rho (rho msg))
    (cl:cons ':theta (theta msg))
    (cl:cons ':psi (psi msg))
    (cl:cons ':detection (detection msg))
))
