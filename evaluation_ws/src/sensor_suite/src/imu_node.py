#!/usr/bin/env python
import time

import rospy
from duckietown.dtros import DTROS, NodeType, TopicType
from sensor_msgs.msg import Imu
from sensor_suite.imu_driver import mpu9250
from sensor_suite import SensorNotFound
from sensor_suite.config import config_file
import math

G = 9.80665  # 1 G in m/s^2
DEG2RAD = math.pi / 180


class IMUHandler(DTROS):
    def __init__(self, node_name):
        super(IMUHandler, self).__init__(node_name=node_name, node_type=NodeType.PERCEPTION)
        self.veh_name = rospy.get_namespace().strip("/")
        
        self.polling_hz = rospy.get_param('~polling_hz')
        self.ang_vel_offset = rospy.get_param('~ang_vel_offset')
        self.accel_offset = rospy.get_param('~accel_offset')
        

        self.current_state = True
        try:
            self.sensor = mpu9250(1)
            _ = self.sensor.accel
            _ = self.sensor.gyro
        except IOError:
            raise SensorNotFound("IMU sensor not detected")

        self.pub = rospy.Publisher('~imu', Imu, queue_size=10)

        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0 / self.polling_hz), self.publish_data)

    def publish_data(self, event):
        try:

            a = self.sensor.accel
            # print('Accel: {:.3f} {:.3f} {:.3f} mg'.format(*a))
            g = self.sensor.gyro
            # print('Gyro: {:.3f} {:.3f} {:.3f} dps'.format(*g))
            # m = imu.mag
            # print 'Magnet: {:.3f} {:.3f} {:.3f} mT'.format(*m)
            # m = imu.temp
            # print 'Temperature: {:.3f} C'.format(m)
            msg = Imu()
            msg.header.stamp = rospy.Time.now()
            msg.angular_velocity.x = g[0] * DEG2RAD - self.accel_offset[0]
            msg.angular_velocity.y = g[1] * DEG2RAD - self.accel_offset[1]
            msg.angular_velocity.z = g[2] * DEG2RAD - self.accel_offset[2]
            msg.linear_acceleration.x = a[0] * G - self.ang_vel_offset[0]
            msg.linear_acceleration.y = a[1] * G - self.ang_vel_offset[1]
            msg.linear_acceleration.z = a[2] * G - self.ang_vel_offset[2]
            for i in range(0, 9):
                msg.angular_velocity_covariance[i] = 0
                msg.linear_acceleration_covariance[i] = 0
                msg.orientation_covariance[i] = -1

            self.pub.publish(msg)

        except IOError as e:
            errno, strerror = e.args
            print("I/O error({0}): {1}".format(errno, strerror))


if __name__ == '__main__':
    try:
        imu_sensor = IMUHandler('imu_node')
        rospy.spin()
    except SensorNotFound as e:
        print(e)
