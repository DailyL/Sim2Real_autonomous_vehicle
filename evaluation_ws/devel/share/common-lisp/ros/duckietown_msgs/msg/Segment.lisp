; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude Segment.msg.html

(cl:defclass <Segment> (roslisp-msg-protocol:ros-message)
  ((color
    :reader color
    :initarg :color
    :type cl:fixnum
    :initform 0)
   (pixels_normalized
    :reader pixels_normalized
    :initarg :pixels_normalized
    :type (cl:vector duckietown_msgs-msg:Vector2D)
   :initform (cl:make-array 2 :element-type 'duckietown_msgs-msg:Vector2D :initial-element (cl:make-instance 'duckietown_msgs-msg:Vector2D)))
   (normal
    :reader normal
    :initarg :normal
    :type duckietown_msgs-msg:Vector2D
    :initform (cl:make-instance 'duckietown_msgs-msg:Vector2D))
   (points
    :reader points
    :initarg :points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 2 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass Segment (<Segment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Segment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Segment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<Segment> is deprecated: use duckietown_msgs-msg:Segment instead.")))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <Segment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:color-val is deprecated.  Use duckietown_msgs-msg:color instead.")
  (color m))

(cl:ensure-generic-function 'pixels_normalized-val :lambda-list '(m))
(cl:defmethod pixels_normalized-val ((m <Segment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:pixels_normalized-val is deprecated.  Use duckietown_msgs-msg:pixels_normalized instead.")
  (pixels_normalized m))

(cl:ensure-generic-function 'normal-val :lambda-list '(m))
(cl:defmethod normal-val ((m <Segment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:normal-val is deprecated.  Use duckietown_msgs-msg:normal instead.")
  (normal m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Segment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:points-val is deprecated.  Use duckietown_msgs-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Segment>)))
    "Constants for message type '<Segment>"
  '((:WHITE . 0)
    (:YELLOW . 1)
    (:RED . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Segment)))
    "Constants for message type 'Segment"
  '((:WHITE . 0)
    (:YELLOW . 1)
    (:RED . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Segment>) ostream)
  "Serializes a message object of type '<Segment>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'color)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pixels_normalized))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'normal) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Segment>) istream)
  "Deserializes a message object of type '<Segment>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'color)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pixels_normalized) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'pixels_normalized)))
    (cl:dotimes (i 2)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:Vector2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'normal) istream)
  (cl:setf (cl:slot-value msg 'points) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i 2)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Segment>)))
  "Returns string type for a message object of type '<Segment>"
  "duckietown_msgs/Segment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Segment)))
  "Returns string type for a message object of type 'Segment"
  "duckietown_msgs/Segment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Segment>)))
  "Returns md5sum for a message object of type '<Segment>"
  "63449fcee6301e43c25adab0c5e5d117")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Segment)))
  "Returns md5sum for a message object of type 'Segment"
  "63449fcee6301e43c25adab0c5e5d117")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Segment>)))
  "Returns full string definition for message of type '<Segment>"
  (cl:format cl:nil "uint8 WHITE=0~%uint8 YELLOW=1	~%uint8 RED=2~%uint8 color~%duckietown_msgs/Vector2D[2] pixels_normalized~%duckietown_msgs/Vector2D normal~%~%geometry_msgs/Point[2] points~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Segment)))
  "Returns full string definition for message of type 'Segment"
  (cl:format cl:nil "uint8 WHITE=0~%uint8 YELLOW=1	~%uint8 RED=2~%uint8 color~%duckietown_msgs/Vector2D[2] pixels_normalized~%duckietown_msgs/Vector2D normal~%~%geometry_msgs/Point[2] points~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Segment>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'pixels_normalized) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'normal))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Segment>))
  "Converts a ROS message object to a list"
  (cl:list 'Segment
    (cl:cons ':color (color msg))
    (cl:cons ':pixels_normalized (pixels_normalized msg))
    (cl:cons ':normal (normal msg))
    (cl:cons ':points (points msg))
))
