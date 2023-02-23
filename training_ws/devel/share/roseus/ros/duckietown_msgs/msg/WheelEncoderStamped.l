;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::WheelEncoderStamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'WheelEncoderStamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED")
  (make-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude WheelEncoderStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ENCODER_TYPE_ABSOLUTE*" (find-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED"))
(shadow '*ENCODER_TYPE_ABSOLUTE* (find-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED"))
(defconstant duckietown_msgs::WheelEncoderStamped::*ENCODER_TYPE_ABSOLUTE* 0)
(intern "*ENCODER_TYPE_INCREMENTAL*" (find-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED"))
(shadow '*ENCODER_TYPE_INCREMENTAL* (find-package "DUCKIETOWN_MSGS::WHEELENCODERSTAMPED"))
(defconstant duckietown_msgs::WheelEncoderStamped::*ENCODER_TYPE_INCREMENTAL* 1)

(defun duckietown_msgs::WheelEncoderStamped-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::WheelEncoderStamped::*ENCODER_TYPE_ABSOLUTE*)
        ((= const 1) 'duckietown_msgs::WheelEncoderStamped::*ENCODER_TYPE_INCREMENTAL*)
        (t nil)))

(defclass duckietown_msgs::WheelEncoderStamped
  :super ros::object
  :slots (_header _data _resolution _type ))

(defmethod duckietown_msgs::WheelEncoderStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) 0)
    ((:resolution __resolution) 0)
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _data (round __data))
   (setq _resolution (round __resolution))
   (setq _type (round __type))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _data
    4
    ;; uint16 _resolution
    2
    ;; uint8 _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _data
       (write-long _data s)
     ;; uint16 _resolution
       (write-word _resolution s)
     ;; uint8 _type
       (write-byte _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _resolution
     (setq _resolution (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::WheelEncoderStamped :md5sum-) "141b74ec2cc3bde8c38b5e3bdb694d12")
(setf (get duckietown_msgs::WheelEncoderStamped :datatype-) "duckietown_msgs/WheelEncoderStamped")
(setf (get duckietown_msgs::WheelEncoderStamped :definition-)
      "# Enum: encoder type
uint8 ENCODER_TYPE_ABSOLUTE = 0
uint8 ENCODER_TYPE_INCREMENTAL = 1

Header header
int32 data
uint16 resolution
uint8 type
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



(provide :duckietown_msgs/WheelEncoderStamped "141b74ec2cc3bde8c38b5e3bdb694d12")


