;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::MaintenanceState)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'MaintenanceState (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE")
  (make-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))

(in-package "ROS")
;;//! \htmlinclude MaintenanceState.msg.html


(intern "*WAY_TO_MAINTENANCE*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*WAY_TO_MAINTENANCE* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*WAY_TO_MAINTENANCE* "\"WAY_TO_MAINTENANCE\"")
(intern "*WAY_TO_CHARGING*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*WAY_TO_CHARGING* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*WAY_TO_CHARGING* "\"WAY_TO_CHARGING\"")
(intern "*CHARGING*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*CHARGING* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*CHARGING* "\"CHARGING\"")
(intern "*WAY_TO_CALIBRATING*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*WAY_TO_CALIBRATING* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*WAY_TO_CALIBRATING* "\"WAY_TO_CALIBRATING\"")
(intern "*CALIBRATING*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*CALIBRATING* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*CALIBRATING* "\"CALIBRATING\"")
(intern "*WAY_TO_CITY*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*WAY_TO_CITY* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*WAY_TO_CITY* "\"WAY_TO_CITY\"")
(intern "*NONE*" (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(shadow '*NONE* (find-package "DUCKIETOWN_MSGS::MAINTENANCESTATE"))
(defconstant duckietown_msgs::MaintenanceState::*NONE* "\"NONE\"")

(defun duckietown_msgs::MaintenanceState-to-symbol (const)
  (cond
        (t nil)))

(defclass duckietown_msgs::MaintenanceState
  :super ros::object
  :slots (_state ))

(defmethod duckietown_msgs::MaintenanceState
  (:init
   (&key
    ((:state __state) "")
    )
   (send-super :init)
   (setq _state (string __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::MaintenanceState :md5sum-) "076259ec4d51665ce2a0b26c9055f2df")
(setf (get duckietown_msgs::MaintenanceState :datatype-) "duckietown_msgs/MaintenanceState")
(setf (get duckietown_msgs::MaintenanceState :definition-)
      "#Header header
string state

# pseudo constants
string WAY_TO_MAINTENANCE=\"WAY_TO_MAINTENANCE\"
string WAY_TO_CHARGING=\"WAY_TO_CHARGING\"
string CHARGING=\"CHARGING\"
string WAY_TO_CALIBRATING=\"WAY_TO_CALIBRATING\"	
string CALIBRATING=\"CALIBRATING\"	
string WAY_TO_CITY=\"WAY_TO_CITY\"
string NONE=\"NONE\"

")



(provide :duckietown_msgs/MaintenanceState "076259ec4d51665ce2a0b26c9055f2df")


