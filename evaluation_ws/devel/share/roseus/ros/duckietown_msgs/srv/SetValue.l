;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SetValue)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SetValue (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SETVALUE")
  (make-package "DUCKIETOWN_MSGS::SETVALUE"))
(unless (find-package "DUCKIETOWN_MSGS::SETVALUEREQUEST")
  (make-package "DUCKIETOWN_MSGS::SETVALUEREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::SETVALUERESPONSE")
  (make-package "DUCKIETOWN_MSGS::SETVALUERESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::SetValueRequest
  :super ros::object
  :slots (_value ))

(defmethod duckietown_msgs::SetValueRequest
  (:init
   (&key
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _value (float __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass duckietown_msgs::SetValueResponse
  :super ros::object
  :slots ())

(defmethod duckietown_msgs::SetValueResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass duckietown_msgs::SetValue
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::SetValue :md5sum-) "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(setf (get duckietown_msgs::SetValue :datatype-) "duckietown_msgs/SetValue")
(setf (get duckietown_msgs::SetValue :request) duckietown_msgs::SetValueRequest)
(setf (get duckietown_msgs::SetValue :response) duckietown_msgs::SetValueResponse)

(defmethod duckietown_msgs::SetValueRequest
  (:response () (instance duckietown_msgs::SetValueResponse :init)))

(setf (get duckietown_msgs::SetValueRequest :md5sum-) "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(setf (get duckietown_msgs::SetValueRequest :datatype-) "duckietown_msgs/SetValueRequest")
(setf (get duckietown_msgs::SetValueRequest :definition-)
      "float32 value
---
")

(setf (get duckietown_msgs::SetValueResponse :md5sum-) "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(setf (get duckietown_msgs::SetValueResponse :datatype-) "duckietown_msgs/SetValueResponse")
(setf (get duckietown_msgs::SetValueResponse :definition-)
      "float32 value
---
")



(provide :duckietown_msgs/SetValue "0aca93dcf6d857f0e5a0dc6be1eaa9fb")


