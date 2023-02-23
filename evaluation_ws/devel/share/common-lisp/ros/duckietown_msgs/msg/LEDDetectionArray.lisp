; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude LEDDetectionArray.msg.html

(cl:defclass <LEDDetectionArray> (roslisp-msg-protocol:ros-message)
  ((detections
    :reader detections
    :initarg :detections
    :type (cl:vector duckietown_msgs-msg:LEDDetection)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:LEDDetection :initial-element (cl:make-instance 'duckietown_msgs-msg:LEDDetection))))
)

(cl:defclass LEDDetectionArray (<LEDDetectionArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LEDDetectionArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LEDDetectionArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<LEDDetectionArray> is deprecated: use duckietown_msgs-msg:LEDDetectionArray instead.")))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <LEDDetectionArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:detections-val is deprecated.  Use duckietown_msgs-msg:detections instead.")
  (detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LEDDetectionArray>) ostream)
  "Serializes a message object of type '<LEDDetectionArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LEDDetectionArray>) istream)
  "Deserializes a message object of type '<LEDDetectionArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:LEDDetection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LEDDetectionArray>)))
  "Returns string type for a message object of type '<LEDDetectionArray>"
  "duckietown_msgs/LEDDetectionArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LEDDetectionArray)))
  "Returns string type for a message object of type 'LEDDetectionArray"
  "duckietown_msgs/LEDDetectionArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LEDDetectionArray>)))
  "Returns md5sum for a message object of type '<LEDDetectionArray>"
  "a95456786a73967a5a29fdbf726c022c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LEDDetectionArray)))
  "Returns md5sum for a message object of type 'LEDDetectionArray"
  "a95456786a73967a5a29fdbf726c022c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LEDDetectionArray>)))
  "Returns full string definition for message of type '<LEDDetectionArray>"
  (cl:format cl:nil "LEDDetection[] detections~%================================================================================~%MSG: duckietown_msgs/LEDDetection~%time timestamp1		# initial timestamp of the camera stream used ~%time timestamp2		# final timestamp of the camera stream used ~%Vector2D pixels_normalized~%float32 frequency ~%string color        # will be r, g or b ~%float32 confidence  # some value of confidence for the detection (TBD)~%~%# for debug/visualization~%float64[] signal_ts~%float32[] signal~%float32[] fft_fs~%float32[] fft~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LEDDetectionArray)))
  "Returns full string definition for message of type 'LEDDetectionArray"
  (cl:format cl:nil "LEDDetection[] detections~%================================================================================~%MSG: duckietown_msgs/LEDDetection~%time timestamp1		# initial timestamp of the camera stream used ~%time timestamp2		# final timestamp of the camera stream used ~%Vector2D pixels_normalized~%float32 frequency ~%string color        # will be r, g or b ~%float32 confidence  # some value of confidence for the detection (TBD)~%~%# for debug/visualization~%float64[] signal_ts~%float32[] signal~%float32[] fft_fs~%float32[] fft~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LEDDetectionArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LEDDetectionArray>))
  "Converts a ROS message object to a list"
  (cl:list 'LEDDetectionArray
    (cl:cons ':detections (detections msg))
))
