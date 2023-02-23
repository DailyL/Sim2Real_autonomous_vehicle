;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ThetaDotSample)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ThetaDotSample (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::THETADOTSAMPLE")
  (make-package "DUCKIETOWN_MSGS::THETADOTSAMPLE"))

(in-package "ROS")
;;//! \htmlinclude ThetaDotSample.msg.html


(defclass duckietown_msgs::ThetaDotSample
  :super ros::object
  :slots (_d_L _d_R _dt _theta_angle_pose_delta ))

(defmethod duckietown_msgs::ThetaDotSample
  (:init
   (&key
    ((:d_L __d_L) 0.0)
    ((:d_R __d_R) 0.0)
    ((:dt __dt) 0.0)
    ((:theta_angle_pose_delta __theta_angle_pose_delta) 0.0)
    )
   (send-super :init)
   (setq _d_L (float __d_L))
   (setq _d_R (float __d_R))
   (setq _dt (float __dt))
   (setq _theta_angle_pose_delta (float __theta_angle_pose_delta))
   self)
  (:d_L
   (&optional __d_L)
   (if __d_L (setq _d_L __d_L)) _d_L)
  (:d_R
   (&optional __d_R)
   (if __d_R (setq _d_R __d_R)) _d_R)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:theta_angle_pose_delta
   (&optional __theta_angle_pose_delta)
   (if __theta_angle_pose_delta (setq _theta_angle_pose_delta __theta_angle_pose_delta)) _theta_angle_pose_delta)
  (:serialization-length
   ()
   (+
    ;; float32 _d_L
    4
    ;; float32 _d_R
    4
    ;; float32 _dt
    4
    ;; float32 _theta_angle_pose_delta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _d_L
       (sys::poke _d_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d_R
       (sys::poke _d_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta_angle_pose_delta
       (sys::poke _theta_angle_pose_delta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _d_L
     (setq _d_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d_R
     (setq _d_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dt
     (setq _dt (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta_angle_pose_delta
     (setq _theta_angle_pose_delta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::ThetaDotSample :md5sum-) "047a1392fc183282d6b1904203840832")
(setf (get duckietown_msgs::ThetaDotSample :datatype-) "duckietown_msgs/ThetaDotSample")
(setf (get duckietown_msgs::ThetaDotSample :definition-)
      "float32 d_L
float32 d_R
float32 dt
float32 theta_angle_pose_delta
")



(provide :duckietown_msgs/ThetaDotSample "047a1392fc183282d6b1904203840832")


