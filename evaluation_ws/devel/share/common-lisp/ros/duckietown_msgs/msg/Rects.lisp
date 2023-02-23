; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude Rects.msg.html

(cl:defclass <Rects> (roslisp-msg-protocol:ros-message)
  ((rects
    :reader rects
    :initarg :rects
    :type (cl:vector duckietown_msgs-msg:Rect)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:Rect :initial-element (cl:make-instance 'duckietown_msgs-msg:Rect))))
)

(cl:defclass Rects (<Rects>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rects>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rects)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<Rects> is deprecated: use duckietown_msgs-msg:Rects instead.")))

(cl:ensure-generic-function 'rects-val :lambda-list '(m))
(cl:defmethod rects-val ((m <Rects>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:rects-val is deprecated.  Use duckietown_msgs-msg:rects instead.")
  (rects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rects>) ostream)
  "Serializes a message object of type '<Rects>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rects>) istream)
  "Deserializes a message object of type '<Rects>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:Rect))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rects>)))
  "Returns string type for a message object of type '<Rects>"
  "duckietown_msgs/Rects")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rects)))
  "Returns string type for a message object of type 'Rects"
  "duckietown_msgs/Rects")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rects>)))
  "Returns md5sum for a message object of type '<Rects>"
  "f5b74b2b15b5d4d2f299389f9f4ca7f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rects)))
  "Returns md5sum for a message object of type 'Rects"
  "f5b74b2b15b5d4d2f299389f9f4ca7f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rects>)))
  "Returns full string definition for message of type '<Rects>"
  (cl:format cl:nil "duckietown_msgs/Rect[] rects~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rects)))
  "Returns full string definition for message of type 'Rects"
  (cl:format cl:nil "duckietown_msgs/Rect[] rects~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rects>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rects>))
  "Converts a ROS message object to a list"
  (cl:list 'Rects
    (cl:cons ':rects (rects msg))
))
