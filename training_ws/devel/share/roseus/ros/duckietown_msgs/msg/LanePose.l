;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LanePose)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LanePose (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LANEPOSE")
  (make-package "DUCKIETOWN_MSGS::LANEPOSE"))

(in-package "ROS")
;;//! \htmlinclude LanePose.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NORMAL*" (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(shadow '*NORMAL* (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(defconstant duckietown_msgs::LanePose::*NORMAL* 0)
(intern "*ERROR*" (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(shadow '*ERROR* (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(defconstant duckietown_msgs::LanePose::*ERROR* 1)

(defun duckietown_msgs::LanePose-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::LanePose::*NORMAL*)
        ((= const 1) 'duckietown_msgs::LanePose::*ERROR*)
        (t nil)))

(defclass duckietown_msgs::LanePose
  :super ros::object
  :slots (_header _d _sigma_d _phi _sigma_phi _status _in_lane ))

(defmethod duckietown_msgs::LanePose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:d __d) 0.0)
    ((:sigma_d __sigma_d) 0.0)
    ((:phi __phi) 0.0)
    ((:sigma_phi __sigma_phi) 0.0)
    ((:status __status) 0)
    ((:in_lane __in_lane) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _d (float __d))
   (setq _sigma_d (float __sigma_d))
   (setq _phi (float __phi))
   (setq _sigma_phi (float __sigma_phi))
   (setq _status (round __status))
   (setq _in_lane __in_lane)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:sigma_d
   (&optional __sigma_d)
   (if __sigma_d (setq _sigma_d __sigma_d)) _sigma_d)
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:sigma_phi
   (&optional __sigma_phi)
   (if __sigma_phi (setq _sigma_phi __sigma_phi)) _sigma_phi)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:in_lane
   (&optional (__in_lane :null))
   (if (not (eq __in_lane :null)) (setq _in_lane __in_lane)) _in_lane)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _d
    4
    ;; float32 _sigma_d
    4
    ;; float32 _phi
    4
    ;; float32 _sigma_phi
    4
    ;; int32 _status
    4
    ;; bool _in_lane
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _d
       (sys::poke _d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_d
       (sys::poke _sigma_d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sigma_phi
       (sys::poke _sigma_phi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _status
       (write-long _status s)
     ;; bool _in_lane
       (if _in_lane (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _d
     (setq _d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_d
     (setq _sigma_d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _phi
     (setq _phi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sigma_phi
     (setq _sigma_phi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _status
     (setq _status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _in_lane
     (setq _in_lane (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::LanePose :md5sum-) "248b875aed9afcb389413014f9465bf7")
(setf (get duckietown_msgs::LanePose :datatype-) "duckietown_msgs/LanePose")
(setf (get duckietown_msgs::LanePose :definition-)
      "Header header
float32 d   #lateral offset
float32 sigma_d
float32 phi #heading error
float32 sigma_phi
int32 status
bool in_lane
#Enum for status
int32 NORMAL=0
int32 ERROR=1 
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



(provide :duckietown_msgs/LanePose "248b875aed9afcb389413014f9465bf7")


