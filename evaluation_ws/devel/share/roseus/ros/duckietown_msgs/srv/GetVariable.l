;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::GetVariable)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'GetVariable (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::GETVARIABLE")
  (make-package "DUCKIETOWN_MSGS::GETVARIABLE"))
(unless (find-package "DUCKIETOWN_MSGS::GETVARIABLEREQUEST")
  (make-package "DUCKIETOWN_MSGS::GETVARIABLEREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::GETVARIABLERESPONSE")
  (make-package "DUCKIETOWN_MSGS::GETVARIABLERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::GetVariableRequest
  :super ros::object
  :slots (_name_json ))

(defmethod duckietown_msgs::GetVariableRequest
  (:init
   (&key
    ((:name_json __name_json) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _name_json __name_json)
   self)
  (:name_json
   (&rest __name_json)
   (if (keywordp (car __name_json))
       (send* _name_json __name_json)
     (progn
       (if __name_json (setq _name_json (car __name_json)))
       _name_json)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _name_json
    (send _name_json :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _name_json
       (send _name_json :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _name_json
     (send _name_json :deserialize buf ptr-) (incf ptr- (send _name_json :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::GetVariableResponse
  :super ros::object
  :slots (_value_json ))

(defmethod duckietown_msgs::GetVariableResponse
  (:init
   (&key
    ((:value_json __value_json) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _value_json __value_json)
   self)
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
    ;; std_msgs/String _value_json
    (send _value_json :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _value_json
       (send _value_json :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _value_json
     (send _value_json :deserialize buf ptr-) (incf ptr- (send _value_json :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::GetVariable
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::GetVariable :md5sum-) "685a8058475bb3a593fd8f9319066e6a")
(setf (get duckietown_msgs::GetVariable :datatype-) "duckietown_msgs/GetVariable")
(setf (get duckietown_msgs::GetVariable :request) duckietown_msgs::GetVariableRequest)
(setf (get duckietown_msgs::GetVariable :response) duckietown_msgs::GetVariableResponse)

(defmethod duckietown_msgs::GetVariableRequest
  (:response () (instance duckietown_msgs::GetVariableResponse :init)))

(setf (get duckietown_msgs::GetVariableRequest :md5sum-) "685a8058475bb3a593fd8f9319066e6a")
(setf (get duckietown_msgs::GetVariableRequest :datatype-) "duckietown_msgs/GetVariableRequest")
(setf (get duckietown_msgs::GetVariableRequest :definition-)
      "std_msgs/String name_json

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String value_json


================================================================================
MSG: std_msgs/String
string data
")

(setf (get duckietown_msgs::GetVariableResponse :md5sum-) "685a8058475bb3a593fd8f9319066e6a")
(setf (get duckietown_msgs::GetVariableResponse :datatype-) "duckietown_msgs/GetVariableResponse")
(setf (get duckietown_msgs::GetVariableResponse :definition-)
      "std_msgs/String name_json

================================================================================
MSG: std_msgs/String
string data
---
std_msgs/String value_json


================================================================================
MSG: std_msgs/String
string data
")



(provide :duckietown_msgs/GetVariable "685a8058475bb3a593fd8f9319066e6a")


