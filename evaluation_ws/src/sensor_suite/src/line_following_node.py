#!/usr/bin/env python
from duckietown import DTROS
from sensor_suite.line_following_sensor import LineFollower
from sensor_suite import SensorNotFound
from sensor_suite.config import config_file
from duckietown_msgs.msg import LineFollowerStamped
from std_msgs.msg import Float32
import rospy


class LineFollowingNode(DTROS):
    """
    Reads from the line following sensors on DBV2, and publishes a ROS topic.

    When this node starts, it will check the ADC diagnostics to see if all of the line following sensors are plugged in.
    If ANY are missing (showing any errors on the ADC diagnostics), then this node will shut itself down gracefully.

    One important caveat: currently, the ADC diagnostics only reset at boot. So if you perform the following sequence:
     - Boot up the duckiebot
     - Plug in line following sensors
     - Start this node
    the ADC diagnostics will show an error (persistent from before the sensors were plugged in), and this node
    will not start up.

    If the sensors are plugged in but this node does not start up, try rebooting the HUT (completely remove it
    from power) to clear the ADC errors.
    """

    def __init__(self, node_name='line_following_node'):
        super(LineFollowingNode, self).__init__(node_name)
        self.veh_name = rospy.get_namespace().strip("/")
        self.file_path = '/data/config/calibrations/sensor_suite/line_follower/{}.yaml'.format(self.veh_name)

        self.parameters['~polling_hz'] = None
        self.parameters['~outer_right'] = None
        self.parameters['~inner_right'] = None
        self.parameters['~inner_left'] = None
        self.parameters['~outer_left'] = None

        config_file.read_calibration(self.file_path, self, ('outer_right', 'inner_right', 'inner_left', 'outer_left'))
        self.updateParameters()
        self.line_follower = LineFollower()

        _, valid = self.line_follower.read()
        if not valid:
            raise SensorNotFound('Line following sensors not found. Error code: {:08b}'
                                 .format(self.line_follower.diagnostics()))

        self.pub = rospy.Publisher("~line_follower", LineFollowerStamped, queue_size=10)
        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0 / self.parameters['~polling_hz']),
                                 self.publish_line_readings)

    def publish_line_readings(self, event):
        voltages, valid = self.line_follower.read()
        msg = LineFollowerStamped()
        msg.header.stamp = rospy.Time.now()
        msg.valid = valid
        for sensor in ['outer_right', 'inner_right', 'inner_left', 'outer_left']:
            val = self.parameters['~' + sensor]['m'] * getattr(voltages, sensor) / 3.3 \
                  + self.parameters['~' + sensor]['b']
            setattr(msg, sensor, min(max(val, 0), 1))
        self.pub.publish(msg)


if __name__ == "__main__":
    try:
        node = LineFollowingNode()
        rospy.spin()
    except SensorNotFound as e:
        print(e)
