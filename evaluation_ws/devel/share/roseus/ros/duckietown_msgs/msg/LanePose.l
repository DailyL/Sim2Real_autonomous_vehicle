;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LanePose)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LanePose (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LANEPOSE")
  (make-package "DUCKIETOWN_MSGS::LANEPOSE"))

(in-package "ROS")
;;//! \htmlinclude LanePose.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NORMAL*" (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(shadow '*NORMAL* (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(defconstant duckietown_msgs::LanePose::*NORMAL* 0)
(intern "*ERROR*" (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(shadow '*ERROR* (find-package "DUCKIETOWN_MSGS::LANEPOSE"))
(defconstant duckietown_msgs::LanePose::*ERROR* 1)

(defun duckietown_msgs::LanePose-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::LanePose::*NORMAL*)
        ((= const 1) 'duckietown_msgs::LanePose::*ERROR*)
        (t nil)))

(defclass duckietown_msgs::LanePose
  :super ros::object
  :slots (_header _d _d_ref _phi _phi_ref _d_phi_covariance _curvature _curvature_ref _v_ref _status _in_lane ))

(defmethod duckietown_msgs::LanePose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:d __d) 0.0)
    ((:d_ref __d_ref) 0.0)
    ((:phi __phi) 0.0)
    ((:phi_ref __phi_ref) 0.0)
    ((:d_phi_covariance __d_phi_covariance) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:curvature __curvature) 0.0)
    ((:curvature_ref __curvature_ref) 0.0)
    ((:v_ref __v_ref) 0.0)
    ((:status __status) 0)
    ((:in_lane __in_lane) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _d (float __d))
   (setq _d_ref (float __d_ref))
   (setq _phi (float __phi))
   (setq _phi_ref (float __phi_ref))
   (setq _d_phi_covariance __d_phi_covariance)
   (setq _curvature (float __curvature))
   (setq _curvature_ref (float __curvature_ref))
   (setq _v_ref (float __v_ref))
   (setq _status (round __status))
   (setq _in_lane __in_lane)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:d_ref
   (&optional __d_ref)
   (if __d_ref (setq _d_ref __d_ref)) _d_ref)
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:phi_ref
   (&optional __phi_ref)
   (if __phi_ref (setq _phi_ref __phi_ref)) _phi_ref)
  (:d_phi_covariance
   (&optional __d_phi_covariance)
   (if __d_phi_covariance (setq _d_phi_covariance __d_phi_covariance)) _d_phi_covariance)
  (:curvature
   (&optional __curvature)
   (if __curvature (setq _curvature __curvature)) _curvature)
  (:curvature_ref
   (&optional __curvature_ref)
   (if __curvature_ref (setq _curvature_ref __curvature_ref)) _curvature_ref)
  (:v_ref
   (&optional __v_ref)
   (if __v_ref (setq _v_ref __v_ref)) _v_ref)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:in_lane
   (&optional (__in_lane :null))
   (if (not (eq __in_lane :null)) (setq _in_lane __in_lane)) _in_lane)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _d
    4
    ;; float32 _d_ref
    4
    ;; float32 _phi
    4
    ;; float32 _phi_ref
    4
    ;; float32[4] _d_phi_covariance
    (* 4    4)
    ;; float32 _curvature
    4
    ;; float32 _curvature_ref
    4
    ;; float32 _v_ref
    4
    ;; int32 _status
    4
    ;; bool _in_lane
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _d
       (sys::poke _d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d_ref
       (sys::poke _d_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _phi_ref
       (sys::poke _phi_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[4] _d_phi_covariance
     (dotimes (i 4)
       (sys::poke (elt _d_phi_covariance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _curvature
       (sys::poke _curvature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _curvature_ref
       (sys::poke _curvature_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_ref
       (sys::poke _v_ref (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _status
       (write-long _status s)
     ;; bool _in_lane
       (if _in_lane (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _d
     (setq _d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d_ref
     (setq _d_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _phi
     (setq _phi (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _phi_ref
     (setq _phi_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[4] _d_phi_covariance
   (dotimes (i (length _d_phi_covariance))
     (setf (elt _d_phi_covariance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _curvature
     (setq _curvature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _curvature_ref
     (setq _curvature_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_ref
     (setq _v_ref (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _status
     (setq _status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _in_lane
     (setq _in_lane (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::LanePose :md5sum-) "382fe0e0d5dea7350bfa93535592e68a")
(setf (get duckietown_msgs::LanePose :datatype-) "duckietown_msgs/LanePose")
(setf (get duckietown_msgs::LanePose :definition-)
      "Header header
float32 d   #lateral offset
float32 d_ref #lateral offset reference
float32 phi #heading error
float32 phi_ref #heading error reference
float32[4] d_phi_covariance
float32 curvature
float32 curvature_ref # Refernece Curvature
float32 v_ref # Referenece Velocity
int32 status #Status of duckietbot 0 if normal, 1 if error is encountered
bool in_lane #Status of duckietbot in lane

#Enum for status
int32 NORMAL=0
int32 ERROR=1

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



(provide :duckietown_msgs/LanePose "382fe0e0d5dea7350bfa93535592e68a")


