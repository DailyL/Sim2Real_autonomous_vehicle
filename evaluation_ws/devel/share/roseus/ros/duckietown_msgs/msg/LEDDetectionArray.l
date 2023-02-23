;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LEDDetectionArray)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LEDDetectionArray (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LEDDETECTIONARRAY")
  (make-package "DUCKIETOWN_MSGS::LEDDETECTIONARRAY"))

(in-package "ROS")
;;//! \htmlinclude LEDDetectionArray.msg.html


(defclass duckietown_msgs::LEDDetectionArray
  :super ros::object
  :slots (_detections ))

(defmethod duckietown_msgs::LEDDetectionArray
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
    ;; duckietown_msgs/LEDDetection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/LEDDetection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duckietown_msgs/LEDDetection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance duckietown_msgs::LEDDetection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::LEDDetectionArray :md5sum-) "a95456786a73967a5a29fdbf726c022c")
(setf (get duckietown_msgs::LEDDetectionArray :datatype-) "duckietown_msgs/LEDDetectionArray")
(setf (get duckietown_msgs::LEDDetectionArray :definition-)
      "LEDDetection[] detections
================================================================================
MSG: duckietown_msgs/LEDDetection
time timestamp1		# initial timestamp of the camera stream used 
time timestamp2		# final timestamp of the camera stream used 
Vector2D pixels_normalized
float32 frequency 
string color        # will be r, g or b 
float32 confidence  # some value of confidence for the detection (TBD)

# for debug/visualization
float64[] signal_ts
float32[] signal
float32[] fft_fs
float32[] fft

================================================================================
MSG: duckietown_msgs/Vector2D
float32 x
float32 y

")



(provide :duckietown_msgs/LEDDetectionArray "a95456786a73967a5a29fdbf726c022c")


