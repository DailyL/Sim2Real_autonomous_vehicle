;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LFstatus)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LFstatus (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LFSTATUS")
  (make-package "DUCKIETOWN_MSGS::LFSTATUS"))
(unless (find-package "DUCKIETOWN_MSGS::LFSTATUSREQUEST")
  (make-package "DUCKIETOWN_MSGS::LFSTATUSREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::LFSTATUSRESPONSE")
  (make-package "DUCKIETOWN_MSGS::LFSTATUSRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::LFstatusRequest
  :super ros::object
  :slots (_sensor_position ))

(defmethod duckietown_msgs::LFstatusRequest
  (:init
   (&key
    ((:sensor_position __sensor_position) "")
    )
   (send-super :init)
   (setq _sensor_position (string __sensor_position))
   self)
  (:sensor_position
   (&optional __sensor_position)
   (if __sensor_position (setq _sensor_position __sensor_position)) _sensor_position)
  (:serialization-length
   ()
   (+
    ;; string _sensor_position
    4 (length _sensor_position)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sensor_position
       (write-long (length _sensor_position) s) (princ _sensor_position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sensor_position
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sensor_position (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass duckietown_msgs::LFstatusResponse
  :super ros::object
  :slots (_voltage ))

(defmethod duckietown_msgs::LFstatusResponse
  (:init
   (&key
    ((:voltage __voltage) 0)
    )
   (send-super :init)
   (setq _voltage (round __voltage))
   self)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:serialization-length
   ()
   (+
    ;; uint16 _voltage
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _voltage
       (write-word _voltage s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _voltage
     (setq _voltage (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass duckietown_msgs::LFstatus
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::LFstatus :md5sum-) "b59a0adbfa1b994feb973fdc4fcbe6db")
(setf (get duckietown_msgs::LFstatus :datatype-) "duckietown_msgs/LFstatus")
(setf (get duckietown_msgs::LFstatus :request) duckietown_msgs::LFstatusRequest)
(setf (get duckietown_msgs::LFstatus :response) duckietown_msgs::LFstatusResponse)

(defmethod duckietown_msgs::LFstatusRequest
  (:response () (instance duckietown_msgs::LFstatusResponse :init)))

(setf (get duckietown_msgs::LFstatusRequest :md5sum-) "b59a0adbfa1b994feb973fdc4fcbe6db")
(setf (get duckietown_msgs::LFstatusRequest :datatype-) "duckietown_msgs/LFstatusRequest")
(setf (get duckietown_msgs::LFstatusRequest :definition-)
      "string sensor_position    #expect sensor position to be one of the following strings: lf_il, lf_ol, lf_ir, lf_ol
---
uint16 voltage
#string timeStamp

")

(setf (get duckietown_msgs::LFstatusResponse :md5sum-) "b59a0adbfa1b994feb973fdc4fcbe6db")
(setf (get duckietown_msgs::LFstatusResponse :datatype-) "duckietown_msgs/LFstatusResponse")
(setf (get duckietown_msgs::LFstatusResponse :definition-)
      "string sensor_position    #expect sensor position to be one of the following strings: lf_il, lf_ol, lf_ir, lf_ol
---
uint16 voltage
#string timeStamp

")



(provide :duckietown_msgs/LFstatus "b59a0adbfa1b994feb973fdc4fcbe6db")


