;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::IntersectionPoseImgDebug)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'IntersectionPoseImgDebug (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::INTERSECTIONPOSEIMGDEBUG")
  (make-package "DUCKIETOWN_MSGS::INTERSECTIONPOSEIMGDEBUG"))

(in-package "ROS")
;;//! \htmlinclude IntersectionPoseImgDebug.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::IntersectionPoseImgDebug
  :super ros::object
  :slots (_header _x _y _theta _type _likelihood _x_init _y_init _theta_init _img ))

(defmethod duckietown_msgs::IntersectionPoseImgDebug
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:type __type) 0)
    ((:likelihood __likelihood) 0.0)
    ((:x_init __x_init) 0.0)
    ((:y_init __y_init) 0.0)
    ((:theta_init __theta_init) 0.0)
    ((:img __img) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _type (round __type))
   (setq _likelihood (float __likelihood))
   (setq _x_init (float __x_init))
   (setq _y_init (float __y_init))
   (setq _theta_init (float __theta_init))
   (setq _img __img)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:likelihood
   (&optional __likelihood)
   (if __likelihood (setq _likelihood __likelihood)) _likelihood)
  (:x_init
   (&optional __x_init)
   (if __x_init (setq _x_init __x_init)) _x_init)
  (:y_init
   (&optional __y_init)
   (if __y_init (setq _y_init __y_init)) _y_init)
  (:theta_init
   (&optional __theta_init)
   (if __theta_init (setq _theta_init __theta_init)) _theta_init)
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ;; uint8 _type
    1
    ;; float32 _likelihood
    4
    ;; float32 _x_init
    4
    ;; float32 _y_init
    4
    ;; float32 _theta_init
    4
    ;; sensor_msgs/CompressedImage _img
    (send _img :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _type
       (write-byte _type s)
     ;; float32 _likelihood
       (sys::poke _likelihood (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x_init
       (sys::poke _x_init (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_init
       (sys::poke _y_init (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta_init
       (sys::poke _theta_init (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; sensor_msgs/CompressedImage _img
       (send _img :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _likelihood
     (setq _likelihood (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x_init
     (setq _x_init (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_init
     (setq _y_init (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta_init
     (setq _theta_init (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; sensor_msgs/CompressedImage _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::IntersectionPoseImgDebug :md5sum-) "0027b9b3f880873af8e49663f8172f1a")
(setf (get duckietown_msgs::IntersectionPoseImgDebug :datatype-) "duckietown_msgs/IntersectionPoseImgDebug")
(setf (get duckietown_msgs::IntersectionPoseImgDebug :definition-)
      "Header header
float32 x
float32 y
float32 theta
uint8 type
float32 likelihood
float32 x_init
float32 y_init
float32 theta_init
sensor_msgs/CompressedImage img
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
MSG: sensor_msgs/CompressedImage
# This message contains a compressed image

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image

string format        # Specifies the format of the data
                     #   Acceptable values:
                     #     jpeg, png
uint8[] data         # Compressed image buffer

")



(provide :duckietown_msgs/IntersectionPoseImgDebug "0027b9b3f880873af8e49663f8172f1a")


