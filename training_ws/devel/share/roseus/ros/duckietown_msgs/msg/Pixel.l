;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::Pixel)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'Pixel (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::PIXEL")
  (make-package "DUCKIETOWN_MSGS::PIXEL"))

(in-package "ROS")
;;//! \htmlinclude Pixel.msg.html


(defclass duckietown_msgs::Pixel
  :super ros::object
  :slots (_u _v ))

(defmethod duckietown_msgs::Pixel
  (:init
   (&key
    ((:u __u) 0)
    ((:v __v) 0)
    )
   (send-super :init)
   (setq _u (round __u))
   (setq _v (round __v))
   self)
  (:u
   (&optional __u)
   (if __u (setq _u __u)) _u)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:serialization-length
   ()
   (+
    ;; int32 _u
    4
    ;; int32 _v
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _u
       (write-long _u s)
     ;; int32 _v
       (write-long _v s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _u
     (setq _u (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _v
     (setq _v (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::Pixel :md5sum-) "f06a7e8dd345ffb826d71a489782114b")
(setf (get duckietown_msgs::Pixel :datatype-) "duckietown_msgs/Pixel")
(setf (get duckietown_msgs::Pixel :definition-)
      "int32 u
int32 v
")



(provide :duckietown_msgs/Pixel "f06a7e8dd345ffb826d71a489782114b")


