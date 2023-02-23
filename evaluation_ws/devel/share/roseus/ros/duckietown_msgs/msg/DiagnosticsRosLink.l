;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsRosLink)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsRosLink (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsRosLink.msg.html


(intern "*LINK_DIRECTION_INBOUND*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK"))
(shadow '*LINK_DIRECTION_INBOUND* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK"))
(defconstant duckietown_msgs::DiagnosticsRosLink::*LINK_DIRECTION_INBOUND* 0)
(intern "*LINK_DIRECTION_OUTBOUND*" (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK"))
(shadow '*LINK_DIRECTION_OUTBOUND* (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSROSLINK"))
(defconstant duckietown_msgs::DiagnosticsRosLink::*LINK_DIRECTION_OUTBOUND* 1)

(defun duckietown_msgs::DiagnosticsRosLink-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::DiagnosticsRosLink::*LINK_DIRECTION_INBOUND*)
        ((= const 1) 'duckietown_msgs::DiagnosticsRosLink::*LINK_DIRECTION_OUTBOUND*)
        (t nil)))

(defclass duckietown_msgs::DiagnosticsRosLink
  :super ros::object
  :slots (_node _topic _remote _direction _connected _transport _messages _dropped _bytes _frequency _bandwidth ))

(defmethod duckietown_msgs::DiagnosticsRosLink
  (:init
   (&key
    ((:node __node) "")
    ((:topic __topic) "")
    ((:remote __remote) "")
    ((:direction __direction) 0)
    ((:connected __connected) nil)
    ((:transport __transport) "")
    ((:messages __messages) 0)
    ((:dropped __dropped) 0)
    ((:bytes __bytes) 0.0)
    ((:frequency __frequency) 0.0)
    ((:bandwidth __bandwidth) 0.0)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _topic (string __topic))
   (setq _remote (string __remote))
   (setq _direction (round __direction))
   (setq _connected __connected)
   (setq _transport (string __transport))
   (setq _messages (round __messages))
   (setq _dropped (round __dropped))
   (setq _bytes (float __bytes))
   (setq _frequency (float __frequency))
   (setq _bandwidth (float __bandwidth))
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:topic
   (&optional __topic)
   (if __topic (setq _topic __topic)) _topic)
  (:remote
   (&optional __remote)
   (if __remote (setq _remote __remote)) _remote)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:connected
   (&optional (__connected :null))
   (if (not (eq __connected :null)) (setq _connected __connected)) _connected)
  (:transport
   (&optional __transport)
   (if __transport (setq _transport __transport)) _transport)
  (:messages
   (&optional __messages)
   (if __messages (setq _messages __messages)) _messages)
  (:dropped
   (&optional __dropped)
   (if __dropped (setq _dropped __dropped)) _dropped)
  (:bytes
   (&optional __bytes)
   (if __bytes (setq _bytes __bytes)) _bytes)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:bandwidth
   (&optional __bandwidth)
   (if __bandwidth (setq _bandwidth __bandwidth)) _bandwidth)
  (:serialization-length
   ()
   (+
    ;; string _node
    4 (length _node)
    ;; string _topic
    4 (length _topic)
    ;; string _remote
    4 (length _remote)
    ;; uint8 _direction
    1
    ;; bool _connected
    1
    ;; string _transport
    4 (length _transport)
    ;; uint64 _messages
    8
    ;; uint64 _dropped
    8
    ;; float32 _bytes
    4
    ;; float32 _frequency
    4
    ;; float32 _bandwidth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;; string _topic
       (write-long (length _topic) s) (princ _topic s)
     ;; string _remote
       (write-long (length _remote) s) (princ _remote s)
     ;; uint8 _direction
       (write-byte _direction s)
     ;; bool _connected
       (if _connected (write-byte -1 s) (write-byte 0 s))
     ;; string _transport
       (write-long (length _transport) s) (princ _transport s)
     ;; uint64 _messages
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _messages (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _messages) (= (length (_messages . bv)) 2)) ;; bignum
              (write-long (ash (elt (_messages . bv) 0) 0) s)
              (write-long (ash (elt (_messages . bv) 1) -1) s))
             ((and (class _messages) (= (length (_messages . bv)) 1)) ;; big1
              (write-long (elt (_messages . bv) 0) s)
              (write-long (if (>= _messages 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _messages s)(write-long (if (>= _messages 0) 0 #xffffffff) s)))
     ;; uint64 _dropped
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _dropped (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _dropped) (= (length (_dropped . bv)) 2)) ;; bignum
              (write-long (ash (elt (_dropped . bv) 0) 0) s)
              (write-long (ash (elt (_dropped . bv) 1) -1) s))
             ((and (class _dropped) (= (length (_dropped . bv)) 1)) ;; big1
              (write-long (elt (_dropped . bv) 0) s)
              (write-long (if (>= _dropped 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _dropped s)(write-long (if (>= _dropped 0) 0 #xffffffff) s)))
     ;; float32 _bytes
       (sys::poke _bytes (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bandwidth
       (sys::poke _bandwidth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _topic
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _topic (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _remote
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _remote (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _direction
     (setq _direction (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _connected
     (setq _connected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _transport
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _transport (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint64 _messages
     
#+(or :alpha :irix6 :x86_64)
      (setf _messages (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _messages (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint64 _dropped
     
#+(or :alpha :irix6 :x86_64)
      (setf _dropped (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _dropped (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _bytes
     (setq _bytes (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bandwidth
     (setq _bandwidth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsRosLink :md5sum-) "53a9a85eb8565abb4ba439662041c3aa")
(setf (get duckietown_msgs::DiagnosticsRosLink :datatype-) "duckietown_msgs/DiagnosticsRosLink")
(setf (get duckietown_msgs::DiagnosticsRosLink :definition-)
      "# Link direction
uint8 LINK_DIRECTION_INBOUND = 0
uint8 LINK_DIRECTION_OUTBOUND = 1

string node         # Node publishing this message
string topic        # Topic transferred over the link
string remote       # Remote end of this link
uint8 direction     # Link direction
bool connected      # Status of the link
string transport    # Type of transport used for this link
uint64 messages     # Number of messages transferred over this link
uint64 dropped      # Number of messages dropped over this link
float32 bytes       # Volume of data transferred over this link
float32 frequency   # Link frequency (Hz)
float32 bandwidth   # Link bandwidth (byte/s)

")



(provide :duckietown_msgs/DiagnosticsRosLink "53a9a85eb8565abb4ba439662041c3aa")


