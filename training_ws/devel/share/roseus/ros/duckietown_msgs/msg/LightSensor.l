;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LightSensor)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LightSensor (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LIGHTSENSOR")
  (make-package "DUCKIETOWN_MSGS::LIGHTSENSOR"))

(in-package "ROS")
;;//! \htmlinclude LightSensor.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::LightSensor
  :super ros::object
  :slots (_header _r _g _b _c _real_lux _lux _temp ))

(defmethod duckietown_msgs::LightSensor
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:r __r) 0)
    ((:g __g) 0)
    ((:b __b) 0)
    ((:c __c) 0)
    ((:real_lux __real_lux) 0)
    ((:lux __lux) 0)
    ((:temp __temp) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _r (round __r))
   (setq _g (round __g))
   (setq _b (round __b))
   (setq _c (round __c))
   (setq _real_lux (round __real_lux))
   (setq _lux (round __lux))
   (setq _temp (round __temp))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:real_lux
   (&optional __real_lux)
   (if __real_lux (setq _real_lux __real_lux)) _real_lux)
  (:lux
   (&optional __lux)
   (if __lux (setq _lux __lux)) _lux)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _r
    4
    ;; int32 _g
    4
    ;; int32 _b
    4
    ;; int32 _c
    4
    ;; int32 _real_lux
    4
    ;; int32 _lux
    4
    ;; int32 _temp
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _r
       (write-long _r s)
     ;; int32 _g
       (write-long _g s)
     ;; int32 _b
       (write-long _b s)
     ;; int32 _c
       (write-long _c s)
     ;; int32 _real_lux
       (write-long _real_lux s)
     ;; int32 _lux
       (write-long _lux s)
     ;; int32 _temp
       (write-long _temp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _r
     (setq _r (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _g
     (setq _g (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _b
     (setq _b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _c
     (setq _c (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _real_lux
     (setq _real_lux (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lux
     (setq _lux (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _temp
     (setq _temp (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::LightSensor :md5sum-) "7d3098cdc59f2c0a8f7c461ef10ca781")
(setf (get duckietown_msgs::LightSensor :datatype-) "duckietown_msgs/LightSensor")
(setf (get duckietown_msgs::LightSensor :definition-)
      "Header header
int32 r
int32 g
int32 b
int32 c
int32 real_lux
int32 lux
int32 temp

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

")



(provide :duckietown_msgs/LightSensor "7d3098cdc59f2c0a8f7c461ef10ca781")


