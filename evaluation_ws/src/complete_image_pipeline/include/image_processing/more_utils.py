from dataclasses import dataclass

import duckietown_rosbag_utils as dru
from sensor_msgs.msg import CameraInfo
from .calibration_utils import get_camera_info_for_robot, get_homography_for_robot
from .ground_projection_geometry import GroundProjectionGeometry
from .rectification import Rectify


@dataclass
class RobotCameraGeometry:
    rectifier: Rectify
    gpg: GroundProjectionGeometry


def get_robot_camera_geometry(robot_name: str) -> RobotCameraGeometry:
    ci: CameraInfo = get_camera_info_for_robot(robot_name)
    K = get_homography_for_robot(robot_name)

    rectifier = Rectify(ci)
    gpg = GroundProjectionGeometry(ci.width, ci.height, K)
    return RobotCameraGeometry(rectifier, gpg)


def get_robot_camera_geometry_from_log(brp: dru.BagReadProxy) -> RobotCameraGeometry:
    robot_name = dru.which_robot(brp)

    K = get_homography_for_robot(robot_name)
    ci = dru.read_camera_info_from_bag(brp)
    rectifier = Rectify(ci)
    gpg = GroundProjectionGeometry(ci.width, ci.height, K)
    return RobotCameraGeometry(rectifier, gpg)
