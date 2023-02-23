;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::NodeGetParamsList)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'NodeGetParamsList (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::NODEGETPARAMSLIST")
  (make-package "DUCKIETOWN_MSGS::NODEGETPARAMSLIST"))
(unless (find-package "DUCKIETOWN_MSGS::NODEGETPARAMSLISTREQUEST")
  (make-package "DUCKIETOWN_MSGS::NODEGETPARAMSLISTREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::NODEGETPARAMSLISTRESPONSE")
  (make-package "DUCKIETOWN_MSGS::NODEGETPARAMSLISTRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::NodeGetParamsListRequest
  :super ros::object
  :slots ())

(defmethod duckietown_msgs::NodeGetParamsListRequest
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

(defclass duckietown_msgs::NodeGetParamsListResponse
  :super ros::object
  :slots (_parameters ))

(defmethod duckietown_msgs::NodeGetParamsListResponse
  (:init
   (&key
    ((:parameters __parameters) ())
    )
   (send-super :init)
   (setq _parameters __parameters)
   self)
  (:parameters
   (&rest __parameters)
   (if (keywordp (car __parameters))
       (send* _parameters __parameters)
     (progn
       (if __parameters (setq _parameters (car __parameters)))
       _parameters)))
  (:serialization-length
   ()
   (+
    ;; duckietown_msgs/NodeParameter[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/NodeParameter[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duckietown_msgs/NodeParameter[] _parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parameters (let (r) (dotimes (i n) (push (instance duckietown_msgs::NodeParameter :init) r)) r))
     (dolist (elem- _parameters)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass duckietown_msgs::NodeGetParamsList
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::NodeGetParamsList :md5sum-) "6d0f5ba1e047603a0b1306ec478bb3e5")
(setf (get duckietown_msgs::NodeGetParamsList :datatype-) "duckietown_msgs/NodeGetParamsList")
(setf (get duckietown_msgs::NodeGetParamsList :request) duckietown_msgs::NodeGetParamsListRequest)
(setf (get duckietown_msgs::NodeGetParamsList :response) duckietown_msgs::NodeGetParamsListResponse)

(defmethod duckietown_msgs::NodeGetParamsListRequest
  (:response () (instance duckietown_msgs::NodeGetParamsListResponse :init)))

(setf (get duckietown_msgs::NodeGetParamsListRequest :md5sum-) "6d0f5ba1e047603a0b1306ec478bb3e5")
(setf (get duckietown_msgs::NodeGetParamsListRequest :datatype-) "duckietown_msgs/NodeGetParamsListRequest")
(setf (get duckietown_msgs::NodeGetParamsListRequest :definition-)
      "---
duckietown_msgs/NodeParameter[] parameters


================================================================================
MSG: duckietown_msgs/NodeParameter
# Parameter type (this has to match duckietown.TopicType)
uint8 PARAM_TYPE_UNKNOWN = 0
uint8 PARAM_TYPE_STRING = 1
uint8 PARAM_TYPE_INT = 2
uint8 PARAM_TYPE_FLOAT = 3
uint8 PARAM_TYPE_BOOL = 4

string node         # Name of the node
string name         # Name of the parameter (fully resolved)
string help         # Description of the parameter
uint8 type          # Type of the parameter (see PARAM_TYPE_X above)
float32 min_value   # Min value (for type INT, UINT, and FLOAT)
float32 max_value   # Max value (for type INT, UINT, and FLOAT)
")

(setf (get duckietown_msgs::NodeGetParamsListResponse :md5sum-) "6d0f5ba1e047603a0b1306ec478bb3e5")
(setf (get duckietown_msgs::NodeGetParamsListResponse :datatype-) "duckietown_msgs/NodeGetParamsListResponse")
(setf (get duckietown_msgs::NodeGetParamsListResponse :definition-)
      "---
duckietown_msgs/NodeParameter[] parameters


================================================================================
MSG: duckietown_msgs/NodeParameter
# Parameter type (this has to match duckietown.TopicType)
uint8 PARAM_TYPE_UNKNOWN = 0
uint8 PARAM_TYPE_STRING = 1
uint8 PARAM_TYPE_INT = 2
uint8 PARAM_TYPE_FLOAT = 3
uint8 PARAM_TYPE_BOOL = 4

string node         # Name of the node
string name         # Name of the parameter (fully resolved)
string help         # Description of the parameter
uint8 type          # Type of the parameter (see PARAM_TYPE_X above)
float32 min_value   # Min value (for type INT, UINT, and FLOAT)
float32 max_value   # Max value (for type INT, UINT, and FLOAT)
")



(provide :duckietown_msgs/NodeGetParamsList "6d0f5ba1e047603a0b1306ec478bb3e5")


