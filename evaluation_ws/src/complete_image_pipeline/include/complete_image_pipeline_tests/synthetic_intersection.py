import numpy as np

import duckietown_code_utils as dtu
from .synthetic import dirn, test_synthetic_phi

actual_map_name = "DT17_scenario_four_way"
template = "DT17_template_four_way"
robot_name = dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS
line_detector_name = "baseline"
# image_prep_name = 'prep_200_100'
image_prep_name = "baseline"
# lane_filter_names = ['baseline', 'generic_straight']
lane_filter_names = []
lane_filter_names += ["moregeneric_fourway"]
# lane_filter_names += ['baseline']
raise_if_error_too_large = True

MAX_PHI_ERR = np.deg2rad(7.1)
MAX_D_ERR = 0.021


@dtu.unit_test
def intersection_zero_zerophi():
    d = 0
    phi = np.deg2rad(0)
    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
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
            max_phi_err=MAX_PHI_ERR,
            max_d_err=MAX_D_ERR,
        )


@dtu.unit_test
def intersection_zero_negphi():
    d = 0
    phi = np.deg2rad(-13)
    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
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
            max_phi_err=MAX_PHI_ERR,
            max_d_err=MAX_D_ERR,
        )


@dtu.unit_test
def intersection_zero_posphi():
    d = 0
    phi = np.deg2rad(+13)
    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
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
            max_phi_err=MAX_PHI_ERR,
            max_d_err=MAX_D_ERR,
        )


@dtu.unit_test
def intersection_zero_posphi2():
    d = 0
    phi = np.deg2rad(+10)
    for lane_filter_name in lane_filter_names:
        outd = dirn(lane_filter_name)
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
            max_phi_err=MAX_PHI_ERR,
            max_d_err=MAX_D_ERR,
        )


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
