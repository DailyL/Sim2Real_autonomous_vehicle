;; Auto-generated. Do not edit!


(when (boundp 'hector_mapping::ResetMapping)
  (if (not (find-package "HECTOR_MAPPING"))
    (make-package "HECTOR_MAPPING"))
  (shadow 'ResetMapping (find-package "HECTOR_MAPPING")))
(unless (find-package "HECTOR_MAPPING::RESETMAPPING")
  (make-package "HECTOR_MAPPING::RESETMAPPING"))
(unless (find-package "HECTOR_MAPPING::RESETMAPPINGREQUEST")
  (make-package "HECTOR_MAPPING::RESETMAPPINGREQUEST"))
(unless (find-package "HECTOR_MAPPING::RESETMAPPINGRESPONSE")
  (make-package "HECTOR_MAPPING::RESETMAPPINGRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass hector_mapping::ResetMappingRequest
  :super ros::object
  :slots (_initial_pose ))

(defmethod hector_mapping::ResetMappingRequest
  (:init
   (&key
    ((:initial_pose __initial_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _initial_pose __initial_pose)
   self)
  (:initial_pose
   (&rest __initial_pose)
   (if (keywordp (car __initial_pose))
       (send* _initial_pose __initial_pose)
     (progn
       (if __initial_pose (setq _initial_pose (car __initial_pose)))
       _initial_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _initial_pose
    (send _initial_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _initial_pose
       (send _initial_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _initial_pose
     (send _initial_pose :deserialize buf ptr-) (incf ptr- (send _initial_pose :serialization-length))
   ;;
   self)
  )

(defclass hector_mapping::ResetMappingResponse
  :super ros::object
  :slots ())

(defmethod hector_mapping::ResetMappingResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass hector_mapping::ResetMapping
  :super ros::object
  :slots ())

(setf (get hector_mapping::ResetMapping :md5sum-) "3423647d14c6c84592eef8b1184a5974")
(setf (get hector_mapping::ResetMapping :datatype-) "hector_mapping/ResetMapping")
(setf (get hector_mapping::ResetMapping :request) hector_mapping::ResetMappingRequest)
(setf (get hector_mapping::ResetMapping :response) hector_mapping::ResetMappingResponse)

(defmethod hector_mapping::ResetMappingRequest
  (:response () (instance hector_mapping::ResetMappingResponse :init)))

(setf (get hector_mapping::ResetMappingRequest :md5sum-) "3423647d14c6c84592eef8b1184a5974")
(setf (get hector_mapping::ResetMappingRequest :datatype-) "hector_mapping/ResetMappingRequest")
(setf (get hector_mapping::ResetMappingRequest :definition-)
      "geometry_msgs/Pose initial_pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
---

")

(setf (get hector_mapping::ResetMappingResponse :md5sum-) "3423647d14c6c84592eef8b1184a5974")
(setf (get hector_mapping::ResetMappingResponse :datatype-) "hector_mapping/ResetMappingResponse")
(setf (get hector_mapping::ResetMappingResponse :definition-)
      "geometry_msgs/Pose initial_pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
---

")



(provide :hector_mapping/ResetMapping "3423647d14c6c84592eef8b1184a5974")


