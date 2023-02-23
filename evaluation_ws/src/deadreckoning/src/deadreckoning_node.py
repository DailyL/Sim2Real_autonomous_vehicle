#!/usr/bin/env python3

import time
import math
import rospy
import message_filters

from nav_msgs.msg import Odometry
from geometry_msgs.msg import Quaternion, Twist, Pose, Point, Vector3, TransformStamped, Transform

from duckietown.dtros import DTROS, NodeType
from duckietown_msgs.msg import WheelEncoderStamped
from tf2_ros import TransformBroadcaster

from tf import transformations as tr


class DeadReckoningNode(DTROS):
    """Performs deadreckoning.
    The node performs deadreckoning to estimate odometry
    based upon wheel encoder values.

    Args:
        node_name (:obj:`str`): a unique, descriptive name for the node that ROS will use

    Configuration:
        ~veh (:obj:`str`): Robot name
        ~publish_hz (:obj:`float`): Frequency at which to publish odometry
        ~encoder_stale_dt (:obj:`float`): Time in seconds after encoders are considered stale
        ~wheelbase (:obj:`float`): Lateral distance between the center of wheels (in meters)
        ~ticks_per_meter (:obj:`int`): Total encoder ticks associated with one meter of travel
        ~debug (:obj: `bool`): Enable/disable debug output

    Publisher:
        ~odom (:obj:`Odometry`): The computed odometry

    Subscribers:
        ~left_wheel_encoder_node/tick (:obj:`WheelEncoderStamped`): Encoder ticks for left wheel
        ~right_wheel_encoder_node/tick (:obj:`WheelEncoderStamped`): Encoder ticks for right wheel
    """

    def __init__(self, node_name):
        super(DeadReckoningNode, self).__init__(node_name=node_name, node_type=NodeType.LOCALIZATION)
        self.node_name = node_name

        self.veh = rospy.get_param("~veh")
        self.publish_hz = rospy.get_param("~publish_hz")
        self.encoder_stale_dt = rospy.get_param("~encoder_stale_dt")
        self.ticks_per_meter = rospy.get_param("~ticks_per_meter")
        self.wheelbase = rospy.get_param("~wheelbase")
        self.origin_frame = rospy.get_param("~origin_frame").replace("~", self.veh)
        self.target_frame = rospy.get_param("~target_frame").replace("~", self.veh)
        self.debug = rospy.get_param("~debug", False)

        self.left_encoder_last = None
        self.right_encoder_last = None
        self.encoders_timestamp_last = None
        self.encoders_timestamp_last_local = None

        # Current pose, forward velocity, and angular rate
        self.timestamp = None
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.yaw = 0.0
        self.q = [0.0, 0.0, 0.0, 1.0]
        self.tv = 0.0
        self.rv = 0.0

        # Used for debugging
        self.x_trajectory = []
        self.y_trajectory = []
        self.yaw_trajectory = []
        self.time = []

        self.total_dist = 0

        # Setup subscribers
        self.sub_encoder_left = message_filters.Subscriber("~left_wheel", WheelEncoderStamped)

        self.sub_encoder_right = message_filters.Subscriber("~right_wheel", WheelEncoderStamped)

        # Setup the time synchronizer
        self.ts_encoders = message_filters.ApproximateTimeSynchronizer(
            [self.sub_encoder_left, self.sub_encoder_right], 10, 0.5
        )
        self.ts_encoders.registerCallback(self.cb_ts_encoders)

        # Setup publishers
        self.pub = rospy.Publisher("~odom", Odometry, queue_size=10)

        # Setup timer
        self.timer = rospy.Timer(rospy.Duration(1 / self.publish_hz), self.cb_timer)
        self._print_time = 0
        self._print_every_sec = 30
        # tf broadcaster for odometry TF
        self._tf_broadcaster = TransformBroadcaster()

        self.loginfo("Initialized")

    def cb_ts_encoders(self, left_encoder, right_encoder):
        timestamp_now = rospy.get_time()

        # Use the average of the two encoder times as the timestamp
        left_encoder_timestamp = left_encoder.header.stamp.to_sec()
        right_encoder_timestamp = right_encoder.header.stamp.to_sec()
        timestamp = (left_encoder_timestamp + right_encoder_timestamp) / 2

        if not self.left_encoder_last:
            self.left_encoder_last = left_encoder
            self.right_encoder_last = right_encoder
            self.encoders_timestamp_last = timestamp
            self.encoders_timestamp_last_local = timestamp_now
            return

        # Skip this message if the time synchronizer gave us an older message
        dtl = left_encoder.header.stamp - self.left_encoder_last.header.stamp
        dtr = right_encoder.header.stamp - self.right_encoder_last.header.stamp
        if dtl.to_sec() < 0 or dtr.to_sec() < 0:
            self.loginfo("Ignoring stale encoder message")
            return

        left_dticks = left_encoder.data - self.left_encoder_last.data
        right_dticks = right_encoder.data - self.right_encoder_last.data

        left_distance = left_dticks * 1.0 / self.ticks_per_meter
        right_distance = right_dticks * 1.0 / self.ticks_per_meter

        # Displacement in body-relative x-direction
        distance = (left_distance + right_distance) / 2

        # Change in heading
        dyaw = (right_distance - left_distance) / self.wheelbase

        dt = timestamp - self.encoders_timestamp_last

        if dt < 1e-6:
            self.logwarn("Time since last encoder message (%f) is too small. Ignoring" % dt)
            return

        self.tv = distance / dt
        self.rv = dyaw / dt

        if self.debug:
            self.loginfo(
                "Left wheel:\t Time = %.4f\t Ticks = %d\t Distance = %.4f m"
                % (left_encoder.header.stamp.to_sec(), left_encoder.data, left_distance)
            )

            self.loginfo(
                "Right wheel:\t Time = %.4f\t Ticks = %d\t Distance = %.4f m"
                % (right_encoder.header.stamp.to_sec(), right_encoder.data, right_distance)
            )

            self.loginfo(
                "TV = %.2f m/s\t RV = %.2f deg/s\t DT = %.4f" % (self.tv, self.rv * 180 / math.pi, dt)
            )

        dist = self.tv * dt
        dyaw = self.rv * dt

        self.yaw = self.angle_clamp(self.yaw + dyaw)
        self.x = self.x + dist * math.cos(self.yaw)
        self.y = self.y + dist * math.sin(self.yaw)
        self.q = tr.quaternion_from_euler(0, 0, self.yaw)
        self.timestamp = timestamp

        self.left_encoder_last = left_encoder
        self.right_encoder_last = right_encoder
        self.encoders_timestamp_last = timestamp
        self.encoders_timestamp_last_local = timestamp_now

    def cb_timer(self, _):
        need_print = time.time() - self._print_time > self._print_every_sec
        if self.encoders_timestamp_last:
            dt = rospy.get_time() - self.encoders_timestamp_last_local
            if abs(dt) > self.encoder_stale_dt:
                if need_print:
                    self.logwarn(
                        "No encoder messages received for %.2f seconds. "
                        "Setting translational and rotational velocities to zero" % dt
                    )
                self.rv = 0.0
                self.tv = 0.0
        else:
            if need_print:
                self.logwarn(
                    "No encoder messages received. " "Setting translational and rotational velocities to zero"
                )
            self.rv = 0.0
            self.tv = 0.0

        # Publish the odometry message
        self.publish_odometry()
        if need_print:
            self._print_time = time.time()

    def publish_odometry(self):
        odom = Odometry()
        odom.header.stamp = rospy.Time.now()  # Ideally, should be encoder time
        odom.header.frame_id = self.origin_frame
        odom.pose.pose = Pose(Point(self.x, self.y, self.z), Quaternion(*self.q))
        odom.child_frame_id = self.target_frame
        odom.twist.twist = Twist(Vector3(self.tv, 0.0, 0.0), Vector3(0.0, 0.0, self.rv))

        self.pub.publish(odom)

        self._tf_broadcaster.sendTransform(
            TransformStamped(
                header=odom.header,
                child_frame_id=self.target_frame,
                transform=Transform(
                    translation=Vector3(self.x, self.y, self.z), rotation=Quaternion(*self.q)
                ),
            )
        )

    @staticmethod
    def angle_clamp(theta):
        if theta > 2 * math.pi:
            return theta - 2 * math.pi
        elif theta < -2 * math.pi:
            return theta + 2 * math.pi
        else:
            return theta


if __name__ == "__main__":
    # create node
    node = DeadReckoningNode("deadreckoning_node")
    rospy.spin()
    # ---
    rospy.signal_shutdown("done")
