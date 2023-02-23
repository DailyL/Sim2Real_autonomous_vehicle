;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AntiInstagramHealth)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AntiInstagramHealth (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMHEALTH")
  (make-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMHEALTH"))

(in-package "ROS")
;;//! \htmlinclude AntiInstagramHealth.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::AntiInstagramHealth
  :super ros::object
  :slots (_header _J1 _J2 _J3 ))

(defmethod duckietown_msgs::AntiInstagramHealth
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:J1 __J1) 0.0)
    ((:J2 __J2) 0.0)
    ((:J3 __J3) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _J1 (float __J1))
   (setq _J2 (float __J2))
   (setq _J3 (float __J3))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:J1
   (&optional __J1)
   (if __J1 (setq _J1 __J1)) _J1)
  (:J2
   (&optional __J2)
   (if __J2 (setq _J2 __J2)) _J2)
  (:J3
   (&optional __J3)
   (if __J3 (setq _J3 __J3)) _J3)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _J1
    4
    ;; float32 _J2
    4
    ;; float32 _J3
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _J1
       (sys::poke _J1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _J2
       (sys::poke _J2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _J3
       (sys::poke _J3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _J1
     (setq _J1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _J2
     (setq _J2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _J3
     (setq _J3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::AntiInstagramHealth :md5sum-) "3a6e17ea173536e892b4dde76e515fb4")
(setf (get duckietown_msgs::AntiInstagramHealth :datatype-) "duckietown_msgs/AntiInstagramHealth")
(setf (get duckietown_msgs::AntiInstagramHealth :definition-)
      "Header header
float32 J1
float32 J2
float32 J3

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



(provide :duckietown_msgs/AntiInstagramHealth "3a6e17ea173536e892b4dde76e515fb4")


