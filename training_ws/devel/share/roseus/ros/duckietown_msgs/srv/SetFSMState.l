;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SetFSMState)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SetFSMState (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SETFSMSTATE")
  (make-package "DUCKIETOWN_MSGS::SETFSMSTATE"))
(unless (find-package "DUCKIETOWN_MSGS::SETFSMSTATEREQUEST")
  (make-package "DUCKIETOWN_MSGS::SETFSMSTATEREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::SETFSMSTATERESPONSE")
  (make-package "DUCKIETOWN_MSGS::SETFSMSTATERESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::SetFSMStateRequest
  :super ros::object
  :slots (_state ))

(defmethod duckietown_msgs::SetFSMStateRequest
  (:init
   (&key
    ((:state __state) "")
    )
   (send-super :init)
   (setq _state (string __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass duckietown_msgs::SetFSMStateResponse
  :super ros::object
  :slots ())

(defmethod duckietown_msgs::SetFSMStateResponse
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

(defclass duckietown_msgs::SetFSMState
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::SetFSMState :md5sum-) "af6d3a99f0fbeb66d3248fa4b3e675fb")
(setf (get duckietown_msgs::SetFSMState :datatype-) "duckietown_msgs/SetFSMState")
(setf (get duckietown_msgs::SetFSMState :request) duckietown_msgs::SetFSMStateRequest)
(setf (get duckietown_msgs::SetFSMState :response) duckietown_msgs::SetFSMStateResponse)

(defmethod duckietown_msgs::SetFSMStateRequest
  (:response () (instance duckietown_msgs::SetFSMStateResponse :init)))

(setf (get duckietown_msgs::SetFSMStateRequest :md5sum-) "af6d3a99f0fbeb66d3248fa4b3e675fb")
(setf (get duckietown_msgs::SetFSMStateRequest :datatype-) "duckietown_msgs/SetFSMStateRequest")
(setf (get duckietown_msgs::SetFSMStateRequest :definition-)
      "string state
---
")

(setf (get duckietown_msgs::SetFSMStateResponse :md5sum-) "af6d3a99f0fbeb66d3248fa4b3e675fb")
(setf (get duckietown_msgs::SetFSMStateResponse :datatype-) "duckietown_msgs/SetFSMStateResponse")
(setf (get duckietown_msgs::SetFSMStateResponse :definition-)
      "string state
---
")



(provide :duckietown_msgs/SetFSMState "af6d3a99f0fbeb66d3248fa4b3e675fb")


