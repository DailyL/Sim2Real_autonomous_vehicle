;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::CoordinationSignal)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'CoordinationSignal (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL")
  (make-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))

(in-package "ROS")
;;//! \htmlinclude CoordinationSignal.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*OFF*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*OFF* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*OFF* "light_off")
(intern "*ON*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*ON* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*ON* "traffic_light_go")
(intern "*SIGNAL_A*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_A* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_A* "CAR_SIGNAL_A")
(intern "*SIGNAL_B*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_B* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_B* "CAR_SIGNAL_B")
(intern "*SIGNAL_C*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_C* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_C* "CAR_SIGNAL_C")
(intern "*SIGNAL_GREEN*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_GREEN* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_GREEN* "CAR_SIGNAL_GREEN")
(intern "*SIGNAL_PRIORITY*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_PRIORITY* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_PRIORITY* "CAR_SIGNAL_PRIORITY")
(intern "*SIGNAL_SACRIFICE_FOR_PRIORITY*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*SIGNAL_SACRIFICE_FOR_PRIORITY* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*SIGNAL_SACRIFICE_FOR_PRIORITY* "CAR_SIGNAL_SACRIFICE_FOR_PRIORITY")
(intern "*TL_GO_ALL*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_GO_ALL* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_GO_ALL* "tl_go_all")
(intern "*TL_STOP_ALL*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_STOP_ALL* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_STOP_ALL* "tl_stop_all")
(intern "*TL_GO_N*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_GO_N* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_GO_N* "tl_go_N")
(intern "*TL_GO_S*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_GO_S* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_GO_S* "tl_go_S")
(intern "*TL_GO_W*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_GO_W* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_GO_W* "tl_go_W")
(intern "*TL_GO_E*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_GO_E* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_GO_E* "tl_go_E")
(intern "*TL_YIELD*" (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(shadow '*TL_YIELD* (find-package "DUCKIETOWN_MSGS::COORDINATIONSIGNAL"))
(defconstant duckietown_msgs::CoordinationSignal::*TL_YIELD* "tl_yield")

(defun duckietown_msgs::CoordinationSignal-to-symbol (const)
  (cond
        (t nil)))

(defclass duckietown_msgs::CoordinationSignal
  :super ros::object
  :slots (_header _signal ))

(defmethod duckietown_msgs::CoordinationSignal
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:signal __signal) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _signal (string __signal))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _signal
    4 (length _signal)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _signal
       (write-long (length _signal) s) (princ _signal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _signal
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _signal (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::CoordinationSignal :md5sum-) "3caa78ed5f7d2e4ac24db630f8ee77a8")
(setf (get duckietown_msgs::CoordinationSignal :datatype-) "duckietown_msgs/CoordinationSignal")
(setf (get duckietown_msgs::CoordinationSignal :definition-)
      "Header header

string signal

# these must match with LED_protocol.yaml
string OFF=light_off
#string ON = light_on
string ON=traffic_light_go
string SIGNAL_A=CAR_SIGNAL_A
string SIGNAL_B=CAR_SIGNAL_B
string SIGNAL_C=CAR_SIGNAL_C
string SIGNAL_GREEN = CAR_SIGNAL_GREEN
string SIGNAL_PRIORITY = CAR_SIGNAL_PRIORITY
string SIGNAL_SACRIFICE_FOR_PRIORITY = CAR_SIGNAL_SACRIFICE_FOR_PRIORITY

string TL_GO_ALL=tl_go_all
string TL_STOP_ALL=tl_stop_all
string TL_GO_N=tl_go_N
string TL_GO_S=tl_go_S
string TL_GO_W=tl_go_W
string TL_GO_E=tl_go_E
string TL_YIELD=tl_yield

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



(provide :duckietown_msgs/CoordinationSignal "3caa78ed5f7d2e4ac24db630f8ee77a8")


