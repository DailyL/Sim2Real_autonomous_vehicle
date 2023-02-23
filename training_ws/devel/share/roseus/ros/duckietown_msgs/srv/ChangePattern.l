;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ChangePattern)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ChangePattern (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::CHANGEPATTERN")
  (make-package "DUCKIETOWN_MSGS::CHANGEPATTERN"))
(unless (find-package "DUCKIETOWN_MSGS::CHANGEPATTERNREQUEST")
  (make-package "DUCKIETOWN_MSGS::CHANGEPATTERNREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::CHANGEPATTERNRESPONSE")
  (make-package "DUCKIETOWN_MSGS::CHANGEPATTERNRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass duckietown_msgs::ChangePatternRequest
  :super ros::object
  :slots (_pattern_name ))

(defmethod duckietown_msgs::ChangePatternRequest
  (:init
   (&key
    ((:pattern_name __pattern_name) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _pattern_name __pattern_name)
   self)
  (:pattern_name
   (&rest __pattern_name)
   (if (keywordp (car __pattern_name))
       (send* _pattern_name __pattern_name)
     (progn
       (if __pattern_name (setq _pattern_name (car __pattern_name)))
       _pattern_name)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _pattern_name
    (send _pattern_name :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _pattern_name
       (send _pattern_name :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _pattern_name
     (send _pattern_name :deserialize buf ptr-) (incf ptr- (send _pattern_name :serialization-length))
   ;;
   self)
  )

(defclass duckietown_msgs::ChangePatternResponse
  :super ros::object
  :slots ())

(defmethod duckietown_msgs::ChangePatternResponse
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

(defclass duckietown_msgs::ChangePattern
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::ChangePattern :md5sum-) "678f2d65b1bda577ab0910fd9c7414ba")
(setf (get duckietown_msgs::ChangePattern :datatype-) "duckietown_msgs/ChangePattern")
(setf (get duckietown_msgs::ChangePattern :request) duckietown_msgs::ChangePatternRequest)
(setf (get duckietown_msgs::ChangePattern :response) duckietown_msgs::ChangePatternResponse)

(defmethod duckietown_msgs::ChangePatternRequest
  (:response () (instance duckietown_msgs::ChangePatternResponse :init)))

(setf (get duckietown_msgs::ChangePatternRequest :md5sum-) "678f2d65b1bda577ab0910fd9c7414ba")
(setf (get duckietown_msgs::ChangePatternRequest :datatype-) "duckietown_msgs/ChangePatternRequest")
(setf (get duckietown_msgs::ChangePatternRequest :definition-)
      "std_msgs/String pattern_name

================================================================================
MSG: std_msgs/String
string data
---

")

(setf (get duckietown_msgs::ChangePatternResponse :md5sum-) "678f2d65b1bda577ab0910fd9c7414ba")
(setf (get duckietown_msgs::ChangePatternResponse :datatype-) "duckietown_msgs/ChangePatternResponse")
(setf (get duckietown_msgs::ChangePatternResponse :definition-)
      "std_msgs/String pattern_name

================================================================================
MSG: std_msgs/String
string data
---

")



(provide :duckietown_msgs/ChangePattern "678f2d65b1bda577ab0910fd9c7414ba")


