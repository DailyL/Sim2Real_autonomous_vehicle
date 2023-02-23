;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosTopicArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosTopicArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPICARRAY")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPICARRAY"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosTopicArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::DiagnosticsRosTopicArray
  :super ros::object
  :slots (_header _topics ))

(defmethod duckietown_msgs::DiagnosticsRosTopicArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:topics __topics) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _topics __topics)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:topics
   (&rest __topics)
   (if (keywordp (car __topics))
       (send* _topics __topics)
     (progn
       (if __topics (setq _topics (car __topics)))
       _topics)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/DiagnosticsRosTopic[] _topics
    (apply #'+ (send-all _topics :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/DiagnosticsRosTopic[] _topics
     (write-long (length _topics) s)
     (dolist (elem _topics)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/DiagnosticsRosTopic[] _topics
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _topics (let (r) (dotimes (i n) (push (instance duckietown_msgs::DiagnosticsRosTopic :init) r)) r))
     (dolist (elem- _topics)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosTopicArray :md5sum-) "75d6b38d91572d9e365e9ae3cf66db75")
(setf (get duckietown_msgs::DiagnosticsRosTopicArray :datatype-) "duckietown_msgs/DiagnosticsRosTopicArray")
(setf (get duckietown_msgs::DiagnosticsRosTopicArray :definition-)
      "Header header
duckietown_msgs/DiagnosticsRosTopic[] topics

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
MSG: duckietown_msgs/DiagnosticsRosTopic
# Topic direction (this has to match duckietown.TopicDirection)
uint8 TOPIC_DIRECTION_INBOUND = 0
uint8 TOPIC_DIRECTION_OUTBOUND = 1

# Topic type (this has to match duckietown.TopicType)
uint8 TOPIC_TYPE_GENERIC = 0
uint8 TOPIC_TYPE_DRIVER = 1
uint8 TOPIC_TYPE_PERCEPTION = 2
uint8 TOPIC_TYPE_CONTROL = 3
uint8 TOPIC_TYPE_PLANNING = 4
uint8 TOPIC_TYPE_LOCALIZATION = 5
uint8 TOPIC_TYPE_MAPPING = 6
uint8 TOPIC_TYPE_SWARM = 7
uint8 TOPIC_TYPE_BEHAVIOR = 8
uint8 TOPIC_TYPE_VISUALIZATION = 9
uint8 TOPIC_TYPE_INFRASTRUCTURE = 10
uint8 TOPIC_TYPE_COMMUNICATION = 11
uint8 TOPIC_TYPE_DIAGNOSTICS = 12
uint8 TOPIC_TYPE_DEBUG = 20

string node                     # Node publishing this message
string name                     # Topic object of the diagnostics
string help                     # Topic description
uint8 type                      # Topic type
uint8 direction                 # Topic direction
float32 frequency               # Topic frequency (Hz)
float32 effective_frequency     # Topic (effective) frequency (Hz)
float32 healthy_frequency       # Frequency at which this topic can be considered healthy
float32 bandwidth               # Topic bandwidth (byte/s)
bool enabled                    # Topic switch

")



(provide :duckietown_msgs/DiagnosticsRosTopicArray "75d6b38d91572d9e365e9ae3cf66db75")


