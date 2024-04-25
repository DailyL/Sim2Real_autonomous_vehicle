#!/usr/bin/env python

from builtins import input
import rospy
from duckietown import DTROS
from sensor_msgs.msg import Imu
from sensor_suite.imu_driver import mpu9250
from sensor_suite import SensorNotFound
from sensor_suite.config import config_file
import math

G = 9.80665  # 1 G in m/s^2
DEG2RAD = math.pi / 180
NUM_MEASUREMENTS = 1000


class IMUCalibration(DTROS):
    def __init__(self, node_name="imu_calibration_node"):
        super(IMUCalibration, self).__init__(node_name=node_name)

        self.veh_name = rospy.get_namespace().strip("/")
        self.file_path = '/data/config/calibrations/sensor_suite/imu/{}.yaml'.format(self.veh_name)

        self.current_state = True
        try:
            self.sensor = mpu9250(1)
            _ = self.sensor.accel
            _ = self.sensor.gyro
        except IOError:
            raise SensorNotFound("IMU sensor not detected")

    def calibrate(self):

        gyro_totals = [0, 0, 0]
        accel_totals = [0, 0, 0]

        input('Place the Duckiebot on a level surface, and leave it perfectly still. Press enter when ready. ')

        for n in range(0, NUM_MEASUREMENTS):
            a = self.sensor.accel
            g = self.sensor.gyro

            for i in range(0, 3):
                gyro_totals[i] += g[i] * DEG2RAD
                accel_totals[i] += a[i] * G

            if n % 10 == 0:
                self.log("{:4d}/{:4d}".format(n + 1, NUM_MEASUREMENTS))
            rospy.sleep(0.01)

        gyro_avg = list(map(lambda x: x / NUM_MEASUREMENTS, gyro_totals))
        accel_avg = list(map(lambda x: x / NUM_MEASUREMENTS, accel_totals))
        accel_avg[2] -= G

        return {
            'ang_vel_offset': gyro_avg,
            'accel_offset': accel_avg
        }


if __name__ == '__main__':
    try:
        imu_sensor = IMUCalibration('imu_node')
        config = imu_sensor.calibrate()
        print(config)
        config_file.save_calibration(imu_sensor.file_path, config)
    except SensorNotFound as e:
        print(e)
