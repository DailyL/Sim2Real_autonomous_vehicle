#!/usr/bin/env python3
import rospy
from duckietown.dtros import DTROS, NodeType, TopicType
from duckietown_msgs.msg import Segment, SegmentList
from std_msgs.msg import ColorRGBA  # Imports msg
from visualization_msgs.msg import Marker, MarkerArray


class LineSegmentVisualizer(DTROS):
    def __init__(self, node_name):
        # Initialize the DTROS parent class
        super(LineSegmentVisualizer, self).__init__(node_name=node_name, node_type=NodeType.DEBUG)

        # Read parameters
        self.veh_name = self.setupParameter("~veh_name", "megaman")

        # Setup publishers
        # self.pub_timestep = self.setupParameter("~pub_timestep",1.0)
        self.pub_seg_list = rospy.Publisher(
            "~segment_list_markers", MarkerArray, queue_size=1, dt_topic_type=TopicType.DEBUG
        )
        self.pub_seg_list_filtered = rospy.Publisher(
            "~filtered_segment_list_markers", MarkerArray, queue_size=1, dt_topic_type=TopicType.DEBUG
        )

        # Create a timer that calls the cbTimer function every 1.0 second
        # self.timer = rospy.Timer(rospy.Duration.from_sec(self.pub_timestep),self.cbTimer)

        self.seg_color_dict = dict()
        self.seg_color_dict[Segment.WHITE] = ColorRGBA(r=1.0, g=1.0, b=1.0, a=1.0)
        self.seg_color_dict[Segment.YELLOW] = ColorRGBA(r=1.0, g=1.0, b=0.0, a=1.0)
        self.seg_color_dict[Segment.RED] = ColorRGBA(r=1.0, g=0.0, b=0.0, a=1.0)

        # Setup subscriber
        self.sub_seg_list = rospy.Subscriber("~segment_list", SegmentList, self.cbSegList)
        self.sub_filtered_seg_list = rospy.Subscriber(
            "~segment_list_filtered", SegmentList, self.cbSegListFiltered
        )

        rospy.loginfo(f"[{self.node_name}] Initialzed.")

    def cbSegList(self, seg_list_msg):
        marker_array = MarkerArray()
        marker_array.markers.append(self.segList2Marker(seg_list_msg))
        # rospy.loginfo("[%s] publishing %s marker."%(self.node_name,len(marker_array.markers)))
        self.pub_seg_list.publish(marker_array)

    def cbSegListFiltered(self, seg_list_msg):
        marker_array = MarkerArray()
        marker_array.markers.append(self.segList2Marker(seg_list_msg))
        # rospy.loginfo("[%s] publishing %s marker."%(self.node_name,len(marker_array.markers)))
        self.pub_seg_list_filtered.publish(marker_array)

    def segList2Marker(self, seg_list_msg):
        marker = Marker()
        marker.header.frame_id = self.veh_name
        marker.header.stamp = seg_list_msg.header.stamp
        marker.ns = self.veh_name + "/line_seg"
        marker.id = 0
        marker.action = Marker.ADD
        marker.lifetime = rospy.Duration.from_sec(5.0)
        marker.type = Marker.LINE_LIST
        marker.pose.orientation.w = 1.0
        marker.scale.x = 0.02
        for seg in seg_list_msg.segments:
            # point_start = seg.points[0]
            # point_end = seg.points[1]
            marker.points.append(seg.points[0])
            marker.points.append(seg.points[1])
            color = self.seg_color_dict[seg.color]
            marker.colors.append(color)
            marker.colors.append(color)

        # rospy.loginfo("[%s] Number of points %s" %(self.node_name,len(marker.points)))
        return marker

    def setupParameter(self, param_name, default_value):
        value = rospy.get_param(param_name, default_value)
        # Write to parameter server for transparancy
        rospy.set_param(param_name, value)
        rospy.loginfo(f"[{self.node_name}] {param_name} = {value} ")
        return value


if __name__ == "__main__":
    # Create the NodeName object
    node = LineSegmentVisualizer(node_name="Line_segment_visualizer")

    # Keep it spinning to keep the node alive
    rospy.spin()
