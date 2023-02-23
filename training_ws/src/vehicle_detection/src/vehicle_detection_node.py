#!/usr/bin/env python3

import cv2

import rospy
from cv_bridge import CvBridge
from duckietown.dtros import DTParam, DTROS, NodeType, ParamType
from duckietown_msgs.msg import BoolStamped, VehicleCorners
from geometry_msgs.msg import Point32
from sensor_msgs.msg import CompressedImage


class VehicleDetectionNode(DTROS):
    """
    This node detects if there is another Duckiebot in the image. This is done by recognizing the pattern of circles on
    the back of every robot.

    Args:
        node_name (:obj:`str`): a unique, descriptive name for the node that ROS will use

    Configuration:
        ~process_frequency (:obj:`float`): Frequency at which to process the incoming images
        ~circlepattern_dims (:obj:`list` of `int`): Number of dots in the pattern, two elements: [number of columns, number of rows]
        ~blobdetector_min_area (:obj:`int`): Parameter for the blob detector, passed to `SimpleBlobDetector <https://docs.opencv.org/4.3.0/d0/d7a/classcv_1_1SimpleBlobDetector.html>`_
        ~blobdetector_min_dist_between_blobs (:obj:`str`): Parameter for the blob detector, passed to `SimpleBlobDetector <https://docs.opencv.org/4.3.0/d0/d7a/classcv_1_1SimpleBlobDetector.html>`_

    Subscriber:
        ~image (:obj:`sensor_msgs.msg.CompressedImage`): Input image

    Publishers:
        ~centers (:obj:`duckietown_msgs.msg.VehicleCorners`): Detected pattern (if any)
        ~debug/detection_image/compressed (:obj:`sensor_msgs.msg.CompressedImage`): Debug image that shows the detected pattern
        ~detection (:obj:`boolStamped`): Vehicle Detection Flag
    """

    def __init__(self, node_name):

        # Initialize the DTROS parent class
        super(VehicleDetectionNode, self).__init__(node_name=node_name, node_type=NodeType.PERCEPTION)

        # Initialize the parameters
        self.process_frequency = DTParam("~process_frequency", param_type=ParamType.FLOAT)
        self.circlepattern_dims = DTParam("~circlepattern_dims", param_type=ParamType.LIST)
        self.blobdetector_min_area = DTParam("~blobdetector_min_area", param_type=ParamType.FLOAT)
        self.blobdetector_min_dist_between_blobs = DTParam(
            "~blobdetector_min_dist_between_blobs", param_type=ParamType.FLOAT
        )

        # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        #
        self.cbParametersChanged()  # TODO: THIS SHOULD BE FIXED IN THE NEW DTROS!!!!!!!!!!
        #
        # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        self.bridge = CvBridge()

        self.last_stamp = rospy.Time.now()

        # Subscriber
        self.sub_image = rospy.Subscriber("~image", CompressedImage, self.cb_image, queue_size=1)

        # Publishers
        self.pub_centers = rospy.Publisher("~centers", VehicleCorners, queue_size=1)
        self.pub_circlepattern_image = rospy.Publisher(
            "~debug/detection_image/compressed", CompressedImage, queue_size=1
        )
        self.pub_detection_flag = rospy.Publisher("~detection", BoolStamped, queue_size=1)
        self.log("Initialization completed.")

    def cbParametersChanged(self):

        # TODO: THIS DOESN'T WORK WITH THE NEW DTROS!!!
        self.publish_duration = rospy.Duration.from_sec(1.0 / self.process_frequency.value)
        params = cv2.SimpleBlobDetector_Params()
        params.minArea = self.blobdetector_min_area.value
        params.minDistBetweenBlobs = self.blobdetector_min_dist_between_blobs.value
        self.simple_blob_detector = cv2.SimpleBlobDetector_create(params)

    def cb_image(self, image_msg):
        """
        Callback for processing a image which potentially contains a back pattern. Processes the image only if
        sufficient time has passed since processing the previous image (relative to the chosen processing frequency).

        The pattern detection is performed using OpenCV's `findCirclesGrid <https://docs.opencv.org/2.4/modules/calib3d/doc/camera_calibration_and_3d_reconstruction.html?highlight=solvepnp#findcirclesgrid>`_ function.

        Args:
            image_msg (:obj:`sensor_msgs.msg.CompressedImage`): Input image

        """
        now = rospy.Time.now()
        if now - self.last_stamp < self.publish_duration:
            return
        else:
            self.last_stamp = now

        vehicle_centers_msg_out = VehicleCorners()
        detection_flag_msg_out = BoolStamped()
        image_cv = self.bridge.compressed_imgmsg_to_cv2(image_msg, "bgr8")

        (detection, centers) = cv2.findCirclesGrid(
            image_cv,
            patternSize=tuple(self.circlepattern_dims.value),
            flags=cv2.CALIB_CB_SYMMETRIC_GRID,
            blobDetector=self.simple_blob_detector,
        )

        # if the pattern is detected, cv2.findCirclesGrid returns a non-zero result, otherwise it returns 0
        # vehicle_detected_msg_out.data = detection > 0
        # self.pub_detection.publish(vehicle_detected_msg_out)

        vehicle_centers_msg_out.header = image_msg.header
        vehicle_centers_msg_out.detection.data = detection > 0
        detection_flag_msg_out.header = image_msg.header
        detection_flag_msg_out.data = detection > 0

        # if the detection is successful add the information about it,
        # otherwise publish a message saying that it was unsuccessful
        if detection > 0:
            points_list = []
            for point in centers:
                center = Point32()
                center.x = point[0, 0]
                center.y = point[0, 1]
                center.z = 0
                points_list.append(center)
            vehicle_centers_msg_out.corners = points_list
            vehicle_centers_msg_out.H = self.circlepattern_dims.value[1]
            vehicle_centers_msg_out.W = self.circlepattern_dims.value[0]

        self.pub_centers.publish(vehicle_centers_msg_out)
        self.pub_detection_flag.publish(detection_flag_msg_out)
        if self.pub_circlepattern_image.get_num_connections() > 0:
            cv2.drawChessboardCorners(image_cv, tuple(self.circlepattern_dims.value), centers, detection)
            image_msg_out = self.bridge.cv2_to_compressed_imgmsg(image_cv)
            self.pub_circlepattern_image.publish(image_msg_out)


if __name__ == "__main__":
    vehicle_detection_node = VehicleDetectionNode("vehicle_detection")
    rospy.spin()
