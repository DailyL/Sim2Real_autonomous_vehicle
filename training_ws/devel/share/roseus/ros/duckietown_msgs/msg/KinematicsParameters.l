;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::KinematicsParameters)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'KinematicsParameters (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::KINEMATICSPARAMETERS")
  (make-package "DUCKIETOWN_MSGS::KINEMATICSPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude KinematicsParameters.msg.html


(defclass duckietown_msgs::KinematicsParameters
  :super ros::object
  :slots (_parameters ))

(defmethod duckietown_msgs::KinematicsParameters
  (:init
   (&key
    ((:parameters __parameters) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _parameters __parameters)
   self)
  (:parameters
   (&optional __parameters)
   (if __parameters (setq _parameters __parameters)) _parameters)
  (:serialization-length
   ()
   (+
    ;; float64[] _parameters
    (* 8    (length _parameters)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _parameters
     (write-long (length _parameters) s)
     (dotimes (i (length _parameters))
       (sys::poke (elt _parameters i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parameters (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _parameters i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::KinematicsParameters :md5sum-) "cbca57679564ab84ca723072e3bf6226")
(setf (get duckietown_msgs::KinematicsParameters :datatype-) "duckietown_msgs/KinematicsParameters")
(setf (get duckietown_msgs::KinematicsParameters :definition-)
      "float64[] parameters
")



(provide :duckietown_msgs/KinematicsParameters "cbca57679564ab84ca723072e3bf6226")


