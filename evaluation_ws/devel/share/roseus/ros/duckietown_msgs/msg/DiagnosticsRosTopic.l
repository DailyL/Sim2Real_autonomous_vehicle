;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosTopic)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosTopic (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosTopic.msg.html


(intern "*TOPIC_DIRECTION_INBOUND*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_DIRECTION_INBOUND* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_DIRECTION_INBOUND* 0)
(intern "*TOPIC_DIRECTION_OUTBOUND*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_DIRECTION_OUTBOUND* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_DIRECTION_OUTBOUND* 1)
(intern "*TOPIC_TYPE_GENERIC*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_GENERIC* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_GENERIC* 0)
(intern "*TOPIC_TYPE_DRIVER*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_DRIVER* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DRIVER* 1)
(intern "*TOPIC_TYPE_PERCEPTION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_PERCEPTION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_PERCEPTION* 2)
(intern "*TOPIC_TYPE_CONTROL*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_CONTROL* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_CONTROL* 3)
(intern "*TOPIC_TYPE_PLANNING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_PLANNING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_PLANNING* 4)
(intern "*TOPIC_TYPE_LOCALIZATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_LOCALIZATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_LOCALIZATION* 5)
(intern "*TOPIC_TYPE_MAPPING*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_MAPPING* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_MAPPING* 6)
(intern "*TOPIC_TYPE_SWARM*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_SWARM* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_SWARM* 7)
(intern "*TOPIC_TYPE_BEHAVIOR*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_BEHAVIOR* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_BEHAVIOR* 8)
(intern "*TOPIC_TYPE_VISUALIZATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_VISUALIZATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_VISUALIZATION* 9)
(intern "*TOPIC_TYPE_INFRASTRUCTURE*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_INFRASTRUCTURE* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_INFRASTRUCTURE* 10)
(intern "*TOPIC_TYPE_COMMUNICATION*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_COMMUNICATION* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_COMMUNICATION* 11)
(intern "*TOPIC_TYPE_DIAGNOSTICS*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_DIAGNOSTICS* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DIAGNOSTICS* 12)
(intern "*TOPIC_TYPE_DEBUG*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(shadow '*TOPIC_TYPE_DEBUG* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSTOPIC"))
(defconstant duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DEBUG* 20)

(defun duckietown_msgs::DiagnosticsRosTopic-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_DIRECTION_INBOUND*)
        ((= const 1) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_DIRECTION_OUTBOUND*)
        ((= const 0) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_GENERIC*)
        ((= const 1) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DRIVER*)
        ((= const 2) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_PERCEPTION*)
        ((= const 3) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_CONTROL*)
        ((= const 4) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_PLANNING*)
        ((= const 5) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_LOCALIZATION*)
        ((= const 6) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_MAPPING*)
        ((= const 7) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_SWARM*)
        ((= const 8) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_BEHAVIOR*)
        ((= const 9) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_VISUALIZATION*)
        ((= const 10) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_INFRASTRUCTURE*)
        ((= const 11) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_COMMUNICATION*)
        ((= const 12) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DIAGNOSTICS*)
        ((= const 20) 'duckietown_msgs::DiagnosticsRosTopic::*TOPIC_TYPE_DEBUG*)
        (t nil)))

(defclass duckietown_msgs::DiagnosticsRosTopic
  :super ros::object
  :slots (_node _name _help _type _direction _frequency _effective_frequency _healthy_frequency _bandwidth _enabled ))

(defmethod duckietown_msgs::DiagnosticsRosTopic
  (:init
   (&key
    ((:node __node) "")
    ((:name __name) "")
    ((:help __help) "")
    ((:type __type) 0)
    ((:direction __direction) 0)
    ((:frequency __frequency) 0.0)
    ((:effective_frequency __effective_frequency) 0.0)
    ((:healthy_frequency __healthy_frequency) 0.0)
    ((:bandwidth __bandwidth) 0.0)
    ((:enabled __enabled) nil)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _name (string __name))
   (setq _help (string __help))
   (setq _type (round __type))
   (setq _direction (round __direction))
   (setq _frequency (float __frequency))
   (setq _effective_frequency (float __effective_frequency))
   (setq _healthy_frequency (float __healthy_frequency))
   (setq _bandwidth (float __bandwidth))
   (setq _enabled __enabled)
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
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:effective_frequency
   (&optional __effective_frequency)
   (if __effective_frequency (setq _effective_frequency __effective_frequency)) _effective_frequency)
  (:healthy_frequency
   (&optional __healthy_frequency)
   (if __healthy_frequency (setq _healthy_frequency __healthy_frequency)) _healthy_frequency)
  (:bandwidth
   (&optional __bandwidth)
   (if __bandwidth (setq _bandwidth __bandwidth)) _bandwidth)
  (:enabled
   (&optional (__enabled :null))
   (if (not (eq __enabled :null)) (setq _enabled __enabled)) _enabled)
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
    ;; uint8 _direction
    1
    ;; float32 _frequency
    4
    ;; float32 _effective_frequency
    4
    ;; float32 _healthy_frequency
    4
    ;; float32 _bandwidth
    4
    ;; bool _enabled
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
     ;; uint8 _direction
       (write-byte _direction s)
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _effective_frequency
       (sys::poke _effective_frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _healthy_frequency
       (sys::poke _healthy_frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bandwidth
       (sys::poke _bandwidth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _enabled
       (if _enabled (write-byte -1 s) (write-byte 0 s))
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
   ;; uint8 _direction
     (setq _direction (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _effective_frequency
     (setq _effective_frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _healthy_frequency
     (setq _healthy_frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bandwidth
     (setq _bandwidth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _enabled
     (setq _enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosTopic :md5sum-) "c3a6c5501489fa1a1f348c31cffc641a")
(setf (get duckietown_msgs::DiagnosticsRosTopic :datatype-) "duckietown_msgs/DiagnosticsRosTopic")
(setf (get duckietown_msgs::DiagnosticsRosTopic :definition-)
      "# Topic direction (this has to match duckietown.TopicDirection)
uint8 TOPIC_DIRECTION_INBOUND = 0
uint8 TOPIC_DIRECTION_OUTBOUND = 1

# Topic type (this has to match duckietown.TopicType)
uint8 TOPIC_TYPE_GENERIC = 0
uint8 TOPIC_TYPE_DRIVER = 1
uint8 TOPIC_TYPE_PERCEPTION = 2
uint8 TOPIC_TYPE_CONTROL = 3
uint8 TOPIC_TYPE_PLANNING = 4
uint8 TOPIC_TYPE_LOCALIZATION = 5
uint8 TOPIC_TYPE_MAPPING = 6
uint8 TOPIC_TYPE_SWARM = 7
uint8 TOPIC_TYPE_BEHAVIOR = 8
uint8 TOPIC_TYPE_VISUALIZATION = 9
uint8 TOPIC_TYPE_INFRASTRUCTURE = 10
uint8 TOPIC_TYPE_COMMUNICATION = 11
uint8 TOPIC_TYPE_DIAGNOSTICS = 12
uint8 TOPIC_TYPE_DEBUG = 20

string node                     # Node publishing this message
string name                     # Topic object of the diagnostics
string help                     # Topic description
uint8 type                      # Topic type
uint8 direction                 # Topic direction
float32 frequency               # Topic frequency (Hz)
float32 effective_frequency     # Topic (effective) frequency (Hz)
float32 healthy_frequency       # Frequency at which this topic can be considered healthy
float32 bandwidth               # Topic bandwidth (byte/s)
bool enabled                    # Topic switch

")



(provide :duckietown_msgs/DiagnosticsRosTopic "c3a6c5501489fa1a1f348c31cffc641a")


