;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LEDInterpreter)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LEDInterpreter (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LEDINTERPRETER")
  (make-package "DUCKIETOWN_MSGS::LEDINTERPRETER"))

(in-package "ROS")
;;//! \htmlinclude LEDInterpreter.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::LEDInterpreter
  :super ros::object
  :slots (_header _vehicle _trafficlight ))

(defmethod duckietown_msgs::LEDInterpreter
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vehicle __vehicle) nil)
    ((:trafficlight __trafficlight) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vehicle __vehicle)
   (setq _trafficlight __trafficlight)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vehicle
   (&optional (__vehicle :null))
   (if (not (eq __vehicle :null)) (setq _vehicle __vehicle)) _vehicle)
  (:trafficlight
   (&optional (__trafficlight :null))
   (if (not (eq __trafficlight :null)) (setq _trafficlight __trafficlight)) _trafficlight)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _vehicle
    1
    ;; bool _trafficlight
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _vehicle
       (if _vehicle (write-byte -1 s) (write-byte 0 s))
     ;; bool _trafficlight
       (if _trafficlight (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _vehicle
     (setq _vehicle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _trafficlight
     (setq _trafficlight (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::LEDInterpreter :md5sum-) "100d6a2c19dff0c3d52b5c327f7ecae9")
(setf (get duckietown_msgs::LEDInterpreter :datatype-) "duckietown_msgs/LEDInterpreter")
(setf (get duckietown_msgs::LEDInterpreter :definition-)
      "Header header
bool vehicle
bool trafficlight

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



(provide :duckietown_msgs/LEDInterpreter "100d6a2c19dff0c3d52b5c327f7ecae9")


