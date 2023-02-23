;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::Vsample)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'Vsample (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::VSAMPLE")
  (make-package "DUCKIETOWN_MSGS::VSAMPLE"))

(in-package "ROS")
;;//! \htmlinclude Vsample.msg.html


(defclass duckietown_msgs::Vsample
  :super ros::object
  :slots (_d_L _d_R _dt _theta_angle_pose_delta _x_axis_pose_delta _y_axis_pose_delta ))

(defmethod duckietown_msgs::Vsample
  (:init
   (&key
    ((:d_L __d_L) 0.0)
    ((:d_R __d_R) 0.0)
    ((:dt __dt) 0.0)
    ((:theta_angle_pose_delta __theta_angle_pose_delta) 0.0)
    ((:x_axis_pose_delta __x_axis_pose_delta) 0.0)
    ((:y_axis_pose_delta __y_axis_pose_delta) 0.0)
    )
   (send-super :init)
   (setq _d_L (float __d_L))
   (setq _d_R (float __d_R))
   (setq _dt (float __dt))
   (setq _theta_angle_pose_delta (float __theta_angle_pose_delta))
   (setq _x_axis_pose_delta (float __x_axis_pose_delta))
   (setq _y_axis_pose_delta (float __y_axis_pose_delta))
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
  (:x_axis_pose_delta
   (&optional __x_axis_pose_delta)
   (if __x_axis_pose_delta (setq _x_axis_pose_delta __x_axis_pose_delta)) _x_axis_pose_delta)
  (:y_axis_pose_delta
   (&optional __y_axis_pose_delta)
   (if __y_axis_pose_delta (setq _y_axis_pose_delta __y_axis_pose_delta)) _y_axis_pose_delta)
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
    ;; float32 _x_axis_pose_delta
    4
    ;; float32 _y_axis_pose_delta
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
     ;; float32 _x_axis_pose_delta
       (sys::poke _x_axis_pose_delta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_axis_pose_delta
       (sys::poke _y_axis_pose_delta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _x_axis_pose_delta
     (setq _x_axis_pose_delta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_axis_pose_delta
     (setq _y_axis_pose_delta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::Vsample :md5sum-) "636e6e791af118be8338c8ab7fbd00e7")
(setf (get duckietown_msgs::Vsample :datatype-) "duckietown_msgs/Vsample")
(setf (get duckietown_msgs::Vsample :definition-)
      "float32 d_L
float32 d_R
float32 dt
float32 theta_angle_pose_delta
float32 x_axis_pose_delta
float32 y_axis_pose_delta
")



(provide :duckietown_msgs/Vsample "636e6e791af118be8338c8ab7fbd00e7")


