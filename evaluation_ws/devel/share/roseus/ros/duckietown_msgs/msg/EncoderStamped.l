;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::EncoderStamped)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'EncoderStamped (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ENCODERSTAMPED")
  (make-package "DUCKIETOWN_MSGS::ENCODERSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude EncoderStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::EncoderStamped
  :super ros::object
  :slots (_header _vel_encoder _count ))

(defmethod duckietown_msgs::EncoderStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vel_encoder __vel_encoder) 0.0)
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _vel_encoder (float __vel_encoder))
   (setq _count (round __count))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vel_encoder
   (&optional __vel_encoder)
   (if __vel_encoder (setq _vel_encoder __vel_encoder)) _vel_encoder)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _vel_encoder
    4
    ;; int64 _count
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _vel_encoder
       (sys::poke _vel_encoder (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int64 _count
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _count (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _count) (= (length (_count . bv)) 2)) ;; bignum
              (write-long (ash (elt (_count . bv) 0) 0) s)
              (write-long (ash (elt (_count . bv) 1) -1) s))
             ((and (class _count) (= (length (_count . bv)) 1)) ;; big1
              (write-long (elt (_count . bv) 0) s)
              (write-long (if (>= _count 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _count s)(write-long (if (>= _count 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _vel_encoder
     (setq _vel_encoder (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int64 _count
#+(or :alpha :irix6 :x86_64)
      (setf _count (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _count (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get duckietown_msgs::EncoderStamped :md5sum-) "bceed13d0df81fff9a99f0c6a78e8f33")
(setf (get duckietown_msgs::EncoderStamped :datatype-) "duckietown_msgs/EncoderStamped")
(setf (get duckietown_msgs::EncoderStamped :definition-)
      "Header header
float32 vel_encoder
int64 count
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



(provide :duckietown_msgs/EncoderStamped "bceed13d0df81fff9a99f0c6a78e8f33")


