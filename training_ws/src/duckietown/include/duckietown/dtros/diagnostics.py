import time
from collections import OrderedDict
from typing import Tuple

import rospy
import socket
from threading import Lock

from .constants import *
from .utils import apply_namespace, get_module_type, get_module_instance
from . import get_instance

from duckietown_msgs.msg import \
    NodeParameter, \
    DiagnosticsRosNode,\
    DiagnosticsRosTopic,\
    DiagnosticsRosTopicArray,\
    DiagnosticsRosLink, \
    DiagnosticsRosLinkArray, \
    DiagnosticsRosParameterArray, \
    DiagnosticsCodeProfilingArray, \
    DiagnosticsCodeProfiling


class DTROSDiagnostics:

    instance = None

    def __init__(self):
        pass

    @classmethod
    def getInstance(cls):
        if not cls.enabled():
            return None
        if cls.instance is None:
            cls.instance = _DTROSDiagnosticsManager()
        return cls.instance

    @classmethod
    def enabled(cls):
        return DIAGNOSTICS_ENABLED and (get_instance() is not None and not get_instance().is_ghost)


class _DTROSDiagnosticsManager:

    def __init__(self):
        # initialize diagnostics data containers
        self._node_stats = {}
        self._topics_stats = {}
        self._topics_monitor = {}
        self._topics_stats_lock = Lock()
        self._links_stats = {}
        self._links_stats_lock = Lock()
        self._params_stats = {}
        self._profiling_stats_lock = Lock()
        self._profiling_stats = OrderedDict()
        # initialize publishers
        self._node_diagnostics_pub = rospy.Publisher(
            apply_namespace(DIAGNOSTICS_ROS_NODE_TOPIC, 1),
            DiagnosticsRosNode,
            queue_size=20,
            latch=True,
            dt_ghost=True,
            dt_topic_type=TopicType.DEBUG
        )
        self._topics_diagnostics_pub = rospy.Publisher(
            apply_namespace(DIAGNOSTICS_ROS_TOPICS_TOPIC, 1),
            DiagnosticsRosTopicArray,
            queue_size=20,
            latch=True,
            dt_ghost=True,
            dt_topic_type=TopicType.DEBUG
        )
        self._params_diagnostics_pub = rospy.Publisher(
            apply_namespace(DIAGNOSTICS_ROS_PARAMETERS_TOPIC, 1),
            DiagnosticsRosParameterArray,
            queue_size=20,
            latch=True,
            dt_ghost=True,
            dt_topic_type=TopicType.DEBUG
        )
        self._links_diagnostics_pub = rospy.Publisher(
            apply_namespace(DIAGNOSTICS_ROS_LINKS_TOPIC, 1),
            DiagnosticsRosLinkArray,
            queue_size=20,
            latch=True,
            dt_ghost=True,
            dt_topic_type=TopicType.DEBUG
        )
        self._profiling_diagnostics_pub = rospy.Publisher(
            apply_namespace(DIAGNOSTICS_CODE_PROFILING_TOPIC, 1),
            DiagnosticsCodeProfilingArray,
            queue_size=20,
            latch=True,
            dt_ghost=True,
            dt_topic_type=TopicType.DEBUG
        )
        # topics diagnostics timer
        self._topics_diagnostics_timer = rospy.Timer(
            period=rospy.Duration.from_sec(DIAGNOSTICS_ROS_TOPICS_PUB_EVERY_SEC),
            callback=self._publish_topics_diagnostics,
            oneshot=False
        )
        # links diagnostics timer
        self._links_diagnostics_timer = rospy.Timer(
            period=rospy.Duration.from_sec(DIAGNOSTICS_ROS_LINKS_PUB_EVERY_SEC),
            callback=self._publish_links_diagnostics,
            oneshot=False
        )
        # profiling diagnostics timer
        self._profiling_diagnostics_timer = rospy.Timer(
            period=rospy.Duration.from_sec(DIAGNOSTICS_CODE_PROFILING_PUB_EVERY_SEC),
            callback=self._publish_profiling_diagnostics,
            oneshot=False
        )

    def register_node(self, name, help, ntype, health):
        self._node_stats = {
            'name': name,
            'help': help,
            'type': ntype.value,
            'health': health.value,
            'health_reason': '',
            'health_stamp': rospy.get_time(),
            'enabled': True,
            'uri': rospy.get_node_uri().rstrip('/'),
            'machine': socket.gethostname(),
            'module_type': get_module_type(),
            'module_instance': get_module_instance()
        }
        # publish new node information
        self._publish_node_diagnostics()

    def update_node(self, health=None, health_reason=None, enabled=None):
        if health is not None:
            self._node_stats['health'] = health.value
            self._node_stats['health_reason'] = health_reason or str(health_reason)
            self._node_stats['health_stamp'] = rospy.get_time()
        if enabled is not None:
            self._node_stats['enabled'] = bool(enabled)
        # publish new node information
        self._publish_node_diagnostics()

    def register_topic(self, name, help, direction, healthy_freq, topic_type, topic_monitor):
        if name in ROS_INFRA_TOPICS:
            return
        # ---
        self._topics_stats_lock.acquire()
        try:
            self._topics_stats[name] = {
                'help': help,
                'type': topic_type.value,
                'direction': direction.value,
                'frequency': 0.0,
                'effective_frequency': 0.0,
                'healthy_frequency': healthy_freq,
                'bandwidth': -1.0,
                'enabled': True
            }
            self._topics_monitor[name] = topic_monitor
        finally:
            self._topics_stats_lock.release()
        # force topic message update
        self._publish_topics_diagnostics(force=True)

    def update_topic(self, name, healthy_freq=None):
        updated_info = {}
        # update healthy frequency
        if healthy_freq is not None:
            updated_info['healthy_frequency'] = healthy_freq
        # update list of topics
        self._topics_stats_lock.acquire()
        try:
            self._topics_stats[name].update(updated_info)
        finally:
            self._topics_stats_lock.release()

    def unregister_topic(self, name):
        self._topics_stats_lock.acquire()
        try:
            if name in self._topics_stats:
                del self._topics_stats[name]
        finally:
            self._topics_stats_lock.release()
        # force topic message update
        self._publish_topics_diagnostics(force=True)

    def register_param(self, name, help, param_type, min_value, max_value, editable):
        self._params_stats[name] = {
            'help': help,
            'type': param_type.value,
            'min_value': float(min_value) if isinstance(min_value, (int, float)) else -1.0,
            'max_value': float(max_value) if isinstance(max_value, (int, float)) else -1.0,
            'editable': editable
        }
        # force topic message update
        self._publish_parameters_diagnostics(force=True)

    def set_topic_switch(self, name, switch_status):
        if name in self._topics_stats:
            self._topics_stats[name]['enabled'] = switch_status

    def get_topic_frequency(self, topic):
        if topic in self._topics_stats:
            return self._topics_stats[topic]['frequency']
        return -1

    def get_topic_bandwidth(self, topic):
        if topic in self._topics_stats:
            return self._topics_stats[topic]['bandwidth']
        return -1

    def compute_topics_frequency(self):
        self._links_stats_lock.acquire()
        try:
            # topic frequency is computed as the average of the frequencies on all its connections
            for topic in list(self._topics_stats.keys()):
                freq = []
                bwidth = []
                for _, link in self._links_stats.items():
                    if link['topic'] == topic:
                        freq.append(link['frequency'])
                        bwidth.append(link['bandwidth'])
                # ---
                self._topics_stats_lock.acquire()
                # compute frequency
                self._topics_stats[topic]['effective_frequency'] = sum(freq) / max(len(freq), 1)
                # compute bandwidth
                self._topics_stats[topic]['bandwidth'] = sum(bwidth) / max(len(bwidth), 1)
                # release lock
                self._topics_stats_lock.release()
            # ---
        finally:
            self._links_stats_lock.release()

    def register_profiler_reading(self, block: str, duration: float, filename: str,
                                  line_nums: Tuple[int, int]):
        # update profiling stats
        self._profiling_stats_lock.acquire()
        try:
            frequency = -1.0
            now = time.time()
            # opportunistically compute the frequency
            if block in self._profiling_stats:
                frequency = 1 / (now - self._profiling_stats[block]['last_recorded_time'])
            # store profiling stats
            self._profiling_stats[block] = {
                'duration': duration,
                'filename': filename,
                'line_nums': line_nums,
                'frequency': frequency,
                'last_recorded_time': now
            }
        finally:
            self._profiling_stats_lock.release()

    def _compute_stats(self):
        # get bus stats and bus info for every active connection
        connections = rospy.impl.registration.get_topic_manager().get_pub_sub_info()
        pub_stats, sub_stats = rospy.impl.registration.get_topic_manager().get_pub_sub_stats()
        # ---
        _conn_direction = lambda d: {
            'i': TopicDirection.INBOUND.value,
            'o': TopicDirection.OUTBOUND.value
        }[d]
        # connections stats
        # From (_TopicImpl:get_stats_info):
        #   http://docs.ros.org/melodic/api/rospy/html/rospy.topics-pysrc.html
        connection_info = {
            c[0]: {
                'topic': c[4],
                'remote': c[1],
                'direction': _conn_direction(c[2]),
                'connected': c[5],
                'transport': c[3][:3]
            }
            for c in connections
            if len(c) >= 6
        }
        links = {}
        # publishers stats
        # From (_PublisherImpl:get_stats):
        #   http://docs.ros.org/melodic/api/rospy/html/rospy.topics-pysrc.html
        for pub_stat in pub_stats:
            topic_name, message_data_bytes, conn_stats = pub_stat
            for conn in conn_stats:
                if len(conn) != 4:
                    continue
                _id, _bytes, _num_messages, _ = conn
                if _id not in connection_info:
                    continue
                link_info = {
                    "bytes": _bytes,
                    "messages": _num_messages,
                    "dropped": 0,
                    "_time": time.time()
                }
                link_info.update(connection_info[_id])
                # compute frequency
                if _id in self._links_stats:
                    old_reading = self._links_stats[_id]
                    link_info.update(_compute_f_b(link_info, old_reading))
                else:
                    link_info.update({'frequency': 0.0, 'bandwidth': 0.0})
                links[_id] = link_info
        # subscribers stats
        # From (_SubscriberImpl:get_stats):
        #   http://docs.ros.org/melodic/api/rospy/html/rospy.topics-pysrc.html
        for sub_stat in sub_stats:
            topic_name, conn_stats = sub_stat
            for conn in conn_stats:
                if len(conn) != 5:
                    continue
                _id, _bytes, _num_messages, _drop_estimate, _ = conn
                if _id not in connection_info:
                    continue
                link_info = {
                    "bytes": _bytes,
                    "messages": _num_messages,
                    "dropped": _drop_estimate if _drop_estimate > 0 else 0,
                    "_time": time.time()
                }
                link_info.update(connection_info[_id])
                # compute frequency
                if _id in self._links_stats:
                    old_reading = self._links_stats[_id]
                    link_info.update(_compute_f_b(link_info, old_reading))
                else:
                    link_info.update({'frequency': 0.0, 'bandwidth': 0.0})
                links[_id] = link_info
        # ---
        # update link stats
        self._links_stats_lock.acquire()
        try:
            self._links_stats = links
        finally:
            self._links_stats_lock.release()
        # update topic stats
        self.compute_topics_frequency()

    def _publish_node_diagnostics(self):
        msg = DiagnosticsRosNode(
            **self._node_stats
        )
        msg.header.stamp = rospy.Time.now()
        self._node_diagnostics_pub.publish(msg)

    def _publish_topics_diagnostics(self, *args, **kwargs):
        force = 'force' in kwargs and kwargs['force']
        if not self._topics_diagnostics_pub.anybody_listening() and not force:
            return
        msg = DiagnosticsRosTopicArray()
        msg.header.stamp = rospy.Time.now()
        self._topics_stats_lock.acquire()
        try:
            for topic, topic_stats in self._topics_stats.items():
                topic_stats['frequency'] = self._topics_monitor[topic].get_frequency()
                topic_stats['effective_frequency'] = min(
                    topic_stats['effective_frequency'], topic_stats['frequency']
                )
                msg.topics.append(DiagnosticsRosTopic(
                    node=rospy.get_name(),
                    name=topic,
                    **topic_stats
                ))
        finally:
            self._topics_stats_lock.release()
        self._topics_diagnostics_pub.publish(msg)

    def _publish_parameters_diagnostics(self, force=False):
        if not self._params_diagnostics_pub.anybody_listening() and not force:
            return
        msg = DiagnosticsRosParameterArray()
        msg.header.stamp = rospy.Time.now()
        for param, param_stats in self._params_stats.items():
            msg.params.append(NodeParameter(
                node=rospy.get_name(),
                name=param,
                **param_stats
            ))
        self._params_diagnostics_pub.publish(msg)

    def _publish_links_diagnostics(self, *args, **kwargs):
        if not self._links_diagnostics_pub.anybody_listening() and \
           not self._topics_diagnostics_pub.anybody_listening():
            return
        self._compute_stats()
        # publish only if somebody is listening
        if not self._links_diagnostics_pub.anybody_listening():
            return
        # ---
        msg = DiagnosticsRosLinkArray()
        msg.header.stamp = rospy.Time.now()
        self._links_stats_lock.acquire()
        try:
            for _, link_stats in self._links_stats.items():
                msg.links.append(DiagnosticsRosLink(
                    node=rospy.get_name(),
                    **{k: v for k, v in link_stats.items() if not k.startswith('_')}
                ))
        finally:
            self._links_stats_lock.release()
        self._links_diagnostics_pub.publish(msg)

    def _publish_profiling_diagnostics(self, *args, **kwargs):
        if not self._profiling_diagnostics_pub.anybody_listening():
            return
        # ---
        # make sure there is something to publish
        if len(self._profiling_stats) <= 0:
            return
        # create timing array
        now = time.time()
        msg = DiagnosticsCodeProfilingArray()
        msg.header.stamp = rospy.Time.now()
        # populate message with blocks
        self._profiling_stats_lock.acquire()
        try:
            for name, block in self._profiling_stats.items():
                msg.blocks.append(DiagnosticsCodeProfiling(
                    node=rospy.get_name(),
                    block=name,
                    frequency=block['frequency'],
                    duration=block['duration'],
                    filename=block['filename'],
                    line_nums=block['line_nums'],
                    time_since_last_execution=now - block['last_recorded_time']
                ))
        finally:
            self._profiling_stats_lock.release()
        # publish
        self._profiling_diagnostics_pub.publish(msg)


def _compute_f_b(new_read, old_read):
    tnow = time.time()
    return {
        'frequency':
            (new_read['messages'] - old_read['messages']) / (tnow - old_read['_time']),
        'bandwidth':
            (new_read['bytes'] - old_read['bytes']) / (tnow - old_read['_time'])
    }
