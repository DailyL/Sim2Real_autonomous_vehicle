;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DisplayFragment)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DisplayFragment (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT")
  (make-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))

(in-package "ROS")
;;//! \htmlinclude DisplayFragment.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*REGION_FULL*" (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(shadow '*REGION_FULL* (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(defconstant duckietown_msgs::DisplayFragment::*REGION_FULL* 0)
(intern "*REGION_HEADER*" (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(shadow '*REGION_HEADER* (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(defconstant duckietown_msgs::DisplayFragment::*REGION_HEADER* 1)
(intern "*REGION_BODY*" (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(shadow '*REGION_BODY* (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(defconstant duckietown_msgs::DisplayFragment::*REGION_BODY* 2)
(intern "*REGION_FOOTER*" (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(shadow '*REGION_FOOTER* (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(defconstant duckietown_msgs::DisplayFragment::*REGION_FOOTER* 3)
(intern "*PAGE_ALL*" (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(shadow '*PAGE_ALL* (find-package "DUCKIETOWN_MSGS::DISPLAYFRAGMENT"))
(defconstant duckietown_msgs::DisplayFragment::*PAGE_ALL* 255)

(defun duckietown_msgs::DisplayFragment-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::DisplayFragment::*REGION_FULL*)
        ((= const 1) 'duckietown_msgs::DisplayFragment::*REGION_HEADER*)
        ((= const 2) 'duckietown_msgs::DisplayFragment::*REGION_BODY*)
        ((= const 3) 'duckietown_msgs::DisplayFragment::*REGION_FOOTER*)
        ((= const 255) 'duckietown_msgs::DisplayFragment::*PAGE_ALL*)
        (t nil)))

(defclass duckietown_msgs::DisplayFragment
  :super ros::object
  :slots (_header _id _region _page _data _location _z _ttl ))

(defmethod duckietown_msgs::DisplayFragment
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) "")
    ((:region __region) 0)
    ((:page __page) 0)
    ((:data __data) (instance sensor_msgs::Image :init))
    ((:location __location) (instance sensor_msgs::RegionOfInterest :init))
    ((:z __z) 0)
    ((:ttl __ttl) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (string __id))
   (setq _region (round __region))
   (setq _page (round __page))
   (setq _data __data)
   (setq _location __location)
   (setq _z (round __z))
   (setq _ttl (round __ttl))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:region
   (&optional __region)
   (if __region (setq _region __region)) _region)
  (:page
   (&optional __page)
   (if __page (setq _page __page)) _page)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:ttl
   (&optional __ttl)
   (if __ttl (setq _ttl __ttl)) _ttl)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _id
    4 (length _id)
    ;; uint8 _region
    1
    ;; uint8 _page
    1
    ;; sensor_msgs/Image _data
    (send _data :serialization-length)
    ;; sensor_msgs/RegionOfInterest _location
    (send _location :serialization-length)
    ;; uint8 _z
    1
    ;; int8 _ttl
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; uint8 _region
       (write-byte _region s)
     ;; uint8 _page
       (write-byte _page s)
     ;; sensor_msgs/Image _data
       (send _data :serialize s)
     ;; sensor_msgs/RegionOfInterest _location
       (send _location :serialize s)
     ;; uint8 _z
       (write-byte _z s)
     ;; int8 _ttl
       (write-byte _ttl s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _region
     (setq _region (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _page
     (setq _page (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; sensor_msgs/Image _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;; sensor_msgs/RegionOfInterest _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; uint8 _z
     (setq _z (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _ttl
     (setq _ttl (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _ttl 127) (setq _ttl (- _ttl 256)))
   ;;
   self)
  )

(setf (get duckietown_msgs::DisplayFragment :md5sum-) "b47577c93ca4c0ee8514639ef90c78dc")
(setf (get duckietown_msgs::DisplayFragment :datatype-) "duckietown_msgs/DisplayFragment")
(setf (get duckietown_msgs::DisplayFragment :definition-)
      "Header header

# Enum: region
uint8 REGION_FULL=0
uint8 REGION_HEADER=1
uint8 REGION_BODY=2
uint8 REGION_FOOTER=3

# Enum: page
uint8 PAGE_ALL=255

# fragment ID and destination page and region
string id
uint8 region
uint8 page

# fragment content
sensor_msgs/Image data

# location on the display where to show the fragment
sensor_msgs/RegionOfInterest location

# Z index in the Z-buffer of the segment
uint8 z

# Time-to-Live in seconds of the fragment (-1 for infinite, do not abuse)
int8 ttl
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
MSG: sensor_msgs/RegionOfInterest
# This message is used to specify a region of interest within an image.
#
# When used to specify the ROI setting of the camera when the image was
# taken, the height and width fields should either match the height and
# width fields for the associated image; or height = width = 0
# indicates that the full resolution image was captured.

uint32 x_offset  # Leftmost pixel of the ROI
                 # (0 if the ROI includes the left edge of the image)
uint32 y_offset  # Topmost pixel of the ROI
                 # (0 if the ROI includes the top edge of the image)
uint32 height    # Height of ROI
uint32 width     # Width of ROI

# True if a distinct rectified ROI should be calculated from the \"raw\"
# ROI in this message. Typically this should be False if the full image
# is captured (ROI not used), and True if a subwindow is captured (ROI
# used).
bool do_rectify

")



(provide :duckietown_msgs/DisplayFragment "b47577c93ca4c0ee8514639ef90c78dc")


