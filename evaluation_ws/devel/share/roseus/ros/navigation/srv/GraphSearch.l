;; Auto-generated. Do not edit!


(when (boundp 'navigation::GraphSearch)
  (if (not (find-package "NAVIGATION"))
    (make-package "NAVIGATION"))
  (shadow 'GraphSearch (find-package "NAVIGATION")))
(unless (find-package "NAVIGATION::GRAPHSEARCH")
  (make-package "NAVIGATION::GRAPHSEARCH"))
(unless (find-package "NAVIGATION::GRAPHSEARCHREQUEST")
  (make-package "NAVIGATION::GRAPHSEARCHREQUEST"))
(unless (find-package "NAVIGATION::GRAPHSEARCHRESPONSE")
  (make-package "NAVIGATION::GRAPHSEARCHRESPONSE"))

(in-package "ROS")





(defclass navigation::GraphSearchRequest
  :super ros::object
  :slots (_source_node _target_node ))

(defmethod navigation::GraphSearchRequest
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

(defclass navigation::GraphSearchResponse
  :super ros::object
  :slots (_actions ))

(defmethod navigation::GraphSearchResponse
  (:init
   (&key
    ((:actions __actions) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _actions __actions)
   self)
  (:actions
   (&optional __actions)
   (if __actions (setq _actions __actions)) _actions)
  (:serialization-length
   ()
   (+
    ;; string[] _actions
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _actions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _actions
     (write-long (length _actions) s)
     (dolist (elem _actions)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _actions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _actions (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _actions i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass navigation::GraphSearch
  :super ros::object
  :slots ())

(setf (get navigation::GraphSearch :md5sum-) "09a6e880a7e29d5f1df1f6f7be49541d")
(setf (get navigation::GraphSearch :datatype-) "navigation/GraphSearch")
(setf (get navigation::GraphSearch :request) navigation::GraphSearchRequest)
(setf (get navigation::GraphSearch :response) navigation::GraphSearchResponse)

(defmethod navigation::GraphSearchRequest
  (:response () (instance navigation::GraphSearchResponse :init)))

(setf (get navigation::GraphSearchRequest :md5sum-) "09a6e880a7e29d5f1df1f6f7be49541d")
(setf (get navigation::GraphSearchRequest :datatype-) "navigation/GraphSearchRequest")
(setf (get navigation::GraphSearchRequest :definition-)
      "string source_node
string target_node
---
string[] actions

")

(setf (get navigation::GraphSearchResponse :md5sum-) "09a6e880a7e29d5f1df1f6f7be49541d")
(setf (get navigation::GraphSearchResponse :datatype-) "navigation/GraphSearchResponse")
(setf (get navigation::GraphSearchResponse :definition-)
      "string source_node
string target_node
---
string[] actions

")



(provide :navigation/GraphSearch "09a6e880a7e29d5f1df1f6f7be49541d")


