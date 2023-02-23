#!/usr/bin/env python
import rospy
from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped, LanePose, VehicleCorners
import numpy as np
import os
import cv2
from cv_bridge import CvBridge, CvBridgeError
from env import launch_env

class ROSAgent(object):
    def __init__(self):
        # Get the vehicle name, which comes in as HOSTNAME
        self.vehicle = 'david'

        # Use our env launcher
        self.env = launch_env()

        # Subscribes to the output of RL agent
        self.action_sub = rospy.Subscriber("/" + self.vehicle + "/car_cmd", Twist2DStamped, self._action_cb)
        
        
        # Place holder for the action
        self.action = np.array([0, 0])

        # Subscribes to the lane pose from lane pose node
        self.lane_pose_sub = rospy.Subscriber("~lane_pose", LanePose, self.lane_pose_callback, queue_size=1)

        # Subscribes to the vehicle decection from detection node
        self.vehicle_detection_sub = rospy.Subscriber("~centers", VehicleCorners, self.cb_process_centers, queue_size=1)

        # Publishes onto the corrected image topic 
        # since image out of simulator is currently rectified
        self.cam_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/image/raw/compressed", CompressedImage, queue_size=10)
        
        # Publisher for camera info - needed for the ground_projection
        self.cam_info_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/camera_info", CameraInfo, queue_size=1)


        # K - Intrinsic camera matrix for the raw (distorted) images.
        self.camera_matrix = [
            305.5718893575089,
            0,
            303.0797142544728,
            0,
            308.8338858195428,
            231.8845403702499,
            0,
            0,
            1,
        ]
        # D Intrinsic camera matrix for the raw (distorted) images.
        self.distortion_coefs = [-0.2944667743901807, 0.0701431287084318, 0.0005859930422629722, -0.0006697840226199427, 0.0]

        # P Projection/camera matrix

        self.projection = [
            220.2460277141687, 0.0, 301.8668918355899, 0.0,
            0.0, 238.6758484095299, 227.0880056118307, 0.0,
            0.0, 0.0, 1.0, 0.0]




        self.bridge = CvBridge()

        self.pattern = np.zeros((21,2))


        

        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(50)



    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            pass



    def cb_process_centers(self, vehicle_centers_msg):
        """
        Callback that processes a back pattern detection. If no detection was made, publishes a dummy stop
        line message.

        Args:
            vehicle_centers_msg (:obj:`duckietown_msgs.msg.VehicleCorners`): Detected pattern (if any)

        """

        # check if there actually was a detection
        i = 0 
        detection = vehicle_centers_msg.detection.data
        if detection:
            for point in vehicle_centers_msg.corners:

                self.pattern[i, 0] = point.x
                self.pattern[i, 1]= point.y
                i += 1

        else:
            self.pattern = np.zeros((21,2))




    def _action_cb(self, msg):
        """
        Callback to listen to RL agent
        Stores it and sustains same action until new message published on topic
        """
        v = msg.v
        omega = msg.omega

        self.action = np.array([v, omega])
    
    def _publish_info(self):
        """
        Publishes a default CameraInfo - TODO: Fix after distortion applied in simulator
        """

        cam_info = CameraInfo()
        time = rospy.get_rostime()
        cam_info.header.stamp.secs = time.secs
        cam_info.header.stamp.nsecs = time.nsecs
        cam_info.height = self.env.camera_height
        cam_info.width = self.env.camera_width
        cam_info.distortion_model = "plumb_bob"
        cam_info.D = self.distortion_coefs
        cam_info.K = self.camera_matrix
        cam_info.R = [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
        cam_info.P = self.projection
        cam_info.binning_x = 0 
        cam_info.binning_y = 0
        cam_info.roi.x_offset = 0
        cam_info.roi.y_offset = 0
        cam_info.roi.height = 0
        cam_info.roi.width = 0
        cam_info.roi.do_rectify = False


        self.cam_info_pub.publish(cam_info)      

    def _publish_img(self, obs):
        """
        Publishes the image to the compressed_image topic, which triggers the lane following loop
        """
        img_msg = CompressedImage()

        time = rospy.get_rostime()
        img_msg.header.stamp.secs = time.secs
        img_msg.header.stamp.nsecs = time.nsecs

        img_msg.format = "jpeg"

        contig = cv2.cvtColor(np.ascontiguousarray(obs), cv2.COLOR_BGR2RGB)

        
        img_msg.data = np.array(cv2.imencode('.jpg', contig)[1]).tostring()





  
        self.cam_pub.publish(img_msg)    

    def spin(self):
        """
        Main loop
        Steps the sim with the last action at rate of 10Hz
        """
        while not rospy.is_shutdown():
            img, r , d, _ = self.env.step(self.action)
            print(_)
            self.env.render()
            if d:
                self.env.reset()
            self._publish_img(img)
            self._publish_info()
            self.r.sleep()

if __name__ == "__main__":
    # Initializes the node
    rospy.init_node('ROSAgent')
    r = ROSAgent()
    r.spin()

