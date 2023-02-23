;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::TurnIDandType)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'TurnIDandType (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::TURNIDANDTYPE")
  (make-package "DUCKIETOWN_MSGS::TURNIDANDTYPE"))

(in-package "ROS")
;;//! \htmlinclude TurnIDandType.msg.html


(defclass duckietown_msgs::TurnIDandType
  :super ros::object
  :slots (_tag_id _turn_type ))

(defmethod duckietown_msgs::TurnIDandType
  (:init
   (&key
    ((:tag_id __tag_id) 0)
    ((:turn_type __turn_type) 0)
    )
   (send-super :init)
   (setq _tag_id (round __tag_id))
   (setq _turn_type (round __turn_type))
   self)
  (:tag_id
   (&optional __tag_id)
   (if __tag_id (setq _tag_id __tag_id)) _tag_id)
  (:turn_type
   (&optional __turn_type)
   (if __turn_type (setq _turn_type __turn_type)) _turn_type)
  (:serialization-length
   ()
   (+
    ;; int16 _tag_id
    2
    ;; int16 _turn_type
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _tag_id
       (write-word _tag_id s)
     ;; int16 _turn_type
       (write-word _turn_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _tag_id
     (setq _tag_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _turn_type
     (setq _turn_type (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get duckietown_msgs::TurnIDandType :md5sum-) "999e690d54f4de1ab02b7e874091d0ff")
(setf (get duckietown_msgs::TurnIDandType :datatype-) "duckietown_msgs/TurnIDandType")
(setf (get duckietown_msgs::TurnIDandType :definition-)
      "int16 tag_id
int16 turn_type

")



(provide :duckietown_msgs/TurnIDandType "999e690d54f4de1ab02b7e874091d0ff")


