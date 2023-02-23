#!/usr/bin/env python
from __future__ import division
import math
import pigpio
import rospy
from duckietown import DTROS
from duckietown_msgs.msg import EncoderStamped
import threading


class EncoderNode(DTROS):
    def __init__(self, node_name):
        super(EncoderNode, self).__init__(node_name=node_name)

        self.parameters['~pin_encoder'] = None
        self.parameters['~radius'] = None
        self.parameters['~holes_per_round'] = None
        self.parameters['~polling_hz'] = None
        self.updateParameters()

        # Setup the Publishers & Messages
        self.pub_encoder_velocity = rospy.Publisher("~encoder_velocity", EncoderStamped, queue_size=1)
        self.global_count = 0
        self.last_published_time = rospy.get_time()
        self.last_published_count = 0
        self.count_lock = threading.Lock()
        self._run = True
        self.current_level = 2
        self.last_tick = 0

        rospy.loginfo("[%s] Initialized.", self.node_name)

        self.pigpio = pigpio.pi()
        self.pigpio.set_mode(self.parameters['~pin_encoder'], pigpio.INPUT)
        self.pigpio.set_pull_up_down(self.parameters['~pin_encoder'], pigpio.PUD_UP)
        self.pigpio.callback(self.parameters['~pin_encoder'], pigpio.EITHER_EDGE, self.edge_callback)

        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0 / self.parameters['~polling_hz']), self.publish_msg)

    def publish_msg(self, _):
        with self.count_lock:
            total_count = self.global_count
        now = rospy.get_time()
        diff = (total_count - self.last_published_count) / 2
        dt = now - self.last_published_time
        holes_velocity = diff / dt  # Velocity in holes per second
        velocity = (holes_velocity / self.parameters['~holes_per_round']) * 2 * math.pi * self.parameters['~radius']

        msg = EncoderStamped()
        msg.header.stamp = rospy.Time.now()
        msg.vel_encoder = velocity
        msg.count = total_count // 2
        self.pub_encoder_velocity.publish(msg)

        self.last_published_time = now
        self.last_published_count = total_count

    def edge_callback(self, gpio_pin, level, tick):

        if tick - self.last_tick > 1000:
            self.last_tick = tick
            with self.count_lock:
                self.global_count += 1

    def __del__(self):
        self.pigpio.stop()  # clean up GPIO on normal exit


if __name__ == '__main__':
    encoder_node = EncoderNode('encoder_node')
    rospy.spin()
