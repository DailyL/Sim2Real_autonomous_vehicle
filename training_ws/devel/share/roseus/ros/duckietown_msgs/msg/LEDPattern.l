;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LEDPattern)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LEDPattern (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LEDPATTERN")
  (make-package "DUCKIETOWN_MSGS::LEDPATTERN"))

(in-package "ROS")
;;//! \htmlinclude LEDPattern.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass duckietown_msgs::LEDPattern
  :super ros::object
  :slots (_header _color_list _rgb_vals _color_mask _frequency _frequency_mask ))

(defmethod duckietown_msgs::LEDPattern
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:color_list __color_list) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:rgb_vals __rgb_vals) ())
    ((:color_mask __color_mask) (make-array 0 :initial-element 0 :element-type :integer))
    ((:frequency __frequency) 0.0)
    ((:frequency_mask __frequency_mask) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _color_list __color_list)
   (setq _rgb_vals __rgb_vals)
   (setq _color_mask __color_mask)
   (setq _frequency (float __frequency))
   (setq _frequency_mask __frequency_mask)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:color_list
   (&optional __color_list)
   (if __color_list (setq _color_list __color_list)) _color_list)
  (:rgb_vals
   (&rest __rgb_vals)
   (if (keywordp (car __rgb_vals))
       (send* _rgb_vals __rgb_vals)
     (progn
       (if __rgb_vals (setq _rgb_vals (car __rgb_vals)))
       _rgb_vals)))
  (:color_mask
   (&optional __color_mask)
   (if __color_mask (setq _color_mask __color_mask)) _color_mask)
  (:frequency
   (&optional __frequency)
   (if __frequency (setq _frequency __frequency)) _frequency)
  (:frequency_mask
   (&optional __frequency_mask)
   (if __frequency_mask (setq _frequency_mask __frequency_mask)) _frequency_mask)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _color_list
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _color_list)) 4
    ;; std_msgs/ColorRGBA[] _rgb_vals
    (apply #'+ (send-all _rgb_vals :serialization-length)) 4
    ;; int8[] _color_mask
    (* 1    (length _color_mask)) 4
    ;; float32 _frequency
    4
    ;; int8[] _frequency_mask
    (* 1    (length _frequency_mask)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _color_list
     (write-long (length _color_list) s)
     (dolist (elem _color_list)
       (write-long (length elem) s) (princ elem s)
       )
     ;; std_msgs/ColorRGBA[] _rgb_vals
     (write-long (length _rgb_vals) s)
     (dolist (elem _rgb_vals)
       (send elem :serialize s)
       )
     ;; int8[] _color_mask
     (write-long (length _color_mask) s)
     (dotimes (i (length _color_mask))
       (write-byte (elt _color_mask i) s)
       )
     ;; float32 _frequency
       (sys::poke _frequency (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8[] _frequency_mask
     (write-long (length _frequency_mask) s)
     (dotimes (i (length _frequency_mask))
       (write-byte (elt _frequency_mask i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _color_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _color_list (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _color_list i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; std_msgs/ColorRGBA[] _rgb_vals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rgb_vals (let (r) (dotimes (i n) (push (instance std_msgs::ColorRGBA :init) r)) r))
     (dolist (elem- _rgb_vals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int8[] _color_mask
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _color_mask (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _color_mask i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _color_mask i) 127) (setf (elt _color_mask i) (- (elt _color_mask i) 256)))
     ))
   ;; float32 _frequency
     (setq _frequency (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8[] _frequency_mask
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _frequency_mask (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _frequency_mask i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _frequency_mask i) 127) (setf (elt _frequency_mask i) (- (elt _frequency_mask i) 256)))
     ))
   ;;
   self)
  )

(setf (get duckietown_msgs::LEDPattern :md5sum-) "47c8633688bbd1c94b1e15be083240b6")
(setf (get duckietown_msgs::LEDPattern :datatype-) "duckietown_msgs/LEDPattern")
(setf (get duckietown_msgs::LEDPattern :definition-)
      "Header header
string[]  color_list
std_msgs/ColorRGBA[]  rgb_vals
int8[]    color_mask
float32   frequency
int8[]    frequency_mask

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

================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

")



(provide :duckietown_msgs/LEDPattern "47c8633688bbd1c94b1e15be083240b6")


