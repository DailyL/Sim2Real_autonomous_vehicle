; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-srv)


;//! \htmlinclude SensorsStatus-request.msg.html

(cl:defclass <SensorsStatus-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SensorsStatus-request (<SensorsStatus-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorsStatus-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorsStatus-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SensorsStatus-request> is deprecated: use duckietown_msgs-srv:SensorsStatus-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <SensorsStatus-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state-val is deprecated.  Use duckietown_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorsStatus-request>) ostream)
  "Serializes a message object of type '<SensorsStatus-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorsStatus-request>) istream)
  "Deserializes a message object of type '<SensorsStatus-request>"
    (cl:setf (cl:slot-value msg 'state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorsStatus-request>)))
  "Returns string type for a service object of type '<SensorsStatus-request>"
  "duckietown_msgs/SensorsStatusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorsStatus-request)))
  "Returns string type for a service object of type 'SensorsStatus-request"
  "duckietown_msgs/SensorsStatusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorsStatus-request>)))
  "Returns md5sum for a message object of type '<SensorsStatus-request>"
  "d8dd1fcbd833d76004def4493c2acff3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorsStatus-request)))
  "Returns md5sum for a message object of type 'SensorsStatus-request"
  "d8dd1fcbd833d76004def4493c2acff3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorsStatus-request>)))
  "Returns full string definition for message of type '<SensorsStatus-request>"
  (cl:format cl:nil "bool state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorsStatus-request)))
  "Returns full string definition for message of type 'SensorsStatus-request"
  (cl:format cl:nil "bool state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorsStatus-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorsStatus-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorsStatus-request
    (cl:cons ':state (state msg))
))
;//! \htmlinclude SensorsStatus-response.msg.html

(cl:defclass <SensorsStatus-response> (roslisp-msg-protocol:ros-message)
  ((state_front_bumper
    :reader state_front_bumper
    :initarg :state_front_bumper
    :type cl:boolean
    :initform cl:nil)
   (state_camera
    :reader state_camera
    :initarg :state_camera
    :type cl:boolean
    :initform cl:nil)
   (state_imu
    :reader state_imu
    :initarg :state_imu
    :type cl:boolean
    :initform cl:nil)
   (state_tof_fl
    :reader state_tof_fl
    :initarg :state_tof_fl
    :type cl:boolean
    :initform cl:nil)
   (state_tof_fm
    :reader state_tof_fm
    :initarg :state_tof_fm
    :type cl:boolean
    :initform cl:nil)
   (state_tof_fr
    :reader state_tof_fr
    :initarg :state_tof_fr
    :type cl:boolean
    :initform cl:nil)
   (state_tof_sl
    :reader state_tof_sl
    :initarg :state_tof_sl
    :type cl:boolean
    :initform cl:nil)
   (state_tof_sr
    :reader state_tof_sr
    :initarg :state_tof_sr
    :type cl:boolean
    :initform cl:nil)
   (state_tof_bl
    :reader state_tof_bl
    :initarg :state_tof_bl
    :type cl:boolean
    :initform cl:nil)
   (state_tof_bm
    :reader state_tof_bm
    :initarg :state_tof_bm
    :type cl:boolean
    :initform cl:nil)
   (state_tof_br
    :reader state_tof_br
    :initarg :state_tof_br
    :type cl:boolean
    :initform cl:nil)
   (state_lf_outer_left
    :reader state_lf_outer_left
    :initarg :state_lf_outer_left
    :type cl:boolean
    :initform cl:nil)
   (state_lf_outer_right
    :reader state_lf_outer_right
    :initarg :state_lf_outer_right
    :type cl:boolean
    :initform cl:nil)
   (state_lf_inner_left
    :reader state_lf_inner_left
    :initarg :state_lf_inner_left
    :type cl:boolean
    :initform cl:nil)
   (state_lf_inner_right
    :reader state_lf_inner_right
    :initarg :state_lf_inner_right
    :type cl:boolean
    :initform cl:nil)
   (state_encoder_and_motor
    :reader state_encoder_and_motor
    :initarg :state_encoder_and_motor
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SensorsStatus-response (<SensorsStatus-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorsStatus-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorsStatus-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-srv:<SensorsStatus-response> is deprecated: use duckietown_msgs-srv:SensorsStatus-response instead.")))

(cl:ensure-generic-function 'state_front_bumper-val :lambda-list '(m))
(cl:defmethod state_front_bumper-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_front_bumper-val is deprecated.  Use duckietown_msgs-srv:state_front_bumper instead.")
  (state_front_bumper m))

(cl:ensure-generic-function 'state_camera-val :lambda-list '(m))
(cl:defmethod state_camera-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_camera-val is deprecated.  Use duckietown_msgs-srv:state_camera instead.")
  (state_camera m))

(cl:ensure-generic-function 'state_imu-val :lambda-list '(m))
(cl:defmethod state_imu-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_imu-val is deprecated.  Use duckietown_msgs-srv:state_imu instead.")
  (state_imu m))

(cl:ensure-generic-function 'state_tof_fl-val :lambda-list '(m))
(cl:defmethod state_tof_fl-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_fl-val is deprecated.  Use duckietown_msgs-srv:state_tof_fl instead.")
  (state_tof_fl m))

(cl:ensure-generic-function 'state_tof_fm-val :lambda-list '(m))
(cl:defmethod state_tof_fm-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_fm-val is deprecated.  Use duckietown_msgs-srv:state_tof_fm instead.")
  (state_tof_fm m))

(cl:ensure-generic-function 'state_tof_fr-val :lambda-list '(m))
(cl:defmethod state_tof_fr-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_fr-val is deprecated.  Use duckietown_msgs-srv:state_tof_fr instead.")
  (state_tof_fr m))

(cl:ensure-generic-function 'state_tof_sl-val :lambda-list '(m))
(cl:defmethod state_tof_sl-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_sl-val is deprecated.  Use duckietown_msgs-srv:state_tof_sl instead.")
  (state_tof_sl m))

(cl:ensure-generic-function 'state_tof_sr-val :lambda-list '(m))
(cl:defmethod state_tof_sr-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_sr-val is deprecated.  Use duckietown_msgs-srv:state_tof_sr instead.")
  (state_tof_sr m))

(cl:ensure-generic-function 'state_tof_bl-val :lambda-list '(m))
(cl:defmethod state_tof_bl-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_bl-val is deprecated.  Use duckietown_msgs-srv:state_tof_bl instead.")
  (state_tof_bl m))

(cl:ensure-generic-function 'state_tof_bm-val :lambda-list '(m))
(cl:defmethod state_tof_bm-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_bm-val is deprecated.  Use duckietown_msgs-srv:state_tof_bm instead.")
  (state_tof_bm m))

(cl:ensure-generic-function 'state_tof_br-val :lambda-list '(m))
(cl:defmethod state_tof_br-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_tof_br-val is deprecated.  Use duckietown_msgs-srv:state_tof_br instead.")
  (state_tof_br m))

(cl:ensure-generic-function 'state_lf_outer_left-val :lambda-list '(m))
(cl:defmethod state_lf_outer_left-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_lf_outer_left-val is deprecated.  Use duckietown_msgs-srv:state_lf_outer_left instead.")
  (state_lf_outer_left m))

(cl:ensure-generic-function 'state_lf_outer_right-val :lambda-list '(m))
(cl:defmethod state_lf_outer_right-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_lf_outer_right-val is deprecated.  Use duckietown_msgs-srv:state_lf_outer_right instead.")
  (state_lf_outer_right m))

(cl:ensure-generic-function 'state_lf_inner_left-val :lambda-list '(m))
(cl:defmethod state_lf_inner_left-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_lf_inner_left-val is deprecated.  Use duckietown_msgs-srv:state_lf_inner_left instead.")
  (state_lf_inner_left m))

(cl:ensure-generic-function 'state_lf_inner_right-val :lambda-list '(m))
(cl:defmethod state_lf_inner_right-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_lf_inner_right-val is deprecated.  Use duckietown_msgs-srv:state_lf_inner_right instead.")
  (state_lf_inner_right m))

(cl:ensure-generic-function 'state_encoder_and_motor-val :lambda-list '(m))
(cl:defmethod state_encoder_and_motor-val ((m <SensorsStatus-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-srv:state_encoder_and_motor-val is deprecated.  Use duckietown_msgs-srv:state_encoder_and_motor instead.")
  (state_encoder_and_motor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorsStatus-response>) ostream)
  "Serializes a message object of type '<SensorsStatus-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_front_bumper) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_camera) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_imu) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_fl) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_fm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_fr) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_sl) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_sr) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_bl) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_bm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_tof_br) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_lf_outer_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_lf_outer_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_lf_inner_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_lf_inner_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state_encoder_and_motor) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorsStatus-response>) istream)
  "Deserializes a message object of type '<SensorsStatus-response>"
    (cl:setf (cl:slot-value msg 'state_front_bumper) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_camera) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_imu) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_fl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_fm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_fr) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_sl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_sr) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_bl) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_bm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_tof_br) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_lf_outer_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_lf_outer_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_lf_inner_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_lf_inner_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'state_encoder_and_motor) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorsStatus-response>)))
  "Returns string type for a service object of type '<SensorsStatus-response>"
  "duckietown_msgs/SensorsStatusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorsStatus-response)))
  "Returns string type for a service object of type 'SensorsStatus-response"
  "duckietown_msgs/SensorsStatusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorsStatus-response>)))
  "Returns md5sum for a message object of type '<SensorsStatus-response>"
  "d8dd1fcbd833d76004def4493c2acff3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorsStatus-response)))
  "Returns md5sum for a message object of type 'SensorsStatus-response"
  "d8dd1fcbd833d76004def4493c2acff3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorsStatus-response>)))
  "Returns full string definition for message of type '<SensorsStatus-response>"
  (cl:format cl:nil "bool state_front_bumper~%bool state_camera~%bool state_imu~%bool state_tof_fl~%bool state_tof_fm~%bool state_tof_fr~%bool state_tof_sl~%bool state_tof_sr~%bool state_tof_bl~%bool state_tof_bm~%bool state_tof_br~%bool state_lf_outer_left~%bool state_lf_outer_right~%bool state_lf_inner_left~%bool state_lf_inner_right~%bool state_encoder_and_motor~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorsStatus-response)))
  "Returns full string definition for message of type 'SensorsStatus-response"
  (cl:format cl:nil "bool state_front_bumper~%bool state_camera~%bool state_imu~%bool state_tof_fl~%bool state_tof_fm~%bool state_tof_fr~%bool state_tof_sl~%bool state_tof_sr~%bool state_tof_bl~%bool state_tof_bm~%bool state_tof_br~%bool state_lf_outer_left~%bool state_lf_outer_right~%bool state_lf_inner_left~%bool state_lf_inner_right~%bool state_encoder_and_motor~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorsStatus-response>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorsStatus-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorsStatus-response
    (cl:cons ':state_front_bumper (state_front_bumper msg))
    (cl:cons ':state_camera (state_camera msg))
    (cl:cons ':state_imu (state_imu msg))
    (cl:cons ':state_tof_fl (state_tof_fl msg))
    (cl:cons ':state_tof_fm (state_tof_fm msg))
    (cl:cons ':state_tof_fr (state_tof_fr msg))
    (cl:cons ':state_tof_sl (state_tof_sl msg))
    (cl:cons ':state_tof_sr (state_tof_sr msg))
    (cl:cons ':state_tof_bl (state_tof_bl msg))
    (cl:cons ':state_tof_bm (state_tof_bm msg))
    (cl:cons ':state_tof_br (state_tof_br msg))
    (cl:cons ':state_lf_outer_left (state_lf_outer_left msg))
    (cl:cons ':state_lf_outer_right (state_lf_outer_right msg))
    (cl:cons ':state_lf_inner_left (state_lf_inner_left msg))
    (cl:cons ':state_lf_inner_right (state_lf_inner_right msg))
    (cl:cons ':state_encoder_and_motor (state_encoder_and_motor msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SensorsStatus)))
  'SensorsStatus-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SensorsStatus)))
  'SensorsStatus-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorsStatus)))
  "Returns string type for a service object of type '<SensorsStatus>"
  "duckietown_msgs/SensorsStatus")