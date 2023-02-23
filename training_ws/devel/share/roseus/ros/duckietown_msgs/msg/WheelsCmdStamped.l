;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::WheelsCmdStamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'WheelsCmdStamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::WHEELSCMDSTAMPED")
  (make-package "DUCKIETOWN_MSGS::WHEELSCMDSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude WheelsCmdStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::WheelsCmdStamped
  :super ros::object
  :slots (_header _vel_left _vel_right ))

(defmethod duckietown_msgs::WheelsCmdStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vel_left __vel_left) 0.0)
    ((:vel_right __vel_right) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vel_left (float __vel_left))
   (setq _vel_right (float __vel_right))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vel_left
   (&optional __vel_left)
   (if __vel_left (setq _vel_left __vel_left)) _vel_left)
  (:vel_right
   (&optional __vel_right)
   (if __vel_right (setq _vel_right __vel_right)) _vel_right)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _vel_left
    4
    ;; float32 _vel_right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _vel_left
       (sys::poke _vel_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_right
       (sys::poke _vel_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _vel_left
     (setq _vel_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_right
     (setq _vel_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::WheelsCmdStamped :md5sum-) "edbf8d24194d839b1982a6a991b552c6")
(setf (get duckietown_msgs::WheelsCmdStamped :datatype-) "duckietown_msgs/WheelsCmdStamped")
(setf (get duckietown_msgs::WheelsCmdStamped :definition-)
      "Header header
float32 vel_left
float32 vel_right
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



(provide :duckietown_msgs/WheelsCmdStamped "edbf8d24194d839b1982a6a991b552c6")


