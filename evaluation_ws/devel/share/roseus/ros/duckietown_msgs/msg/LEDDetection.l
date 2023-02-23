;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LEDDetection)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LEDDetection (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LEDDETECTION")
  (make-package "DUCKIETOWN_MSGS::LEDDETECTION"))

(in-package "ROS")
;;//! \htmlinclude LEDDetection.msg.html


(defclass duckietown_msgs::LEDDetection
  :super ros::object
  :slots (_timestamp1 _timestamp2 _pixels_normalized _frequency _color _confidence _signal_ts _signal _fft_fs _fft ))

(defmethod duckietown_msgs::LEDDetection
  (:init
   (&key
    ((:timestamp1 __timestamp1) (instance ros::time :init))
    ((:timestamp2 __timestamp2) (instance ros::time :init))
    ((:pixels_normalized __pixels_normalized) (instance duckietown_msgs::Vector2D :init))
    ((:frequency __frequency) 0.0)
    ((:color __color) "")
    ((:confidence __confidence) 0.0)
    ((:signal_ts __signal_ts) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:signal __signal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:fft_fs __fft_fs) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:fft __fft) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _timestamp1 __timestamp1)
   (setq _timestamp2 __timestamp2)
   (setq _pixels_normalized __pixels_normalized)
   (setq _frequency (float __frequency))
   (setq _color (string __color))
   (setq _confidence (float __confidence))
   (setq _signal_ts __signal_ts)
   (setq _signal __signal)
   (setq _fft_fs __fft_fs)
   (setq _fft __fft)
   self)
  (:timestamp1
   (&optional __timestamp1)
   (if __timestamp1 (setq _timestamp1 __timestamp1)) _timestamp1)
  (:timestamp2
   (&optional __timestamp2)
   (if __timestamp2 (setq _timestamp2 __timestamp2)) _timestamp2)
  (:pixels_normalized
   (&rest __pixels_normalized)
   (if (keywordp (car __pixels_normalized))
       (send* _pixels_normalized __pixels_normalized)
     (progn
       (if __pixels_normalized (setq _pixels_normalized (car __pixels_normalized)))
       _pixels_normalized)))
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:signal_ts
   (&optional __signal_ts)
   (if __signal_ts (setq _signal_ts __signal_ts)) _signal_ts)
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:fft_fs
   (&optional __fft_fs)
   (if __fft_fs (setq _fft_fs __fft_fs)) _fft_fs)
  (:fft
   (&optional __fft)
   (if __fft (setq _fft __fft)) _fft)
  (:serialization-length
   ()
   (+
    ;; time _timestamp1
    8
    ;; time _timestamp2
    8
    ;; duckietown_msgs/Vector2D _pixels_normalized
    (send _pixels_normalized :serialization-length)
    ;; float32 _frequency
    4
    ;; string _color
    4 (length _color)
    ;; float32 _confidence
    4
    ;; float64[] _signal_ts
    (* 8    (length _signal_ts)) 4
    ;; float32[] _signal
    (* 4    (length _signal)) 4
    ;; float32[] _fft_fs
    (* 4    (length _fft_fs)) 4
    ;; float32[] _fft
    (* 4    (length _fft)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _timestamp1
       (write-long (send _timestamp1 :sec) s) (write-long (send _timestamp1 :nsec) s)
     ;; time _timestamp2
       (write-long (send _timestamp2 :sec) s) (write-long (send _timestamp2 :nsec) s)
     ;; duckietown_msgs/Vector2D _pixels_normalized
       (send _pixels_normalized :serialize s)
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64[] _signal_ts
     (write-long (length _signal_ts) s)
     (dotimes (i (length _signal_ts))
       (sys::poke (elt _signal_ts i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float32[] _signal
     (write-long (length _signal) s)
     (dotimes (i (length _signal))
       (sys::poke (elt _signal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _fft_fs
     (write-long (length _fft_fs) s)
     (dotimes (i (length _fft_fs))
       (sys::poke (elt _fft_fs i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _fft
     (write-long (length _fft) s)
     (dotimes (i (length _fft))
       (sys::poke (elt _fft i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _timestamp1
     (send _timestamp1 :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _timestamp1 :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _timestamp2
     (send _timestamp2 :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _timestamp2 :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; duckietown_msgs/Vector2D _pixels_normalized
     (send _pixels_normalized :deserialize buf ptr-) (incf ptr- (send _pixels_normalized :serialization-length))
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64[] _signal_ts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _signal_ts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _signal_ts i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float32[] _signal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _signal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _signal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _fft_fs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fft_fs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _fft_fs i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _fft
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _fft (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _fft i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::LEDDetection :md5sum-) "d1ac8691d7a30e838dc372a724aee94b")
(setf (get duckietown_msgs::LEDDetection :datatype-) "duckietown_msgs/LEDDetection")
(setf (get duckietown_msgs::LEDDetection :definition-)
      "time timestamp1		# initial timestamp of the camera stream used 
time timestamp2		# final timestamp of the camera stream used 
Vector2D pixels_normalized
float32 frequency 
string color        # will be r, g or b 
float32 confidence  # some value of confidence for the detection (TBD)

# for debug/visualization
float64[] signal_ts
float32[] signal
float32[] fft_fs
float32[] fft

================================================================================
MSG: duckietown_msgs/Vector2D
float32 x
float32 y

")



(provide :duckietown_msgs/LEDDetection "d1ac8691d7a30e838dc372a724aee94b")


