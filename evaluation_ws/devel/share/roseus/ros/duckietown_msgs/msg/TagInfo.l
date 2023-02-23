;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::TagInfo)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'TagInfo (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::TAGINFO")
  (make-package "DUCKIETOWN_MSGS::TAGINFO"))

(in-package "ROS")
;;//! \htmlinclude TagInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*S_NAME*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*S_NAME* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*S_NAME* 0)
(intern "*SIGN*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*SIGN* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*SIGN* 1)
(intern "*LIGHT*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*LIGHT* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*LIGHT* 2)
(intern "*LOCALIZE*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*LOCALIZE* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*LOCALIZE* 3)
(intern "*VEHICLE*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*VEHICLE* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*VEHICLE* 4)
(intern "*STOP*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*STOP* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*STOP* 5)
(intern "*YIELD*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*YIELD* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*YIELD* 6)
(intern "*NO_RIGHT_TURN*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*NO_RIGHT_TURN* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*NO_RIGHT_TURN* 7)
(intern "*NO_LEFT_TURN*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*NO_LEFT_TURN* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*NO_LEFT_TURN* 8)
(intern "*ONEWAY_RIGHT*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*ONEWAY_RIGHT* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*ONEWAY_RIGHT* 9)
(intern "*ONEWAY_LEFT*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*ONEWAY_LEFT* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*ONEWAY_LEFT* 10)
(intern "*FOUR_WAY*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*FOUR_WAY* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*FOUR_WAY* 11)
(intern "*RIGHT_T_INTERSECT*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*RIGHT_T_INTERSECT* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*RIGHT_T_INTERSECT* 12)
(intern "*LEFT_T_INTERSECT*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*LEFT_T_INTERSECT* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*LEFT_T_INTERSECT* 13)
(intern "*T_INTERSECTION*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*T_INTERSECTION* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*T_INTERSECTION* 14)
(intern "*DO_NOT_ENTER*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*DO_NOT_ENTER* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*DO_NOT_ENTER* 15)
(intern "*PEDESTRIAN*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*PEDESTRIAN* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*PEDESTRIAN* 16)
(intern "*T_LIGHT_AHEAD*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*T_LIGHT_AHEAD* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*T_LIGHT_AHEAD* 17)
(intern "*DUCK_CROSSING*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*DUCK_CROSSING* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*DUCK_CROSSING* 18)
(intern "*PARKING*" (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(shadow '*PARKING* (find-package "DUCKIETOWN_MSGS::TAGINFO"))
(defconstant duckietown_msgs::TagInfo::*PARKING* 19)

(defun duckietown_msgs::TagInfo-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::TagInfo::*S_NAME*)
        ((= const 1) 'duckietown_msgs::TagInfo::*SIGN*)
        ((= const 2) 'duckietown_msgs::TagInfo::*LIGHT*)
        ((= const 3) 'duckietown_msgs::TagInfo::*LOCALIZE*)
        ((= const 4) 'duckietown_msgs::TagInfo::*VEHICLE*)
        ((= const 5) 'duckietown_msgs::TagInfo::*STOP*)
        ((= const 6) 'duckietown_msgs::TagInfo::*YIELD*)
        ((= const 7) 'duckietown_msgs::TagInfo::*NO_RIGHT_TURN*)
        ((= const 8) 'duckietown_msgs::TagInfo::*NO_LEFT_TURN*)
        ((= const 9) 'duckietown_msgs::TagInfo::*ONEWAY_RIGHT*)
        ((= const 10) 'duckietown_msgs::TagInfo::*ONEWAY_LEFT*)
        ((= const 11) 'duckietown_msgs::TagInfo::*FOUR_WAY*)
        ((= const 12) 'duckietown_msgs::TagInfo::*RIGHT_T_INTERSECT*)
        ((= const 13) 'duckietown_msgs::TagInfo::*LEFT_T_INTERSECT*)
        ((= const 14) 'duckietown_msgs::TagInfo::*T_INTERSECTION*)
        ((= const 15) 'duckietown_msgs::TagInfo::*DO_NOT_ENTER*)
        ((= const 16) 'duckietown_msgs::TagInfo::*PEDESTRIAN*)
        ((= const 17) 'duckietown_msgs::TagInfo::*T_LIGHT_AHEAD*)
        ((= const 18) 'duckietown_msgs::TagInfo::*DUCK_CROSSING*)
        ((= const 19) 'duckietown_msgs::TagInfo::*PARKING*)
        (t nil)))

(defclass duckietown_msgs::TagInfo
  :super ros::object
  :slots (_header _id _tag_type _street_name _traffic_sign_type _vehicle_name _location ))

(defmethod duckietown_msgs::TagInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:tag_type __tag_type) 0)
    ((:street_name __street_name) "")
    ((:traffic_sign_type __traffic_sign_type) 0)
    ((:vehicle_name __vehicle_name) "")
    ((:location __location) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _tag_type (round __tag_type))
   (setq _street_name (string __street_name))
   (setq _traffic_sign_type (round __traffic_sign_type))
   (setq _vehicle_name (string __vehicle_name))
   (setq _location (float __location))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:tag_type
   (&optional __tag_type)
   (if __tag_type (setq _tag_type __tag_type)) _tag_type)
  (:street_name
   (&optional __street_name)
   (if __street_name (setq _street_name __street_name)) _street_name)
  (:traffic_sign_type
   (&optional __traffic_sign_type)
   (if __traffic_sign_type (setq _traffic_sign_type __traffic_sign_type)) _traffic_sign_type)
  (:vehicle_name
   (&optional __vehicle_name)
   (if __vehicle_name (setq _vehicle_name __vehicle_name)) _vehicle_name)
  (:location
   (&optional __location)
   (if __location (setq _location __location)) _location)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _id
    4
    ;; uint8 _tag_type
    1
    ;; string _street_name
    4 (length _street_name)
    ;; uint8 _traffic_sign_type
    1
    ;; string _vehicle_name
    4 (length _vehicle_name)
    ;; float32 _location
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _id
       (write-long _id s)
     ;; uint8 _tag_type
       (write-byte _tag_type s)
     ;; string _street_name
       (write-long (length _street_name) s) (princ _street_name s)
     ;; uint8 _traffic_sign_type
       (write-byte _traffic_sign_type s)
     ;; string _vehicle_name
       (write-long (length _vehicle_name) s) (princ _vehicle_name s)
     ;; float32 _location
       (sys::poke _location (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _tag_type
     (setq _tag_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _street_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _street_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _traffic_sign_type
     (setq _traffic_sign_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _vehicle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vehicle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _location
     (setq _location (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get duckietown_msgs::TagInfo :md5sum-) "d194db19dc43ddeaa93486d02f120934")
(setf (get duckietown_msgs::TagInfo :datatype-) "duckietown_msgs/TagInfo")
(setf (get duckietown_msgs::TagInfo :definition-)
      "Header header
int32 id

#(StreetName, TrafficSign, Localization, Vehicle)
uint8 tag_type

uint8 S_NAME=0
uint8 SIGN=1	
uint8 LIGHT=2
uint8 LOCALIZE=3
uint8 VEHICLE=4

string street_name

uint8 traffic_sign_type
# (12 possible traffic sign types)

uint8 STOP=5
uint8 YIELD=6
uint8 NO_RIGHT_TURN=7
uint8 NO_LEFT_TURN=8
uint8 ONEWAY_RIGHT=9
uint8 ONEWAY_LEFT=10
uint8 FOUR_WAY=11
uint8 RIGHT_T_INTERSECT=12
uint8 LEFT_T_INTERSECT=13
uint8 T_INTERSECTION=14
uint8 DO_NOT_ENTER=15
uint8 PEDESTRIAN=16
uint8 T_LIGHT_AHEAD=17
uint8 DUCK_CROSSING=18
uint8 PARKING=19

string vehicle_name

# Just added a single number for location. Probably want to use Vector2D.msg, but I get errors when I try to add it.
float32 location

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



(provide :duckietown_msgs/TagInfo "d194db19dc43ddeaa93486d02f120934")


