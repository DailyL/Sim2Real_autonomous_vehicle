;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosParameterArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosParameterArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSPARAMETERARRAY")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSPARAMETERARRAY"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosParameterArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::DiagnosticsRosParameterArray
  :super ros::object
  :slots (_header _params ))

(defmethod duckietown_msgs::DiagnosticsRosParameterArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:params __params) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _params __params)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:params
   (&rest __params)
   (if (keywordp (car __params))
       (send* _params __params)
     (progn
       (if __params (setq _params (car __params)))
       _params)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/NodeParameter[] _params
    (apply #'+ (send-all _params :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/NodeParameter[] _params
     (write-long (length _params) s)
     (dolist (elem _params)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/NodeParameter[] _params
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _params (let (r) (dotimes (i n) (push (instance duckietown_msgs::NodeParameter :init) r)) r))
     (dolist (elem- _params)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosParameterArray :md5sum-) "3cce38c64acfe087a9363ff4d78b53a5")
(setf (get duckietown_msgs::DiagnosticsRosParameterArray :datatype-) "duckietown_msgs/DiagnosticsRosParameterArray")
(setf (get duckietown_msgs::DiagnosticsRosParameterArray :definition-)
      "Header header
duckietown_msgs/NodeParameter[] params             # List of parameters

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
bool editable       # Editable (it means that the node will be notified for changes)
")



(provide :duckietown_msgs/DiagnosticsRosParameterArray "3cce38c64acfe087a9363ff4d78b53a5")


