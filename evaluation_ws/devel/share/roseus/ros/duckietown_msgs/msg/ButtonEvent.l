;; Auto-generated. Do not edit!


(when (boundp 'duckietown_msgs::ButtonEvent)
  (if (not (find-package "DUCKIETOWN_MSGS"))
    (make-package "DUCKIETOWN_MSGS"))
  (shadow 'ButtonEvent (find-package "DUCKIETOWN_MSGS")))
(unless (find-package "DUCKIETOWN_MSGS::BUTTONEVENT")
  (make-package "DUCKIETOWN_MSGS::BUTTONEVENT"))

(in-package "ROS")
;;//! \htmlinclude ButtonEvent.msg.html


(intern "*EVENT_SINGLE_CLICK*" (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(shadow '*EVENT_SINGLE_CLICK* (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(defconstant duckietown_msgs::ButtonEvent::*EVENT_SINGLE_CLICK* 0)
(intern "*EVENT_HELD_3SEC*" (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(shadow '*EVENT_HELD_3SEC* (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(defconstant duckietown_msgs::ButtonEvent::*EVENT_HELD_3SEC* 10)
(intern "*EVENT_HELD_10SEC*" (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(shadow '*EVENT_HELD_10SEC* (find-package "DUCKIETOWN_MSGS::BUTTONEVENT"))
(defconstant duckietown_msgs::ButtonEvent::*EVENT_HELD_10SEC* 20)

(defun duckietown_msgs::ButtonEvent-to-symbol (const)
  (cond
        ((= const 0) 'duckietown_msgs::ButtonEvent::*EVENT_SINGLE_CLICK*)
        ((= const 10) 'duckietown_msgs::ButtonEvent::*EVENT_HELD_3SEC*)
        ((= const 20) 'duckietown_msgs::ButtonEvent::*EVENT_HELD_10SEC*)
        (t nil)))

(defclass duckietown_msgs::ButtonEvent
  :super ros::object
  :slots (_event ))

(defmethod duckietown_msgs::ButtonEvent
  (:init
   (&key
    ((:event __event) 0)
    )
   (send-super :init)
   (setq _event (round __event))
   self)
  (:event
   (&optional __event)
   (if __event (setq _event __event)) _event)
  (:serialization-length
   ()
   (+
    ;; uint8 _event
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _event
       (write-byte _event s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _event
     (setq _event (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get duckietown_msgs::ButtonEvent :md5sum-) "99a2e60dbe7b111394ec13b630081819")
(setf (get duckietown_msgs::ButtonEvent :datatype-) "duckietown_msgs/ButtonEvent")
(setf (get duckietown_msgs::ButtonEvent :definition-)
      "uint8 EVENT_SINGLE_CLICK = 0
uint8 EVENT_HELD_3SEC = 10
uint8 EVENT_HELD_10SEC = 20

uint8 event

")



(provide :duckietown_msgs/ButtonEvent "99a2e60dbe7b111394ec13b630081819")


