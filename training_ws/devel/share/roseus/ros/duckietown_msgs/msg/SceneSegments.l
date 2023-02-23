;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SceneSegments)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SceneSegments (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SCENESEGMENTS")
  (make-package "DUCKIETOWN_MSGS::SCENESEGMENTS"))

(in-package "ROS")
;;//! \htmlinclude SceneSegments.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass duckietown_msgs::SceneSegments
  :super ros::object
  :slots (_segimage _rects ))

(defmethod duckietown_msgs::SceneSegments
  (:init
   (&key
    ((:segimage __segimage) (instance sensor_msgs::Image :init))
    ((:rects __rects) ())
    )
   (send-super :init)
   (setq _segimage __segimage)
   (setq _rects __rects)
   self)
  (:segimage
   (&rest __segimage)
   (if (keywordp (car __segimage))
       (send* _segimage __segimage)
     (progn
       (if __segimage (setq _segimage (car __segimage)))
       _segimage)))
  (:rects
   (&rest __rects)
   (if (keywordp (car __rects))
       (send* _rects __rects)
     (progn
       (if __rects (setq _rects (car __rects)))
       _rects)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _segimage
    (send _segimage :serialization-length)
    ;; duckietown_msgs/Rect[] _rects
    (apply #'+ (send-all _rects :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _segimage
       (send _segimage :serialize s)
     ;; duckietown_msgs/Rect[] _rects
     (write-long (length _rects) s)
     (dolist (elem _rects)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _segimage
     (send _segimage :deserialize buf ptr-) (incf ptr- (send _segimage :serialization-length))
   ;; duckietown_msgs/Rect[] _rects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rects (let (r) (dotimes (i n) (push (instance duckietown_msgs::Rect :init) r)) r))
     (dolist (elem- _rects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::SceneSegments :md5sum-) "2aa3c1097b948038841bf28c11cf95cb")
(setf (get duckietown_msgs::SceneSegments :datatype-) "duckietown_msgs/SceneSegments")
(setf (get duckietown_msgs::SceneSegments :definition-)
      "sensor_msgs/Image segimage
duckietown_msgs/Rect[] rects
================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: duckietown_msgs/Rect
# all in pixel coordinate
# (x, y, w, h) defines a rectangle
int32 x
int32 y
int32 w
int32 h

")



(provide :duckietown_msgs/SceneSegments "2aa3c1097b948038841bf28c11cf95cb")


