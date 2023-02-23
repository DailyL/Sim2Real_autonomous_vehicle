;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AprilTagDetectionArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AprilTagDetectionArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::APRILTAGDETECTIONARRAY")
  (make-package "DUCKIETOWN_MSGS::APRILTAGDETECTIONARRAY"))

(in-package "ROS")
;;//! \htmlinclude AprilTagDetectionArray.msg.html


(defclass duckietown_msgs::AprilTagDetectionArray
  :super ros::object
  :slots (_detections ))

(defmethod duckietown_msgs::AprilTagDetectionArray
  (:init
   (&key
    ((:detections __detections) ())
    )
   (send-super :init)
   (setq _detections __detections)
   self)
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
    ;; duckietown_msgs/AprilTagDetection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/AprilTagDetection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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

(setf (get duckietown_msgs::AprilTagDetectionArray :md5sum-) "93c0a301ed9e6633dc34b8117d49ebd4")
(setf (get duckietown_msgs::AprilTagDetectionArray :datatype-) "duckietown_msgs/AprilTagDetectionArray")
(setf (get duckietown_msgs::AprilTagDetectionArray :definition-)
      "AprilTagDetection[] detections
================================================================================
MSG: duckietown_msgs/AprilTagDetection
int32 id
float64 size
geometry_msgs/PoseStamped pose
================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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



(provide :duckietown_msgs/AprilTagDetectionArray "93c0a301ed9e6633dc34b8117d49ebd4")


