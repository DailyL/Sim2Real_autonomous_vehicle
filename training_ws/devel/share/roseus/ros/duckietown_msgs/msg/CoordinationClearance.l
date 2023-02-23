;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::CoordinationClearance)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'CoordinationClearance (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE")
  (make-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))

(in-package "ROS")
;;//! \htmlinclude CoordinationClearance.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NA*" (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(shadow '*NA* (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(defconstant duckietown_msgs::CoordinationClearance::*NA* -1)
(intern "*WAIT*" (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(shadow '*WAIT* (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(defconstant duckietown_msgs::CoordinationClearance::*WAIT* 0)
(intern "*GO*" (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(shadow '*GO* (find-package "DUCKIETOWN_MSGS::COORDINATIONCLEARANCE"))
(defconstant duckietown_msgs::CoordinationClearance::*GO* 1)

(defun duckietown_msgs::CoordinationClearance-to-symbol (const)
  (cond
        ((= const -1) 'duckietown_msgs::CoordinationClearance::*NA*)
        ((= const 0) 'duckietown_msgs::CoordinationClearance::*WAIT*)
        ((= const 1) 'duckietown_msgs::CoordinationClearance::*GO*)
        (t nil)))

(defclass duckietown_msgs::CoordinationClearance
  :super ros::object
  :slots (_header _status ))

(defmethod duckietown_msgs::CoordinationClearance
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _status (round __status))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;;
   self)
  )

(setf (get duckietown_msgs::CoordinationClearance :md5sum-) "863863237538fdb5f0d38c0c62b294db")
(setf (get duckietown_msgs::CoordinationClearance :datatype-) "duckietown_msgs/CoordinationClearance")
(setf (get duckietown_msgs::CoordinationClearance :definition-)
      "Header header
int8 status

int8 NA=-1
int8 WAIT=0
int8 GO=1



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



(provide :duckietown_msgs/CoordinationClearance "863863237538fdb5f0d38c0c62b294db")


