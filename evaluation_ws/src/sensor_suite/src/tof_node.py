#!/usr/bin/env python
from duckietown import DTROS
from duckietown_msgs.msg import ToFStamped
from sensor_suite.tof_driver import ToF
from sensor_suite import SensorNotFound
from sensor_suite.config import config_file
import rospy
import smbus
import yaml
import os
from collections import namedtuple

MUX_ADDR = 0x70
TOF_CHIP_ID = 0xAD02


class SensorData(namedtuple('sensor_data', ['index', 'tof', 'pub'])):
    """
    Represents all of the necessary data for communicating with 1 individual ToF sensor.

    index: 0 - 7 inclusive. Index on the I2C multiplexer
    tof: The actual ToF object
    pub: rospy publisher
    """


class ToFNode(DTROS):
    """
    This node performs I2C communication with RFD77402 time-of-flight (ToF) distance sensors.

    This node will try to communicate with each of the 8 ports on the multiplexer on the front bumper.
    For each ToF sensor it finds, it will publish a ROS topic called 'tof_<n>', where <n> is the number of the port
    on the multiplexer.
    If it finds no ToF sensors, this node should cleanly exit. If an uncaught exception results in a stack
    trace being displayed, this is a bug, and should be reported.
    """

    def __init__(self, node_name='tof_node'):
        super(ToFNode, self).__init__(node_name)
        self.veh_name = rospy.get_namespace().strip("/")
        self.file_path = '/data/config/calibrations/sensor_suite/tof/{}.yaml'.format(self.veh_name)
        self.parameters['~polling_hz'] = None
        self.parameters['~m'] = None
        self.parameters['~b'] = None

        config_file.read_calibration(self.file_path, self, ['m', 'b'])
        self.updateParameters()

        self.smbus = smbus.SMBus(1)

        self.tofs = []

        for i in range(0, 8):
            try:
                self.select_tof(i)
                tof = ToF()
                chip_id = self.smbus.read_word_data(tof.addr, tof.RFD77402_MOD_CHIP_ID)
                if chip_id == TOF_CHIP_ID:
                    pub = rospy.Publisher("~tof_{}".format(i), ToFStamped, queue_size=10)
                    self.tofs.append(SensorData(i, tof, pub))
                    tof.begin()
            except IOError:
                # IOError probably means that there is no ToF sensor plugged into this particular port of the mux
                pass

        if len(self.tofs) == 0:
            raise SensorNotFound('No valid ToF sensors found')

        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0 / self.parameters['~polling_hz']), self.read_distances)

    def select_tof(self, index):
        """
        Selects which port of the multiplexer is currently being used.
        :param index: Index of the port on the multiplexer (0 - 7, inclusive)
        :return: None
        :raises: IOError if it is unable to communicate with the front bumper multiplexer
        """
        self.smbus.write_byte(MUX_ADDR, 1 << index)

    def read_distances(self, event):
        """
        Reads all connected ToF sensors and publishes the results.

        This function should be called periodically by a ROSPy Timer.
        """
        for sensor in self.tofs:
            msg = ToFStamped()
            msg.header.stamp = rospy.Time.now()
            try:
                self.select_tof(sensor.index)
                error_code, distance, valid_pixels, confidence_value = sensor.tof.takeMeasurement()
                distance = self.parameters['~m'][sensor.index] * distance + self.parameters['~b'][sensor.index]
            except IOError as e:
                self.log("IOError when reading from ToF: {}".format(e))
                error_code, distance, valid_pixels, confidence_value = 0x03, 0, 0, 0
            msg.error = error_code
            msg.distance = distance
            msg.confidence = confidence_value
            sensor.pub.publish(msg)
            # print("[{i}] Distance: {dist}, valid pixels: {pixels}, confidence: {conf}".format(
            #     i=sensor.index, dist=distance, pixels=valid_pixels, conf=confidence_value
            # ))


if __name__ == "__main__":
    try:
        node = ToFNode()
        rospy.spin()
    except SensorNotFound as e:
        print(e)
    # except IOError as e:
    #     print("Error when trying to communicate with front bumper. Is it plugged in?")
