;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ObstacleImageDetection)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ObstacleImageDetection (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::OBSTACLEIMAGEDETECTION")
  (make-package "DUCKIETOWN_MSGS::OBSTACLEIMAGEDETECTION"))

(in-package "ROS")
;;//! \htmlinclude ObstacleImageDetection.msg.html


(defclass duckietown_msgs::ObstacleImageDetection
  :super ros::object
  :slots (_bounding_box _type ))

(defmethod duckietown_msgs::ObstacleImageDetection
  (:init
   (&key
    ((:bounding_box __bounding_box) (instance duckietown_msgs::Rect :init))
    ((:type __type) (instance duckietown_msgs::ObstacleType :init))
    )
   (send-super :init)
   (setq _bounding_box __bounding_box)
   (setq _type __type)
   self)
  (:bounding_box
   (&rest __bounding_box)
   (if (keywordp (car __bounding_box))
       (send* _bounding_box __bounding_box)
     (progn
       (if __bounding_box (setq _bounding_box (car __bounding_box)))
       _bounding_box)))
  (:type
   (&rest __type)
   (if (keywordp (car __type))
       (send* _type __type)
     (progn
       (if __type (setq _type (car __type)))
       _type)))
  (:serialization-length
   ()
   (+
    ;; duckietown_msgs/Rect _bounding_box
    (send _bounding_box :serialization-length)
    ;; duckietown_msgs/ObstacleType _type
    (send _type :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duckietown_msgs/Rect _bounding_box
       (send _bounding_box :serialize s)
     ;; duckietown_msgs/ObstacleType _type
       (send _type :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duckietown_msgs/Rect _bounding_box
     (send _bounding_box :deserialize buf ptr-) (incf ptr- (send _bounding_box :serialization-length))
   ;; duckietown_msgs/ObstacleType _type
     (send _type :deserialize buf ptr-) (incf ptr- (send _type :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::ObstacleImageDetection :md5sum-) "e532bfbd15e6046dab5e4261999811a9")
(setf (get duckietown_msgs::ObstacleImageDetection :datatype-) "duckietown_msgs/ObstacleImageDetection")
(setf (get duckietown_msgs::ObstacleImageDetection :definition-)
      "duckietown_msgs/Rect bounding_box
duckietown_msgs/ObstacleType type
================================================================================
MSG: duckietown_msgs/Rect
# all in pixel coordinate
# (x, y, w, h) defines a rectangle
int32 x
int32 y
int32 w
int32 h

================================================================================
MSG: duckietown_msgs/ObstacleType
uint8 DUCKIE=0
uint8 CONE=1
uint8 type
")



(provide :duckietown_msgs/ObstacleImageDetection "e532bfbd15e6046dab5e4261999811a9")


