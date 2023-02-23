;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SignalsDetectionETHZ17)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SignalsDetectionETHZ17 (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17")
  (make-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))

(in-package "ROS")
;;//! \htmlinclude SignalsDetectionETHZ17.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*SIGNAL_A*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*SIGNAL_A* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*SIGNAL_A* "'car_signal_A'")
(intern "*SIGNAL_B*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*SIGNAL_B* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*SIGNAL_B* "'car_signal_B'")
(intern "*SIGNAL_C*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*SIGNAL_C* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*SIGNAL_C* "'car_signal_C'")
(intern "*NO_CARS*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*NO_CARS* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*NO_CARS* "'no_cars_detected'")
(intern "*CARS*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*CARS* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*CARS* "'cars_detected'")
(intern "*GO*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(shadow '*GO* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTIONETHZ17"))
(defconstant duckietown_msgs::SignalsDetectionETHZ17::*GO* "'tl_go'")

(defun duckietown_msgs::SignalsDetectionETHZ17-to-symbol (const)
  (cond
        (t nil)))

(defclass duckietown_msgs::SignalsDetectionETHZ17
  :super ros::object
  :slots (_header _led_detected _no_led_detected ))

(defmethod duckietown_msgs::SignalsDetectionETHZ17
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:led_detected __led_detected) "")
    ((:no_led_detected __no_led_detected) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _led_detected (string __led_detected))
   (setq _no_led_detected (string __no_led_detected))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:led_detected
   (&optional __led_detected)
   (if __led_detected (setq _led_detected __led_detected)) _led_detected)
  (:no_led_detected
   (&optional __no_led_detected)
   (if __no_led_detected (setq _no_led_detected __no_led_detected)) _no_led_detected)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _led_detected
    4 (length _led_detected)
    ;; string _no_led_detected
    4 (length _no_led_detected)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _led_detected
       (write-long (length _led_detected) s) (princ _led_detected s)
     ;; string _no_led_detected
       (write-long (length _no_led_detected) s) (princ _no_led_detected s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _led_detected
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _led_detected (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _no_led_detected
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _no_led_detected (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::SignalsDetectionETHZ17 :md5sum-) "c1b7d3a54f028811e1c3b2366af85c0a")
(setf (get duckietown_msgs::SignalsDetectionETHZ17 :datatype-) "duckietown_msgs/SignalsDetectionETHZ17")
(setf (get duckietown_msgs::SignalsDetectionETHZ17 :definition-)
      "Header header

# this is what we can see at the intersection:
#string front
#string right
#string left 

# For the first backoff approach
string led_detected
string no_led_detected

# Each of these can be:
#string NO_CAR='no_car_detected'
string SIGNAL_A='car_signal_A'
string SIGNAL_B='car_signal_B'
string SIGNAL_C='car_signal_C'

string NO_CARS='no_cars_detected'
string CARS   ='cars_detected'


# Plus we can see the traffic light

# for the moment we assume that no traffic light exists

#string traffic_light_state

#string NO_TRAFFIC_LIGHT='no_traffic_light'
#string STOP='tl_stop'
string GO='tl_go'
#string YIELD='tl_yield'


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



(provide :duckietown_msgs/SignalsDetectionETHZ17 "c1b7d3a54f028811e1c3b2366af85c0a")


