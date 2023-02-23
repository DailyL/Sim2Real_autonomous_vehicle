;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SensorsStatus)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SensorsStatus (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SENSORSSTATUS")
  (make-package "DUCKIETOWN_MSGS::SENSORSSTATUS"))
(unless (find-package "DUCKIETOWN_MSGS::SENSORSSTATUSREQUEST")
  (make-package "DUCKIETOWN_MSGS::SENSORSSTATUSREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::SENSORSSTATUSRESPONSE")
  (make-package "DUCKIETOWN_MSGS::SENSORSSTATUSRESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::SensorsStatusRequest
  :super ros::object
  :slots (_state ))

(defmethod duckietown_msgs::SensorsStatusRequest
  (:init
   (&key
    ((:state __state) nil)
    )
   (send-super :init)
   (setq _state __state)
   self)
  (:state
   (&optional (__state :null))
   (if (not (eq __state :null)) (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; bool _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _state
       (if _state (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _state
     (setq _state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass duckietown_msgs::SensorsStatusResponse
  :super ros::object
  :slots (_state_front_bumper _state_camera _state_imu _state_tof_fl _state_tof_fm _state_tof_fr _state_tof_sl _state_tof_sr _state_tof_bl _state_tof_bm _state_tof_br _state_lf_outer_left _state_lf_outer_right _state_lf_inner_left _state_lf_inner_right _state_encoder_and_motor ))

(defmethod duckietown_msgs::SensorsStatusResponse
  (:init
   (&key
    ((:state_front_bumper __state_front_bumper) nil)
    ((:state_camera __state_camera) nil)
    ((:state_imu __state_imu) nil)
    ((:state_tof_fl __state_tof_fl) nil)
    ((:state_tof_fm __state_tof_fm) nil)
    ((:state_tof_fr __state_tof_fr) nil)
    ((:state_tof_sl __state_tof_sl) nil)
    ((:state_tof_sr __state_tof_sr) nil)
    ((:state_tof_bl __state_tof_bl) nil)
    ((:state_tof_bm __state_tof_bm) nil)
    ((:state_tof_br __state_tof_br) nil)
    ((:state_lf_outer_left __state_lf_outer_left) nil)
    ((:state_lf_outer_right __state_lf_outer_right) nil)
    ((:state_lf_inner_left __state_lf_inner_left) nil)
    ((:state_lf_inner_right __state_lf_inner_right) nil)
    ((:state_encoder_and_motor __state_encoder_and_motor) nil)
    )
   (send-super :init)
   (setq _state_front_bumper __state_front_bumper)
   (setq _state_camera __state_camera)
   (setq _state_imu __state_imu)
   (setq _state_tof_fl __state_tof_fl)
   (setq _state_tof_fm __state_tof_fm)
   (setq _state_tof_fr __state_tof_fr)
   (setq _state_tof_sl __state_tof_sl)
   (setq _state_tof_sr __state_tof_sr)
   (setq _state_tof_bl __state_tof_bl)
   (setq _state_tof_bm __state_tof_bm)
   (setq _state_tof_br __state_tof_br)
   (setq _state_lf_outer_left __state_lf_outer_left)
   (setq _state_lf_outer_right __state_lf_outer_right)
   (setq _state_lf_inner_left __state_lf_inner_left)
   (setq _state_lf_inner_right __state_lf_inner_right)
   (setq _state_encoder_and_motor __state_encoder_and_motor)
   self)
  (:state_front_bumper
   (&optional (__state_front_bumper :null))
   (if (not (eq __state_front_bumper :null)) (setq _state_front_bumper __state_front_bumper)) _state_front_bumper)
  (:state_camera
   (&optional (__state_camera :null))
   (if (not (eq __state_camera :null)) (setq _state_camera __state_camera)) _state_camera)
  (:state_imu
   (&optional (__state_imu :null))
   (if (not (eq __state_imu :null)) (setq _state_imu __state_imu)) _state_imu)
  (:state_tof_fl
   (&optional (__state_tof_fl :null))
   (if (not (eq __state_tof_fl :null)) (setq _state_tof_fl __state_tof_fl)) _state_tof_fl)
  (:state_tof_fm
   (&optional (__state_tof_fm :null))
   (if (not (eq __state_tof_fm :null)) (setq _state_tof_fm __state_tof_fm)) _state_tof_fm)
  (:state_tof_fr
   (&optional (__state_tof_fr :null))
   (if (not (eq __state_tof_fr :null)) (setq _state_tof_fr __state_tof_fr)) _state_tof_fr)
  (:state_tof_sl
   (&optional (__state_tof_sl :null))
   (if (not (eq __state_tof_sl :null)) (setq _state_tof_sl __state_tof_sl)) _state_tof_sl)
  (:state_tof_sr
   (&optional (__state_tof_sr :null))
   (if (not (eq __state_tof_sr :null)) (setq _state_tof_sr __state_tof_sr)) _state_tof_sr)
  (:state_tof_bl
   (&optional (__state_tof_bl :null))
   (if (not (eq __state_tof_bl :null)) (setq _state_tof_bl __state_tof_bl)) _state_tof_bl)
  (:state_tof_bm
   (&optional (__state_tof_bm :null))
   (if (not (eq __state_tof_bm :null)) (setq _state_tof_bm __state_tof_bm)) _state_tof_bm)
  (:state_tof_br
   (&optional (__state_tof_br :null))
   (if (not (eq __state_tof_br :null)) (setq _state_tof_br __state_tof_br)) _state_tof_br)
  (:state_lf_outer_left
   (&optional (__state_lf_outer_left :null))
   (if (not (eq __state_lf_outer_left :null)) (setq _state_lf_outer_left __state_lf_outer_left)) _state_lf_outer_left)
  (:state_lf_outer_right
   (&optional (__state_lf_outer_right :null))
   (if (not (eq __state_lf_outer_right :null)) (setq _state_lf_outer_right __state_lf_outer_right)) _state_lf_outer_right)
  (:state_lf_inner_left
   (&optional (__state_lf_inner_left :null))
   (if (not (eq __state_lf_inner_left :null)) (setq _state_lf_inner_left __state_lf_inner_left)) _state_lf_inner_left)
  (:state_lf_inner_right
   (&optional (__state_lf_inner_right :null))
   (if (not (eq __state_lf_inner_right :null)) (setq _state_lf_inner_right __state_lf_inner_right)) _state_lf_inner_right)
  (:state_encoder_and_motor
   (&optional (__state_encoder_and_motor :null))
   (if (not (eq __state_encoder_and_motor :null)) (setq _state_encoder_and_motor __state_encoder_and_motor)) _state_encoder_and_motor)
  (:serialization-length
   ()
   (+
    ;; bool _state_front_bumper
    1
    ;; bool _state_camera
    1
    ;; bool _state_imu
    1
    ;; bool _state_tof_fl
    1
    ;; bool _state_tof_fm
    1
    ;; bool _state_tof_fr
    1
    ;; bool _state_tof_sl
    1
    ;; bool _state_tof_sr
    1
    ;; bool _state_tof_bl
    1
    ;; bool _state_tof_bm
    1
    ;; bool _state_tof_br
    1
    ;; bool _state_lf_outer_left
    1
    ;; bool _state_lf_outer_right
    1
    ;; bool _state_lf_inner_left
    1
    ;; bool _state_lf_inner_right
    1
    ;; bool _state_encoder_and_motor
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _state_front_bumper
       (if _state_front_bumper (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_camera
       (if _state_camera (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_imu
       (if _state_imu (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_fl
       (if _state_tof_fl (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_fm
       (if _state_tof_fm (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_fr
       (if _state_tof_fr (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_sl
       (if _state_tof_sl (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_sr
       (if _state_tof_sr (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_bl
       (if _state_tof_bl (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_bm
       (if _state_tof_bm (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_tof_br
       (if _state_tof_br (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_lf_outer_left
       (if _state_lf_outer_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_lf_outer_right
       (if _state_lf_outer_right (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_lf_inner_left
       (if _state_lf_inner_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_lf_inner_right
       (if _state_lf_inner_right (write-byte -1 s) (write-byte 0 s))
     ;; bool _state_encoder_and_motor
       (if _state_encoder_and_motor (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _state_front_bumper
     (setq _state_front_bumper (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_camera
     (setq _state_camera (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_imu
     (setq _state_imu (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_fl
     (setq _state_tof_fl (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_fm
     (setq _state_tof_fm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_fr
     (setq _state_tof_fr (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_sl
     (setq _state_tof_sl (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_sr
     (setq _state_tof_sr (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_bl
     (setq _state_tof_bl (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_bm
     (setq _state_tof_bm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_tof_br
     (setq _state_tof_br (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_lf_outer_left
     (setq _state_lf_outer_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_lf_outer_right
     (setq _state_lf_outer_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_lf_inner_left
     (setq _state_lf_inner_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_lf_inner_right
     (setq _state_lf_inner_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _state_encoder_and_motor
     (setq _state_encoder_and_motor (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass duckietown_msgs::SensorsStatus
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::SensorsStatus :md5sum-) "d8dd1fcbd833d76004def4493c2acff3")
(setf (get duckietown_msgs::SensorsStatus :datatype-) "duckietown_msgs/SensorsStatus")
(setf (get duckietown_msgs::SensorsStatus :request) duckietown_msgs::SensorsStatusRequest)
(setf (get duckietown_msgs::SensorsStatus :response) duckietown_msgs::SensorsStatusResponse)

(defmethod duckietown_msgs::SensorsStatusRequest
  (:response () (instance duckietown_msgs::SensorsStatusResponse :init)))

(setf (get duckietown_msgs::SensorsStatusRequest :md5sum-) "d8dd1fcbd833d76004def4493c2acff3")
(setf (get duckietown_msgs::SensorsStatusRequest :datatype-) "duckietown_msgs/SensorsStatusRequest")
(setf (get duckietown_msgs::SensorsStatusRequest :definition-)
      "bool state
---
bool state_front_bumper
bool state_camera
bool state_imu
bool state_tof_fl
bool state_tof_fm
bool state_tof_fr
bool state_tof_sl
bool state_tof_sr
bool state_tof_bl
bool state_tof_bm
bool state_tof_br
bool state_lf_outer_left
bool state_lf_outer_right
bool state_lf_inner_left
bool state_lf_inner_right
bool state_encoder_and_motor

")

(setf (get duckietown_msgs::SensorsStatusResponse :md5sum-) "d8dd1fcbd833d76004def4493c2acff3")
(setf (get duckietown_msgs::SensorsStatusResponse :datatype-) "duckietown_msgs/SensorsStatusResponse")
(setf (get duckietown_msgs::SensorsStatusResponse :definition-)
      "bool state
---
bool state_front_bumper
bool state_camera
bool state_imu
bool state_tof_fl
bool state_tof_fm
bool state_tof_fr
bool state_tof_sl
bool state_tof_sr
bool state_tof_bl
bool state_tof_bm
bool state_tof_br
bool state_lf_outer_left
bool state_lf_outer_right
bool state_lf_inner_left
bool state_lf_inner_right
bool state_encoder_and_motor

")



(provide :duckietown_msgs/SensorsStatus "d8dd1fcbd833d76004def4493c2acff3")


