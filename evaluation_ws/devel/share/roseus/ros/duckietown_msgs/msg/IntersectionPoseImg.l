;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::IntersectionPoseImg)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'IntersectionPoseImg (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::INTERSECTIONPOSEIMG")
  (make-package "DUCKIETOWN_MSGS::INTERSECTIONPOSEIMG"))

(in-package "ROS")
;;//! \htmlinclude IntersectionPoseImg.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::IntersectionPoseImg
  :super ros::object
  :slots (_header _x _y _theta _type _likelihood _img ))

(defmethod duckietown_msgs::IntersectionPoseImg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    ((:type __type) 0)
    ((:likelihood __likelihood) 0.0)
    ((:img __img) (instance sensor_msgs::CompressedImage :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   (setq _type (round __type))
   (setq _likelihood (float __likelihood))
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
   ;; sensor_msgs/CompressedImage _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::IntersectionPoseImg :md5sum-) "9be288b28225c76ee9ce1052704524b8")
(setf (get duckietown_msgs::IntersectionPoseImg :datatype-) "duckietown_msgs/IntersectionPoseImg")
(setf (get duckietown_msgs::IntersectionPoseImg :definition-)
      "Header header
float32 x
float32 y
float32 theta
uint8 type
float32 likelihood
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



(provide :duckietown_msgs/IntersectionPoseImg "9be288b28225c76ee9ce1052704524b8")


