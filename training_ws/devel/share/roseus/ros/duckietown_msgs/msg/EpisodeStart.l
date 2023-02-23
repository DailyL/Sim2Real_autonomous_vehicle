;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::EpisodeStart)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'EpisodeStart (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::EPISODESTART")
  (make-package "DUCKIETOWN_MSGS::EPISODESTART"))

(in-package "ROS")
;;//! \htmlinclude EpisodeStart.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::EpisodeStart
  :super ros::object
  :slots (_header _episode_name _other_payload_yaml ))

(defmethod duckietown_msgs::EpisodeStart
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:episode_name __episode_name) "")
    ((:other_payload_yaml __other_payload_yaml) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _episode_name (string __episode_name))
   (setq _other_payload_yaml (string __other_payload_yaml))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:episode_name
   (&optional __episode_name)
   (if __episode_name (setq _episode_name __episode_name)) _episode_name)
  (:other_payload_yaml
   (&optional __other_payload_yaml)
   (if __other_payload_yaml (setq _other_payload_yaml __other_payload_yaml)) _other_payload_yaml)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _episode_name
    4 (length _episode_name)
    ;; string _other_payload_yaml
    4 (length _other_payload_yaml)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _episode_name
       (write-long (length _episode_name) s) (princ _episode_name s)
     ;; string _other_payload_yaml
       (write-long (length _other_payload_yaml) s) (princ _other_payload_yaml s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _episode_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _episode_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _other_payload_yaml
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _other_payload_yaml (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::EpisodeStart :md5sum-) "d9c9ddf1cb6334de0336392fe315bfa9")
(setf (get duckietown_msgs::EpisodeStart :datatype-) "duckietown_msgs/EpisodeStart")
(setf (get duckietown_msgs::EpisodeStart :definition-)
      "Header header
string episode_name
string other_payload_yaml

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

")



(provide :duckietown_msgs/EpisodeStart "d9c9ddf1cb6334de0336392fe315bfa9")


