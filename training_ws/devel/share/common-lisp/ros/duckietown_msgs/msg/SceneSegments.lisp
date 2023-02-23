; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude SceneSegments.msg.html

(cl:defclass <SceneSegments> (roslisp-msg-protocol:ros-message)
  ((segimage
    :reader segimage
    :initarg :segimage
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (rects
    :reader rects
    :initarg :rects
    :type (cl:vector duckietown_msgs-msg:Rect)
   :initform (cl:make-array 0 :element-type 'duckietown_msgs-msg:Rect :initial-element (cl:make-instance 'duckietown_msgs-msg:Rect))))
)

(cl:defclass SceneSegments (<SceneSegments>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SceneSegments>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SceneSegments)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<SceneSegments> is deprecated: use duckietown_msgs-msg:SceneSegments instead.")))

(cl:ensure-generic-function 'segimage-val :lambda-list '(m))
(cl:defmethod segimage-val ((m <SceneSegments>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:segimage-val is deprecated.  Use duckietown_msgs-msg:segimage instead.")
  (segimage m))

(cl:ensure-generic-function 'rects-val :lambda-list '(m))
(cl:defmethod rects-val ((m <SceneSegments>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:rects-val is deprecated.  Use duckietown_msgs-msg:rects instead.")
  (rects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SceneSegments>) ostream)
  "Serializes a message object of type '<SceneSegments>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'segimage) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SceneSegments>) istream)
  "Deserializes a message object of type '<SceneSegments>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'segimage) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SceneSegments>)))
  "Returns string type for a message object of type '<SceneSegments>"
  "duckietown_msgs/SceneSegments")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SceneSegments)))
  "Returns string type for a message object of type 'SceneSegments"
  "duckietown_msgs/SceneSegments")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SceneSegments>)))
  "Returns md5sum for a message object of type '<SceneSegments>"
  "2aa3c1097b948038841bf28c11cf95cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SceneSegments)))
  "Returns md5sum for a message object of type 'SceneSegments"
  "2aa3c1097b948038841bf28c11cf95cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SceneSegments>)))
  "Returns full string definition for message of type '<SceneSegments>"
  (cl:format cl:nil "sensor_msgs/Image segimage~%duckietown_msgs/Rect[] rects~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SceneSegments)))
  "Returns full string definition for message of type 'SceneSegments"
  (cl:format cl:nil "sensor_msgs/Image segimage~%duckietown_msgs/Rect[] rects~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: duckietown_msgs/Rect~%# all in pixel coordinate~%# (x, y, w, h) defines a rectangle~%int32 x~%int32 y~%int32 w~%int32 h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SceneSegments>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'segimage))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SceneSegments>))
  "Converts a ROS message object to a list"
  (cl:list 'SceneSegments
    (cl:cons ':segimage (segimage msg))
    (cl:cons ':rects (rects msg))
))
