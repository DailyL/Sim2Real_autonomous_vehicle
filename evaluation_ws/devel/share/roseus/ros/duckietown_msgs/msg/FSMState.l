;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::FSMState)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'FSMState (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::FSMSTATE")
  (make-package "DUCKIETOWN_MSGS::FSMSTATE"))

(in-package "ROS")
;;//! \htmlinclude FSMState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*LANE_FOLLOWING*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*LANE_FOLLOWING* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*LANE_FOLLOWING* "\"LANE_FOLLOWING\"")
(intern "*INTERSECTION_COORDINATION*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*INTERSECTION_COORDINATION* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*INTERSECTION_COORDINATION* "\"INTERSECTION_COORDINATION\"")
(intern "*INTERSECTION_CONTROL*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*INTERSECTION_CONTROL* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*INTERSECTION_CONTROL* "\"INTERSECTION_CONTROL\"")
(intern "*NORMAL_JOYSTICK_CONTROL*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*NORMAL_JOYSTICK_CONTROL* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*NORMAL_JOYSTICK_CONTROL* "\"NORMAL_JOYSTICK_CONTROL\"")
(intern "*SAFE_JOYSTICK_CONTROL*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*SAFE_JOYSTICK_CONTROL* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*SAFE_JOYSTICK_CONTROL* "\"SAFE_JOYSTICK_CONTROL\"")
(intern "*PARKING*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*PARKING* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*PARKING* "\"PARKING\"")
(intern "*ARRIVE_AT_STOP_LINE*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*ARRIVE_AT_STOP_LINE* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*ARRIVE_AT_STOP_LINE* "\"ARRIVE_AT_STOP_LINE\"")
(intern "*LANE_RECOVERY*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*LANE_RECOVERY* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*LANE_RECOVERY* "\"LANE_RECOVERY\"")
(intern "*INTERSECTION_RECOVERY*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*INTERSECTION_RECOVERY* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*INTERSECTION_RECOVERY* "\"INTERSECTION_RECOVERY\"")
(intern "*CALIBRATING*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*CALIBRATING* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*CALIBRATING* "\"CALIBRATING\"")
(intern "*CALIBRATING_CALC*" (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(shadow '*CALIBRATING_CALC* (find-package "DUCKIETOWN_MSGS::FSMSTATE"))
(defconstant duckietown_msgs::FSMState::*CALIBRATING_CALC* "\"CALIBRATING_CALC\"")

(defun duckietown_msgs::FSMState-to-symbol (const)
  (cond
        (t nil)))

(defclass duckietown_msgs::FSMState
  :super ros::object
  :slots (_header _state ))

(defmethod duckietown_msgs::FSMState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state __state) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _state (string __state))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _state
    4 (length _state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::FSMState :md5sum-) "3c94938238cecfe40fdf747aae8abbaa")
(setf (get duckietown_msgs::FSMState :datatype-) "duckietown_msgs/FSMState")
(setf (get duckietown_msgs::FSMState :definition-)
      "Header header
string state

# pseudo constants
string LANE_FOLLOWING=\"LANE_FOLLOWING\"
string INTERSECTION_COORDINATION=\"INTERSECTION_COORDINATION\"
string INTERSECTION_CONTROL=\"INTERSECTION_CONTROL\"
string NORMAL_JOYSTICK_CONTROL=\"NORMAL_JOYSTICK_CONTROL\"
string SAFE_JOYSTICK_CONTROL=\"SAFE_JOYSTICK_CONTROL\"
string PARKING=\"PARKING\"
string ARRIVE_AT_STOP_LINE=\"ARRIVE_AT_STOP_LINE\"
string LANE_RECOVERY=\"LANE_RECOVERY\"
string INTERSECTION_RECOVERY=\"INTERSECTION_RECOVERY\"
string CALIBRATING=\"CALIBRATING\"
string CALIBRATING_CALC=\"CALIBRATING_CALC\"

#List of states
# LANE_FOLLOWING
# INTERSECTION_COORDINATION
# INTERSECTION_CONTROL
# NORMAL_JOYSTICK_CONTROL
# SAFE_JOYSTICK_CONTROL
# PARKING
# ARRIVE_AT_STOP_LINE
# LANE_RECOVERY
# INTERSECTION_RECOVERY
# CALIBRATING
# CALIBRATING_CALC

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



(provide :duckietown_msgs/FSMState "3c94938238cecfe40fdf747aae8abbaa")


