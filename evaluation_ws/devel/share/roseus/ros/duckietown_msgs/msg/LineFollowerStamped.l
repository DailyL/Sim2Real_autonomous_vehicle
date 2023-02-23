;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LineFollowerStamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LineFollowerStamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LINEFOLLOWERSTAMPED")
  (make-package "DUCKIETOWN_MSGS::LINEFOLLOWERSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude LineFollowerStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::LineFollowerStamped
  :super ros::object
  :slots (_header _valid _outer_right _inner_right _inner_left _outer_left ))

(defmethod duckietown_msgs::LineFollowerStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:valid __valid) nil)
    ((:outer_right __outer_right) 0.0)
    ((:inner_right __inner_right) 0.0)
    ((:inner_left __inner_left) 0.0)
    ((:outer_left __outer_left) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _valid __valid)
   (setq _outer_right (float __outer_right))
   (setq _inner_right (float __inner_right))
   (setq _inner_left (float __inner_left))
   (setq _outer_left (float __outer_left))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:valid
   (&optional (__valid :null))
   (if (not (eq __valid :null)) (setq _valid __valid)) _valid)
  (:outer_right
   (&optional __outer_right)
   (if __outer_right (setq _outer_right __outer_right)) _outer_right)
  (:inner_right
   (&optional __inner_right)
   (if __inner_right (setq _inner_right __inner_right)) _inner_right)
  (:inner_left
   (&optional __inner_left)
   (if __inner_left (setq _inner_left __inner_left)) _inner_left)
  (:outer_left
   (&optional __outer_left)
   (if __outer_left (setq _outer_left __outer_left)) _outer_left)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _valid
    1
    ;; float32 _outer_right
    4
    ;; float32 _inner_right
    4
    ;; float32 _inner_left
    4
    ;; float32 _outer_left
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;; float32 _outer_right
       (sys::poke _outer_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _inner_right
       (sys::poke _inner_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _inner_left
       (sys::poke _inner_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _outer_left
       (sys::poke _outer_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _outer_right
     (setq _outer_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _inner_right
     (setq _inner_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _inner_left
     (setq _inner_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _outer_left
     (setq _outer_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::LineFollowerStamped :md5sum-) "296fc5d7868bac377ab0a7300283e5f4")
(setf (get duckietown_msgs::LineFollowerStamped :datatype-) "duckietown_msgs/LineFollowerStamped")
(setf (get duckietown_msgs::LineFollowerStamped :definition-)
      "Header header

bool valid  # True iff the ADC reading was valid
# All of the following values are normalized line brightness, between 0 and 1.
# Specifically, an ADC voltage of 0 is mapped to 0, and 3.3V is mapped to 1.0.
float32 outer_right
float32 inner_right
float32 inner_left
float32 outer_left

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



(provide :duckietown_msgs/LineFollowerStamped "296fc5d7868bac377ab0a7300283e5f4")


