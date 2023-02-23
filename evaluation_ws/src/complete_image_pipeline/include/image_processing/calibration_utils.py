import os
import shutil
import time
from typing import List

import numpy as np
import yaml
from rospkg import ResourceNotFound

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
from sensor_msgs.msg import CameraInfo


class NoHomographyInfoAvailable(dtu.DTException):
    pass


class InvalidHomographyInfo(dtu.DTException):
    pass


def get_homography_default():
    """Returns a nominal homography"""
    return get_homography_for_robot("default")


def get_homography_for_robot(robot_name: str) -> np.ndarray:
    dtu.check_isinstance(robot_name, str)
    # find the file

    fn = get_homography_info_config_file(robot_name)

    # load the YAML
    data = dtu.yaml_load_file(fn, plain_yaml=True)  # True means "plain"

    # convert the YAML
    homography = homography_from_yaml(data)

    return homography


def get_roots_for_calibrations() -> List[str]:
    roots: List[str] = []
    try:
        d = dtu.get_duckiefleet_root()
    except dtu.DTConfigException:
        dtu.logger.warn("Skipping duckiefleet root.")
        pass
    else:
        roots.append(os.path.join(d, "calibrations"))
    try:
        d = dru.get_ros_package_path("duckietown")
    except ResourceNotFound:
        dtu.logger.warn("Skipping duckietown root.")
    else:
        roots.append(os.path.join(d, "config", "baseline", "calibration"))

    d0 = dru.get_ros_package_path("complete_image_pipeline")
    dd = os.path.join(d0, "log-calib-config", "baseline", "calibration")
    roots.append(dd)

    return roots


def get_homography_info_config_file(robot_name: str) -> str:
    """
    Raises NoHomographyInfoAvailable.

    :param robot_name:
    :return:
    """
    strict = False
    roots = get_roots_for_calibrations()

    found = []
    for df in roots:
        # Load camera information
        fn = os.path.join(df, "camera_extrinsic", robot_name + ".yaml")
        fn_default = os.path.join(df, "camera_extrinsic", "default.yaml")
        if os.path.exists(fn):
            found.append(fn)
            msg = f"Using filename {fn}"
            dtu.logger.info(msg)
        elif os.path.exists(fn_default):
            found.append(fn_default)
            msg = f"Using filename {fn_default}"
            dtu.logger.info(msg)

    if len(found) == 0:
        msg = f"Cannot find homography file for robot {robot_name!r};\n{roots}"
        dtu.logger.error(msg)
        raise NoHomographyInfoAvailable(msg)
    elif len(found) == 1:
        return found[0]
    else:
        msg = "Found more than one configuration file: \n{}".format("\n".join(found))
        msg += "\n Please delete one of those."
        dtu.logger.warn(msg)
        if strict:
            raise Exception(msg)
        else:
            dtu.logger.error(msg)
            return found[0]


def homography_from_yaml(data: dict) -> np.array:
    try:
        h = data["homography"]
        res = np.array(h).reshape((3, 3))
        return res
    except Exception as e:
        msg = "Could not interpret data:"
        msg += "\n\n" + dtu.indent(yaml.dump(data), "   ")
        dtu.logger.error(msg)
        raise InvalidHomographyInfo(msg) from e


def save_homography(H: np.array, robot_name: str) -> None:
    dtu.logger.info(f"Homography:\n {H}")

    # Check if specific point in matrix is larger than zero (this would definitly mean we're having a
    # corrupted rotation matrix)
    if H[1][2] > 0:
        msg = "WARNING: Homography could be corrupt."
        msg += f"\n {H}"
        raise Exception(msg)

    ob = {"homography": sum(H.reshape(9, 1).tolist(), [])}

    s = yaml.dump(ob)
    s += "\n# Calibrated on "
    localTime = "" + dtu.format_time_as_YYYY_MM_DD(time.time())
    s += localTime

    fn = get_extrinsics_filename(robot_name)

    # TODO: dtu.write_data_to_files is broken!
    with open(fn, "w") as file:
        file.write(s)


def get_extrinsics_filename(robot_name: str) -> str:
    """This is the file in DUCKIEFLEET_ROOT that is used to save to."""
    df_root = dtu.get_duckiefleet_root()
    fn = os.path.join(df_root, "calibrations", "camera_extrinsic", f"{robot_name}.yaml")
    return fn


def disable_old_homography(robot_name: str):
    fn = get_extrinsics_filename(robot_name)
    if os.path.exists(fn):
        fn2 = None
        for i in range(100):
            fn2 = fn + f".disabled.{i:03d}"
            if not os.path.exists(fn2):
                break
        msg = (
            f"Disabling old homography - so that if this fails it is clear it failed.\n Backup saved as "
            f"{fn2} "
        )
        dtu.logger.warning(msg)
        shutil.move(fn, fn2)


class NoCameraInfoAvailable(dtu.DTException):
    pass


class InvalidCameraInfo(dtu.DTException):
    pass


def get_camera_info_default() -> CameraInfo:
    """Returns a nominal CameraInfo"""
    return get_camera_info_for_robot("default")


default_camera_info = """
image_width: 640
image_height: 480
camera_name: /shamrock/rosberrypi_cam
camera_matrix:
  rows: 3
  cols: 3
  data: [305.5718893575089, 0, 303.0797142544728, 0, 308.8338858195428, 231.8845403702499, 0, 0, 1]
distortion_model: plumb_bob
distortion_coefficients:
  rows: 1
  cols: 5
  data: [-0.2944667743901807, 0.0701431287084318, 0.0005859930422629722, -0.0006697840226199427, 0]
rectification_matrix:
  rows: 3
  cols: 3
  data: [1, 0, 0, 0, 1, 0, 0, 0, 1]
projection_matrix:
  rows: 3
  cols: 4
  data: [220.2460277141687, 0, 301.8668918355899, 0, 0, 238.6758484095299, 227.0880056118307, 0, 0, 0, 1, 0]
"""


def get_camera_info_for_robot(robot_name: str) -> CameraInfo:
    """
    Returns a CameraInfo object for the given robot.
    This is in a good format to pass to PinholeCameraModel:
        self.pcm = PinholeCameraModel()
        self.pcm.fromCameraInfo(self.ci)
    The fields are simply lists (not array or matrix).
    Raises:
        NoCameraInfoAvailable  if no info available
        InvalidCameraInfo   if the info exists but is invalid
    """

    if robot_name == dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS:
        calib_data = dtu.yaml_load(default_camera_info)
        fn = None
    else:
        # find the file
        fn = get_camera_info_config_file(robot_name)

        # load the YAML

        calib_data = dtu.yaml_load_file(fn, plain_yaml=True)

    # convert the YAML
    try:
        camera_info = camera_info_from_yaml(calib_data)
    except InvalidCameraInfo as e:
        msg = f"Invalid data in file {fn}"
        raise InvalidCameraInfo(msg) from e

    check_camera_info_sane_for_DB17(camera_info)

    return camera_info


def check_camera_info_sane_for_DB17(camera_info: CameraInfo):
    """Raises an exception if the calibration is way off with respect
    to platform DVB17"""

    # TODO: to write
    pass


def camera_info_from_yaml(calib_data: dict) -> CameraInfo:
    try:
        cam_info = CameraInfo()
        cam_info.width = calib_data["image_width"]
        cam_info.height = calib_data["image_height"]
        #         cam_info.K = np.matrix(calib_data['camera_matrix']['data']).reshape((3,3))
        #         cam_info.D = np.matrix(calib_data['distortion_coefficients']['data']).reshape((1,5))
        #         cam_info.R = np.matrix(calib_data['rectification_matrix']['data']).reshape((3,3))
        #         cam_info.P = np.matrix(calib_data['projection_matrix']['data']).reshape((3,4))
        cam_info.K = calib_data["camera_matrix"]["data"]
        cam_info.D = calib_data["distortion_coefficients"]["data"]
        cam_info.R = calib_data["rectification_matrix"]["data"]
        cam_info.P = calib_data["projection_matrix"]["data"]

        cam_info.distortion_model = calib_data["distortion_model"]
        return cam_info
    except Exception as e:
        msg = "Could not interpret data:"
        msg += "\n\n" + dtu.indent(yaml.dump(calib_data), "   ")
        dtu.raise_wrapped(InvalidCameraInfo, e, msg)


def get_camera_info_config_file(robot_name: str) -> str:
    roots = get_roots_for_calibrations()

    for df in roots:
        # Load camera information
        fn = os.path.join(df, "camera_intrinsic", robot_name + ".yaml")
        fn_default = os.path.join(df, "camera_intrinsic", "default.yaml")
        if os.path.exists(fn):
            return fn
        elif os.path.exists(fn_default):
            return fn_default
        else:
            dtu.logger.debug(f"{fn} does not exist and neither does {fn_default}")

    msg = f"Cannot find intrinsic file for robot {robot_name!r};\n{roots}"
    raise NoCameraInfoAvailable(msg)


def load_camera_info_2(filename: str) -> CameraInfo:
    with open(filename, "r") as f:
        calib_data = yaml.load(f, Loader=yaml.Loader)
    cam_info = CameraInfo()
    cam_info.width = calib_data["image_width"]
    cam_info.height = calib_data["image_height"]
    cam_info.K = calib_data["camera_matrix"]["data"]
    cam_info.D = calib_data["distortion_coefficients"]["data"]
    cam_info.R = calib_data["rectification_matrix"]["data"]
    cam_info.P = calib_data["projection_matrix"]["data"]
    cam_info.distortion_model = calib_data["distortion_model"]
    return cam_info
