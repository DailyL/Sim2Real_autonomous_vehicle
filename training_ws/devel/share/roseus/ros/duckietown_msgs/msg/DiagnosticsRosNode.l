;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosNode)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosNode (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosNode.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*NODE_TYPE_GENERIC*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_GENERIC* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_GENERIC* 0)
(intern "*NODE_TYPE_DRIVER*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_DRIVER* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DRIVER* 1)
(intern "*NODE_TYPE_PERCEPTION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_PERCEPTION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_PERCEPTION* 2)
(intern "*NODE_TYPE_CONTROL*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_CONTROL* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_CONTROL* 3)
(intern "*NODE_TYPE_PLANNING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_PLANNING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_PLANNING* 4)
(intern "*NODE_TYPE_LOCALIZATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_LOCALIZATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_LOCALIZATION* 5)
(intern "*NODE_TYPE_MAPPING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_MAPPING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_MAPPING* 6)
(intern "*NODE_TYPE_SWARM*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_SWARM* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_SWARM* 7)
(intern "*NODE_TYPE_BEHAVIOR*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_BEHAVIOR* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_BEHAVIOR* 8)
(intern "*NODE_TYPE_VISUALIZATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_VISUALIZATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_VISUALIZATION* 9)
(intern "*NODE_TYPE_INFRASTRUCTURE*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_INFRASTRUCTURE* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_INFRASTRUCTURE* 10)
(intern "*NODE_TYPE_COMMUNICATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_COMMUNICATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_COMMUNICATION* 11)
(intern "*NODE_TYPE_DIAGNOSTICS*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_DIAGNOSTICS* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DIAGNOSTICS* 12)
(intern "*NODE_TYPE_DEBUG*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_TYPE_DEBUG* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DEBUG* 20)
(intern "*NODE_HEALTH_UNKNOWN*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_UNKNOWN* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_UNKNOWN* 0)
(intern "*NODE_HEALTH_STARTING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_STARTING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_STARTING* 5)
(intern "*NODE_HEALTH_STARTED*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_STARTED* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_STARTED* 6)
(intern "*NODE_HEALTH_HEALTHY*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_HEALTHY* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_HEALTHY* 10)
(intern "*NODE_HEALTH_WARNING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_WARNING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_WARNING* 20)
(intern "*NODE_HEALTH_ERROR*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_ERROR* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_ERROR* 30)
(intern "*NODE_HEALTH_FATAL*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(shadow '*NODE_HEALTH_FATAL* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSNODE"))
(defconstant duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_FATAL* 40)

(defun duckietown_msgs::DiagnosticsRosNode-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_GENERIC*)
        ((= const 1) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DRIVER*)
        ((= const 2) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_PERCEPTION*)
        ((= const 3) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_CONTROL*)
        ((= const 4) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_PLANNING*)
        ((= const 5) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_LOCALIZATION*)
        ((= const 6) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_MAPPING*)
        ((= const 7) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_SWARM*)
        ((= const 8) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_BEHAVIOR*)
        ((= const 9) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_VISUALIZATION*)
        ((= const 10) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_INFRASTRUCTURE*)
        ((= const 11) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_COMMUNICATION*)
        ((= const 12) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DIAGNOSTICS*)
        ((= const 20) 'duckietown_msgs::DiagnosticsRosNode::*NODE_TYPE_DEBUG*)
        ((= const 0) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_UNKNOWN*)
        ((= const 5) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_STARTING*)
        ((= const 6) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_STARTED*)
        ((= const 10) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_HEALTHY*)
        ((= const 20) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_WARNING*)
        ((= const 30) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_ERROR*)
        ((= const 40) 'duckietown_msgs::DiagnosticsRosNode::*NODE_HEALTH_FATAL*)
        (t nil)))

(defclass duckietown_msgs::DiagnosticsRosNode
  :super ros::object
  :slots (_header _name _help _type _health _health_reason _health_stamp _enabled _uri _machine _module_type _module_instance ))

(defmethod duckietown_msgs::DiagnosticsRosNode
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:help __help) "")
    ((:type __type) 0)
    ((:health __health) 0)
    ((:health_reason __health_reason) "")
    ((:health_stamp __health_stamp) 0.0)
    ((:enabled __enabled) nil)
    ((:uri __uri) "")
    ((:machine __machine) "")
    ((:module_type __module_type) "")
    ((:module_instance __module_instance) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _help (string __help))
   (setq _type (round __type))
   (setq _health (round __health))
   (setq _health_reason (string __health_reason))
   (setq _health_stamp (float __health_stamp))
   (setq _enabled __enabled)
   (setq _uri (string __uri))
   (setq _machine (string __machine))
   (setq _module_type (string __module_type))
   (setq _module_instance (string __module_instance))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:help
   (&optional __help)
   (if __help (setq _help __help)) _help)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:health
   (&optional __health)
   (if __health (setq _health __health)) _health)
  (:health_reason
   (&optional __health_reason)
   (if __health_reason (setq _health_reason __health_reason)) _health_reason)
  (:health_stamp
   (&optional __health_stamp)
   (if __health_stamp (setq _health_stamp __health_stamp)) _health_stamp)
  (:enabled
   (&optional (__enabled :null))
   (if (not (eq __enabled :null)) (setq _enabled __enabled)) _enabled)
  (:uri
   (&optional __uri)
   (if __uri (setq _uri __uri)) _uri)
  (:machine
   (&optional __machine)
   (if __machine (setq _machine __machine)) _machine)
  (:module_type
   (&optional __module_type)
   (if __module_type (setq _module_type __module_type)) _module_type)
  (:module_instance
   (&optional __module_instance)
   (if __module_instance (setq _module_instance __module_instance)) _module_instance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; string _help
    4 (length _help)
    ;; uint8 _type
    1
    ;; uint8 _health
    1
    ;; string _health_reason
    4 (length _health_reason)
    ;; float32 _health_stamp
    4
    ;; bool _enabled
    1
    ;; string _uri
    4 (length _uri)
    ;; string _machine
    4 (length _machine)
    ;; string _module_type
    4 (length _module_type)
    ;; string _module_instance
    4 (length _module_instance)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _help
       (write-long (length _help) s) (princ _help s)
     ;; uint8 _type
       (write-byte _type s)
     ;; uint8 _health
       (write-byte _health s)
     ;; string _health_reason
       (write-long (length _health_reason) s) (princ _health_reason s)
     ;; float32 _health_stamp
       (sys::poke _health_stamp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _enabled
       (if _enabled (write-byte -1 s) (write-byte 0 s))
     ;; string _uri
       (write-long (length _uri) s) (princ _uri s)
     ;; string _machine
       (write-long (length _machine) s) (princ _machine s)
     ;; string _module_type
       (write-long (length _module_type) s) (princ _module_type s)
     ;; string _module_instance
       (write-long (length _module_instance) s) (princ _module_instance s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _help
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _help (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _health
     (setq _health (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _health_reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _health_reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _health_stamp
     (setq _health_stamp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _enabled
     (setq _enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _uri
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _uri (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _machine
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _machine (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _module_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _module_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _module_instance
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _module_instance (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosNode :md5sum-) "d51c0fa0a1d1899eebe4bf3476ab3439")
(setf (get duckietown_msgs::DiagnosticsRosNode :datatype-) "duckietown_msgs/DiagnosticsRosNode")
(setf (get duckietown_msgs::DiagnosticsRosNode :definition-)
      "# Node type (this has to match duckietown.NodeType)
uint8 NODE_TYPE_GENERIC = 0
uint8 NODE_TYPE_DRIVER = 1
uint8 NODE_TYPE_PERCEPTION = 2
uint8 NODE_TYPE_CONTROL = 3
uint8 NODE_TYPE_PLANNING = 4
uint8 NODE_TYPE_LOCALIZATION = 5
uint8 NODE_TYPE_MAPPING = 6
uint8 NODE_TYPE_SWARM = 7
uint8 NODE_TYPE_BEHAVIOR = 8
uint8 NODE_TYPE_VISUALIZATION = 9
uint8 NODE_TYPE_INFRASTRUCTURE = 10
uint8 NODE_TYPE_COMMUNICATION = 11
uint8 NODE_TYPE_DIAGNOSTICS = 12
uint8 NODE_TYPE_DEBUG = 20

# Node health (this has to match duckietown.NodeHealth)
uint8 NODE_HEALTH_UNKNOWN = 0
uint8 NODE_HEALTH_STARTING = 5
uint8 NODE_HEALTH_STARTED = 6
uint8 NODE_HEALTH_HEALTHY = 10
uint8 NODE_HEALTH_WARNING = 20
uint8 NODE_HEALTH_ERROR = 30
uint8 NODE_HEALTH_FATAL = 40

Header header
string name             # Node publishing this message
string help             # Node description
uint8 type              # Node type (see NODE_TYPE_X above)
uint8 health            # Node health (see NODE_HEALTH_X above)
string health_reason    # String describing the reason for this health status (if any)
float32 health_stamp    # Time when the health status changed into the current
bool enabled            # Status of the switch
string uri              # RPC URI of the node
string machine          # Machine hostname or IP where this node is running
string module_type      # Module containing this node
string module_instance  # ID of the instance of the module running this node

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :duckietown_msgs/DiagnosticsRosNode "d51c0fa0a1d1899eebe4bf3476ab3439")


