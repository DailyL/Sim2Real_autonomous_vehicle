;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::AprilTagDetection)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'AprilTagDetection (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::APRILTAGDETECTION")
  (make-package "DUCKIETOWN_MSGS::APRILTAGDETECTION"))

(in-package "ROS")
;;//! \htmlinclude AprilTagDetection.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass duckietown_msgs::AprilTagDetection
  :super ros::object
  :slots (_transform _tag_id _tag_family _hamming _decision_margin _homography _center _corners _pose_error ))

(defmethod duckietown_msgs::AprilTagDetection
  (:init
   (&key
    ((:transform __transform) (instance geometry_msgs::Transform :init))
    ((:tag_id __tag_id) 0)
    ((:tag_family __tag_family) "")
    ((:hamming __hamming) 0)
    ((:decision_margin __decision_margin) 0.0)
    ((:homography __homography) (make-array 9 :initial-element 0.0 :element-type :float))
    ((:center __center) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:corners __corners) (make-array 8 :initial-element 0.0 :element-type :float))
    ((:pose_error __pose_error) 0.0)
    )
   (send-super :init)
   (setq _transform __transform)
   (setq _tag_id (round __tag_id))
   (setq _tag_family (string __tag_family))
   (setq _hamming (round __hamming))
   (setq _decision_margin (float __decision_margin))
   (setq _homography __homography)
   (setq _center __center)
   (setq _corners __corners)
   (setq _pose_error (float __pose_error))
   self)
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:tag_id
   (&optional __tag_id)
   (if __tag_id (setq _tag_id __tag_id)) _tag_id)
  (:tag_family
   (&optional __tag_family)
   (if __tag_family (setq _tag_family __tag_family)) _tag_family)
  (:hamming
   (&optional __hamming)
   (if __hamming (setq _hamming __hamming)) _hamming)
  (:decision_margin
   (&optional __decision_margin)
   (if __decision_margin (setq _decision_margin __decision_margin)) _decision_margin)
  (:homography
   (&optional __homography)
   (if __homography (setq _homography __homography)) _homography)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:corners
   (&optional __corners)
   (if __corners (setq _corners __corners)) _corners)
  (:pose_error
   (&optional __pose_error)
   (if __pose_error (setq _pose_error __pose_error)) _pose_error)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Transform _transform
    (send _transform :serialization-length)
    ;; int32 _tag_id
    4
    ;; string _tag_family
    4 (length _tag_family)
    ;; int32 _hamming
    4
    ;; float32 _decision_margin
    4
    ;; float32[9] _homography
    (* 4    9)
    ;; float32[2] _center
    (* 4    2)
    ;; float32[8] _corners
    (* 4    8)
    ;; float32 _pose_error
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Transform _transform
       (send _transform :serialize s)
     ;; int32 _tag_id
       (write-long _tag_id s)
     ;; string _tag_family
       (write-long (length _tag_family) s) (princ _tag_family s)
     ;; int32 _hamming
       (write-long _hamming s)
     ;; float32 _decision_margin
       (sys::poke _decision_margin (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[9] _homography
     (dotimes (i 9)
       (sys::poke (elt _homography i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[2] _center
     (dotimes (i 2)
       (sys::poke (elt _center i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[8] _corners
     (dotimes (i 8)
       (sys::poke (elt _corners i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _pose_error
       (sys::poke _pose_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Transform _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; int32 _tag_id
     (setq _tag_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _tag_family
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tag_family (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _hamming
     (setq _hamming (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _decision_margin
     (setq _decision_margin (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[9] _homography
   (dotimes (i (length _homography))
     (setf (elt _homography i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[2] _center
   (dotimes (i (length _center))
     (setf (elt _center i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[8] _corners
   (dotimes (i (length _corners))
     (setf (elt _corners i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32 _pose_error
     (setq _pose_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::AprilTagDetection :md5sum-) "a831190390fbef881c141df7b86598db")
(setf (get duckietown_msgs::AprilTagDetection :datatype-) "duckietown_msgs/AprilTagDetection")
(setf (get duckietown_msgs::AprilTagDetection :definition-)
      "geometry_msgs/Transform transform
int32 tag_id
string tag_family
int32 hamming
float32 decision_margin
float32[9] homography
float32[2] center
float32[8] corners
float32 pose_error

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :duckietown_msgs/AprilTagDetection "a831190390fbef881c141df7b86598db")


