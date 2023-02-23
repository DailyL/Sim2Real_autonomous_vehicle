;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::Rects)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'Rects (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::RECTS")
  (make-package "DUCKIETOWN_MSGS::RECTS"))

(in-package "ROS")
;;//! \htmlinclude Rects.msg.html


(defclass duckietown_msgs::Rects
  :super ros::object
  :slots (_rects ))

(defmethod duckietown_msgs::Rects
  (:init
   (&key
    ((:rects __rects) ())
    )
   (send-super :init)
   (setq _rects __rects)
   self)
  (:rects
   (&rest __rects)
   (if (keywordp (car __rects))
       (send* _rects __rects)
     (progn
       (if __rects (setq _rects (car __rects)))
       _rects)))
  (:serialization-length
   ()
   (+
    ;; duckietown_msgs/Rect[] _rects
    (apply #'+ (send-all _rects :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/Rect[] _rects
     (write-long (length _rects) s)
     (dolist (elem _rects)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duckietown_msgs/Rect[] _rects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rects (let (r) (dotimes (i n) (push (instance duckietown_msgs::Rect :init) r)) r))
     (dolist (elem- _rects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::Rects :md5sum-) "f5b74b2b15b5d4d2f299389f9f4ca7f8")
(setf (get duckietown_msgs::Rects :datatype-) "duckietown_msgs/Rects")
(setf (get duckietown_msgs::Rects :definition-)
      "duckietown_msgs/Rect[] rects
================================================================================
MSG: duckietown_msgs/Rect
# all in pixel coordinate
# (x, y, w, h) defines a rectangle
int32 x
int32 y
int32 w
int32 h

")



(provide :duckietown_msgs/Rects "f5b74b2b15b5d4d2f299389f9f4ca7f8")


