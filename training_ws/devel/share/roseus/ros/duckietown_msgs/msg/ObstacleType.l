;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ObstacleType)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ObstacleType (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::OBSTACLETYPE")
  (make-package "DUCKIETOWN_MSGS::OBSTACLETYPE"))

(in-package "ROS")
;;//! \htmlinclude ObstacleType.msg.html


(intern "*DUCKIE*" (find-package "DUCKIETOWN_MSGS::OBSTACLETYPE"))
(shadow '*DUCKIE* (find-package "DUCKIETOWN_MSGS::OBSTACLETYPE"))
(defconstant duckietown_msgs::ObstacleType::*DUCKIE* 0)
(intern "*CONE*" (find-package "DUCKIETOWN_MSGS::OBSTACLETYPE"))
(shadow '*CONE* (find-package "DUCKIETOWN_MSGS::OBSTACLETYPE"))
(defconstant duckietown_msgs::ObstacleType::*CONE* 1)

(defun duckietown_msgs::ObstacleType-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::ObstacleType::*DUCKIE*)
        ((= const 1) 'duckietown_msgs::ObstacleType::*CONE*)
        (t nil)))

(defclass duckietown_msgs::ObstacleType
  :super ros::object
  :slots (_type ))

(defmethod duckietown_msgs::ObstacleType
  (:init
   (&key
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; uint8 _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type
       (write-byte _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::ObstacleType :md5sum-) "9ebfbd5f069d46cb29c52358b5e953fb")
(setf (get duckietown_msgs::ObstacleType :datatype-) "duckietown_msgs/ObstacleType")
(setf (get duckietown_msgs::ObstacleType :definition-)
      "uint8 DUCKIE=0
uint8 CONE=1
uint8 type
")



(provide :duckietown_msgs/ObstacleType "9ebfbd5f069d46cb29c52358b5e953fb")


