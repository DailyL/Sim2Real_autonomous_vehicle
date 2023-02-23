;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AntiInstagramTransform)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AntiInstagramTransform (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMTRANSFORM")
  (make-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMTRANSFORM"))

(in-package "ROS")
;;//! \htmlinclude AntiInstagramTransform.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::AntiInstagramTransform
  :super ros::object
  :slots (_header _s ))

(defmethod duckietown_msgs::AntiInstagramTransform
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:s __s) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _s __s)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[6] _s
    (* 8    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[6] _s
     (dotimes (i 6)
       (sys::poke (elt _s i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[6] _s
   (dotimes (i (length _s))
     (setf (elt _s i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get duckietown_msgs::AntiInstagramTransform :md5sum-) "d8691e07ae6615fec4d91101863288cf")
(setf (get duckietown_msgs::AntiInstagramTransform :datatype-) "duckietown_msgs/AntiInstagramTransform")
(setf (get duckietown_msgs::AntiInstagramTransform :definition-)
      "Header header
float64[6] s
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



(provide :duckietown_msgs/AntiInstagramTransform "d8691e07ae6615fec4d91101863288cf")


