;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::VehiclePose)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'VehiclePose (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::VEHICLEPOSE")
  (make-package "DUCKIETOWN_MSGS::VEHICLEPOSE"))

(in-package "ROS")
;;//! \htmlinclude VehiclePose.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::VehiclePose
  :super ros::object
  :slots (_header _rho _theta _psi _detection ))

(defmethod duckietown_msgs::VehiclePose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rho __rho) (instance std_msgs::Float32 :init))
    ((:theta __theta) (instance std_msgs::Float32 :init))
    ((:psi __psi) (instance std_msgs::Float32 :init))
    ((:detection __detection) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _rho __rho)
   (setq _theta __theta)
   (setq _psi __psi)
   (setq _detection __detection)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rho
   (&rest __rho)
   (if (keywordp (car __rho))
       (send* _rho __rho)
     (progn
       (if __rho (setq _rho (car __rho)))
       _rho)))
  (:theta
   (&rest __theta)
   (if (keywordp (car __theta))
       (send* _theta __theta)
     (progn
       (if __theta (setq _theta (car __theta)))
       _theta)))
  (:psi
   (&rest __psi)
   (if (keywordp (car __psi))
       (send* _psi __psi)
     (progn
       (if __psi (setq _psi (car __psi)))
       _psi)))
  (:detection
   (&rest __detection)
   (if (keywordp (car __detection))
       (send* _detection __detection)
     (progn
       (if __detection (setq _detection (car __detection)))
       _detection)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Float32 _rho
    (send _rho :serialization-length)
    ;; std_msgs/Float32 _theta
    (send _theta :serialization-length)
    ;; std_msgs/Float32 _psi
    (send _psi :serialization-length)
    ;; std_msgs/Bool _detection
    (send _detection :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Float32 _rho
       (send _rho :serialize s)
     ;; std_msgs/Float32 _theta
       (send _theta :serialize s)
     ;; std_msgs/Float32 _psi
       (send _psi :serialize s)
     ;; std_msgs/Bool _detection
       (send _detection :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Float32 _rho
     (send _rho :deserialize buf ptr-) (incf ptr- (send _rho :serialization-length))
   ;; std_msgs/Float32 _theta
     (send _theta :deserialize buf ptr-) (incf ptr- (send _theta :serialization-length))
   ;; std_msgs/Float32 _psi
     (send _psi :deserialize buf ptr-) (incf ptr- (send _psi :serialization-length))
   ;; std_msgs/Bool _detection
     (send _detection :deserialize buf ptr-) (incf ptr- (send _detection :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::VehiclePose :md5sum-) "69c01ed5e84e0f58f795e563d073900d")
(setf (get duckietown_msgs::VehiclePose :datatype-) "duckietown_msgs/VehiclePose")
(setf (get duckietown_msgs::VehiclePose :definition-)
      "Header header
std_msgs/Float32 rho
std_msgs/Float32 theta
std_msgs/Float32 psi
std_msgs/Bool detection


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
MSG: std_msgs/Float32
float32 data
================================================================================
MSG: std_msgs/Bool
bool data
")



(provide :duckietown_msgs/VehiclePose "69c01ed5e84e0f58f795e563d073900d")


