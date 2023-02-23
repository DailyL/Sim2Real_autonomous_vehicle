;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AntiInstagramThresholds)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AntiInstagramThresholds (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMTHRESHOLDS")
  (make-package "DUCKIETOWN_MSGS::ANTIINSTAGRAMTHRESHOLDS"))

(in-package "ROS")
;;//! \htmlinclude AntiInstagramThresholds.msg.html


(defclass duckietown_msgs::AntiInstagramThresholds
  :super ros::object
  :slots (_low _high ))

(defmethod duckietown_msgs::AntiInstagramThresholds
  (:init
   (&key
    ((:low __low) (make-array 3 :initial-element 0 :element-type :integer))
    ((:high __high) (make-array 3 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _low __low)
   (setq _high __high)
   self)
  (:low
   (&optional __low)
   (if __low (setq _low __low)) _low)
  (:high
   (&optional __high)
   (if __high (setq _high __high)) _high)
  (:serialization-length
   ()
   (+
    ;; int16[3] _low
    (* 2    3)
    ;; int16[3] _high
    (* 2    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[3] _low
     (dotimes (i 3)
       (write-word (elt _low i) s)
       )
     ;; int16[3] _high
     (dotimes (i 3)
       (write-word (elt _high i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[3] _low
   (dotimes (i (length _low))
     (setf (elt _low i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; int16[3] _high
   (dotimes (i (length _high))
     (setf (elt _high i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get duckietown_msgs::AntiInstagramThresholds :md5sum-) "bcde9d2f8b33a444d7909aaaa7563290")
(setf (get duckietown_msgs::AntiInstagramThresholds :datatype-) "duckietown_msgs/AntiInstagramThresholds")
(setf (get duckietown_msgs::AntiInstagramThresholds :definition-)
      "int16[3] low
int16[3] high

")



(provide :duckietown_msgs/AntiInstagramThresholds "bcde9d2f8b33a444d7909aaaa7563290")


