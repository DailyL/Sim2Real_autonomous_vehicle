#!/usr/bin/env python3
import sys

import cv2

import rospy
from cv_bridge import CvBridge
from duckietown_msgs.msg import Vector2D
from sensor_msgs.msg import Image


def mouse_cb(event, x, y, flags, param):
    if event == cv2.EVENT_LBUTTONDOWN:
        w, h = param
        normalized_uv = Vector2D()
        normalized_uv.x = float(x) / float(w)
        normalized_uv.y = float(y) / float(h)

        print(f"image coordinate: ({x}, {y})")
        print(f"normalized image coordinate: ({normalized_uv.x}, {normalized_uv.y})")


def get_image_topic_name(veh):
    # image_topic_name = veh + "/camera_node/image_rect"
    # try:
    #  rospy.wait_for_message(image_topic_name, Image, timeout=3)
    #  return image_topic_name
    # except rospy.ROSException, e:
    #  print "%s" % e

    image_topic_name = veh + "/camera_node/image/raw"
    try:
        rospy.wait_for_message(image_topic_name, Image, timeout=5)
        return image_topic_name
    except rospy.ROSException as e:
        print(f"{e}")
        # XXX: raise error

    return None


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(("usage: " + sys.argv[0] + " vehicle name"))
        sys.exit(1)

    param = sys.argv[1]
    param = param.replace("veh:=", "")
    print(f"Using vehicle name {param!r}.")
    veh = "/" + param

    bridge = CvBridge()

    rospy.init_node("annotate_rosbag")
    print("please click the image to look up the pixel coordinate")
    print("press 'ESC' key to exit")

    cv2.namedWindow("image")
    cv2.setMouseCallback("image", mouse_cb, param=(640, 480))
    key = 0

    image_topic_name = get_image_topic_name(veh)
    print("image topic name: " + image_topic_name)

    if image_topic_name is not None:
        while key is not 27:
            img = rospy.wait_for_message(image_topic_name, Image)
            cv2image = bridge.imgmsg_to_cv2(img, "rgb8")
            cv2.imshow("image", cv2image)
            key = cv2.waitKey(2)
