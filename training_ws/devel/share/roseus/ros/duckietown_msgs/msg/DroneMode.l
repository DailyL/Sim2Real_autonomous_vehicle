;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DroneMode)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DroneMode (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DRONEMODE")
  (make-package "DUCKIETOWN_MSGS::DRONEMODE"))

(in-package "ROS")
;;//! \htmlinclude DroneMode.msg.html


(intern "*DRONE_MODE_DISARMED*" (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(shadow '*DRONE_MODE_DISARMED* (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(defconstant duckietown_msgs::DroneMode::*DRONE_MODE_DISARMED* 0)
(intern "*DRONE_MODE_ARMED*" (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(shadow '*DRONE_MODE_ARMED* (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(defconstant duckietown_msgs::DroneMode::*DRONE_MODE_ARMED* 1)
(intern "*DRONE_MODE_FLYING*" (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(shadow '*DRONE_MODE_FLYING* (find-package "DUCKIETOWN_MSGS::DRONEMODE"))
(defconstant duckietown_msgs::DroneMode::*DRONE_MODE_FLYING* 2)

(defun duckietown_msgs::DroneMode-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::DroneMode::*DRONE_MODE_DISARMED*)
        ((= const 1) 'duckietown_msgs::DroneMode::*DRONE_MODE_ARMED*)
        ((= const 2) 'duckietown_msgs::DroneMode::*DRONE_MODE_FLYING*)
        (t nil)))

(defclass duckietown_msgs::DroneMode
  :super ros::object
  :slots (_drone_mode ))

(defmethod duckietown_msgs::DroneMode
  (:init
   (&key
    ((:drone_mode __drone_mode) 0)
    )
   (send-super :init)
   (setq _drone_mode (round __drone_mode))
   self)
  (:drone_mode
   (&optional __drone_mode)
   (if __drone_mode (setq _drone_mode __drone_mode)) _drone_mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _drone_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _drone_mode
       (write-byte _drone_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _drone_mode
     (setq _drone_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::DroneMode :md5sum-) "b59b67ae59d5510222e083f7dcf98328")
(setf (get duckietown_msgs::DroneMode :datatype-) "duckietown_msgs/DroneMode")
(setf (get duckietown_msgs::DroneMode :definition-)
      "# Power supply status constants
uint8 DRONE_MODE_DISARMED = 0
uint8 DRONE_MODE_ARMED = 1
uint8 DRONE_MODE_FLYING = 2

# The drone status  as reported. Values defined above
uint8 drone_mode

")



(provide :duckietown_msgs/DroneMode "b59b67ae59d5510222e083f7dcf98328")


