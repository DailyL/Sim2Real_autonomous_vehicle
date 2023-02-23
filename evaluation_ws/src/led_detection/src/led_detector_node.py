#!/usr/bin/env python3

import cv2
import numpy as np

import rospy
from cv_bridge import CvBridge
from duckietown.dtros import DTROS, NodeType
from duckietown_msgs.msg import SignalsDetection
from duckietown_rosdata_utils import numpy_from_ros_compressed
from led_detection.LED_detector import LEDDetector
from sensor_msgs.msg import CompressedImage


class LEDDetectorNode(DTROS):
    """
    This node extracts signals from a series of images. The images are collected,
    a blob detection is applied, then a FFT (https://en.wikipedia.org/wiki/Fast_Fourier_transform)
    is used to extract a frequency of a blinking LED. If this matches a signal specified in the
    LED protocol, the signal is published.

    Args:
        node_name (:obj:`str`): a unique, descriptive name for the node that ROS will use

    Subscribers:
        ~~image/compressed (:obj:`sensor_msgs.msg.CompressedImage`): The compressed image from the camera.

    Publishers:
        ~signals_detection (:obj:`duckietown_msgs.msg.SignalsDetection`): The signals detected.
        ~image_detection_right/compressed (:obj:`std_msgs.msg.CompressedImage`): Debug topic to visualize
        detections on the right.
        ~image_detection_front/compressed (:obj:`std_msgs.msg.CompressedImage`): Debug topic to visualize
        detections in front.
        ~image_detection_TL (:obj:`std_msgs.msg.CompressedImage`): Debug topic to visualize detections of
        traffic lights.
    """

    def __init__(self, node_name, node_type):
        # Initialize the DTROS parent class
        super(LEDDetectorNode, self).__init__(node_name=node_name, node_type=node_type)

        self.node_name = "LED_DETECTOR_NODE"
        # Needed to publish images
        self.bridge = CvBridge()

        # Add the node parameters to the parameters dictionary
        self.params = dict()
        self.params["~capture_time"] = rospy.get_param("~capture_time", None)
        self.params["~DTOL"] = rospy.get_param("~DTOL", None)
        self.params["~useFFT"] = rospy.get_param("~useFFT", None)
        self.params["~freqIdentity"] = rospy.get_param("~freqIdentity", None)
        self.params["~crop_params"] = rospy.get_param("~crop_params", None)
        self.params["~blob_detector_db"] = {}
        self.params["~blob_detector_tl"] = {}
        self.params["~verbose"] = rospy.get_param("~verbose", None)
        self.params["~cell_size"] = rospy.get_param("~cell_size", None)
        self.params["~LED_protocol"] = rospy.get_param("~LED_protocol", None)

        # Initialize detector
        self.detector = LEDDetector(self.params, self.log)

        # self.updateParameters()  TODO: This needs be replaced by the new DTROS callback when it is
        #  implemented

        self.first_timestamp = 0
        self.capture_finished = True
        self.t_init = None
        self.trigger = True
        self.node_state = 0
        self.data = []
        self.misdetection = 0  # use to store how many times traffic light signal happend elsewhere to
        # check calibration.

        # Initialize detection
        self.right = None
        self.front = None
        self.traffic_light = None
        # We currently are not able to see what happens on the left
        self.left = "UNKNOWN"

        # Publishers
        self.pub_detections = rospy.Publisher("~signals_detection", SignalsDetection, queue_size=1)

        # Publishers for debug images
        self.pub_image_right = rospy.Publisher(
            "~image_detection_right/compressed", CompressedImage, queue_size=1
        )
        self.pub_image_front = rospy.Publisher(
            "~image_detection_front/compressed", CompressedImage, queue_size=1
        )
        self.pub_image_TL = rospy.Publisher("~image_detection_TL/compressed", CompressedImage, queue_size=1)

        # Subscribers
        self.sub_cam = rospy.Subscriber("~image/compressed", CompressedImage, self.camera_callback)

        # Log info
        self.log("Initialized!")

    def camera_callback(self, msg):
        """
        Callback that collects images and starts the detection. It unregister the subscriber while processing
        the images. Once finished, it restarts it.

        Args:
            msg (:obj:`sensor_msgs.msg.CompressedImage`): Input image.
        """
        float_time = msg.header.stamp.to_sec()

        if self.trigger:
            self.trigger = False
            self.data = []
            self.capture_finished = False
            # Start capturing images
            self.first_timestamp = msg.header.stamp.to_sec()
            self.t_init = rospy.Time.now().to_sec()

        elif self.capture_finished:
            self.node_state = 0

        if self.first_timestamp > 0:
            rel_time = float_time - self.first_timestamp

            # Capturing
            if rel_time < self.params["~capture_time"]:
                self.node_state = 1
                # Capture image
                rgb = numpy_from_ros_compressed(msg)
                rgb = cv2.cvtColor(rgb, cv2.COLOR_BGRA2GRAY)
                rgb = 255 - rgb
                self.data.append({"timestamp": float_time, "rgb": rgb[:, :]})

            # Start processing
            elif not self.capture_finished and self.first_timestamp > 0:
                if self.params["~verbose"] == 2:
                    self.log(f"Relative Time {rel_time}, processing")
                self.node_state = 2
                self.capture_finished = True
                self.first_timestamp = 0

                # IMPORTANT! Explicitly ignore messages while processing, accumulates delay otherwise!
                self.sub_cam.unregister()

                # Process image and publish results
                self.process_and_publish()

    @staticmethod
    def crop_image(images, crop_norm):
        """
        Crops an array of images according to `crop_norm`.

        Args:
            images (:obj:`numpy array`): Images in form HxWxN_images
            crop_norm (:obj:`list`): List of lists containing the crop limits.
        """
        # Get size
        height, width, _ = images.shape
        # Compute indices
        h_start = int(np.floor(height * crop_norm[0][0]))
        h_end = int(np.ceil(height * crop_norm[0][1]))
        w_start = int(np.floor(width * crop_norm[1][0]))
        w_end = int(np.ceil(width * crop_norm[1][1]))
        # Crop image
        image_cropped = images[h_start:h_end, w_start:w_end, :]
        # Return cropped image
        return image_cropped

    def process_and_publish(self):
        """
        Processes the images (detection and interpretation) using an instantiated `LED_detector` object.
        """
        # Initial time
        tic = rospy.Time.now().to_sec()

        # Get dimensions
        h, w = self.data[0]["rgb"].shape
        num_img = len(self.data)

        # Save images in numpy arrays
        images = np.zeros((h, w, num_img), dtype=np.uint8)
        timestamps = np.zeros(num_img)
        for i, v in enumerate(self.data):
            timestamps[i] = v["timestamp"]
            images[:, :, i] = v["rgb"]

        # Crop images
        img_right = self.crop_image(images, self.params["~crop_params"]["cropNormalizedRight"])
        img_front = self.crop_image(images, self.params["~crop_params"]["cropNormalizedFront"])
        img_tl = self.crop_image(images, self.params["~crop_params"]["cropNormalizedTL"])

        # Print on screen
        if self.params["~verbose"] == 2:
            self.log(f"Analyzing {num_img} images of size {w} X {h}")

        # Get blobs right
        blobs_right, frame_right = self.detector.find_blobs(img_right, "car")
        # Get blobs front
        blobs_front, frame_front = self.detector.find_blobs(img_front, "car")
        # Get blobs right
        blobs_tl, frame_tl = self.detector.find_blobs(img_tl, "tl")

        radius = self.params["~DTOL"] / 2.0

        if self.params["~verbose"] > 0:
            # Extract blobs for visualization
            keypoint_blob_right = self.detector.get_keypoints(blobs_right, radius)
            keypoint_blob_front = self.detector.get_keypoints(blobs_front, radius)
            keypoint_blob_tl = self.detector.get_keypoints(blobs_tl, radius)

            # Images
            img_pub_right = cv2.drawKeypoints(
                img_right[:, :, -1],
                keypoint_blob_right,
                np.array([]),
                (0, 0, 255),
                cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS,
            )
            img_pub_front = cv2.drawKeypoints(
                img_front[:, :, -1],
                keypoint_blob_front,
                np.array([]),
                (0, 0, 255),
                cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS,
            )
            img_pub_tl = cv2.drawKeypoints(
                img_tl[:, :, -1],
                keypoint_blob_tl,
                np.array([]),
                (0, 0, 255),
                cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS,
            )
        else:
            img_pub_right = None
            img_pub_front = None
            img_pub_tl = None

        # Initialize detection
        self.right = None
        self.front = None
        self.traffic_light = None

        # Sampling time
        t_s = (1.0 * self.params["~capture_time"]) / (1.0 * num_img)

        # Decide whether LED or not
        self.right = self.detector.interpret_signal(blobs_right, t_s, num_img)
        self.front = self.detector.interpret_signal(blobs_front, t_s, num_img)
        self.traffic_light = self.detector.interpret_signal(blobs_tl, t_s, num_img)

        if self.traffic_light != "traffic_light_go":
            rospy.logwarn(
                "[%s] Traffic light detected a non-traffic light signal. Suppressed!", self.node_name
            )
            self.traffic_light = None
        else:
            rospy.loginfo("[%s] Traffic Light is green! GO!", self.node_name)

        if self.right == "traffic_light_go":
            rospy.logwarn("[%s] Detected Vehicle with a traffic light signal. Suppressed! ", self.node_name)
            self.right = None
            self.misdetection += 1
            if self.misdetection >= 5:
                rospy.logwarn(
                    "[%s] Noticed traffic light signal elsewhere more than 5 times. Calibration is wrong! Go "
                    "with traffic light",
                    self.node_name,
                )
                self.misdetection = 0
                self.traffic_light = "traffic_light_go"

        if self.front == "traffic_light_go":
            rospy.logwarn("[%s] Detected Vehicle with a traffic light signal. Suppressed! ", self.node_name)
            self.front = None
            self.misdetection += 1
            if self.misdetection >= 5:
                rospy.logwarn(
                    "[%s] Noticed traffic light signal elsewhere more than 5 times. Calibration is wrong. Go "
                    "with traffic light",
                    self.node_name,
                )
                self.misdetection = 0
                self.traffic_light = "traffic_light_go"

        # Left bot (also UNKNOWN)
        self.left = "UNKNOWN"

        # Final time
        processing_time = rospy.Time.now().to_sec() - tic
        total_time = rospy.Time.now().to_sec() - self.t_init

        # Publish results
        self.publish(img_pub_right, img_pub_front, img_pub_tl)

        # Print performance
        if self.params["~verbose"] == 2:
            self.log(
                f"[{self.node_name}] Detection completed. Processing time: {processing_time:.2f} s. Total "
                f"time:  {total_time:.2f} s"
            )

        # Keep going
        self.trigger = True
        self.sub_cam = rospy.Subscriber("~image/compressed", CompressedImage, self.camera_callback)

    def publish(self, img_right, img_front, img_tl):
        """
        Publishes the results of the detection, in case of high verbosity, it publishes debug images of the
        detection, otherwise just the detection result.

        Args:
            img_right (:obj:`numpy array`): Debug image
            img_front (:obj:`numpy array`): Debug image
            img_tl (:obj:`numpy array`): Debug image
        """
        #  Publish image with circles if verbose is > 0
        if self.params["~verbose"] > 0:
            img_right_circle_msg = self.bridge.cv2_to_compressed_imgmsg(img_right)  # , encoding="bgr8")
            img_front_circle_msg = self.bridge.cv2_to_compressed_imgmsg(img_front)  # , encoding="bgr8")
            img_tl_circle_msg = self.bridge.cv2_to_compressed_imgmsg(img_tl)  # , encoding="bgr8")

            # Publish image
            self.pub_image_right.publish(img_right_circle_msg)
            self.pub_image_front.publish(img_front_circle_msg)
            self.pub_image_TL.publish(img_tl_circle_msg)

        # Log results to the terminal
        rospy.loginfo(
            "[%s] The observed LEDs are: Front = [%s] Right = [%s] Traffic light state = [%s]",
            self.node_name,
            self.front,
            self.right,
            self.traffic_light,
        )

        # Publish detections
        detections_msg = SignalsDetection(
            front=self.front, right=self.right, left=self.left, traffic_light_state=self.traffic_light
        )
        self.pub_detections.publish(detections_msg)

    def cbParametersChanged(self):
        """Updates parameters."""
        self.detector.update_parameters(self.params)


if __name__ == "__main__":
    # Initialize the node
    led_detector_node = LEDDetectorNode(node_name="led_detector_node", node_type=NodeType.PERCEPTION)
    # Keep it spinning to keep the node alive
    rospy.spin()
