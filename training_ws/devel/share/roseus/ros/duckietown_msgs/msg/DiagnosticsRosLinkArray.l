;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosLinkArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosLinkArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINKARRAY")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINKARRAY"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosLinkArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::DiagnosticsRosLinkArray
  :super ros::object
  :slots (_header _links ))

(defmethod duckietown_msgs::DiagnosticsRosLinkArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:links __links) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _links __links)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:links
   (&rest __links)
   (if (keywordp (car __links))
       (send* _links __links)
     (progn
       (if __links (setq _links (car __links)))
       _links)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/DiagnosticsRosLink[] _links
    (apply #'+ (send-all _links :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/DiagnosticsRosLink[] _links
     (write-long (length _links) s)
     (dolist (elem _links)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/DiagnosticsRosLink[] _links
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _links (let (r) (dotimes (i n) (push (instance duckietown_msgs::DiagnosticsRosLink :init) r)) r))
     (dolist (elem- _links)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosLinkArray :md5sum-) "429f5aa0771b8b09d6913175d25517ec")
(setf (get duckietown_msgs::DiagnosticsRosLinkArray :datatype-) "duckietown_msgs/DiagnosticsRosLinkArray")
(setf (get duckietown_msgs::DiagnosticsRosLinkArray :definition-)
      "Header header
duckietown_msgs/DiagnosticsRosLink[] links

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
MSG: duckietown_msgs/DiagnosticsRosLink
# Link direction
uint8 LINK_DIRECTION_INBOUND = 0
uint8 LINK_DIRECTION_OUTBOUND = 1

string node         # Node publishing this message
string topic        # Topic transferred over the link
string remote       # Remote end of this link
uint8 direction     # Link direction
bool connected      # Status of the link
string transport    # Type of transport used for this link
uint64 messages     # Number of messages transferred over this link
uint64 dropped      # Number of messages dropped over this link
float32 bytes       # Volume of data transferred over this link
float32 frequency   # Link frequency (Hz)
float32 bandwidth   # Link bandwidth (byte/s)

")



(provide :duckietown_msgs/DiagnosticsRosLinkArray "429f5aa0771b8b09d6913175d25517ec")


