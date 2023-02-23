;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SetCustomLEDPattern)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SetCustomLEDPattern (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERN")
  (make-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERN"))
(unless (find-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERNREQUEST")
  (make-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERNREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERNRESPONSE")
  (make-package "DUCKIETOWN_MSGS::SETCUSTOMLEDPATTERNRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::SetCustomLEDPatternRequest
  :super ros::object
  :slots (_pattern ))

(defmethod duckietown_msgs::SetCustomLEDPatternRequest
  (:init
   (&key
    ((:pattern __pattern) (instance duckietown_msgs::LEDPattern :init))
    )
   (send-super :init)
   (setq _pattern __pattern)
   self)
  (:pattern
   (&rest __pattern)
   (if (keywordp (car __pattern))
       (send* _pattern __pattern)
     (progn
       (if __pattern (setq _pattern (car __pattern)))
       _pattern)))
  (:serialization-length
   ()
   (+
    ;; duckietown_msgs/LEDPattern _pattern
    (send _pattern :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/LEDPattern _pattern
       (send _pattern :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duckietown_msgs/LEDPattern _pattern
     (send _pattern :deserialize buf ptr-) (incf ptr- (send _pattern :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::SetCustomLEDPatternResponse
  :super ros::object
  :slots ())

(defmethod duckietown_msgs::SetCustomLEDPatternResponse
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

(defclass duckietown_msgs::SetCustomLEDPattern
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::SetCustomLEDPattern :md5sum-) "80c491edc501f8f5b2f80aaecfd31b21")
(setf (get duckietown_msgs::SetCustomLEDPattern :datatype-) "duckietown_msgs/SetCustomLEDPattern")
(setf (get duckietown_msgs::SetCustomLEDPattern :request) duckietown_msgs::SetCustomLEDPatternRequest)
(setf (get duckietown_msgs::SetCustomLEDPattern :response) duckietown_msgs::SetCustomLEDPatternResponse)

(defmethod duckietown_msgs::SetCustomLEDPatternRequest
  (:response () (instance duckietown_msgs::SetCustomLEDPatternResponse :init)))

(setf (get duckietown_msgs::SetCustomLEDPatternRequest :md5sum-) "80c491edc501f8f5b2f80aaecfd31b21")
(setf (get duckietown_msgs::SetCustomLEDPatternRequest :datatype-) "duckietown_msgs/SetCustomLEDPatternRequest")
(setf (get duckietown_msgs::SetCustomLEDPatternRequest :definition-)
      "duckietown_msgs/LEDPattern pattern

================================================================================
MSG: duckietown_msgs/LEDPattern
Header header
string[]  color_list
std_msgs/ColorRGBA[]  rgb_vals
int8[]    color_mask
float32   frequency
int8[]    frequency_mask

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
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a
---

")

(setf (get duckietown_msgs::SetCustomLEDPatternResponse :md5sum-) "80c491edc501f8f5b2f80aaecfd31b21")
(setf (get duckietown_msgs::SetCustomLEDPatternResponse :datatype-) "duckietown_msgs/SetCustomLEDPatternResponse")
(setf (get duckietown_msgs::SetCustomLEDPatternResponse :definition-)
      "duckietown_msgs/LEDPattern pattern

================================================================================
MSG: duckietown_msgs/LEDPattern
Header header
string[]  color_list
std_msgs/ColorRGBA[]  rgb_vals
int8[]    color_mask
float32   frequency
int8[]    frequency_mask

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
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a
---

")



(provide :duckietown_msgs/SetCustomLEDPattern "80c491edc501f8f5b2f80aaecfd31b21")


