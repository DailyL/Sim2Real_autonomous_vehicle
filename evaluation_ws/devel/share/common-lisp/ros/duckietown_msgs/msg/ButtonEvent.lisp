; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude ButtonEvent.msg.html

(cl:defclass <ButtonEvent> (roslisp-msg-protocol:ros-message)
  ((event
    :reader event
    :initarg :event
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ButtonEvent (<ButtonEvent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ButtonEvent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ButtonEvent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<ButtonEvent> is deprecated: use duckietown_msgs-msg:ButtonEvent instead.")))

(cl:ensure-generic-function 'event-val :lambda-list '(m))
(cl:defmethod event-val ((m <ButtonEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:event-val is deprecated.  Use duckietown_msgs-msg:event instead.")
  (event m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ButtonEvent>)))
    "Constants for message type '<ButtonEvent>"
  '((:EVENT_SINGLE_CLICK . 0)
    (:EVENT_HELD_3SEC . 10)
    (:EVENT_HELD_10SEC . 20))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ButtonEvent)))
    "Constants for message type 'ButtonEvent"
  '((:EVENT_SINGLE_CLICK . 0)
    (:EVENT_HELD_3SEC . 10)
    (:EVENT_HELD_10SEC . 20))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ButtonEvent>) ostream)
  "Serializes a message object of type '<ButtonEvent>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'event)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ButtonEvent>) istream)
  "Deserializes a message object of type '<ButtonEvent>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'event)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ButtonEvent>)))
  "Returns string type for a message object of type '<ButtonEvent>"
  "duckietown_msgs/ButtonEvent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ButtonEvent)))
  "Returns string type for a message object of type 'ButtonEvent"
  "duckietown_msgs/ButtonEvent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ButtonEvent>)))
  "Returns md5sum for a message object of type '<ButtonEvent>"
  "99a2e60dbe7b111394ec13b630081819")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ButtonEvent)))
  "Returns md5sum for a message object of type 'ButtonEvent"
  "99a2e60dbe7b111394ec13b630081819")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ButtonEvent>)))
  "Returns full string definition for message of type '<ButtonEvent>"
  (cl:format cl:nil "uint8 EVENT_SINGLE_CLICK = 0~%uint8 EVENT_HELD_3SEC = 10~%uint8 EVENT_HELD_10SEC = 20~%~%uint8 event~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ButtonEvent)))
  "Returns full string definition for message of type 'ButtonEvent"
  (cl:format cl:nil "uint8 EVENT_SINGLE_CLICK = 0~%uint8 EVENT_HELD_3SEC = 10~%uint8 EVENT_HELD_10SEC = 20~%~%uint8 event~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ButtonEvent>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ButtonEvent>))
  "Converts a ROS message object to a list"
  (cl:list 'ButtonEvent
    (cl:cons ':event (event msg))
))
