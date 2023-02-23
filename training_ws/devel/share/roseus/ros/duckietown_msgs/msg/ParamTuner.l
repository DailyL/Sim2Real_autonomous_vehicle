;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ParamTuner)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ParamTuner (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::PARAMTUNER")
  (make-package "DUCKIETOWN_MSGS::PARAMTUNER"))

(in-package "ROS")
;;//! \htmlinclude ParamTuner.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::ParamTuner
  :super ros::object
  :slots (_header _cross_track_err _cross_track_integral _diff_cross_track_err _heading_err _heading_integral _diff_heading_err _dt ))

(defmethod duckietown_msgs::ParamTuner
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cross_track_err __cross_track_err) 0.0)
    ((:cross_track_integral __cross_track_integral) 0.0)
    ((:diff_cross_track_err __diff_cross_track_err) 0.0)
    ((:heading_err __heading_err) 0.0)
    ((:heading_integral __heading_integral) 0.0)
    ((:diff_heading_err __diff_heading_err) 0.0)
    ((:dt __dt) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _cross_track_err (float __cross_track_err))
   (setq _cross_track_integral (float __cross_track_integral))
   (setq _diff_cross_track_err (float __diff_cross_track_err))
   (setq _heading_err (float __heading_err))
   (setq _heading_integral (float __heading_integral))
   (setq _diff_heading_err (float __diff_heading_err))
   (setq _dt (float __dt))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cross_track_err
   (&optional __cross_track_err)
   (if __cross_track_err (setq _cross_track_err __cross_track_err)) _cross_track_err)
  (:cross_track_integral
   (&optional __cross_track_integral)
   (if __cross_track_integral (setq _cross_track_integral __cross_track_integral)) _cross_track_integral)
  (:diff_cross_track_err
   (&optional __diff_cross_track_err)
   (if __diff_cross_track_err (setq _diff_cross_track_err __diff_cross_track_err)) _diff_cross_track_err)
  (:heading_err
   (&optional __heading_err)
   (if __heading_err (setq _heading_err __heading_err)) _heading_err)
  (:heading_integral
   (&optional __heading_integral)
   (if __heading_integral (setq _heading_integral __heading_integral)) _heading_integral)
  (:diff_heading_err
   (&optional __diff_heading_err)
   (if __diff_heading_err (setq _diff_heading_err __diff_heading_err)) _diff_heading_err)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _cross_track_err
    4
    ;; float32 _cross_track_integral
    4
    ;; float32 _diff_cross_track_err
    4
    ;; float32 _heading_err
    4
    ;; float32 _heading_integral
    4
    ;; float32 _diff_heading_err
    4
    ;; float32 _dt
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _cross_track_err
       (sys::poke _cross_track_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cross_track_integral
       (sys::poke _cross_track_integral (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _diff_cross_track_err
       (sys::poke _diff_cross_track_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading_err
       (sys::poke _heading_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading_integral
       (sys::poke _heading_integral (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _diff_heading_err
       (sys::poke _diff_heading_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _cross_track_err
     (setq _cross_track_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cross_track_integral
     (setq _cross_track_integral (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _diff_cross_track_err
     (setq _diff_cross_track_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading_err
     (setq _heading_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading_integral
     (setq _heading_integral (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _diff_heading_err
     (setq _diff_heading_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dt
     (setq _dt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::ParamTuner :md5sum-) "53c42bf2be1bd4386da34eca6088702d")
(setf (get duckietown_msgs::ParamTuner :datatype-) "duckietown_msgs/ParamTuner")
(setf (get duckietown_msgs::ParamTuner :definition-)
      "Header header
float32 cross_track_err
float32 cross_track_integral
float32 diff_cross_track_err
float32 heading_err
float32 heading_integral
float32 diff_heading_err
float32 dt
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



(provide :duckietown_msgs/ParamTuner "53c42bf2be1bd4386da34eca6088702d")


