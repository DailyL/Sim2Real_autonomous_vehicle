;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::DiagnosticsCodeProfiling)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'DiagnosticsCodeProfiling (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::DIAGNOSTICSCODEPROFILING")
  (make-package "DUCKIETOWN_MSGS::DIAGNOSTICSCODEPROFILING"))

(in-package "ROS")
;;//! \htmlinclude DiagnosticsCodeProfiling.msg.html


(defclass duckietown_msgs::DiagnosticsCodeProfiling
  :super ros::object
  :slots (_node _block _frequency _duration _filename _line_nums _time_since_last_execution ))

(defmethod duckietown_msgs::DiagnosticsCodeProfiling
  (:init
   (&key
    ((:node __node) "")
    ((:block __block) "")
    ((:frequency __frequency) 0.0)
    ((:duration __duration) 0.0)
    ((:filename __filename) "")
    ((:line_nums __line_nums) (make-array 2 :initial-element 0 :element-type :integer))
    ((:time_since_last_execution __time_since_last_execution) 0.0)
    )
   (send-super :init)
   (setq _node (string __node))
   (setq _block (string __block))
   (setq _frequency (float __frequency))
   (setq _duration (float __duration))
   (setq _filename (string __filename))
   (setq _line_nums __line_nums)
   (setq _time_since_last_execution (float __time_since_last_execution))
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:block
   (&optional __block)
   (if __block (setq _block __block)) _block)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:line_nums
   (&optional __line_nums)
   (if __line_nums (setq _line_nums __line_nums)) _line_nums)
  (:time_since_last_execution
   (&optional __time_since_last_execution)
   (if __time_since_last_execution (setq _time_since_last_execution __time_since_last_execution)) _time_since_last_execution)
  (:serialization-length
   ()
   (+
    ;; string _node
    4 (length _node)
    ;; string _block
    4 (length _block)
    ;; float32 _frequency
    4
    ;; float32 _duration
    4
    ;; string _filename
    4 (length _filename)
    ;; uint16[2] _line_nums
    (* 2    2)
    ;; float32 _time_since_last_execution
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;; string _block
       (write-long (length _block) s) (princ _block s)
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _duration
       (sys::poke _duration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;; uint16[2] _line_nums
     (dotimes (i 2)
       (write-word (elt _line_nums i) s)
       )
     ;; float32 _time_since_last_execution
       (sys::poke _time_since_last_execution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _block
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _block (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _duration
     (setq _duration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16[2] _line_nums
   (dotimes (i (length _line_nums))
     (setf (elt _line_nums i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; float32 _time_since_last_execution
     (setq _time_since_last_execution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::DiagnosticsCodeProfiling :md5sum-) "2f919bc6b39855368e96c3df59f3187f")
(setf (get duckietown_msgs::DiagnosticsCodeProfiling :datatype-) "duckietown_msgs/DiagnosticsCodeProfiling")
(setf (get duckietown_msgs::DiagnosticsCodeProfiling :definition-)
      "string node                             # Node publishing this message
string block                            # Name of the profiled code block
float32 frequency                       # Execution frequency of the block
float32 duration                        # Last execution time of the block (in seconds)
string filename                         # Filename in which this block resides
uint16[2] line_nums                     # Start and end line of the block in the file
float32 time_since_last_execution       # Seconds since last execution
")



(provide :duckietown_msgs/DiagnosticsCodeProfiling "2f919bc6b39855368e96c3df59f3187f")


