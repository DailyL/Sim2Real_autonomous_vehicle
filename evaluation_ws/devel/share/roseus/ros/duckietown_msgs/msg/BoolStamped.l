;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::BoolStamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'BoolStamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::BOOLSTAMPED")
  (make-package "DUCKIETOWN_MSGS::BOOLSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude BoolStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::BoolStamped
  :super ros::object
  :slots (_header _data ))

(defmethod duckietown_msgs::BoolStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional (__data :null))
   (if (not (eq __data :null)) (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::BoolStamped :md5sum-) "542e22b190dc8e6eb476d50dda88feb7")
(setf (get duckietown_msgs::BoolStamped :datatype-) "duckietown_msgs/BoolStamped")
(setf (get duckietown_msgs::BoolStamped :definition-)
      "Header header
bool data

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



(provide :duckietown_msgs/BoolStamped "542e22b190dc8e6eb476d50dda88feb7")


