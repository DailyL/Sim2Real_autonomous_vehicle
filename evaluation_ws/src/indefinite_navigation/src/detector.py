#!/usr/bin/env python3
import cv2
import numpy as np

import rospy

# from duckietown_msgs.msg import ObstacleImageDetection, ObstacleImageDetectionList, ObstacleType, Rect,
# BoolStamped
from count_turns import TurnCounter
from cv_bridge import CvBridge
from sensor_msgs.msg import CompressedImage, Image
from std_msgs.msg import Bool, Float32


class Matcher:
    STOP1 = [np.array(x, np.uint8) for x in [[0, 140, 100], [15, 255, 255]]]
    STOP2 = [np.array(x, np.uint8) for x in [[165, 140, 100], [180, 255, 255]]]
    LINE = [np.array(x, np.uint8) for x in [[25, 100, 150], [35, 255, 255]]]

    def get_filtered_contours(self, img, contour_type):
        hsv_img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

        if contour_type == "STOP1":
            frame_threshed = cv2.inRange(hsv_img, self.STOP1[0], self.STOP1[1])
            ret, thresh = cv2.threshold(frame_threshed, 22, 255, 0)
        elif contour_type == "STOP2":
            frame_threshed = cv2.inRange(hsv_img, self.STOP2[0], self.STOP2[1])
            ret, thresh = cv2.threshold(frame_threshed, 22, 255, 0)
        elif contour_type == "LINE":
            frame_threshed = cv2.inRange(hsv_img, self.LINE[0], self.LINE[1])
            ret, thresh = cv2.threshold(frame_threshed, 35, 255, 0)
        else:
            return []

        filtered_contours = []

        contours, hierarchy = cv2.findContours(thresh, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)
        contour_area = [(cv2.contourArea(c), (c)) for c in contours]
        contour_area = sorted(contour_area, reverse=True, key=lambda x: x[0])

        height, width = img.shape[:2]
        for (area, (cnt)) in contour_area:
            # plot box around contour
            x, y, w, h = cv2.boundingRect(cnt)
            box = (x, y, w, h)
            d = 0.5 * (x - width / 2) ** 2 + (y - height) ** 2
            if not (h > 15 and w > 15 and d < 120000):
                continue
            mask = np.zeros(thresh.shape, np.uint8)
            cv2.drawContours(mask, [cnt], 0, 255, -1)
            mean_val = cv2.mean(img, mask=mask)
            aspect_ratio = float(w) / h
            filtered_contours.append((area, (cnt, box, d, aspect_ratio, mean_val, area)))
        return filtered_contours

    def contour_match(self, img):
        """
        Returns 1. Image with bounding boxes added
                2. an ObstacleImageDetectionList
        """

        height, width = img.shape[:2]
        cv2.rectangle(img, (0, 0), (width, height / 3), (0, 0, 0), thickness=-5)
        cv2.rectangle(img, (0, 0), (width / 5, height), (0, 0, 0), thickness=-5)
        cv2.rectangle(img, (4 * width / 5, 0), (width, height), (0, 0, 0), thickness=-5)

        # get filtered contours
        stop1 = self.get_filtered_contours(img, "STOP1")
        stop2 = self.get_filtered_contours(img, "STOP2")
        line = self.get_filtered_contours(img, "LINE")

        all_contours = stop1 + stop2
        all_contours = sorted(all_contours, reverse=True, key=lambda x: x[0])

        i = 0
        center = -1
        if len(all_contours) > 0:
            area, (cnt, box, ds, aspect_ratio, mean_color, area) = all_contours[0]

            # plot box around contour
            x, y, w, h = box
            font = cv2.FONT_HERSHEY_SIMPLEX
            cv2.putText(img, "stop line", (x, y), font, 0.5, mean_color, 4)
            cv2.rectangle(img, (x, y), (x + w, y + h), mean_color, 2)

            # center =  (x + w ) /float(width)

            test = x + w

        if len(all_contours) > 0 and len(line) > 0:
            for area, (cnt, box, ds, aspect_ratio, mean_color, area) in line:

                # plot box around contour
                x, y, w, h = box
                font = cv2.FONT_HERSHEY_SIMPLEX
                val = (test - x) / float(w)
                if abs(val) > 0.75:
                    continue

                # cv2.putText(img,"%s" % val, (x,y), font, 1.0, (255)*3 ,4)
                cv2.putText(img, "servo line", (x, y), font, 0.5, mean_color, 4)
                cv2.rectangle(img, (x, y), (x + w, y + h), mean_color, 2)

                center = (x + w) / float(width)
                break

        return img, center


class StaticObjectDetectorNode:
    def __init__(self):
        self.name = "static_object_detector_node"

        self.tm = Matcher()
        self.active = False
        self.turn_counter = TurnCounter()

        self.pub_ibvs = rospy.Publisher("~ibvs", Float32, queue_size=1)
        self.sub_image = rospy.Subscriber(
            "~image_compressed", CompressedImage, self.processImage, buff_size=921600, queue_size=1
        )
        self.pub_image = rospy.Publisher("~servo_image", Image, queue_size=1)
        self.pub_turns = rospy.Publisher("~turned", Bool, queue_size=1)
        self.bridge = CvBridge()

        rospy.loginfo(f"[{self.name}] Initialized.")

    def cbSwitch(self, switch_msg):
        self.active = switch_msg.data

    def processImage(self, image_msg):
        np_arr = np.fromstring(image_msg.data, np.uint8)
        # image_cv=self.bridge.imgmsg_to_cv2(image_msg,"bgr8")
        image_cv = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

        img, center = self.tm.contour_match(image_cv)
        crossing, turns = self.turn_counter.cbmsg(center)
        if crossing:
            # only trigger if it's been awhile
            rospy.loginfo(f"Crossing.  {turns} turn")
            self.pub_turns.publish(Bool(data=True))
        self.pub_ibvs.publish(Float32(data=center))

        height, width = img.shape[:2]
        """
        try:
            self.pub_image.publish(self.bridge.cv2_to_imgmsg(img, "bgr8"))
        except CvBridgeError as e:
            print(e)
        """


if __name__ == "__main__":
    rospy.init_node("arii")
    node = StaticObjectDetectorNode()
    rospy.spin()
