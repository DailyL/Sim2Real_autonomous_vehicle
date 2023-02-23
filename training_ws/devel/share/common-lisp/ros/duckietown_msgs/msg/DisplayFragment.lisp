; Auto-generated. Do not edit!


(cl:in-package duckietown_msgs-msg)


;//! \htmlinclude DisplayFragment.msg.html

(cl:defclass <DisplayFragment> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (region
    :reader region
    :initarg :region
    :type cl:fixnum
    :initform 0)
   (page
    :reader page
    :initarg :page
    :type cl:fixnum
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (location
    :reader location
    :initarg :location
    :type sensor_msgs-msg:RegionOfInterest
    :initform (cl:make-instance 'sensor_msgs-msg:RegionOfInterest))
   (z
    :reader z
    :initarg :z
    :type cl:fixnum
    :initform 0)
   (ttl
    :reader ttl
    :initarg :ttl
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DisplayFragment (<DisplayFragment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DisplayFragment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DisplayFragment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name duckietown_msgs-msg:<DisplayFragment> is deprecated: use duckietown_msgs-msg:DisplayFragment instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:header-val is deprecated.  Use duckietown_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:id-val is deprecated.  Use duckietown_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'region-val :lambda-list '(m))
(cl:defmethod region-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:region-val is deprecated.  Use duckietown_msgs-msg:region instead.")
  (region m))

(cl:ensure-generic-function 'page-val :lambda-list '(m))
(cl:defmethod page-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:page-val is deprecated.  Use duckietown_msgs-msg:page instead.")
  (page m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:data-val is deprecated.  Use duckietown_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:location-val is deprecated.  Use duckietown_msgs-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:z-val is deprecated.  Use duckietown_msgs-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'ttl-val :lambda-list '(m))
(cl:defmethod ttl-val ((m <DisplayFragment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader duckietown_msgs-msg:ttl-val is deprecated.  Use duckietown_msgs-msg:ttl instead.")
  (ttl m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DisplayFragment>)))
    "Constants for message type '<DisplayFragment>"
  '((:REGION_FULL . 0)
    (:REGION_HEADER . 1)
    (:REGION_BODY . 2)
    (:REGION_FOOTER . 3)
    (:PAGE_ALL . 255))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DisplayFragment)))
    "Constants for message type 'DisplayFragment"
  '((:REGION_FULL . 0)
    (:REGION_HEADER . 1)
    (:REGION_BODY . 2)
    (:REGION_FOOTER . 3)
    (:PAGE_ALL . 255))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DisplayFragment>) ostream)
  "Serializes a message object of type '<DisplayFragment>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'region)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'page)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'z)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ttl)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DisplayFragment>) istream)
  "Deserializes a message object of type '<DisplayFragment>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'region)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'page)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'z)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ttl) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DisplayFragment>)))
  "Returns string type for a message object of type '<DisplayFragment>"
  "duckietown_msgs/DisplayFragment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DisplayFragment)))
  "Returns string type for a message object of type 'DisplayFragment"
  "duckietown_msgs/DisplayFragment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DisplayFragment>)))
  "Returns md5sum for a message object of type '<DisplayFragment>"
  "b47577c93ca4c0ee8514639ef90c78dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DisplayFragment)))
  "Returns md5sum for a message object of type 'DisplayFragment"
  "b47577c93ca4c0ee8514639ef90c78dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DisplayFragment>)))
  "Returns full string definition for message of type '<DisplayFragment>"
  (cl:format cl:nil "Header header~%~%# Enum: region~%uint8 REGION_FULL=0~%uint8 REGION_HEADER=1~%uint8 REGION_BODY=2~%uint8 REGION_FOOTER=3~%~%# Enum: page~%uint8 PAGE_ALL=255~%~%# fragment ID and destination page and region~%string id~%uint8 region~%uint8 page~%~%# fragment content~%sensor_msgs/Image data~%~%# location on the display where to show the fragment~%sensor_msgs/RegionOfInterest location~%~%# Z index in the Z-buffer of the segment~%uint8 z~%~%# Time-to-Live in seconds of the fragment (-1 for infinite, do not abuse)~%int8 ttl~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DisplayFragment)))
  "Returns full string definition for message of type 'DisplayFragment"
  (cl:format cl:nil "Header header~%~%# Enum: region~%uint8 REGION_FULL=0~%uint8 REGION_HEADER=1~%uint8 REGION_BODY=2~%uint8 REGION_FOOTER=3~%~%# Enum: page~%uint8 PAGE_ALL=255~%~%# fragment ID and destination page and region~%string id~%uint8 region~%uint8 page~%~%# fragment content~%sensor_msgs/Image data~%~%# location on the display where to show the fragment~%sensor_msgs/RegionOfInterest location~%~%# Z index in the Z-buffer of the segment~%uint8 z~%~%# Time-to-Live in seconds of the fragment (-1 for infinite, do not abuse)~%int8 ttl~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: sensor_msgs/RegionOfInterest~%# This message is used to specify a region of interest within an image.~%#~%# When used to specify the ROI setting of the camera when the image was~%# taken, the height and width fields should either match the height and~%# width fields for the associated image; or height = width = 0~%# indicates that the full resolution image was captured.~%~%uint32 x_offset  # Leftmost pixel of the ROI~%                 # (0 if the ROI includes the left edge of the image)~%uint32 y_offset  # Topmost pixel of the ROI~%                 # (0 if the ROI includes the top edge of the image)~%uint32 height    # Height of ROI~%uint32 width     # Width of ROI~%~%# True if a distinct rectified ROI should be calculated from the \"raw\"~%# ROI in this message. Typically this should be False if the full image~%# is captured (ROI not used), and True if a subwindow is captured (ROI~%# used).~%bool do_rectify~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DisplayFragment>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'id))
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DisplayFragment>))
  "Converts a ROS message object to a list"
  (cl:list 'DisplayFragment
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':region (region msg))
    (cl:cons ':page (page msg))
    (cl:cons ':data (data msg))
    (cl:cons ':location (location msg))
    (cl:cons ':z (z msg))
    (cl:cons ':ttl (ttl msg))
))
