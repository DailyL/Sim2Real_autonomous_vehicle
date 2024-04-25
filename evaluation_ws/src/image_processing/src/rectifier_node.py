#!/usr/bin/env python3

import cv2
import rospy
import numpy as np
from image_geometry import PinholeCameraModel
from sensor_msgs.msg import CompressedImage, CameraInfo

from duckietown.dtros import DTROS, DTParam, NodeType, TopicType
from dt_class_utils import DTReminder
from turbojpeg import TurboJPEG


class RectifierNode(DTROS):
    def __init__(self, node_name):
        super().__init__(node_name, node_type=NodeType.PERCEPTION)

        # parameters
        self.publish_freq = DTParam("~publish_freq", -1)
        self.alpha = DTParam("~alpha", 0.0)

        # utility objects
        self.jpeg = TurboJPEG()
        self.reminder = DTReminder(frequency=self.publish_freq.value)
        self.camera_model = None
        self.rect_camera_info = None
        self.mapx, self.mapy = None, None

        # subscribers
        self.sub_img = rospy.Subscriber(
            "~image_in", CompressedImage, self.cb_image, queue_size=1, buff_size="10MB"
        )
        self.sub_camera_info = rospy.Subscriber(
            "~camera_info_in", CameraInfo, self.cb_camera_info, queue_size=1
        )

        # publishers
        self.pub_img = rospy.Publisher(
            "~image/compressed",
            CompressedImage,
            queue_size=1,
            dt_topic_type=TopicType.PERCEPTION,
            dt_healthy_freq=self.publish_freq.value,
            dt_help="Rectified image (i.e., image with no distortion effects from the lens).",
        )
        self.pub_camera_info = rospy.Publisher(
            "~camera_info",
            CameraInfo,
            queue_size=1,
            dt_topic_type=TopicType.PERCEPTION,
            dt_healthy_freq=self.publish_freq.value,
            dt_help="Camera parameters for the (virtual) rectified camera.",
        )

    def cb_camera_info(self, msg):
        # unsubscribe from camera_info
        self.loginfo("Camera info message received. Unsubscribing from camera_info topic.")
        # noinspection PyBroadException
        try:
            self.sub_camera_info.shutdown()
        except BaseException:
            pass
        # ---
        H, W = msg.height, msg.width
        # create new camera info
        self.camera_model = PinholeCameraModel()
        self.camera_model.fromCameraInfo(msg)
        # find optimal rectified pinhole camera
        with self.profiler("/cb/camera_info/get_optimal_new_camera_matrix"):
            rect_camera_K, _ = cv2.getOptimalNewCameraMatrix(
                self.camera_model.K, self.camera_model.D, (W, H), self.alpha.value
            )
        # create rectification map
        with self.profiler("/cb/camera_info/init_undistort_rectify_map"):
            self.mapx, self.mapy = cv2.initUndistortRectifyMap(
                self.camera_model.K, self.camera_model.D, None, rect_camera_K, (W, H), cv2.CV_32FC1
            )
        # pack rectified camera info into a CameraInfo message
        self.rect_camera_info = CameraInfo(
            width=W,
            height=H,
            K=rect_camera_K.flatten().tolist(),
            R=np.eye(3).flatten().tolist(),
            P=np.zeros((3, 4)).flatten().tolist(),
        )

    def cb_image(self, msg):
        # make sure this matters to somebody
        if not self.pub_img.anybody_listening() and not self.pub_camera_info.anybody_listening():
            return
        # make sure we have a map to use
        if self.mapx is None or self.mapy is None:
            return
        # make sure the node is not switched off
        if not self.switch:
            return
        # make sure this is a good time to publish (always keep this as last check)
        if not self.reminder.is_time(frequency=self.publish_freq.value):
            return
        # turn 'compressed distorted image message' into 'raw distorted image'
        with self.profiler("/cb/image/decode"):
            dist_img = self.jpeg.decode(msg.data)
        # run input image through the lens map
        with self.profiler("/cb/image/rectify"):
            rect_img = cv2.remap(dist_img, self.mapx, self.mapy, cv2.INTER_NEAREST)
        # turn 'raw rectified image' into 'compressed rectified image message'
        with self.profiler("/cb/image/encode"):
            # rect_img_msg = self.bridge.cv2_to_compressed_imgmsg(rect_img)
            rect_img_msg = CompressedImage(format="jpeg", data=self.jpeg.encode(rect_img))
        # maintain original header
        rect_img_msg.header.stamp = msg.header.stamp
        rect_img_msg.header.frame_id = msg.header.frame_id
        self.rect_camera_info.header.stamp = msg.header.stamp
        self.rect_camera_info.header.frame_id = msg.header.frame_id
        # publish image
        self.pub_img.publish(rect_img_msg)
        # publish camera info
        self.pub_camera_info.publish(self.rect_camera_info)


if __name__ == "__main__":
    node = RectifierNode("rectifier_node")
    rospy.spin()
