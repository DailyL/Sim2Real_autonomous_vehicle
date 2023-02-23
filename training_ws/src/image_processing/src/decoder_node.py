#!/usr/bin/env python3

import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image, CompressedImage

from duckietown.dtros import DTROS, DTParam, NodeType, TopicType
from dt_class_utils import DTReminder


class DecoderNode(DTROS):
    def __init__(self, node_name):
        super().__init__(node_name, node_type=NodeType.PERCEPTION)

        # parameters
        self.publish_freq = DTParam("~publish_freq", -1)

        # utility objects
        self.bridge = CvBridge()
        self.reminder = DTReminder(frequency=self.publish_freq.value)

        # subscribers
        self.sub_img = rospy.Subscriber(
            "~image_in", CompressedImage, self.cb_image, queue_size=1, buff_size="10MB"
        )

        # publishers
        self.pub_img = rospy.Publisher(
            "~image_out",
            Image,
            queue_size=1,
            dt_topic_type=TopicType.PERCEPTION,
            dt_healthy_freq=self.publish_freq.value,
            dt_help="Raw image",
        )

    def cb_image(self, msg):
        # make sure this matters to somebody
        if not self.pub_img.anybody_listening():
            return
        # make sure the node is not switched off
        if not self.switch:
            return
        # make sure this is a good time to publish (always keep this as last check)
        if not self.reminder.is_time(frequency=self.publish_freq.value):
            return
        # turn 'compressed image message' into 'raw image'
        with self.profiler("/cb/image/decode"):
            img = self.bridge.compressed_imgmsg_to_cv2(msg)
        # turn 'raw image' into 'raw image message'
        with self.profiler("/cb/image/serialize"):
            out_msg = self.bridge.cv2_to_imgmsg(img, "bgr8")
        # maintain original header
        out_msg.header = msg.header
        # publish image
        self.pub_img.publish(out_msg)


if __name__ == "__main__":
    node = DecoderNode("decoder_node")
    rospy.spin()
