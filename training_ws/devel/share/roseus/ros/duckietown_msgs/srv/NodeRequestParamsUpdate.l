;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::NodeRequestParamsUpdate)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'NodeRequestParamsUpdate (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATE")
  (make-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATE"))
(unless (find-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATEREQUEST")
  (make-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATEREQUEST"))
(unless (find-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATERESPONSE")
  (make-package "DUCKIETOWN_MSGS::NODEREQUESTPARAMSUPDATERESPONSE"))

(in-package "ROS")





(defclass duckietown_msgs::NodeRequestParamsUpdateRequest
  :super ros::object
  :slots (_parameter ))

(defmethod duckietown_msgs::NodeRequestParamsUpdateRequest
  (:init
   (&key
    ((:parameter __parameter) "")
    )
   (send-super :init)
   (setq _parameter (string __parameter))
   self)
  (:parameter
   (&optional __parameter)
   (if __parameter (setq _parameter __parameter)) _parameter)
  (:serialization-length
   ()
   (+
    ;; string _parameter
    4 (length _parameter)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _parameter
       (write-long (length _parameter) s) (princ _parameter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _parameter
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _parameter (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass duckietown_msgs::NodeRequestParamsUpdateResponse
  :super ros::object
  :slots (_success ))

(defmethod duckietown_msgs::NodeRequestParamsUpdateResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass duckietown_msgs::NodeRequestParamsUpdate
  :super ros::object
  :slots ())

(setf (get duckietown_msgs::NodeRequestParamsUpdate :md5sum-) "e8496433f08c35370e7779defca9aa19")
(setf (get duckietown_msgs::NodeRequestParamsUpdate :datatype-) "duckietown_msgs/NodeRequestParamsUpdate")
(setf (get duckietown_msgs::NodeRequestParamsUpdate :request) duckietown_msgs::NodeRequestParamsUpdateRequest)
(setf (get duckietown_msgs::NodeRequestParamsUpdate :response) duckietown_msgs::NodeRequestParamsUpdateResponse)

(defmethod duckietown_msgs::NodeRequestParamsUpdateRequest
  (:response () (instance duckietown_msgs::NodeRequestParamsUpdateResponse :init)))

(setf (get duckietown_msgs::NodeRequestParamsUpdateRequest :md5sum-) "e8496433f08c35370e7779defca9aa19")
(setf (get duckietown_msgs::NodeRequestParamsUpdateRequest :datatype-) "duckietown_msgs/NodeRequestParamsUpdateRequest")
(setf (get duckietown_msgs::NodeRequestParamsUpdateRequest :definition-)
      "string parameter
---
bool success

")

(setf (get duckietown_msgs::NodeRequestParamsUpdateResponse :md5sum-) "e8496433f08c35370e7779defca9aa19")
(setf (get duckietown_msgs::NodeRequestParamsUpdateResponse :datatype-) "duckietown_msgs/NodeRequestParamsUpdateResponse")
(setf (get duckietown_msgs::NodeRequestParamsUpdateResponse :definition-)
      "string parameter
---
bool success

")



(provide :duckietown_msgs/NodeRequestParamsUpdate "e8496433f08c35370e7779defca9aa19")


