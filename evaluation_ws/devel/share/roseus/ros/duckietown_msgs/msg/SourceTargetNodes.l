;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::SourceTargetNodes)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'SourceTargetNodes (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::SOURCETARGETNODES")
  (make-package "DUCKIETOWN_MSGS::SOURCETARGETNODES"))

(in-package "ROS")
;;//! \htmlinclude SourceTargetNodes.msg.html


(defclass duckietown_msgs::SourceTargetNodes
  :super ros::object
  :slots (_source_node _target_node ))

(defmethod duckietown_msgs::SourceTargetNodes
  (:init
   (&key
    ((:source_node __source_node) "")
    ((:target_node __target_node) "")
    )
   (send-super :init)
   (setq _source_node (string __source_node))
   (setq _target_node (string __target_node))
   self)
  (:source_node
   (&optional __source_node)
   (if __source_node (setq _source_node __source_node)) _source_node)
  (:target_node
   (&optional __target_node)
   (if __target_node (setq _target_node __target_node)) _target_node)
  (:serialization-length
   ()
   (+
    ;; string _source_node
    4 (length _source_node)
    ;; string _target_node
    4 (length _target_node)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _source_node
       (write-long (length _source_node) s) (princ _source_node s)
     ;; string _target_node
       (write-long (length _target_node) s) (princ _target_node s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _source_node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _source_node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _target_node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target_node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::SourceTargetNodes :md5sum-) "f05fda47731d8da1f80e3a499a42edf9")
(setf (get duckietown_msgs::SourceTargetNodes :datatype-) "duckietown_msgs/SourceTargetNodes")
(setf (get duckietown_msgs::SourceTargetNodes :definition-)
      "string source_node
string target_node

")



(provide :duckietown_msgs/SourceTargetNodes "f05fda47731d8da1f80e3a499a42edf9")


