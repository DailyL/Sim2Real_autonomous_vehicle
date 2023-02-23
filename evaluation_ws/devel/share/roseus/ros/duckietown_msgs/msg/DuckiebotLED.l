;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DuckiebotLED)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DuckiebotLED (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DUCKIEBOTLED")
  (make-package "DUCKIETOWN_MSGS::DUCKIEBOTLED"))

(in-package "ROS")
;;//! \htmlinclude DuckiebotLED.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::DuckiebotLED
  :super ros::object
  :slots (_header _colors ))

(defmethod duckietown_msgs::DuckiebotLED
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:colors __colors) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _colors __colors)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:colors
   (&rest __colors)
   (if (keywordp (car __colors))
       (send* _colors __colors)
     (progn
       (if __colors (setq _colors (car __colors)))
       _colors)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/ColorRGBA[] _colors
    (apply #'+ (send-all _colors :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/ColorRGBA[] _colors
     (write-long (length _colors) s)
     (dolist (elem _colors)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/ColorRGBA[] _colors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _colors (let (r) (dotimes (i n) (push (instance std_msgs::ColorRGBA :init) r)) r))
     (dolist (elem- _colors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::DuckiebotLED :md5sum-) "d1a05ea07d5c98d935c3a53fe6500186")
(setf (get duckietown_msgs::DuckiebotLED :datatype-) "duckietown_msgs/DuckiebotLED")
(setf (get duckietown_msgs::DuckiebotLED :definition-)
      "Header header
std_msgs/ColorRGBA[] colors

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
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

")



(provide :duckietown_msgs/DuckiebotLED "d1a05ea07d5c98d935c3a53fe6500186")


