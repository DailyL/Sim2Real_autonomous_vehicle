import os
from typing import List

import numpy as np

import duckietown_code_utils as dtu
from duckietown_segmaps import FAMILY_SEGMAPS
from duckietown_code_utils.cli import D8App
from easy_algo import get_easy_algo_db
from image_processing.more_utils import get_robot_camera_geometry
from .image_simulation import simulate_image

logger = dtu.logger
__all__ = [
    "ValidateCalibration",
]


class ValidateCalibration(D8App):
    """

    This program validates the intrinsic/extrinsics calibrations.

    """

    cmd = "rosrun complete_image_pipeline validate_calibration"

    usage = """

Use as follows:

    $ %(prog)s [robot names]

Example:

    $ %(prog)s shamrock emma

"""

    def define_program_options(self, params):
        params.add_string("output", short="o", help="Output dir", default="out/validate_calibration")
        params.accept_extra()

    def go(self):
        extra = self.options.get_extra()

        if len(extra) == 0:
            robots = [dtu.get_current_robot_name()]
        else:
            robots = extra

        # robots = db.query('robot', query, raise_if_no_matches=True)
        # self.debug('robots: %s' % sorted(robots))

        actual_map_name = "DT17_scenario_four_way"

        # noinspection PyUnresolvedReferences
        out = self.options.output
        create_visuals(robots, actual_map_name, out)

        for robot_name in robots:
            try_simulated_localization(robot_name)


def try_simulated_localization(robot_name: str):
    actual_map_name = "DT17_scenario_straight_straight"
    template = "DT17_template_straight_straight"

    line_detector_name = "baseline"
    lane_filter_name = "baseline"
    lane_filter_name = "moregeneric_straight"
    image_prep_name = "baseline"
    d = 0.01
    phi = np.deg2rad(5)
    max_phi_err = np.deg2rad(5)
    max_d_err = 0.03
    outd = f"out/try_simulated_localization-{robot_name}"

    from complete_image_pipeline_tests.synthetic import test_synthetic_phi

    # XXX: should not include the _tests module

    test_synthetic_phi(
        actual_map_name,
        template,
        robot_name,
        line_detector_name,
        image_prep_name,
        lane_filter_name,
        d,
        phi,
        outd,
        max_phi_err=max_phi_err,
        max_d_err=max_d_err,
    )


def create_visuals(robots: List[str], actual_map_name: str, out: str):
    db = get_easy_algo_db()
    actual_map = db.create_instance(FAMILY_SEGMAPS, actual_map_name)
    res = {}
    res2 = {}

    for i, robot_name in enumerate(sorted(robots)):
        logger.info(f"{i}/{len(robots)}: {robot_name}")
        rcg = get_robot_camera_geometry(robot_name)

        pose = np.eye(3)
        simulated_data = simulate_image(actual_map, pose, gpg=rcg.gpg, rectifier=rcg.rectifier, blur_sigma=1)
        res[robot_name] = simulated_data.rectified_synthetic_bgr
        res2[robot_name] = simulated_data.distorted_synthetic_bgr
    if not res:
        msg = "No images to draw."
        dtu.logger.error(msg)
    else:
        output = os.path.join(out, "distorted")
        dtu.write_bgr_images_as_jpgs(res2, output)
        output = os.path.join(out, "rectified")
        dtu.write_bgr_images_as_jpgs(res, output)
