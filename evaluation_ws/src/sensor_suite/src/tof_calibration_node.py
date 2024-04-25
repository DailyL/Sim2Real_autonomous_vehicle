#!/usr/bin/env python
from __future__ import print_function, division
from builtins import input
from duckietown import DTROS
import rospy
import sys
import select
import math
import smbus
from sensor_suite.tof_driver import ToF
from sensor_suite.config import config_file


NUM_MEASUREMENTS = 100
MUX_ADDR = 0x70


class ToFCalibrationNode(DTROS):

    def __init__(self, node_name="tof_calibration_node"):
        super(ToFCalibrationNode, self).__init__(node_name)

        self.veh_name = rospy.get_namespace().strip("/")
        self.file_path = '/data/config/calibrations/sensor_suite/tof/{}.yaml'.format(self.veh_name)

        self.m = [1.0] * 8
        self.b = [0.0] * 8

        self.parameters['~polling_hz'] = None
        self.updateParameters()

        self.smbus = smbus.SMBus(1)

    def do_one_distance(self, tof):
        """
        :param tof: The ToF object to calibrate
        :return: (Correct distance, mean measured distance, standard deviation)
        """
        print("Now, place a large flat object in front of the sensor, at a distance between 100mm and 2000mm.")
        number = input("How far, in millimeters, is this object from the sensor? ")
        print("")
        while True:
            try:
                number = int(number)
                break
            except ValueError:
                number = input("Not a number. Please input an integer number of millimeters. ")
        dist = number
        print("I will now take {} measurements at this distance.".format(NUM_MEASUREMENTS))
        measurements = []
        # We need to clear the last old measurement from the buffer
        tof.takeMeasurement()
        for i in range(1, NUM_MEASUREMENTS + 1):
            error_code, distance, valid_pixels, confidence_value = tof.takeMeasurement()
            measurements.append(distance)
            print("Measurement {}/{}: {:4d}mm".format(i, NUM_MEASUREMENTS, distance))
            rospy.sleep(1.0 / self.parameters['~polling_hz'])
        mean = sum(measurements) / len(measurements)
        stddev = math.sqrt(sum(map(lambda x: (x - mean) ** 2, measurements)) / len(measurements))
        print("Mean: {}, Standard Deviation: {}".format(mean, stddev))
        input("Press enter to continue...")
        return dist, mean, stddev

    def calibrate(self, index):
        try:
            self.select_tof(index)
            tof = ToF()
            tof.begin()
        except IOError:
            print("No ToF found on index {}".format(index))
            return
        print("Calibrating ToF sensor on index {}".format(index))
        print("\n")
        while not select.select([sys.stdin], [], [], 1.0 / self.parameters['~polling_hz'])[0]:
            error_code, distance, valid_pixels, confidence_value = tof.takeMeasurement()
            print("\033[1000D\033[1A\033[KDistance: {:4d}mm".format(distance))
            print("Use these measurements to identify the correct sensor. Press enter once you have done this.")

        input('')  # This is needed to clear the stdin buffer after the select call above
        print("\n")
        print("Now beginning calibration. You will be asked to repeat this procedure twice.")
        dist1, mean1, stddev1 = self.do_one_distance(tof)
        dist2, mean2, stddev2 = self.do_one_distance(tof)
        slope = (dist2 - dist1) / (mean2 - mean1)
        intercept = dist1 - (slope * mean1)
        self.m[index] = slope
        self.b[index] = intercept
        print("Slope: {:.4f}, Intercept: {:.4f}".format(slope, intercept))
        input("Press enter to continue...")
        while not select.select([sys.stdin], [], [], 1.0 / self.parameters['~polling_hz'])[0]:
            error_code, distance, valid_pixels, confidence_value = tof.takeMeasurement()
            dist = slope * distance + intercept
            print("\033[1000D\033[1A\033[KDistance: {:9.4f}mm".format(dist))
            print("Use these measurements to verify the calibration. Press enter when done.")

        input('')  # This is needed to clear the stdin buffer after the select call above

    def select_tof(self, index):
        """
        Selects which port of the multiplexer is currently being used.
        :param index: Index of the port on the multiplexer (0 - 7, inclusive)
        :return: None
        :raises: IOError if it is unable to communicate with the front bumper multiplexer
        """
        self.smbus.write_byte(MUX_ADDR, 1 << index)


if __name__ == "__main__":
    node = ToFCalibrationNode()
    for i in range(0, 8):
        node.calibrate(i)
    config_file.save_calibration(node.file_path, {
        'm': node.m,
        'b': node.b
    })
