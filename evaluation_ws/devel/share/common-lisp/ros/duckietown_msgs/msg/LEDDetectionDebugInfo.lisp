; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude LEDDetectionDebugInfo.msg.html

(cl:defclass <LEDDetectionDebugInfo> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (capture_progress
    :reader capture_progress
    :initarg :capture_progress
    :type cl:float
    :initform 0.0)
   (cell_size
    :reader cell_size
    :initarg :cell_size
    :type (cl:vector cl:integer)
   :initform (cl:make-array 2 :element-type 'cl:integer :initial-element 0))
   (crop_rect_norm
    :reader crop_rect_norm
    :initarg :crop_rect_norm
    :type (cl:vector cl:float)
   :initform (cl:make-array 4 :element-type 'cl:float :initial-element 0.0))
   (variance_map
    :reader variance_map
    :initarg :variance_map
    :type sensor_msgs-msg:CompressedImage
    :initform (cl:make-instance 'sensor_msgs-msg:CompressedImage))
   (candidates
    :reader candidates
    :initarg :candidates
    :type (cl:vector duckietown_msgs-msg:Vector2D)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:Vector2D :initial-element (cl:make-instance 'duckietown_msgs-msg:Vector2D)))
   (led_all_unfiltered
    :reader led_all_unfiltered
    :initarg :led_all_unfiltered
    :type duckietown_msgs-msg:LEDDetectionArray
    :initform (cl:make-instance 'duckietown_msgs-msg:LEDDetectionArray)))
)

(cl:defclass LEDDetectionDebugInfo (<LEDDetectionDebugInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LEDDetectionDebugInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LEDDetectionDebugInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<LEDDetectionDebugInfo> is deprecated: use duckietown_msgs-msg:LEDDetectionDebugInfo instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:state-val is deprecated.  Use duckietown_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'capture_progress-val :lambda-list '(m))
(cl:defmethod capture_progress-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:capture_progress-val is deprecated.  Use duckietown_msgs-msg:capture_progress instead.")
  (capture_progress m))

(cl:ensure-generic-function 'cell_size-val :lambda-list '(m))
(cl:defmethod cell_size-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:cell_size-val is deprecated.  Use duckietown_msgs-msg:cell_size instead.")
  (cell_size m))

(cl:ensure-generic-function 'crop_rect_norm-val :lambda-list '(m))
(cl:defmethod crop_rect_norm-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:crop_rect_norm-val is deprecated.  Use duckietown_msgs-msg:crop_rect_norm instead.")
  (crop_rect_norm m))

(cl:ensure-generic-function 'variance_map-val :lambda-list '(m))
(cl:defmethod variance_map-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:variance_map-val is deprecated.  Use duckietown_msgs-msg:variance_map instead.")
  (variance_map m))

(cl:ensure-generic-function 'candidates-val :lambda-list '(m))
(cl:defmethod candidates-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:candidates-val is deprecated.  Use duckietown_msgs-msg:candidates instead.")
  (candidates m))

(cl:ensure-generic-function 'led_all_unfiltered-val :lambda-list '(m))
(cl:defmethod led_all_unfiltered-val ((m <LEDDetectionDebugInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:led_all_unfiltered-val is deprecated.  Use duckietown_msgs-msg:led_all_unfiltered instead.")
  (led_all_unfiltered m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LEDDetectionDebugInfo>) ostream)
  "Serializes a message object of type '<LEDDetectionDebugInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'capture_progress))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'cell_size))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'crop_rect_norm))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'variance_map) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'candidates))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'candidates))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'led_all_unfiltered) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LEDDetectionDebugInfo>) istream)
  "Deserializes a message object of type '<LEDDetectionDebugInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'capture_progress) (roslisp-utils:decode-single-float-bits bits)))
  (cl:setf (cl:slot-value msg 'cell_size) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'cell_size)))
    (cl:dotimes (i 2)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'crop_rect_norm) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'crop_rect_norm)))
    (cl:dotimes (i 4)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'variance_map) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'candidates) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'candidates)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'duckietown_msgs-msg:Vector2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'led_all_unfiltered) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LEDDetectionDebugInfo>)))
  "Returns string type for a message object of type '<LEDDetectionDebugInfo>"
  "duckietown_msgs/LEDDetectionDebugInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LEDDetectionDebugInfo)))
  "Returns string type for a message object of type 'LEDDetectionDebugInfo"
  "duckietown_msgs/LEDDetectionDebugInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LEDDetectionDebugInfo>)))
  "Returns md5sum for a message object of type '<LEDDetectionDebugInfo>"
  "be212adc91f6527a99fc828df2018200")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LEDDetectionDebugInfo)))
  "Returns md5sum for a message object of type 'LEDDetectionDebugInfo"
  "be212adc91f6527a99fc828df2018200")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LEDDetectionDebugInfo>)))
  "Returns full string definition for message of type '<LEDDetectionDebugInfo>"
  (cl:format cl:nil "uint8 state # 0: idle, 1: capturing, 2: processing~%float32 capture_progress~%~%uint32[2] cell_size~%float32[4] crop_rect_norm~%~%sensor_msgs/CompressedImage variance_map~%Vector2D[] candidates~%~%LEDDetectionArray led_all_unfiltered~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: duckietown_msgs/LEDDetectionArray~%LEDDetection[] detections~%================================================================================~%MSG: duckietown_msgs/LEDDetection~%time timestamp1		# initial timestamp of the camera stream used ~%time timestamp2		# final timestamp of the camera stream used ~%Vector2D pixels_normalized~%float32 frequency ~%string color        # will be r, g or b ~%float32 confidence  # some value of confidence for the detection (TBD)~%~%# for debug/visualization~%float64[] signal_ts~%float32[] signal~%float32[] fft_fs~%float32[] fft~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LEDDetectionDebugInfo)))
  "Returns full string definition for message of type 'LEDDetectionDebugInfo"
  (cl:format cl:nil "uint8 state # 0: idle, 1: capturing, 2: processing~%float32 capture_progress~%~%uint32[2] cell_size~%float32[4] crop_rect_norm~%~%sensor_msgs/CompressedImage variance_map~%Vector2D[] candidates~%~%LEDDetectionArray led_all_unfiltered~%~%================================================================================~%MSG: sensor_msgs/CompressedImage~%# This message contains a compressed image~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%~%string format        # Specifies the format of the data~%                     #   Acceptable values:~%                     #     jpeg, png~%uint8[] data         # Compressed image buffer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Vector2D~%float32 x~%float32 y~%~%================================================================================~%MSG: duckietown_msgs/LEDDetectionArray~%LEDDetection[] detections~%================================================================================~%MSG: duckietown_msgs/LEDDetection~%time timestamp1		# initial timestamp of the camera stream used ~%time timestamp2		# final timestamp of the camera stream used ~%Vector2D pixels_normalized~%float32 frequency ~%string color        # will be r, g or b ~%float32 confidence  # some value of confidence for the detection (TBD)~%~%# for debug/visualization~%float64[] signal_ts~%float32[] signal~%float32[] fft_fs~%float32[] fft~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LEDDetectionDebugInfo>))
  (cl:+ 0
     1
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'cell_size) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'crop_rect_norm) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'variance_map))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'candidates) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'led_all_unfiltered))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LEDDetectionDebugInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'LEDDetectionDebugInfo
    (cl:cons ':state (state msg))
    (cl:cons ':capture_progress (capture_progress msg))
    (cl:cons ':cell_size (cell_size msg))
    (cl:cons ':crop_rect_norm (crop_rect_norm msg))
    (cl:cons ':variance_map (variance_map msg))
    (cl:cons ':candidates (candidates msg))
    (cl:cons ':led_all_unfiltered (led_all_unfiltered msg))
))
