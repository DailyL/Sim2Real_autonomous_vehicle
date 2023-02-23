;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AprilTagDetectionArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AprilTagDetectionArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::APRILTAGDETECTIONARRAY")
  (make-package "DUCKIETOWN_MSGS::APRILTAGDETECTIONARRAY"))

(in-package "ROS")
;;//! \htmlinclude AprilTagDetectionArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::AprilTagDetectionArray
  :super ros::object
  :slots (_header _detections ))

(defmethod duckietown_msgs::AprilTagDetectionArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detections __detections) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _detections __detections)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; duckietown_msgs/AprilTagDetection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; duckietown_msgs/AprilTagDetection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; duckietown_msgs/AprilTagDetection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance duckietown_msgs::AprilTagDetection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::AprilTagDetectionArray :md5sum-) "21f977fd1654c0bf67532acd641c3d4d")
(setf (get duckietown_msgs::AprilTagDetectionArray :datatype-) "duckietown_msgs/AprilTagDetectionArray")
(setf (get duckietown_msgs::AprilTagDetectionArray :definition-)
      "Header header
AprilTagDetection[] detections
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
MSG: duckietown_msgs/AprilTagDetection
geometry_msgs/Transform transform
int32 tag_id
string tag_family
int32 hamming
float32 decision_margin
float32[9] homography
float32[2] center
float32[8] corners
float32 pose_error

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :duckietown_msgs/AprilTagDetectionArray "21f977fd1654c0bf67532acd641c3d4d")


