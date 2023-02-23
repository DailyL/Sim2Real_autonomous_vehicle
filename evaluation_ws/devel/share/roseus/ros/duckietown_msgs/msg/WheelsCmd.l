;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::WheelsCmd)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'WheelsCmd (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::WHEELSCMD")
  (make-package "DUCKIETOWN_MSGS::WHEELSCMD"))

(in-package "ROS")
;;//! \htmlinclude WheelsCmd.msg.html


(defclass duckietown_msgs::WheelsCmd
  :super ros::object
  :slots (_vel_left _vel_right ))

(defmethod duckietown_msgs::WheelsCmd
  (:init
   (&key
    ((:vel_left __vel_left) 0.0)
    ((:vel_right __vel_right) 0.0)
    )
   (send-super :init)
   (setq _vel_left (float __vel_left))
   (setq _vel_right (float __vel_right))
   self)
  (:vel_left
   (&optional __vel_left)
   (if __vel_left (setq _vel_left __vel_left)) _vel_left)
  (:vel_right
   (&optional __vel_right)
   (if __vel_right (setq _vel_right __vel_right)) _vel_right)
  (:serialization-length
   ()
   (+
    ;; float32 _vel_left
    4
    ;; float32 _vel_right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vel_left
       (sys::poke _vel_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_right
       (sys::poke _vel_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vel_left
     (setq _vel_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_right
     (setq _vel_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::WheelsCmd :md5sum-) "95189a38cb8112e26fa8ced2d5359a0c")
(setf (get duckietown_msgs::WheelsCmd :datatype-) "duckietown_msgs/WheelsCmd")
(setf (get duckietown_msgs::WheelsCmd :definition-)
      "float32 vel_left
float32 vel_right
")



(provide :duckietown_msgs/WheelsCmd "95189a38cb8112e26fa8ced2d5359a0c")


