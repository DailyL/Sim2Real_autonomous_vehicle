import rospy
from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped
import numpy as np
import os
import cv2


class ROSAgent(object):
    def __init__(self):
        # Get the vehicle name, which comes in as HOSTNAME
        self.vehicle = os.getenv('HOSTNAME')

        # Subscribes to the output of the lane_controller_node and IK node
        self.action_sub = rospy.Subscriber('/{}/lane_controller_node/car_cmd'.format(
            self.vehicle), Twist2DStamped, self._action_cb)
        self.ik_action_sub = rospy.Subscriber('/{}/wheels_driver_node/wheels_cmd'.format(
            self.vehicle), WheelsCmdStamped, self._ik_action_cb)

        # Place holder for the action
        self.action = np.array([0, 0])

        # Publishes onto the corrected image topic
        # since image out of simulator is currently rectified
        self.cam_pub = rospy.Publisher('/{}/corrected_image/compressed'.format(
            self.vehicle), CompressedImage, queue_size=10)

        # Publisher for camera info - needed for the ground_projection
        self.cam_info_pub = rospy.Publisher('/{}/camera_node/camera_info'.format(
            self.vehicle), CameraInfo, queue_size=1)

        # Initializes the node
        rospy.init_node('ROSAgent')

        self.r = rospy.Rate(10)

    def _action_cb(self, msg):
        """
        Now Just for Debugging Purposes: No longer using heading/velocity - instead use vl / vr
        Callback to listen to last outputted action from lane_controller_node
        Stores it and sustains same action until new message published on topic
        """
        v = msg.v
        omega = msg.omega


    def _ik_action_cb(self, msg):
        """
        Callback to listen to last outputted action from lane_controller_node
        Stores it and sustains same action until new message published on topic
        """
        # THIS HAS BEEN CHANGED
        # vref = 0.22
        vl = msg.vel_left
        vr = msg.vel_right
        self.action = np.array([vl, vr]) # / vref

    def _publish_info(self):
        """
        Publishes a default CameraInfo - TODO: Fix after distortion applied in simulator
        """
        self.cam_info_pub.publish(CameraInfo())

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
            img, r , d, _ = self.sim.step(self.action)
            self._publish_img(img)
            self._publish_info()
            self.r.sleep()
