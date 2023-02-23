import numpy as np
from numpy.testing.utils import assert_almost_equal

import duckietown_code_utils as dtu
from complete_image_pipeline_tests.synthetic import dirn, test_synthetic

logger = dtu.logger
from easy_algo import get_easy_algo_db
from localization_templates import FAMILY_LOC_TEMPLATES, TemplateBeforeCurve
from localization_templates.template_lane_straight import phi_d_friendly

template = "DT17_template_before_curve_left"
robot_name = dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS
line_detector_name = "baseline"
# image_prep_name = 'prep_200_100'
image_prep_name = "baseline"
lane_filter_names = []
lane_filter_names += ["moregeneric_before_curve_left"]
# lane_filter_names += ['baseline']
raise_if_error_too_large = True
actual_map_name = "DT17_scenario_before_curve_left"
max_phi_err = np.deg2rad(5)
max_d_err = 0.021


@dtu.unit_test
def start_curve():
    res = np.zeros((), dtype=TemplateBeforeCurve.DATATYPE_COORDS)
    # x is unused (projection)
    res["phi"] = 0
    res["d"] = 0
    pose_or_location = res

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
def inside_curve():
    pose_or_location = dtu.geo.SE2_from_translation_angle([0.15, -0.1], np.deg2rad(5))

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
def inside_curve2():
    pose_or_location = dtu.geo.SE2_from_translation_angle([0.35, -0.1], np.deg2rad(15))

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
def coordinates():
    easy_algo_db = get_easy_algo_db()
    localization_template = easy_algo_db.create_instance(FAMILY_LOC_TEMPLATES, template)

    localization_template._init_metrics()
    center = localization_template.center
    offset = localization_template.offset
    pose = dtu.geo.SE2_from_translation_angle([center[0], center[1] - offset], np.deg2rad(0))
    location = localization_template.coords_from_pose(pose)
    assert_almost_equal(location["phi"], 0)
    assert_almost_equal(location["d"], 0)

    DX = 0.01
    pose = dtu.geo.SE2_from_translation_angle([center[0], center[1] - offset + DX], np.deg2rad(0))
    location = localization_template.coords_from_pose(pose)
    assert_almost_equal(location["phi"], 0)
    assert_almost_equal(location["d"], DX)

    pose = dtu.geo.SE2_from_translation_angle([center[0], center[1] - offset + DX], np.deg2rad(10))
    location = localization_template.coords_from_pose(pose)
    assert_almost_equal(location["phi"], np.deg2rad(10))
    assert_almost_equal(location["d"], DX)

    pose = dtu.geo.SE2_from_translation_angle([center[0] + offset, center[1]], np.deg2rad(90))
    location = localization_template.coords_from_pose(pose)
    assert_almost_equal(location["phi"], np.deg2rad(0))
    assert_almost_equal(location["d"], 0)

    a = 0
    pose = dtu.geo.SE2_from_translation_angle(
        [center[0] + offset * np.cos(a), center[1] + offset * np.sin(a)], np.deg2rad(45)
    )
    location = localization_template.coords_from_pose(pose)

    assert_almost_equal(location["phi"], np.deg2rad(-45))
    assert_almost_equal(location["d"], 0)

    a = np.deg2rad(-40)
    pose = dtu.geo.SE2_from_translation_angle(
        [center[0] + offset * np.cos(a), center[1] + offset * np.sin(a)], np.deg2rad(50)
    )
    location = localization_template.coords_from_pose(pose)
    #     print('offset: %s' % offset)
    #     print('pose: %s' % SE2.friendly(pose))
    #     print('location: %s' % phi_d_friendly(location))
    #
    assert_almost_equal(location["phi"], np.deg2rad(0))
    assert_almost_equal(location["d"], 0)

    a = np.deg2rad(-40)
    D = 0.01
    pose = dtu.geo.SE2_from_translation_angle(
        [center[0] + (offset + D) * np.cos(a), center[1] + (offset + D) * np.sin(a)], np.deg2rad(50)
    )
    location = localization_template.coords_from_pose(pose)
    #     print('offset: %s' % offset)
    #     print('pose: %s' % SE2.friendly(pose))
    #     print('location: %s' % phi_d_friendly(location))
    #
    assert_almost_equal(location["phi"], np.deg2rad(0))
    assert_almost_equal(location["d"], -D)

    pose = dtu.geo.SE2_from_translation_angle([+0.1095, 0], np.deg2rad(0))
    check_coords(localization_template, pose)

    pose = dtu.geo.SE2_from_translation_angle([+0.1095, 0], np.deg2rad(15))
    check_coords(localization_template, pose)
    #
    pose = dtu.geo.SE2_from_translation_angle([0.15, -0.1], np.deg2rad(5))
    check_coords(localization_template, pose)


#
def check_coords(localization_template, pose):
    location = localization_template.coords_from_pose(pose)
    pose_norm = localization_template.pose_from_coords(location)
    location2 = localization_template.coords_from_pose(pose_norm)

    logger.info(f"pose: {dtu.geo.SE2.friendly(pose)}")
    logger.info(f"location: {phi_d_friendly(location)}")
    logger.info(f"pose_norm: {dtu.geo.SE2.friendly(pose_norm)}")
    logger.info(f"location2: {phi_d_friendly(location2)}")
    for k in location.dtype.fields:
        assert_almost_equal(location[k], location2[k])


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
