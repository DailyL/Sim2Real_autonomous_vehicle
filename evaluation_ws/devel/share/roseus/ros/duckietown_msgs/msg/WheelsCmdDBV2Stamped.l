;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::WheelsCmdDBV2Stamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'WheelsCmdDBV2Stamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::WHEELSCMDDBV2STAMPED")
  (make-package "DUCKIETOWN_MSGS::WHEELSCMDDBV2STAMPED"))

(in-package "ROS")
;;//! \htmlinclude WheelsCmdDBV2Stamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::WheelsCmdDBV2Stamped
  :super ros::object
  :slots (_header _gamma _vel_wheel _trim ))

(defmethod duckietown_msgs::WheelsCmdDBV2Stamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gamma __gamma) 0.0)
    ((:vel_wheel __vel_wheel) 0.0)
    ((:trim __trim) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _gamma (float __gamma))
   (setq _vel_wheel (float __vel_wheel))
   (setq _trim (float __trim))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gamma
   (&optional __gamma)
   (if __gamma (setq _gamma __gamma)) _gamma)
  (:vel_wheel
   (&optional __vel_wheel)
   (if __vel_wheel (setq _vel_wheel __vel_wheel)) _vel_wheel)
  (:trim
   (&optional __trim)
   (if __trim (setq _trim __trim)) _trim)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _gamma
    4
    ;; float32 _vel_wheel
    4
    ;; float32 _trim
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _gamma
       (sys::poke _gamma (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_wheel
       (sys::poke _vel_wheel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _trim
       (sys::poke _trim (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _gamma
     (setq _gamma (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_wheel
     (setq _vel_wheel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _trim
     (setq _trim (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::WheelsCmdDBV2Stamped :md5sum-) "7da28061cc173091cc0253decf17895d")
(setf (get duckietown_msgs::WheelsCmdDBV2Stamped :datatype-) "duckietown_msgs/WheelsCmdDBV2Stamped")
(setf (get duckietown_msgs::WheelsCmdDBV2Stamped :definition-)
      "Header header
float32 gamma           #\"vel_left\" changed to \"gamma\", RFMH_2019_02_26
float32 vel_wheel       #\"vel_right\" changed to \"vel_wheel\", RFMH_2019_02_26
float32 trim            #included \"trim\" to be accessible in the wheels_driver_node as well, RFMH_2019_04_01
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



(provide :duckietown_msgs/WheelsCmdDBV2Stamped "7da28061cc173091cc0253decf17895d")


