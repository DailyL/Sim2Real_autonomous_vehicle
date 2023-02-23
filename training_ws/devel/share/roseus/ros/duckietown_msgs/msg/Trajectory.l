;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::Trajectory)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'Trajectory (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::TRAJECTORY")
  (make-package "DUCKIETOWN_MSGS::TRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude Trajectory.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::Trajectory
  :super ros::object
  :slots (_header _pos _vel _acc _jerk ))

(defmethod duckietown_msgs::Trajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pos __pos) ())
    ((:vel __vel) ())
    ((:acc __acc) ())
    ((:jerk __jerk) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _pos __pos)
   (setq _vel __vel)
   (setq _acc __acc)
   (setq _jerk __jerk)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:vel
   (&rest __vel)
   (if (keywordp (car __vel))
       (send* _vel __vel)
     (progn
       (if __vel (setq _vel (car __vel)))
       _vel)))
  (:acc
   (&rest __acc)
   (if (keywordp (car __acc))
       (send* _acc __acc)
     (progn
       (if __acc (setq _acc (car __acc)))
       _acc)))
  (:jerk
   (&rest __jerk)
   (if (keywordp (car __jerk))
       (send* _jerk __jerk)
     (progn
       (if __jerk (setq _jerk (car __jerk)))
       _jerk)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3Stamped[] _pos
    (apply #'+ (send-all _pos :serialization-length)) 4
    ;; geometry_msgs/Vector3Stamped[] _vel
    (apply #'+ (send-all _vel :serialization-length)) 4
    ;; geometry_msgs/Vector3Stamped[] _acc
    (apply #'+ (send-all _acc :serialization-length)) 4
    ;; geometry_msgs/Vector3Stamped[] _jerk
    (apply #'+ (send-all _jerk :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3Stamped[] _pos
     (write-long (length _pos) s)
     (dolist (elem _pos)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3Stamped[] _vel
     (write-long (length _vel) s)
     (dolist (elem _vel)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3Stamped[] _acc
     (write-long (length _acc) s)
     (dolist (elem _acc)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3Stamped[] _jerk
     (write-long (length _jerk) s)
     (dolist (elem _jerk)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3Stamped[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3Stamped :init) r)) r))
     (dolist (elem- _pos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3Stamped[] _vel
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vel (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3Stamped :init) r)) r))
     (dolist (elem- _vel)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3Stamped[] _acc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _acc (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3Stamped :init) r)) r))
     (dolist (elem- _acc)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3Stamped[] _jerk
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _jerk (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3Stamped :init) r)) r))
     (dolist (elem- _jerk)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::Trajectory :md5sum-) "4a5c4bf7a2bfb37b947e3dfa585ede51")
(setf (get duckietown_msgs::Trajectory :datatype-) "duckietown_msgs/Trajectory")
(setf (get duckietown_msgs::Trajectory :definition-)
      "Header header
geometry_msgs/Vector3Stamped[] pos
geometry_msgs/Vector3Stamped[] vel
geometry_msgs/Vector3Stamped[] acc
geometry_msgs/Vector3Stamped[] jerk


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
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

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
")



(provide :duckietown_msgs/Trajectory "4a5c4bf7a2bfb37b947e3dfa585ede51")


