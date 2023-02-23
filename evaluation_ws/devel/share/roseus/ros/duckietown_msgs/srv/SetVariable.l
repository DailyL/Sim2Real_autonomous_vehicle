;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SetVariable)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SetVariable (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SETVARIABLE")
  (make-package "DUCKIETOWN_MSGS::SETVARIABLE"))
(unless (find-package "DUCKIETOWN_MSGS::SETVARIABLEREQUEST")
  (make-package "DUCKIETOWN_MSGS::SETVARIABLEREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::SETVARIABLERESPONSE")
  (make-package "DUCKIETOWN_MSGS::SETVARIABLERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::SetVariableRequest
  :super ros::object
  :slots (_name_json _value_json ))

(defmethod duckietown_msgs::SetVariableRequest
  (:init
   (&key
    ((:name_json __name_json) (instance std_msgs::String :init))
    ((:value_json __value_json) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _name_json __name_json)
   (setq _value_json __value_json)
   self)
  (:name_json
   (&rest __name_json)
   (if (keywordp (car __name_json))
       (send* _name_json __name_json)
     (progn
       (if __name_json (setq _name_json (car __name_json)))
       _name_json)))
  (:value_json
   (&rest __value_json)
   (if (keywordp (car __value_json))
       (send* _value_json __value_json)
     (progn
       (if __value_json (setq _value_json (car __value_json)))
       _value_json)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _name_json
    (send _name_json :serialization-length)
    ;; std_msgs/String _value_json
    (send _value_json :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _name_json
       (send _name_json :serialize s)
     ;; std_msgs/String _value_json
       (send _value_json :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _name_json
     (send _name_json :deserialize buf ptr-) (incf ptr- (send _name_json :serialization-length))
   ;; std_msgs/String _value_json
     (send _value_json :deserialize buf ptr-) (incf ptr- (send _value_json :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::SetVariableResponse
  :super ros::object
  :slots (_success_json ))

(defmethod duckietown_msgs::SetVariableResponse
  (:init
   (&key
    ((:success_json __success_json) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _success_json __success_json)
   self)
  (:success_json
   (&rest __success_json)
   (if (keywordp (car __success_json))
       (send* _success_json __success_json)
     (progn
       (if __success_json (setq _success_json (car __success_json)))
       _success_json)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _success_json
    (send _success_json :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _success_json
       (send _success_json :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _success_json
     (send _success_json :deserialize buf ptr-) (incf ptr- (send _success_json :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::SetVariable
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::SetVariable :md5sum-) "b9596f8691f82d6cddb450d38ac5e5af")
(setf (get duckietown_msgs::SetVariable :datatype-) "duckietown_msgs/SetVariable")
(setf (get duckietown_msgs::SetVariable :request) duckietown_msgs::SetVariableRequest)
(setf (get duckietown_msgs::SetVariable :response) duckietown_msgs::SetVariableResponse)

(defmethod duckietown_msgs::SetVariableRequest
  (:response () (instance duckietown_msgs::SetVariableResponse :init)))

(setf (get duckietown_msgs::SetVariableRequest :md5sum-) "b9596f8691f82d6cddb450d38ac5e5af")
(setf (get duckietown_msgs::SetVariableRequest :datatype-) "duckietown_msgs/SetVariableRequest")
(setf (get duckietown_msgs::SetVariableRequest :definition-)
      "std_msgs/String name_json
std_msgs/String value_json

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String success_json


================================================================================
MSG: std_msgs/String
string data
")

(setf (get duckietown_msgs::SetVariableResponse :md5sum-) "b9596f8691f82d6cddb450d38ac5e5af")
(setf (get duckietown_msgs::SetVariableResponse :datatype-) "duckietown_msgs/SetVariableResponse")
(setf (get duckietown_msgs::SetVariableResponse :definition-)
      "std_msgs/String name_json
std_msgs/String value_json

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String success_json


================================================================================
MSG: std_msgs/String
string data
")



(provide :duckietown_msgs/SetVariable "b9596f8691f82d6cddb450d38ac5e5af")


