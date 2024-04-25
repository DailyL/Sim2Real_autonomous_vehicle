#!/usr/bin/env python3
import os
import sys

from led_detection.LEDDetector import LEDDetector

import duckietown_code_utils as dtu
from duckietown_rosdata_utils.more import get_ros_package_path
from led_detection.unit_tests import load_tests

W = 0
H = 0

logger = dtu.logger


def main():
    script_name = os.path.basename(sys.argv[0])
    args = sys.argv[1:]
    if len(args) != 2:
        msg = "I need two arguments. Please see README.md for documentation."
        dtu.logger.error(msg)
        sys.exit(2)

    which_tests0 = sys.argv[1]
    which_estimators0 = sys.argv[2]

    package_dir = get_ros_package_path("led_detection")
    dtu.logger.debug(f"Package dir: {package_dir!r}")

    # dirname = 'catkin_ws/src/f23-LED/led_detection/scripts/'
    # filename = 'all_tests.yaml'
    filename = os.path.join(package_dir, "scripts", "dp45_tests.yaml")

    alltests = load_tests(filename)
    estimators = {
        "baseline": LEDDetector(ploteverything=False, verbose=True, plotfinal=False),
        "LEDDetector_plots": LEDDetector(True, True, True),
    }
    # ,'LEDDetector_forloops' : LEDDetector_forloops(True, True, True)}

    which_tests = dtu.expand_string(which_tests0, list(alltests))
    which_estimators = dtu.expand_string(which_estimators0, list(estimators))

    logger.info(f"     tests: {which_tests0!r} |-> {which_tests}")
    logger.info(f"estimators: {which_estimators0!r} |-> {which_estimators}")

    # which tests to execute
    test_results = {}
    for id_test in which_tests:
        for id_estimator in which_estimators:
            result = run_test(id_test, alltests[id_test], id_estimator, estimators[id_estimator])
            test_results[(id_test, id_estimator)] = result

    nfailed = list(test_results.values()).count(False)
    if not nfailed:
        logger.info("All tests passed")
    else:
        which = [k for k, v in list(test_results.items()) if not v]
        logger.error(f"These tests failed: {which} ")
        sys.exit(3)


def is_match(detection, expected):
    # Determines whether a detection matches with an expectation
    # if either the frequency or the position match but something
    # else doesn't, it warns about what it is
    global W, H

    print((f"shape is {W}, {H}"))
    predicates = {
        "position": abs(1.0 * detection.pixels_normalized.x * W - expected["image_coordinates"][0])
        < expected["image_coordinates_margin"]
        and abs(1.0 * detection.pixels_normalized.y * H - expected["image_coordinates"][1])
        < expected["image_coordinates_margin"],
        "frequency": detection.frequency == expected["frequency"],
        # 'timestamps': abs(detection.timestamp1-expected['timestamp1'])<0.1 and
        #              abs(detection.timestamp2-expected['timestamp2'])<0.1
    }

    unsatisfied = [n for n in predicates if not predicates[n]]
    if unsatisfied and (predicates["position"] or predicates["frequency"]):
        logger.warning(
            f"\nAlmost a match - ({unsatisfied} mismatch) - between detection: \n{detection} \nand "
            f"expectation: \n{expected}"
        )

    return not unsatisfied


def find_match(detection, expected_set):
    # return index (in expected) of the first match to detection
    # or -1 if there is no match
    try:
        return next((n for n in range(len(expected_set)) if (is_match(detection, expected_set[n]))))
    except StopIteration:
        return -1


def run_test(id_test, test, id_estimator, estimator):
    global W, H

    logger.info(f"     id_test: {id_test}")
    logger.info(f"id_estimator: {id_estimator}")
    from led_detection.unit_tests import LEDDetectionUnitTest

    assert isinstance(test, LEDDetectionUnitTest)
    query = test.get_query()
    print(query["images"]["rgb"][0].shape)
    H, W, _ = query["images"]["rgb"][0].shape
    print((f"shape is {W}, {H}"))
    result = estimator.detect_led(**query)

    # We are testing whether the expected detections are a subset of
    # the returned ones, we will accept duplicate detections of the
    # same LED
    match_count = [0] * len(test.expected)
    for r in result.detections:
        m = find_match(r, test.expected)
        if m != -1:
            match_count[m] += 1

    missedLEDs = [test.expected[i] for i in range(0, len(match_count)) if match_count[i] == 0]
    if missedLEDs:
        logger.error(f"missed LED detections ({len(missedLEDs)}): \n {missedLEDs}")

    return not 0 in match_count


if __name__ == "__main__":
    dtu.wrap_main(main)
