;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::VehicleCorners)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'VehicleCorners (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::VEHICLECORNERS")
  (make-package "DUCKIETOWN_MSGS::VEHICLECORNERS"))

(in-package "ROS")
;;//! \htmlinclude VehicleCorners.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::VehicleCorners
  :super ros::object
  :slots (_header _corners _detection _H _W ))

(defmethod duckietown_msgs::VehicleCorners
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:corners __corners) ())
    ((:detection __detection) (instance std_msgs::Bool :init))
    ((:H __H) 0)
    ((:W __W) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _corners __corners)
   (setq _detection __detection)
   (setq _H (round __H))
   (setq _W (round __W))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:corners
   (&rest __corners)
   (if (keywordp (car __corners))
       (send* _corners __corners)
     (progn
       (if __corners (setq _corners (car __corners)))
       _corners)))
  (:detection
   (&rest __detection)
   (if (keywordp (car __detection))
       (send* _detection __detection)
     (progn
       (if __detection (setq _detection (car __detection)))
       _detection)))
  (:H
   (&optional __H)
   (if __H (setq _H __H)) _H)
  (:W
   (&optional __W)
   (if __W (setq _W __W)) _W)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point32[] _corners
    (apply #'+ (send-all _corners :serialization-length)) 4
    ;; std_msgs/Bool _detection
    (send _detection :serialization-length)
    ;; int32 _H
    4
    ;; int32 _W
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point32[] _corners
     (write-long (length _corners) s)
     (dolist (elem _corners)
       (send elem :serialize s)
       )
     ;; std_msgs/Bool _detection
       (send _detection :serialize s)
     ;; int32 _H
       (write-long _H s)
     ;; int32 _W
       (write-long _W s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point32[] _corners
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _corners (let (r) (dotimes (i n) (push (instance geometry_msgs::Point32 :init) r)) r))
     (dolist (elem- _corners)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/Bool _detection
     (send _detection :deserialize buf ptr-) (incf ptr- (send _detection :serialization-length))
   ;; int32 _H
     (setq _H (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _W
     (setq _W (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::VehicleCorners :md5sum-) "f601f02846ab710f0645608b8ce77e71")
(setf (get duckietown_msgs::VehicleCorners :datatype-) "duckietown_msgs/VehicleCorners")
(setf (get duckietown_msgs::VehicleCorners :definition-)
      "Header header
geometry_msgs/Point32[] corners
std_msgs/Bool detection
int32 H
int32 W


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
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: std_msgs/Bool
bool data
")



(provide :duckietown_msgs/VehicleCorners "f601f02846ab710f0645608b8ce77e71")


