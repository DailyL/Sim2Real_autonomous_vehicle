#!/usr/bin/env python
from __future__ import division, print_function
from duckietown import DTROS
from sensor_suite.line_following_sensor import LineFollower, LineDetection
from sensor_suite import SensorNotFound
from sensor_suite.config import config_file
from std_msgs.msg import Float32
import rospy
import json
from builtins import input

# Total number of measurements to take for averaging
NUM_MEASUREMENTS = 100
# What brightness value should yellow be calibrated to?
IDEAL_YELLOW = 0.2
# What brightness level should black be calibrated to?
IDEAL_BLACK = 1.0


class LineFollowingCalibrationNode(DTROS):
    """
    Walks the user through the calibration procedure for the line following sensor
    """
    def __init__(self, node_name='line_following_node'):
        super(LineFollowingCalibrationNode, self).__init__(node_name)
        # self.parameters['~polling_hz'] = None
        # self.updateParameters()

        self.veh_name = rospy.get_namespace().strip("/")
        self.file_path = '/data/config/calibrations/sensor_suite/line_follower/{}.yaml'.format(self.veh_name)

        self.line_follower = LineFollower()

    def calibrate_color(self, color):
        assert color in ('black', 'white', 'red', 'yellow')
        input('Place the duckiebot such that ALL 4 line follower sensors are over {}. Press enter when ready.'
              .format(color))
        print("Taking {} readings.".format(NUM_MEASUREMENTS))
        measurements = []
        while len(measurements) < NUM_MEASUREMENTS:
            voltages, valid = self.line_follower.read()
            measurements.append(voltages)
            print("{:3d}/{:3d}: {}".format(len(measurements), NUM_MEASUREMENTS, voltages))
            rospy.sleep(0.01)

        results = {
            'outer_left': [],
            'inner_left': [],
            'inner_right': [],
            'outer_right': []
        }

        for measurement in measurements:
            results['outer_left'].append(measurement.outer_left / 3.3)
            results['inner_left'].append(measurement.inner_left / 3.3)
            results['inner_right'].append(measurement.inner_right / 3.3)
            results['outer_right'].append(measurement.outer_right / 3.3)

        results = {
            key: sum(lst) / len(lst) for key, lst in results.items()
        }

        print(results)

        return results

    def calibrate_all(self):
        results = {color: self.calibrate_color(color) for color in ('black', 'white', 'yellow')}
        print(json.dumps(results, indent=2, sort_keys=True))
        print('\n\n')

        calibration = {}
        for sensor in ['outer_left', 'inner_left', 'inner_right', 'outer_right']:
            m = (IDEAL_BLACK - IDEAL_YELLOW) / (results['black'][sensor] - results['yellow'][sensor])
            calibration[sensor] = {
                'm': m,
                'b': IDEAL_YELLOW - m * results['yellow'][sensor]
            }
        return calibration


if __name__ == "__main__":
    try:
        node = LineFollowingCalibrationNode()
        calibration = node.calibrate_all()
        print(json.dumps(calibration, indent=2, sort_keys=True))
        config_file.save_calibration(node.file_path, calibration)
    except SensorNotFound as e:
        print(e)

