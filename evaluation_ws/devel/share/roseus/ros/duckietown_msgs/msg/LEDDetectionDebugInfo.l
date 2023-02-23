;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::LEDDetectionDebugInfo)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'LEDDetectionDebugInfo (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::LEDDETECTIONDEBUGINFO")
  (make-package "DUCKIETOWN_MSGS::LEDDETECTIONDEBUGINFO"))

(in-package "ROS")
;;//! \htmlinclude LEDDetectionDebugInfo.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass duckietown_msgs::LEDDetectionDebugInfo
  :super ros::object
  :slots (_state _capture_progress _cell_size _crop_rect_norm _variance_map _candidates _led_all_unfiltered ))

(defmethod duckietown_msgs::LEDDetectionDebugInfo
  (:init
   (&key
    ((:state __state) 0)
    ((:capture_progress __capture_progress) 0.0)
    ((:cell_size __cell_size) (make-array 2 :initial-element 0 :element-type :integer))
    ((:crop_rect_norm __crop_rect_norm) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:variance_map __variance_map) (instance sensor_msgs::CompressedImage :init))
    ((:candidates __candidates) ())
    ((:led_all_unfiltered __led_all_unfiltered) (instance duckietown_msgs::LEDDetectionArray :init))
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _capture_progress (float __capture_progress))
   (setq _cell_size __cell_size)
   (setq _crop_rect_norm __crop_rect_norm)
   (setq _variance_map __variance_map)
   (setq _candidates __candidates)
   (setq _led_all_unfiltered __led_all_unfiltered)
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:capture_progress
   (&optional __capture_progress)
   (if __capture_progress (setq _capture_progress __capture_progress)) _capture_progress)
  (:cell_size
   (&optional __cell_size)
   (if __cell_size (setq _cell_size __cell_size)) _cell_size)
  (:crop_rect_norm
   (&optional __crop_rect_norm)
   (if __crop_rect_norm (setq _crop_rect_norm __crop_rect_norm)) _crop_rect_norm)
  (:variance_map
   (&rest __variance_map)
   (if (keywordp (car __variance_map))
       (send* _variance_map __variance_map)
     (progn
       (if __variance_map (setq _variance_map (car __variance_map)))
       _variance_map)))
  (:candidates
   (&rest __candidates)
   (if (keywordp (car __candidates))
       (send* _candidates __candidates)
     (progn
       (if __candidates (setq _candidates (car __candidates)))
       _candidates)))
  (:led_all_unfiltered
   (&rest __led_all_unfiltered)
   (if (keywordp (car __led_all_unfiltered))
       (send* _led_all_unfiltered __led_all_unfiltered)
     (progn
       (if __led_all_unfiltered (setq _led_all_unfiltered (car __led_all_unfiltered)))
       _led_all_unfiltered)))
  (:serialization-length
   ()
   (+
    ;; uint8 _state
    1
    ;; float32 _capture_progress
    4
    ;; uint32[2] _cell_size
    (* 4    2)
    ;; float32[4] _crop_rect_norm
    (* 4    4)
    ;; sensor_msgs/CompressedImage _variance_map
    (send _variance_map :serialization-length)
    ;; duckietown_msgs/Vector2D[] _candidates
    (apply #'+ (send-all _candidates :serialization-length)) 4
    ;; duckietown_msgs/LEDDetectionArray _led_all_unfiltered
    (send _led_all_unfiltered :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _state
       (write-byte _state s)
     ;; float32 _capture_progress
       (sys::poke _capture_progress (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32[2] _cell_size
     (dotimes (i 2)
       (write-long (elt _cell_size i) s)
       )
     ;; float32[4] _crop_rect_norm
     (dotimes (i 4)
       (sys::poke (elt _crop_rect_norm i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; sensor_msgs/CompressedImage _variance_map
       (send _variance_map :serialize s)
     ;; duckietown_msgs/Vector2D[] _candidates
     (write-long (length _candidates) s)
     (dolist (elem _candidates)
       (send elem :serialize s)
       )
     ;; duckietown_msgs/LEDDetectionArray _led_all_unfiltered
       (send _led_all_unfiltered :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _capture_progress
     (setq _capture_progress (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32[2] _cell_size
   (dotimes (i (length _cell_size))
     (setf (elt _cell_size i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;; float32[4] _crop_rect_norm
   (dotimes (i (length _crop_rect_norm))
     (setf (elt _crop_rect_norm i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; sensor_msgs/CompressedImage _variance_map
     (send _variance_map :deserialize buf ptr-) (incf ptr- (send _variance_map :serialization-length))
   ;; duckietown_msgs/Vector2D[] _candidates
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _candidates (let (r) (dotimes (i n) (push (instance duckietown_msgs::Vector2D :init) r)) r))
     (dolist (elem- _candidates)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; duckietown_msgs/LEDDetectionArray _led_all_unfiltered
     (send _led_all_unfiltered :deserialize buf ptr-) (incf ptr- (send _led_all_unfiltered :serialization-length))
   ;;
   self)
  )

(setf (get duckietown_msgs::LEDDetectionDebugInfo :md5sum-) "be212adc91f6527a99fc828df2018200")
(setf (get duckietown_msgs::LEDDetectionDebugInfo :datatype-) "duckietown_msgs/LEDDetectionDebugInfo")
(setf (get duckietown_msgs::LEDDetectionDebugInfo :definition-)
      "uint8 state # 0: idle, 1: capturing, 2: processing
float32 capture_progress

uint32[2] cell_size
float32[4] crop_rect_norm

sensor_msgs/CompressedImage variance_map
Vector2D[] candidates

LEDDetectionArray led_all_unfiltered

================================================================================
MSG: sensor_msgs/CompressedImage
# This message contains a compressed image

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image

string format        # Specifies the format of the data
                     #   Acceptable values:
                     #     jpeg, png
uint8[] data         # Compressed image buffer

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
MSG: duckietown_msgs/Vector2D
float32 x
float32 y

================================================================================
MSG: duckietown_msgs/LEDDetectionArray
LEDDetection[] detections
================================================================================
MSG: duckietown_msgs/LEDDetection
time timestamp1		# initial timestamp of the camera stream used 
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

")



(provide :duckietown_msgs/LEDDetectionDebugInfo "be212adc91f6527a99fc828df2018200")


