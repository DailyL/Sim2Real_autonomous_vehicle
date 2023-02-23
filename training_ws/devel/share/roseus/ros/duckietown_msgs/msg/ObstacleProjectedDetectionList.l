;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ObstacleProjectedDetectionList)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ObstacleProjectedDetectionList (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::OBSTACLEPROJECTEDDETECTIONLIST")
  (make-package "DUCKIETOWN_MSGS::OBSTACLEPROJECTEDDETECTIONLIST"))

(in-package "ROS")
;;//! \htmlinclude ObstacleProjectedDetectionList.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::ObstacleProjectedDetectionList
  :super ros::object
  :slots (_header _list ))

(defmethod duckietown_msgs::ObstacleProjectedDetectionList
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:list __list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _list __list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:list
   (&rest __list)
   (if (keywordp (car __list))
       (send* _list __list)
     (progn
       (if __list (setq _list (car __list)))
       _list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/ObstacleProjectedDetection[] _list
    (apply #'+ (send-all _list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/ObstacleProjectedDetection[] _list
     (write-long (length _list) s)
     (dolist (elem _list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/ObstacleProjectedDetection[] _list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list (let (r) (dotimes (i n) (push (instance duckietown_msgs::ObstacleProjectedDetection :init) r)) r))
     (dolist (elem- _list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::ObstacleProjectedDetectionList :md5sum-) "11b067403fefa6151edc8b44e25edac3")
(setf (get duckietown_msgs::ObstacleProjectedDetectionList :datatype-) "duckietown_msgs/ObstacleProjectedDetectionList")
(setf (get duckietown_msgs::ObstacleProjectedDetectionList :definition-)
      "Header header
duckietown_msgs/ObstacleProjectedDetection[] list
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
MSG: duckietown_msgs/ObstacleProjectedDetection
geometry_msgs/Point location
duckietown_msgs/ObstacleType type
float32 distance
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: duckietown_msgs/ObstacleType
uint8 DUCKIE=0
uint8 CONE=1
uint8 type
")



(provide :duckietown_msgs/ObstacleProjectedDetectionList "11b067403fefa6151edc8b44e25edac3")


