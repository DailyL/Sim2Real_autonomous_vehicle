;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SignalsDetection)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SignalsDetection (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION")
  (make-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))

(in-package "ROS")
;;//! \htmlinclude SignalsDetection.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NO_CAR*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*NO_CAR* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*NO_CAR* "'no_car_detected'")
(intern "*SIGNAL_A*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*SIGNAL_A* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*SIGNAL_A* "'car_signal_A'")
(intern "*SIGNAL_B*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*SIGNAL_B* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*SIGNAL_B* "'car_signal_B'")
(intern "*SIGNAL_C*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*SIGNAL_C* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*SIGNAL_C* "'car_signal_C'")
(intern "*SIGNAL_PRIORITY*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*SIGNAL_PRIORITY* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*SIGNAL_PRIORITY* "'car_signal_priority'")
(intern "*SIGNAL_SACRIFICE_FOR_PRIORITY*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*SIGNAL_SACRIFICE_FOR_PRIORITY* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*SIGNAL_SACRIFICE_FOR_PRIORITY* "'car_signal_sacrifice_for_priority'")
(intern "*NO_CARS*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*NO_CARS* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*NO_CARS* "'no_cars_detected'")
(intern "*CARS*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*CARS* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*CARS* "'cars_detected'")
(intern "*NO_TRAFFIC_LIGHT*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*NO_TRAFFIC_LIGHT* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*NO_TRAFFIC_LIGHT* "'no_traffic_light'")
(intern "*STOP*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*STOP* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*STOP* "'tl_stop'")
(intern "*GO*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*GO* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*GO* "'tl_go'")
(intern "*YIELD*" (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(shadow '*YIELD* (find-package "DUCKIETOWN_MSGS::SIGNALSDETECTION"))
(defconstant duckietown_msgs::SignalsDetection::*YIELD* "'tl_yield'")

(defun duckietown_msgs::SignalsDetection-to-symbol (const)
  (cond
        (t nil)))

(defclass duckietown_msgs::SignalsDetection
  :super ros::object
  :slots (_header _front _right _left _traffic_light_state ))

(defmethod duckietown_msgs::SignalsDetection
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:front __front) "")
    ((:right __right) "")
    ((:left __left) "")
    ((:traffic_light_state __traffic_light_state) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _front (string __front))
   (setq _right (string __right))
   (setq _left (string __left))
   (setq _traffic_light_state (string __traffic_light_state))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:front
   (&optional __front)
   (if __front (setq _front __front)) _front)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:traffic_light_state
   (&optional __traffic_light_state)
   (if __traffic_light_state (setq _traffic_light_state __traffic_light_state)) _traffic_light_state)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _front
    4 (length _front)
    ;; string _right
    4 (length _right)
    ;; string _left
    4 (length _left)
    ;; string _traffic_light_state
    4 (length _traffic_light_state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _front
       (write-long (length _front) s) (princ _front s)
     ;; string _right
       (write-long (length _right) s) (princ _right s)
     ;; string _left
       (write-long (length _left) s) (princ _left s)
     ;; string _traffic_light_state
       (write-long (length _traffic_light_state) s) (princ _traffic_light_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _front
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _front (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _right
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _right (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _left
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _left (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _traffic_light_state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _traffic_light_state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::SignalsDetection :md5sum-) "7a3bb73ea77191f1c0ddd7e196f27c75")
(setf (get duckietown_msgs::SignalsDetection :datatype-) "duckietown_msgs/SignalsDetection")
(setf (get duckietown_msgs::SignalsDetection :definition-)
      "Header header

# this is what we can see at the intersection:
string front
string right
string left

# For the first backoff approach
# string led_detected
# string no_led_detected

# Each of these can be:
string NO_CAR='no_car_detected'
string SIGNAL_A='car_signal_A'
string SIGNAL_B='car_signal_B'
string SIGNAL_C='car_signal_C'
string SIGNAL_PRIORITY='car_signal_priority'
string SIGNAL_SACRIFICE_FOR_PRIORITY='car_signal_sacrifice_for_priority'

string NO_CARS='no_cars_detected'
string CARS   ='cars_detected'


# Plus we can see the traffic light

# for the moment we assume that no traffic light exists

string traffic_light_state

string NO_TRAFFIC_LIGHT='no_traffic_light'
string STOP='tl_stop'
string GO='tl_go'
string YIELD='tl_yield'

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



(provide :duckietown_msgs/SignalsDetection "7a3bb73ea77191f1c0ddd7e196f27c75")


