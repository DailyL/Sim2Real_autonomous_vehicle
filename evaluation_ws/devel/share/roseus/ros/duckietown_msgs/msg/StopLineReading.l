;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::StopLineReading)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'StopLineReading (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::STOPLINEREADING")
  (make-package "DUCKIETOWN_MSGS::STOPLINEREADING"))

(in-package "ROS")
;;//! \htmlinclude StopLineReading.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::StopLineReading
  :super ros::object
  :slots (_header _stop_line_detected _at_stop_line _stop_line_point ))

(defmethod duckietown_msgs::StopLineReading
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:stop_line_detected __stop_line_detected) nil)
    ((:at_stop_line __at_stop_line) nil)
    ((:stop_line_point __stop_line_point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _stop_line_detected __stop_line_detected)
   (setq _at_stop_line __at_stop_line)
   (setq _stop_line_point __stop_line_point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:stop_line_detected
   (&optional (__stop_line_detected :null))
   (if (not (eq __stop_line_detected :null)) (setq _stop_line_detected __stop_line_detected)) _stop_line_detected)
  (:at_stop_line
   (&optional (__at_stop_line :null))
   (if (not (eq __at_stop_line :null)) (setq _at_stop_line __at_stop_line)) _at_stop_line)
  (:stop_line_point
   (&rest __stop_line_point)
   (if (keywordp (car __stop_line_point))
       (send* _stop_line_point __stop_line_point)
     (progn
       (if __stop_line_point (setq _stop_line_point (car __stop_line_point)))
       _stop_line_point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _stop_line_detected
    1
    ;; bool _at_stop_line
    1
    ;; geometry_msgs/Point _stop_line_point
    (send _stop_line_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _stop_line_detected
       (if _stop_line_detected (write-byte -1 s) (write-byte 0 s))
     ;; bool _at_stop_line
       (if _at_stop_line (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Point _stop_line_point
       (send _stop_line_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _stop_line_detected
     (setq _stop_line_detected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _at_stop_line
     (setq _at_stop_line (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Point _stop_line_point
     (send _stop_line_point :deserialize buf ptr-) (incf ptr- (send _stop_line_point :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::StopLineReading :md5sum-) "735fe9e9ff1e4d7460bbf69ab2720ae0")
(setf (get duckietown_msgs::StopLineReading :datatype-) "duckietown_msgs/StopLineReading")
(setf (get duckietown_msgs::StopLineReading :definition-)
      "Header header
bool stop_line_detected
bool at_stop_line
geometry_msgs/Point stop_line_point #this is in the \"lane frame\"

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :duckietown_msgs/StopLineReading "735fe9e9ff1e4d7460bbf69ab2720ae0")


