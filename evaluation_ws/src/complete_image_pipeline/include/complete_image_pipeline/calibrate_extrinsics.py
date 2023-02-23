import os
from typing import cast

import cv2

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
from duckietown_code_utils.cli import D8App
from image_processing.calibration_utils import (
    disable_old_homography,
    get_camera_info_for_robot,
    get_homography_default,
    save_homography,
)
from image_processing.ground_projection_geometry import GroundProjectionGeometry
from image_processing.rectification import Rectify

logger = dtu.logger

__all__ = [
    "CalibrateExtrinsics",
]


class CalibrateExtrinsics(D8App):
    """Calibrate the extrinsics.
    Run on Duckiebot directly. By default, waits for a message published by the ROS `camera_node`.
    """

    cmd = "rosrun complete_image_pipeline calibrate_extrinsics"

    def define_program_options(self, params):
        g = "Input/output"
        params.add_string(
            "input",
            default=None,
            help="If given, use this image rather than capturing.",
        )
        params.add_string("output", default=None, short="-o", help="Output directory", group=g)

    def go(self):
        robot_name = dtu.get_current_robot_name()

        # noinspection PyUnresolvedReferences
        output = self.options.output
        # noinspection PyUnresolvedReferences
        the_input = self.options.input
        if output is None:
            output = "out/calibrate-extrinsics"  # + dtu.get_md5(self.options.image)[:6]
            self.info(f"No --output given, using {output}")

        if the_input is None:

            self.info(("{}\nCalibrating using the ROS image stream...\n".format("*" * 20)))
            import rospy
            from sensor_msgs.msg import CompressedImage

            topic_name = os.path.join("/", robot_name, "camera_node/image/compressed")
            logger.info(f"Topic to listen to is: {topic_name}")

            self.info("Let's wait for an image. Say cheese!")

            # Dummy for getting a ROS message
            rospy.init_node("calibrate_extrinsics")

            try:
                img_msg = rospy.wait_for_message(topic_name, CompressedImage, timeout=10)
                self.info("Image captured")
            except rospy.ROSException as e:
                print(
                    (
                        "\n\n\n"
                        f"Didn't get any message: {e}\n "
                        "MAKE SURE YOU USE DT SHELL COMMANDS OF VERSION 4.1.9 OR HIGHER."
                    )
                )
                raise
            img_msg = cast(CompressedImage, img_msg)
            bgr = dtu.bgr_from_rgb(dru.rgb_from_ros(img_msg))
            self.info(f"Picture taken: {str(bgr.shape)} ")

        else:
            self.info(f"Loading input image {the_input}")
            bgr = dtu.bgr_from_jpg_fn(the_input)

        if bgr.shape[1] != 640:
            interpolation = cv2.INTER_CUBIC
            bgr = dtu.d8_image_resize_fit(bgr, 640, interpolation)
            self.info(f"Resized to: {str(bgr.shape)} ")
        # Disable the old calibration file
        self.info("Disableing old homography")
        disable_old_homography(robot_name)
        self.info("Obtaining camera info")
        try:
            camera_info = get_camera_info_for_robot(robot_name)
        except Exception as e:
            msg = "Error on obtaining camera info."
            raise Exception(msg) from e

        self.info("Get default homography")
        try:
            homography_dummy = get_homography_default()
        except Exception as e:
            msg = "Error on getting homography."
            raise Exception(msg) from e

        self.info("Rectify image")
        try:
            rect = Rectify(camera_info)
        except Exception as e:
            msg = "Error rectifying image."
            raise Exception(msg) from e

        self.info("Calculate GPG")
        try:
            gpg = GroundProjectionGeometry(
                camera_info.width, camera_info.height, homography_dummy.reshape((3, 3))
            )
        except Exception as e:
            msg = "Error calculating GroundProjectionGeometry."
            raise Exception(msg) from e
        self.info("Ordered Dict")
        res = {}
        try:
            bgr_rectified = rect.rectify(bgr, interpolation=cv2.INTER_CUBIC)

            res["bgr"] = bgr
            res["bgr_rectified"] = bgr_rectified

            _new_matrix, res["rectified_full_ratio_auto"] = rect.rectify_full(bgr, ratio=1.65)

            (result_gpg, status) = gpg.estimate_homography(bgr_rectified)

            if status is not None:
                raise Exception(status)

            save_homography(result_gpg.H, robot_name)
            msg = """

To check that this worked well, place the robot on the road, and run:

    rosrun complete_image_pipeline single_image

Look at the produced jpgs.

"""
            self.info(msg)
        except Exception as E:
            self.error(E)
        finally:
            dtu.write_bgr_images_as_jpgs(res, output)
