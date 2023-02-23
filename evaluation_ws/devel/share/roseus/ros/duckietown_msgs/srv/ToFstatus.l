;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ToFstatus)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ToFstatus (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::TOFSTATUS")
  (make-package "DUCKIETOWN_MSGS::TOFSTATUS"))
(unless (find-package "DUCKIETOWN_MSGS::TOFSTATUSREQUEST")
  (make-package "DUCKIETOWN_MSGS::TOFSTATUSREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::TOFSTATUSRESPONSE")
  (make-package "DUCKIETOWN_MSGS::TOFSTATUSRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::ToFstatusRequest
  :super ros::object
  :slots (_sensor_position ))

(defmethod duckietown_msgs::ToFstatusRequest
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

(defclass duckietown_msgs::ToFstatusResponse
  :super ros::object
  :slots (_distance _confidenceValue _validPixels _timeStamp ))

(defmethod duckietown_msgs::ToFstatusResponse
  (:init
   (&key
    ((:distance __distance) 0)
    ((:confidenceValue __confidenceValue) 0)
    ((:validPixels __validPixels) 0)
    ((:timeStamp __timeStamp) "")
    )
   (send-super :init)
   (setq _distance (round __distance))
   (setq _confidenceValue (round __confidenceValue))
   (setq _validPixels (round __validPixels))
   (setq _timeStamp (string __timeStamp))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:confidenceValue
   (&optional __confidenceValue)
   (if __confidenceValue (setq _confidenceValue __confidenceValue)) _confidenceValue)
  (:validPixels
   (&optional __validPixels)
   (if __validPixels (setq _validPixels __validPixels)) _validPixels)
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:serialization-length
   ()
   (+
    ;; uint16 _distance
    2
    ;; uint16 _confidenceValue
    2
    ;; uint16 _validPixels
    2
    ;; string _timeStamp
    4 (length _timeStamp)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _distance
       (write-word _distance s)
     ;; uint16 _confidenceValue
       (write-word _confidenceValue s)
     ;; uint16 _validPixels
       (write-word _validPixels s)
     ;; string _timeStamp
       (write-long (length _timeStamp) s) (princ _timeStamp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _distance
     (setq _distance (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _confidenceValue
     (setq _confidenceValue (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _validPixels
     (setq _validPixels (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _timeStamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timeStamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass duckietown_msgs::ToFstatus
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::ToFstatus :md5sum-) "123f458c8760917a4db65e882cc7f43c")
(setf (get duckietown_msgs::ToFstatus :datatype-) "duckietown_msgs/ToFstatus")
(setf (get duckietown_msgs::ToFstatus :request) duckietown_msgs::ToFstatusRequest)
(setf (get duckietown_msgs::ToFstatus :response) duckietown_msgs::ToFstatusResponse)

(defmethod duckietown_msgs::ToFstatusRequest
  (:response () (instance duckietown_msgs::ToFstatusResponse :init)))

(setf (get duckietown_msgs::ToFstatusRequest :md5sum-) "123f458c8760917a4db65e882cc7f43c")
(setf (get duckietown_msgs::ToFstatusRequest :datatype-) "duckietown_msgs/ToFstatusRequest")
(setf (get duckietown_msgs::ToFstatusRequest :definition-)
      "string sensor_position    #expect tof_fl, tof_fm, tof_fr, tof_sl, tof_sr, tof_bl, tof_br
---
uint16 distance
uint16 confidenceValue
uint16 validPixels
string timeStamp

")

(setf (get duckietown_msgs::ToFstatusResponse :md5sum-) "123f458c8760917a4db65e882cc7f43c")
(setf (get duckietown_msgs::ToFstatusResponse :datatype-) "duckietown_msgs/ToFstatusResponse")
(setf (get duckietown_msgs::ToFstatusResponse :definition-)
      "string sensor_position    #expect tof_fl, tof_fm, tof_fr, tof_sl, tof_sr, tof_bl, tof_br
---
uint16 distance
uint16 confidenceValue
uint16 validPixels
string timeStamp

")



(provide :duckietown_msgs/ToFstatus "123f458c8760917a4db65e882cc7f43c")


