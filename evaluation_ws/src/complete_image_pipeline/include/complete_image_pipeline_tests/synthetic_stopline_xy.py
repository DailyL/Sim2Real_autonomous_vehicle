import numpy as np

import duckietown_code_utils as dtu
from .synthetic import dirn, test_synthetic

actual_map_name = "DT17_scenario_four_way"
template = "DT17_template_xy_stopline"
robot_name = dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS
line_detector_name = "baseline"
# image_prep_name = 'prep_200_100'
image_prep_name = "baseline"

lane_filter_names = []
lane_filter_names += ["moregeneric_xy_stopline"]


# raise_if_error_too_large = True
#
# MAX_PHI_ERR = np.deg2rad(5)
# MAX_D_ERR = 0.021


@dtu.unit_test
def stopline_zero_zero():
    pose_or_location = dtu.geo.SE2_from_translation_angle([0, -0.10], np.deg2rad(0))

    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
        test_synthetic(
            actual_map_name,
            template,
            robot_name,
            line_detector_name,
            image_prep_name,
            lane_filter_name,
            pose_or_location,
            outd,
        )


@dtu.unit_test
def stopline_two():
    pose_or_location = dtu.geo.SE2_from_translation_angle([0.05, -0.10], np.deg2rad(0))

    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
        test_synthetic(
            actual_map_name,
            template,
            robot_name,
            line_detector_name,
            image_prep_name,
            lane_filter_name,
            pose_or_location,
            outd,
        )


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
