#!/usr/bin/env python
import gym_duckietown
from gym_duckietown.envs import DuckietownEnv

import rospy
from rospy.core import loginfo

from sensor_msgs.msg import CompressedImage, CameraInfo

from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped

import cv2

import numpy as np


class GymEnvNode(object):
    def __init__(self):
        super(GymEnvNode, self).__init__(
            node_name="gym_root", node_type=NodeType.GENERIC)
        self.env = DuckietownEnv(
            seed=123,
            map_name="loop_empty",
            max_steps=500001,
            domain_rand=0,
            camera_width=640,
            camera_height=480,
            accept_start_angle_deg=4,
            full_transparency=True,
            distortion=False
        )

        self.action = [0.0, 0.0]

        self.image_pub = rospy.Publisher(
            "camera/image/compressed", CompressedImage, queue_size=1)

        self.cam_info_pub = rospy.Publisher('camera_node/camera_info', CameraInfo, queue_size=1)

        self.wheel_sub = rospy.Subscriber("joy_mapper/car_cmd", Twist2DStamped, self.cmd_callback, queue_size=1)

    def cmd_callback(self, msg):
        v = msg.v
        omega = msg.omega

        self.action = np.array([v, omega])


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
  
        self.image_pub.publish(img_msg)



    def run(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            rospy.loginfo("Updating environment")
            observation, reward, done, misc = self.env.step(self.action)
            #image_np = cv2.imdecode(observation, cv2.IMREAD_COLOR)
            self._publish_img(observation)
            self._publish_info()

            if done:
                self.env.reset()
            rate.sleep()


if __name__ == '__main__':
    node = GymEnvNode()
    node.run()
    rospy.spin()
