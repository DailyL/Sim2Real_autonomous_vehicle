;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsCodeProfilingArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsCodeProfilingArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSCODEPROFILINGARRAY")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSCODEPROFILINGARRAY"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsCodeProfilingArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::DiagnosticsCodeProfilingArray
  :super ros::object
  :slots (_header _blocks ))

(defmethod duckietown_msgs::DiagnosticsCodeProfilingArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:blocks __blocks) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _blocks __blocks)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:blocks
   (&rest __blocks)
   (if (keywordp (car __blocks))
       (send* _blocks __blocks)
     (progn
       (if __blocks (setq _blocks (car __blocks)))
       _blocks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/DiagnosticsCodeProfiling[] _blocks
    (apply #'+ (send-all _blocks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/DiagnosticsCodeProfiling[] _blocks
     (write-long (length _blocks) s)
     (dolist (elem _blocks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/DiagnosticsCodeProfiling[] _blocks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _blocks (let (r) (dotimes (i n) (push (instance duckietown_msgs::DiagnosticsCodeProfiling :init) r)) r))
     (dolist (elem- _blocks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsCodeProfilingArray :md5sum-) "57dca0d37f20880e0dee9358611e6e75")
(setf (get duckietown_msgs::DiagnosticsCodeProfilingArray :datatype-) "duckietown_msgs/DiagnosticsCodeProfilingArray")
(setf (get duckietown_msgs::DiagnosticsCodeProfilingArray :definition-)
      "Header header
duckietown_msgs/DiagnosticsCodeProfiling[] blocks

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
MSG: duckietown_msgs/DiagnosticsCodeProfiling
string node                             # Node publishing this message
string block                            # Name of the profiled code block
float32 frequency                       # Execution frequency of the block
float32 duration                        # Last execution time of the block (in seconds)
string filename                         # Filename in which this block resides
uint16[2] line_nums                     # Start and end line of the block in the file
float32 time_since_last_execution       # Seconds since last execution
")



(provide :duckietown_msgs/DiagnosticsCodeProfilingArray "57dca0d37f20880e0dee9358611e6e75")


