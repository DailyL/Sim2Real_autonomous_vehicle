#!/usr/bin/env python3

import sys
import signal

from duckietown.dtros import DTROS, NodeType, ParamType, TopicDirection, TopicType, NodeHealth
from duckietown.dtros.constants import \
    DIAGNOSTICS_ROS_NODE_TOPIC, \
    DIAGNOSTICS_ROS_TOPICS_TOPIC, \
    DIAGNOSTICS_ROS_PARAMETERS_TOPIC, \
    DIAGNOSTICS_ROS_LINKS_TOPIC
from duckietown.dtros.utils import apply_namespace
from duckietown_msgs.msg import \
    DiagnosticsRosNode,\
    DiagnosticsRosTopicArray,\
    DiagnosticsRosLinkArray, \
    DiagnosticsRosParameterArray

from dt_ros_api.providers import SubscriberProvider, RosGraphProvider
from dt_ros_api.knowledge_base import KnowledgeBase
from dt_ros_api.constants import is_infra_node, is_infra_topic
from dt_ros_api import ROS_HTTP_API

ROS_HTTP_API_PORT = 8084


class ROS_HTTP_API_Node(DTROS):

    def __init__(self):
        super(ROS_HTTP_API_Node, self).__init__(
            node_name='ros_http_api_node',
            node_type=NodeType.INFRASTRUCTURE,
            dt_ghost=True
        )
        # ---
        # subscriber: diagnostics/ros/node
        self._diagnostics_node_sub = SubscriberProvider(
            apply_namespace(DIAGNOSTICS_ROS_NODE_TOPIC, 1),
            DiagnosticsRosNode,
            self._diagnostics_node_cb,
            queue_size=100,
            dt_ghost=True,
            dt_timeout=-1
        )
        KnowledgeBase.register_provider('/node/info/', self._diagnostics_node_sub)
        # subscriber: diagnostics/ros/topics
        self._diagnostics_topics_sub = SubscriberProvider(
            apply_namespace(DIAGNOSTICS_ROS_TOPICS_TOPIC, 1),
            DiagnosticsRosTopicArray,
            self._diagnostics_topics_cb,
            queue_size=100,
            dt_ghost=True,
            dt_timeout=20
        )
        KnowledgeBase.register_provider('/node/topics/', self._diagnostics_topics_sub)
        KnowledgeBase.register_provider('/topic/type/', self._diagnostics_topics_sub)
        KnowledgeBase.register_provider('/topic/info/', self._diagnostics_topics_sub)
        KnowledgeBase.register_provider('/topic/hz/', self._diagnostics_topics_sub)
        KnowledgeBase.register_provider('/topic/bw/', self._diagnostics_topics_sub)
        # subscriber: diagnostics/ros/parameters
        self._diagnostics_params_sub = SubscriberProvider(
            apply_namespace(DIAGNOSTICS_ROS_PARAMETERS_TOPIC, 1),
            DiagnosticsRosParameterArray,
            self._diagnostics_params_cb,
            queue_size=100,
            dt_ghost=True,
            dt_timeout=-1
        )
        KnowledgeBase.register_provider('/node/params/', self._diagnostics_params_sub)
        KnowledgeBase.register_provider('/param/info/', self._diagnostics_params_sub)
        # subscriber: diagnostics/ros/links
        self._diagnostics_links_sub = SubscriberProvider(
            apply_namespace(DIAGNOSTICS_ROS_LINKS_TOPIC, 1),
            DiagnosticsRosLinkArray,
            self._diagnostics_links_cb,
            queue_size=100,
            dt_ghost=True,
            dt_timeout=20
        )
        KnowledgeBase.register_provider('/node/links/', self._diagnostics_links_sub)
        # rosgraph provider
        self._graph_provider = RosGraphProvider()
        KnowledgeBase.register_provider('/topic/publishers/', self._graph_provider)
        KnowledgeBase.register_provider('/topic/subscribers/', self._graph_provider)
        KnowledgeBase.register_provider('/topic/info/', self._graph_provider)
        KnowledgeBase.register_provider('/topic/list/', self._graph_provider)
        KnowledgeBase.register_provider('/service/list/', self._graph_provider)
        KnowledgeBase.register_provider('/service/info/', self._graph_provider)
        KnowledgeBase.register_provider('/service/providers/', self._graph_provider)
        KnowledgeBase.register_provider('/node/list/', self._graph_provider)
        KnowledgeBase.register_provider('/node/topics/', self._graph_provider)
        KnowledgeBase.register_provider('/node/services/', self._graph_provider)

    @staticmethod
    def _diagnostics_node_cb(data):
        if is_infra_node(data.name):
            return
        # ---
        key = '/node/info%s' % data.name
        # store info about nodes
        info = {
            'help': data.help,
            'type': NodeType(data.type).name,
            'health': NodeHealth(data.health).name,
            'health_value': NodeHealth(data.health).value,
            'health_reason': data.health_reason,
            'health_stamp': data.health_stamp,
            'enabled': data.enabled,
            'machine': data.machine,
            'module_type': data.module_type,
            'module_instance': data.module_instance
        }
        KnowledgeBase.set(key, info)

    @staticmethod
    def _diagnostics_topics_cb(data):
        topic_key = lambda k, t: '/topic/%s%s' % (k, t)
        node_key = lambda n: '/node/topics%s' % n
        # nothing to do if the message is empty
        if len(data.topics) <= 0:
            return
        # store info about topics
        node = data.topics[0].node
        topics = KnowledgeBase.get(node_key(node), {})
        for topic in data.topics:
            if is_infra_topic(topic.name):
                continue
            # ---
            # store topic type
            topic_type_str = TopicType(topic.type).name
            KnowledgeBase.set(topic_key('type', topic.name), topic_type_str)
            # compile topic info
            info = {
                'help': topic.help,
                'message_type': None,
                'type': topic_type_str,
                # TODO: these should be averaged
                'bandwidth': topic.bandwidth,
                'frequency': topic.frequency,
                'effective_frequency': topic.effective_frequency
            }
            KnowledgeBase.set(topic_key('info', topic.name), info)
            # frequency
            KnowledgeBase.set(topic_key('hz', topic.name), topic.frequency)
            # bandwidth
            KnowledgeBase.set(topic_key('bw', topic.name), topic.bandwidth)
            # add topic to node topics
            topics[topic.name] = {
                'direction': TopicDirection(topic.direction).name,
                'healthy_frequency': topic.healthy_frequency,
                'enabled': topic.enabled
            }
            topics[topic.name].update(info)
            # store info about node topics
        KnowledgeBase.set(node_key(node), topics)

    @staticmethod
    def _diagnostics_params_cb(data):
        node_key = lambda n: '/node/params%s' % n
        param_key = lambda p: '/param/info%s' % p
        # nothing to do if the message is empty
        if len(data.params) <= 0:
            return
        # store info about params
        node = data.params[0].node
        params = KnowledgeBase.get(node_key(node), [])
        for param in data.params:
            info = {
                'help': param.help,
                'type': ParamType(param.type).name,
                'min_value': param.min_value,
                'max_value': param.max_value,
                'editable': param.editable
            }
            KnowledgeBase.set(param_key(param.name), info)
            # make list of params per node
            params.append(param.name)
        # ---
        KnowledgeBase.set(node_key(node), list(set(params)))

    @staticmethod
    def _diagnostics_links_cb(data):
        node_key = lambda n: '/node/links%s' % n
        # nothing to do if the message is empty
        if len(data.links) <= 0:
            return
        # store info about links
        node = data.links[0].node
        links = [
            {
                'topic': link.topic,
                'remote': link.remote,
                'direction': TopicDirection(link.direction).name,
                'connected': link.connected,
                'transport': link.transport,
                'messages': link.messages,
                'dropped': link.dropped,
                'bytes': link.bytes,
                'frequency': link.frequency,
                'bandwidth': link.bandwidth
            }
            for link in data.links
            if not is_infra_topic(link.topic)
        ]
        # ---
        KnowledgeBase.set(node_key(node), links)


def signal_handler(sig, frame):
    sys.exit(0)


if __name__ == '__main__':
    signal.signal(signal.SIGINT, signal_handler)
    ros_node = ROS_HTTP_API_Node()
    api = ROS_HTTP_API()
    api.run(host='0.0.0.0', port=ROS_HTTP_API_PORT)
