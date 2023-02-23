;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::Segment)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'Segment (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SEGMENT")
  (make-package "DUCKIETOWN_MSGS::SEGMENT"))

(in-package "ROS")
;;//! \htmlinclude Segment.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*WHITE*" (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(shadow '*WHITE* (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(defconstant duckietown_msgs::Segment::*WHITE* 0)
(intern "*YELLOW*" (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(shadow '*YELLOW* (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(defconstant duckietown_msgs::Segment::*YELLOW* 1)
(intern "*RED*" (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(shadow '*RED* (find-package "DUCKIETOWN_MSGS::SEGMENT"))
(defconstant duckietown_msgs::Segment::*RED* 2)

(defun duckietown_msgs::Segment-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::Segment::*WHITE*)
        ((= const 1) 'duckietown_msgs::Segment::*YELLOW*)
        ((= const 2) 'duckietown_msgs::Segment::*RED*)
        (t nil)))

(defclass duckietown_msgs::Segment
  :super ros::object
  :slots (_color _pixels_normalized _normal _points ))

(defmethod duckietown_msgs::Segment
  (:init
   (&key
    ((:color __color) 0)
    ((:pixels_normalized __pixels_normalized) (let (r) (dotimes (i 2) (push (instance duckietown_msgs::Vector2D :init) r)) r))
    ((:normal __normal) (instance duckietown_msgs::Vector2D :init))
    ((:points __points) (let (r) (dotimes (i 2) (push (instance geometry_msgs::Point :init) r)) r))
    )
   (send-super :init)
   (setq _color (round __color))
   (setq _pixels_normalized __pixels_normalized)
   (setq _normal __normal)
   (setq _points __points)
   self)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:pixels_normalized
   (&rest __pixels_normalized)
   (if (keywordp (car __pixels_normalized))
       (send* _pixels_normalized __pixels_normalized)
     (progn
       (if __pixels_normalized (setq _pixels_normalized (car __pixels_normalized)))
       _pixels_normalized)))
  (:normal
   (&rest __normal)
   (if (keywordp (car __normal))
       (send* _normal __normal)
     (progn
       (if __normal (setq _normal (car __normal)))
       _normal)))
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; uint8 _color
    1
    ;; duckietown_msgs/Vector2D[2] _pixels_normalized
    (apply #'+ (send-all _pixels_normalized :serialization-length))
    ;; duckietown_msgs/Vector2D _normal
    (send _normal :serialization-length)
    ;; geometry_msgs/Point[2] _points
    (apply #'+ (send-all _points :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _color
       (write-byte _color s)
     ;; duckietown_msgs/Vector2D[2] _pixels_normalized
     (dolist (elem _pixels_normalized)
       (send elem :serialize s)
       )
     ;; duckietown_msgs/Vector2D _normal
       (send _normal :serialize s)
     ;; geometry_msgs/Point[2] _points
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _color
     (setq _color (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; duckietown_msgs/Vector2D[2] _pixels_normalized
   (dotimes (i 2)
     (send (elt _pixels_normalized i) :deserialize buf ptr-) (incf ptr- (send (elt _pixels_normalized i) :serialization-length))
     )
   ;; duckietown_msgs/Vector2D _normal
     (send _normal :deserialize buf ptr-) (incf ptr- (send _normal :serialization-length))
   ;; geometry_msgs/Point[2] _points
   (dotimes (i 2)
     (send (elt _points i) :deserialize buf ptr-) (incf ptr- (send (elt _points i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get duckietown_msgs::Segment :md5sum-) "63449fcee6301e43c25adab0c5e5d117")
(setf (get duckietown_msgs::Segment :datatype-) "duckietown_msgs/Segment")
(setf (get duckietown_msgs::Segment :definition-)
      "uint8 WHITE=0
uint8 YELLOW=1	
uint8 RED=2
uint8 color
duckietown_msgs/Vector2D[2] pixels_normalized
duckietown_msgs/Vector2D normal

geometry_msgs/Point[2] points

================================================================================
MSG: duckietown_msgs/Vector2D
float32 x
float32 y

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :duckietown_msgs/Segment "63449fcee6301e43c25adab0c5e5d117")


