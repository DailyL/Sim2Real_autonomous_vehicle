#!/usr/bin/env python3

import cv2
import numpy as np

import rospy
from cv_bridge import CvBridge
from duckietown.dtros import DTParam, DTROS, NodeType, ParamType
from duckietown_msgs.msg import BoolStamped, FSMState, StopLineReading, VehicleCorners
from duckietown_msgs.srv import ChangePattern
from image_geometry import PinholeCameraModel
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import String
from visualization_msgs.msg import Marker


class VehicleFilterNode(DTROS):
    """
    The vehicle filter node is responsible for estimating the relative pose to a detected back pattern of a
    robot and
    for publishing a stop line message if the other vehicle is too close. We model the vehicle in front as
    a stop line
    and leave the velocity control to the lane control node.

    Args:
        node_name (:obj:`str`): a unique, descriptive name for the node that ROS will use

    Configuration:
        ~distance_between_centers (:obj:`float`): Distance between the centers of the circles on the back
        pattern, in meters.
        ~max_reproj_pixelerror_pose_estimation (:obj:`float`): Maximum tolerable reprojection error. If a
        reprojection error higher than that is observed. A stop message will be published.
        ~virtual_stop_line_offset (:obj:`int`): Desired distance from the back pattern of the robot in
        front, in meters.

    Subscriber:
        ~centers (:obj:`duckietown_msgs.msg.VehicleCorners`): Detected pattern (if any)
        ~camera_info (:obj:`sensor_msgs.msg.CameraInfo`): Intrinsic properties of the camera. Needed for
        rectifying the segments.

    Publishers:
        ~virtual_stop_line (:obj:`duckietown_msgs.msg.StopLineReading`): Message to the lane controller
        ~debug/visualization_marker (:obj:`visualization_msgs.msg.Marker`): Debug topic that publishes an
        rViz marker
        ~stopped (:obj:`BoolStamped`): Message to FSM state machine to identify that vehicle is stopped
    """

    def __init__(self, node_name):

        # Initialize the DTROS parent class
        super(VehicleFilterNode, self).__init__(node_name=node_name, node_type=NodeType.PERCEPTION)

        # Add the node parameters to the parameters dictionary and load their default values
        self.distance_between_centers = DTParam("~distance_between_centers", param_type=ParamType.FLOAT)

        self.max_reproj_pixelerror_pose_estimation = DTParam(
            "~max_reproj_pixelerror_pose_estimation", param_type=ParamType.FLOAT
        )

        self.virtual_stop_line_offset = DTParam("~virtual_stop_line_offset", param_type=ParamType.FLOAT)

        self.bridge = CvBridge()

        # these will be defined on the first call to calc_circle_pattern
        self.last_calc_circle_pattern = None
        self.circlepattern_dist = None
        self.circlepattern = None
        self.state = None
        # subscribers
        self.sub_centers = rospy.Subscriber("~centers", VehicleCorners, self.cb_process_centers, queue_size=1)
        self.sub_info = rospy.Subscriber(
            "~camera_info", CameraInfo, self.cb_process_camera_info, queue_size=1
        )
        """ TODO: REMOVE AFTER ROAD_ANOMALY NODE CONSTRUCTION"""
        self.sub_state = rospy.Subscriber("~mode", FSMState, self.cbFSMState)
        # publishers
        self.pub_virtual_stop_line = rospy.Publisher("~virtual_stop_line", StopLineReading, queue_size=1)
        self.pub_visualize = rospy.Publisher("~debug/visualization_marker", Marker, queue_size=1)
        self.pub_stopped_flag = rospy.Publisher("~stopped", BoolStamped, queue_size=1)
        self.pcm = PinholeCameraModel()
        self.changePattern = rospy.ServiceProxy("~set_pattern", ChangePattern)
        self.log("Initialization completed")
        self.last_led_state = None

    def cbFSMState(self, msg):
        self.state = msg.state

    def cb_process_camera_info(self, msg):
        """
        Callback that stores the intrinsic calibration into a PinholeCameraModel object.

        Args:

            msg (:obj:`sensor_msgs.msg.CameraInfo`): Intrinsic properties of the camera.
        """

        self.pcm.fromCameraInfo(msg)

    def cb_process_centers(self, vehicle_centers_msg):
        """
        Callback that processes a back pattern detection. If no detection was made, publishes a dummy stop
        line message.

        Args:
            vehicle_centers_msg (:obj:`duckietown_msgs.msg.VehicleCorners`): Detected pattern (if any)

        """

        # check if there actually was a detection
        detection = vehicle_centers_msg.detection.data
        if detection:
            self.calc_circle_pattern(vehicle_centers_msg.H, vehicle_centers_msg.W)
            points = np.zeros((vehicle_centers_msg.H * vehicle_centers_msg.W, 2))
            for i in range(len(points)):
                points[i] = np.array([vehicle_centers_msg.corners[i].x, vehicle_centers_msg.corners[i].y])

            success, rotation_vector, translation_vector = cv2.solvePnP(
                objectPoints=self.circlepattern,
                imagePoints=points,
                cameraMatrix=self.pcm.intrinsicMatrix(),
                distCoeffs=self.pcm.distortionCoeffs(),
            )

            if success:
                points_reproj, _ = cv2.projectPoints(
                    objectPoints=self.circlepattern,
                    rvec=rotation_vector,
                    tvec=translation_vector,
                    cameraMatrix=self.pcm.intrinsicMatrix(),
                    distCoeffs=self.pcm.distortionCoeffs(),
                )

                mean_reproj_error = np.mean(
                    np.sqrt(np.sum((np.squeeze(points_reproj) - points) ** 2, axis=1))
                )

                if mean_reproj_error < self.max_reproj_pixelerror_pose_estimation.value:
                    (R, jac) = cv2.Rodrigues(rotation_vector)
                    R_inv = np.transpose(R)
                    translation_vector = -np.dot(R_inv, translation_vector)
                    distance_to_vehicle = -translation_vector[2]

                    # make the message and publish
                    self.publish_stop_line_msg(
                        header=vehicle_centers_msg.header,
                        detected=True,
                        at=distance_to_vehicle <= self.virtual_stop_line_offset.value,
                        x=distance_to_vehicle,
                    )

                    if self.pub_visualize.get_num_connections() > 0:
                        marker_msg = Marker()
                        marker_msg.header = vehicle_centers_msg.header
                        marker_msg.header.frame_id = "donald"
                        marker_msg.ns = "my_namespace"
                        marker_msg.id = 0
                        marker_msg.type = Marker.CUBE
                        marker_msg.action = Marker.ADD
                        marker_msg.pose.position.x = -translation_vector[2]
                        marker_msg.pose.position.y = translation_vector[0]
                        marker_msg.pose.position.z = translation_vector[1]
                        marker_msg.pose.orientation.x = 0.0
                        marker_msg.pose.orientation.y = 0.0
                        marker_msg.pose.orientation.z = 0.0
                        marker_msg.pose.orientation.w = 1.0
                        marker_msg.scale.x = 0.1
                        marker_msg.scale.y = 0.1
                        marker_msg.scale.z = 0.1
                        marker_msg.color.r = 1.0
                        marker_msg.color.g = 1.0
                        marker_msg.color.b = 0.0
                        marker_msg.color.a = 1.0
                        marker_msg.lifetime = rospy.Duration.from_sec(1)
                        self.pub_visualize.publish(marker_msg)

                else:
                    self.log(
                        "Pose estimation failed, too high reprojection error. "
                        "Reporting detection at 0cm for safety."
                    )
                    self.publish_stop_line_msg(header=vehicle_centers_msg.header, detected=True, at=True)

            else:
                self.log("Pose estimation failed. " "Reporting detection at 0cm for safety.")
                self.publish_stop_line_msg(header=vehicle_centers_msg.header, detected=True, at=True)

        else:
            # publish empty messages
            self.publish_stop_line_msg(header=vehicle_centers_msg.header)

            if self.pub_visualize.get_num_connections() > 0:
                marker_msg = Marker()
                marker_msg.header = vehicle_centers_msg.header
                marker_msg.header.frame_id = "donald"
                marker_msg.ns = "my_namespace"
                marker_msg.id = 0
                marker_msg.action = Marker.DELETE
                self.pub_visualize.publish(marker_msg)
        try:
            self.trigger_led_hazard_light(
                detection, (distance_to_vehicle <= self.virtual_stop_line_offset.value)
            )
        except Exception:
            self.trigger_led_hazard_light(detection, False)

    def calc_circle_pattern(self, height, width):
        """
        Calculates the physical locations of each dot in the pattern.

        Args:
            height (`int`): number of rows in the pattern
            width (`int`): number of columns in the pattern

        """
        # check if the version generated before is still valid, if not, or first time called, create

        if self.last_calc_circle_pattern is None or self.last_calc_circle_pattern != (height, width):
            self.circlepattern_dist = self.distance_between_centers.value
            self.circlepattern = np.zeros([height * width, 3])
            for i in range(0, width):
                for j in range(0, height):
                    self.circlepattern[i + j * width, 0] = (
                        self.circlepattern_dist * i - self.circlepattern_dist * (width - 1) / 2
                    )
                    self.circlepattern[i + j * width, 1] = (
                        self.circlepattern_dist * j - self.circlepattern_dist * (height - 1) / 2
                    )

    def trigger_led_hazard_light(self, detection, stopped):
        """
        Publish a service message to trigger the hazard light at the back of the robot
        """
        msg = String()

        if stopped:
            msg.data = "OBSTACLE_STOPPED"
            if msg.data != self.last_led_state:
                self.changePattern(msg)
            self.last_led_state = msg.data
        elif detection:
            msg.data = "OBSTACLE_ALERT"
            if msg.data != self.last_led_state:
                self.changePattern(msg)
            self.last_led_state = msg.data
        else:
            if self.state == "LANE_FOLLOWING":
                msg.data = "CAR_DRIVING"
                if msg.data != self.last_led_state:
                    self.changePattern(msg)
                self.last_led_state = "CAR_DRIVING"
            elif self.state == "NORMAL_JOYSTICK_CONTROL":
                msg.data = "WHITE"
                if msg.data != self.last_led_state:
                    self.changePattern(msg)
                self.last_led_state = msg.data

    def publish_stop_line_msg(self, header, detected=False, at=False, x=0.0, y=0.0):
        """
        Makes and publishes a stop line message.

        Args:
            header: header of a ROS message, usually copied from an incoming message
            detected (`bool`): whether a vehicle has been detected
            at (`bool`): whether we are closer than the desired distance
            x (`float`): distance to the vehicle
            y (`float`): lateral offset from the vehicle (not used, always 0)
        """

        stop_line_msg = StopLineReading()
        stop_line_msg.header = header
        stop_line_msg.stop_line_detected = bool(detected)
        stop_line_msg.at_stop_line = bool(at)
        stop_line_msg.stop_line_point.x = int(x)
        stop_line_msg.stop_line_point.y = int(y)
        self.pub_virtual_stop_line.publish(stop_line_msg)

        """
        Remove once have the road anomaly watcher node
        """
        stopped_flag = BoolStamped()
        stopped_flag.header = header
        stopped_flag.data = bool(at)
        self.pub_stopped_flag.publish(stopped_flag)


if __name__ == "__main__":
    vehicle_filter_node = VehicleFilterNode(node_name="vehicle_filter_node")
    rospy.spin()
