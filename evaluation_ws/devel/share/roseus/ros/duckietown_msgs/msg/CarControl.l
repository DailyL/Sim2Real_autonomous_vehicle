;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::CarControl)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'CarControl (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::CARCONTROL")
  (make-package "DUCKIETOWN_MSGS::CARCONTROL"))

(in-package "ROS")
;;//! \htmlinclude CarControl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::CarControl
  :super ros::object
  :slots (_header _speed _steering _need_steering ))

(defmethod duckietown_msgs::CarControl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:speed __speed) 0.0)
    ((:steering __steering) 0.0)
    ((:need_steering __need_steering) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _speed (float __speed))
   (setq _steering (float __steering))
   (setq _need_steering __need_steering)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:need_steering
   (&optional (__need_steering :null))
   (if (not (eq __need_steering :null)) (setq _need_steering __need_steering)) _need_steering)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _speed
    4
    ;; float32 _steering
    4
    ;; bool _need_steering
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _need_steering
       (if _need_steering (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering
     (setq _steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _need_steering
     (setq _need_steering (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::CarControl :md5sum-) "a5bdd39ba7df1e21f0742b74ac614c71")
(setf (get duckietown_msgs::CarControl :datatype-) "duckietown_msgs/CarControl")
(setf (get duckietown_msgs::CarControl :definition-)
      "Header header
float32 speed
float32 steering
bool need_steering
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



(provide :duckietown_msgs/CarControl "a5bdd39ba7df1e21f0742b74ac614c71")


