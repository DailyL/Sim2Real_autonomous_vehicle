;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::NodeParameter)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'NodeParameter (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::NODEPARAMETER")
  (make-package "DUCKIETOWN_MSGS::NODEPARAMETER"))

(in-package "ROS")
;;//! \htmlinclude NodeParameter.msg.html


(intern "*PARAM_TYPE_UNKNOWN*" (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(shadow '*PARAM_TYPE_UNKNOWN* (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(defconstant duckietown_msgs::NodeParameter::*PARAM_TYPE_UNKNOWN* 0)
(intern "*PARAM_TYPE_STRING*" (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(shadow '*PARAM_TYPE_STRING* (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(defconstant duckietown_msgs::NodeParameter::*PARAM_TYPE_STRING* 1)
(intern "*PARAM_TYPE_INT*" (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(shadow '*PARAM_TYPE_INT* (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(defconstant duckietown_msgs::NodeParameter::*PARAM_TYPE_INT* 2)
(intern "*PARAM_TYPE_FLOAT*" (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(shadow '*PARAM_TYPE_FLOAT* (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(defconstant duckietown_msgs::NodeParameter::*PARAM_TYPE_FLOAT* 3)
(intern "*PARAM_TYPE_BOOL*" (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(shadow '*PARAM_TYPE_BOOL* (find-package "DUCKIETOWN_MSGS::NODEPARAMETER"))
(defconstant duckietown_msgs::NodeParameter::*PARAM_TYPE_BOOL* 4)

(defun duckietown_msgs::NodeParameter-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::NodeParameter::*PARAM_TYPE_UNKNOWN*)
        ((= const 1) 'duckietown_msgs::NodeParameter::*PARAM_TYPE_STRING*)
        ((= const 2) 'duckietown_msgs::NodeParameter::*PARAM_TYPE_INT*)
        ((= const 3) 'duckietown_msgs::NodeParameter::*PARAM_TYPE_FLOAT*)
        ((= const 4) 'duckietown_msgs::NodeParameter::*PARAM_TYPE_BOOL*)
        (t nil)))

(defclass duckietown_msgs::NodeParameter
  :super ros::object
  :slots (_node _name _help _type _min_value _max_value _editable ))

(defmethod duckietown_msgs::NodeParameter
  (:init
   (&key
    ((:node __node) "")
    ((:name __name) "")
    ((:help __help) "")
    ((:type __type) 0)
    ((:min_value __min_value) 0.0)
    ((:max_value __max_value) 0.0)
    ((:editable __editable) nil)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _name (string __name))
   (setq _help (string __help))
   (setq _type (round __type))
   (setq _min_value (float __min_value))
   (setq _max_value (float __max_value))
   (setq _editable __editable)
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:help
   (&optional __help)
   (if __help (setq _help __help)) _help)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:min_value
   (&optional __min_value)
   (if __min_value (setq _min_value __min_value)) _min_value)
  (:max_value
   (&optional __max_value)
   (if __max_value (setq _max_value __max_value)) _max_value)
  (:editable
   (&optional (__editable :null))
   (if (not (eq __editable :null)) (setq _editable __editable)) _editable)
  (:serialization-length
   ()
   (+
    ;; string _node
    4 (length _node)
    ;; string _name
    4 (length _name)
    ;; string _help
    4 (length _help)
    ;; uint8 _type
    1
    ;; float32 _min_value
    4
    ;; float32 _max_value
    4
    ;; bool _editable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _help
       (write-long (length _help) s) (princ _help s)
     ;; uint8 _type
       (write-byte _type s)
     ;; float32 _min_value
       (sys::poke _min_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_value
       (sys::poke _max_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _editable
       (if _editable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _help
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _help (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _min_value
     (setq _min_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_value
     (setq _max_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _editable
     (setq _editable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::NodeParameter :md5sum-) "871c14dc09d7cdeffeca9173f51f84f9")
(setf (get duckietown_msgs::NodeParameter :datatype-) "duckietown_msgs/NodeParameter")
(setf (get duckietown_msgs::NodeParameter :definition-)
      "# Parameter type (this has to match duckietown.TopicType)
uint8 PARAM_TYPE_UNKNOWN = 0
uint8 PARAM_TYPE_STRING = 1
uint8 PARAM_TYPE_INT = 2
uint8 PARAM_TYPE_FLOAT = 3
uint8 PARAM_TYPE_BOOL = 4

string node         # Name of the node
string name         # Name of the parameter (fully resolved)
string help         # Description of the parameter
uint8 type          # Type of the parameter (see PARAM_TYPE_X above)
float32 min_value   # Min value (for type INT, UINT, and FLOAT)
float32 max_value   # Max value (for type INT, UINT, and FLOAT)
bool editable       # Editable (it means that the node will be notified for changes)
")



(provide :duckietown_msgs/NodeParameter "871c14dc09d7cdeffeca9173f51f84f9")


