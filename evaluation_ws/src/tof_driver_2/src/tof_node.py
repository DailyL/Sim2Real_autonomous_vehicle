#!/usr/bin/env python3

import rospy
import dataclasses
import numpy as np

from sensor_msgs.msg import Range
from std_msgs.msg import Header
from duckietown_msgs.msg import DisplayFragment

from lib_dt_vl53l0x.dt_vl53l0x import \
    VL53L0X, \
    Vl53l0xAccuracyMode

from dt_class_utils import DTReminder
from duckietown.dtros import DTROS, NodeType, TopicType


@dataclasses.dataclass
class ToFAccuracy:
    mode: Vl53l0xAccuracyMode
    timing_budget: float
    max_range: float
    # the following are taken from the sensor's datasheet
    min_range: float = 0.05
    fov: float = np.deg2rad(25)

    @staticmethod
    def from_string(mode: str):
        ms = 1 / 1000
        return {
            "GOOD": ToFAccuracy(Vl53l0xAccuracyMode.GOOD, 33 * ms, 1.2),
            "BETTER": ToFAccuracy(Vl53l0xAccuracyMode.BETTER, 66 * ms, 1.2),
            "BEST": ToFAccuracy(Vl53l0xAccuracyMode.BEST, 200 * ms, 1.2),
            "LONG_RANGE": ToFAccuracy(Vl53l0xAccuracyMode.LONG_RANGE, 33 * ms, 2.0),
            "HIGH_SPEED": ToFAccuracy(Vl53l0xAccuracyMode.HIGH_SPEED, 20 * ms, 1.2)
        }[mode]


class ToFNode(DTROS):

    def __init__(self):
        super(ToFNode, self).__init__(
            node_name='tof_node',
            node_type=NodeType.DRIVER
        )
        # get parameters
        self._veh = rospy.get_param('~veh')
        self._i2c_bus = rospy.get_param('~bus')
        self._i2c_address = rospy.get_param('~address', 0x29)
        self._sensor_name = rospy.get_param('~sensor_name')
        self._frequency = int(max(1, rospy.get_param('~frequency', 10)))
        self._mode = rospy.get_param('~mode', 'BETTER')
        self._display_fragment_frequency = rospy.get_param('~display_fragment_frequency', 4)
        self._accuracy = ToFAccuracy.from_string(self._mode)
        # create a VL53L0X sensor handler
        self._sensor = VL53L0X(i2c_bus=self._i2c_bus, i2c_address=self._i2c_address)
        self._sensor.open()
        # create publisher
        self._pub = rospy.Publisher(
            "~range",
            Range,
            queue_size=1,
            dt_topic_type=TopicType.DRIVER,
            dt_help="The distance to the closest object detected by the sensor"
        )
        self._display_pub = rospy.Publisher(
            "~fragments",
            DisplayFragment,
            queue_size=1,
            dt_topic_type=TopicType.VISUALIZATION,
            dt_help="Fragments to display on the display"
        )
        # create screen renderer
        self._renderer = ToFSensorFragmentRenderer(self._sensor_name, self._accuracy)
        # start ranging
        self._sensor.start_ranging(self._accuracy.mode)
        max_frequency = min(self._frequency, int(1.0 / self._accuracy.timing_budget))
        if self._frequency > max_frequency:
            self.logwarn(f"Frequency of {self._frequency}Hz not supported. The selected mode "
                         f"{self._mode} has a timing budget of {self._accuracy.timing_budget}s, "
                         f"which yields a maximum frequency of {max_frequency}Hz.")
            self._frequency = max_frequency
        self.loginfo(f"Frequency set to {self._frequency}Hz.")
        # create timers
        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0 / max_frequency), self._timer_cb)
        self._fragment_reminder = DTReminder(frequency=self._display_fragment_frequency)

    def _timer_cb(self, _):
        # detect range
        distance_mm = self._sensor.get_distance()
        # pack observation into a message
        msg = Range(
            header=Header(
                stamp=rospy.Time.now(),
                frame_id=f"{self._veh}/tof/{self._sensor_name}"
            ),
            radiation_type=Range.INFRARED,
            field_of_view=self._accuracy.fov,
            min_range=self._accuracy.min_range,
            max_range=self._accuracy.max_range,
            range=distance_mm / 1000
        )
        # publish
        self._pub.publish(msg)
        # publish display rendering (if it is a good time to do so)
        if self._fragment_reminder.is_time():
            self._renderer.update(distance_mm)
            msg = self._renderer.as_msg()
            self._display_pub.publish(msg)

    def on_shutdown(self):
        # noinspection PyBroadException
        try:
            self._sensor.stop_ranging()
        except BaseException:
            pass




if __name__ == '__main__':
    node = ToFNode()
    rospy.spin()
