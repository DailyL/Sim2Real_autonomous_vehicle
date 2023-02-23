;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::IMUstatus)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'IMUstatus (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::IMUSTATUS")
  (make-package "DUCKIETOWN_MSGS::IMUSTATUS"))
(unless (find-package "DUCKIETOWN_MSGS::IMUSTATUSREQUEST")
  (make-package "DUCKIETOWN_MSGS::IMUSTATUSREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::IMUSTATUSRESPONSE")
  (make-package "DUCKIETOWN_MSGS::IMUSTATUSRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::IMUstatusRequest
  :super ros::object
  :slots (_sensor_position ))

(defmethod duckietown_msgs::IMUstatusRequest
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

(defclass duckietown_msgs::IMUstatusResponse
  :super ros::object
  :slots (_acceleration_x _acceleration_y _acceleration_z _timestamp_acceleration _gyro_x _gyro_y _gyro_z _timestamp_gyro _magentic_field_x _magentic_field_y _magentic_field_z _timestamp_magnetic_field _temperature ))

(defmethod duckietown_msgs::IMUstatusResponse
  (:init
   (&key
    ((:acceleration_x __acceleration_x) 0.0)
    ((:acceleration_y __acceleration_y) 0.0)
    ((:acceleration_z __acceleration_z) 0.0)
    ((:timestamp_acceleration __timestamp_acceleration) "")
    ((:gyro_x __gyro_x) 0.0)
    ((:gyro_y __gyro_y) 0.0)
    ((:gyro_z __gyro_z) 0.0)
    ((:timestamp_gyro __timestamp_gyro) "")
    ((:magentic_field_x __magentic_field_x) 0.0)
    ((:magentic_field_y __magentic_field_y) 0.0)
    ((:magentic_field_z __magentic_field_z) 0.0)
    ((:timestamp_magnetic_field __timestamp_magnetic_field) "")
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _acceleration_x (float __acceleration_x))
   (setq _acceleration_y (float __acceleration_y))
   (setq _acceleration_z (float __acceleration_z))
   (setq _timestamp_acceleration (string __timestamp_acceleration))
   (setq _gyro_x (float __gyro_x))
   (setq _gyro_y (float __gyro_y))
   (setq _gyro_z (float __gyro_z))
   (setq _timestamp_gyro (string __timestamp_gyro))
   (setq _magentic_field_x (float __magentic_field_x))
   (setq _magentic_field_y (float __magentic_field_y))
   (setq _magentic_field_z (float __magentic_field_z))
   (setq _timestamp_magnetic_field (string __timestamp_magnetic_field))
   (setq _temperature (float __temperature))
   self)
  (:acceleration_x
   (&optional __acceleration_x)
   (if __acceleration_x (setq _acceleration_x __acceleration_x)) _acceleration_x)
  (:acceleration_y
   (&optional __acceleration_y)
   (if __acceleration_y (setq _acceleration_y __acceleration_y)) _acceleration_y)
  (:acceleration_z
   (&optional __acceleration_z)
   (if __acceleration_z (setq _acceleration_z __acceleration_z)) _acceleration_z)
  (:timestamp_acceleration
   (&optional __timestamp_acceleration)
   (if __timestamp_acceleration (setq _timestamp_acceleration __timestamp_acceleration)) _timestamp_acceleration)
  (:gyro_x
   (&optional __gyro_x)
   (if __gyro_x (setq _gyro_x __gyro_x)) _gyro_x)
  (:gyro_y
   (&optional __gyro_y)
   (if __gyro_y (setq _gyro_y __gyro_y)) _gyro_y)
  (:gyro_z
   (&optional __gyro_z)
   (if __gyro_z (setq _gyro_z __gyro_z)) _gyro_z)
  (:timestamp_gyro
   (&optional __timestamp_gyro)
   (if __timestamp_gyro (setq _timestamp_gyro __timestamp_gyro)) _timestamp_gyro)
  (:magentic_field_x
   (&optional __magentic_field_x)
   (if __magentic_field_x (setq _magentic_field_x __magentic_field_x)) _magentic_field_x)
  (:magentic_field_y
   (&optional __magentic_field_y)
   (if __magentic_field_y (setq _magentic_field_y __magentic_field_y)) _magentic_field_y)
  (:magentic_field_z
   (&optional __magentic_field_z)
   (if __magentic_field_z (setq _magentic_field_z __magentic_field_z)) _magentic_field_z)
  (:timestamp_magnetic_field
   (&optional __timestamp_magnetic_field)
   (if __timestamp_magnetic_field (setq _timestamp_magnetic_field __timestamp_magnetic_field)) _timestamp_magnetic_field)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; float32 _acceleration_x
    4
    ;; float32 _acceleration_y
    4
    ;; float32 _acceleration_z
    4
    ;; string _timestamp_acceleration
    4 (length _timestamp_acceleration)
    ;; float32 _gyro_x
    4
    ;; float32 _gyro_y
    4
    ;; float32 _gyro_z
    4
    ;; string _timestamp_gyro
    4 (length _timestamp_gyro)
    ;; float32 _magentic_field_x
    4
    ;; float32 _magentic_field_y
    4
    ;; float32 _magentic_field_z
    4
    ;; string _timestamp_magnetic_field
    4 (length _timestamp_magnetic_field)
    ;; float32 _temperature
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _acceleration_x
       (sys::poke _acceleration_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration_y
       (sys::poke _acceleration_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration_z
       (sys::poke _acceleration_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _timestamp_acceleration
       (write-long (length _timestamp_acceleration) s) (princ _timestamp_acceleration s)
     ;; float32 _gyro_x
       (sys::poke _gyro_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gyro_y
       (sys::poke _gyro_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gyro_z
       (sys::poke _gyro_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _timestamp_gyro
       (write-long (length _timestamp_gyro) s) (princ _timestamp_gyro s)
     ;; float32 _magentic_field_x
       (sys::poke _magentic_field_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _magentic_field_y
       (sys::poke _magentic_field_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _magentic_field_z
       (sys::poke _magentic_field_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _timestamp_magnetic_field
       (write-long (length _timestamp_magnetic_field) s) (princ _timestamp_magnetic_field s)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _acceleration_x
     (setq _acceleration_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration_y
     (setq _acceleration_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration_z
     (setq _acceleration_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _timestamp_acceleration
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timestamp_acceleration (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _gyro_x
     (setq _gyro_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gyro_y
     (setq _gyro_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gyro_z
     (setq _gyro_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _timestamp_gyro
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timestamp_gyro (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _magentic_field_x
     (setq _magentic_field_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _magentic_field_y
     (setq _magentic_field_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _magentic_field_z
     (setq _magentic_field_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _timestamp_magnetic_field
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timestamp_magnetic_field (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass duckietown_msgs::IMUstatus
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::IMUstatus :md5sum-) "508fbfdea8b0319f1b2a5826eac9a6e6")
(setf (get duckietown_msgs::IMUstatus :datatype-) "duckietown_msgs/IMUstatus")
(setf (get duckietown_msgs::IMUstatus :request) duckietown_msgs::IMUstatusRequest)
(setf (get duckietown_msgs::IMUstatus :response) duckietown_msgs::IMUstatusResponse)

(defmethod duckietown_msgs::IMUstatusRequest
  (:response () (instance duckietown_msgs::IMUstatusResponse :init)))

(setf (get duckietown_msgs::IMUstatusRequest :md5sum-) "508fbfdea8b0319f1b2a5826eac9a6e6")
(setf (get duckietown_msgs::IMUstatusRequest :datatype-) "duckietown_msgs/IMUstatusRequest")
(setf (get duckietown_msgs::IMUstatusRequest :definition-)
      "string sensor_position
---
float32 acceleration_x
float32 acceleration_y
float32 acceleration_z
string timestamp_acceleration
float32 gyro_x
float32 gyro_y
float32 gyro_z
string timestamp_gyro
float32 magentic_field_x
float32 magentic_field_y
float32 magentic_field_z
string timestamp_magnetic_field
float32 temperature

")

(setf (get duckietown_msgs::IMUstatusResponse :md5sum-) "508fbfdea8b0319f1b2a5826eac9a6e6")
(setf (get duckietown_msgs::IMUstatusResponse :datatype-) "duckietown_msgs/IMUstatusResponse")
(setf (get duckietown_msgs::IMUstatusResponse :definition-)
      "string sensor_position
---
float32 acceleration_x
float32 acceleration_y
float32 acceleration_z
string timestamp_acceleration
float32 gyro_x
float32 gyro_y
float32 gyro_z
string timestamp_gyro
float32 magentic_field_x
float32 magentic_field_y
float32 magentic_field_z
string timestamp_magnetic_field
float32 temperature

")



(provide :duckietown_msgs/IMUstatus "508fbfdea8b0319f1b2a5826eac9a6e6")


