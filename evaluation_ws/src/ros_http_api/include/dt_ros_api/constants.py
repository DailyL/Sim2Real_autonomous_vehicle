import rospy

from duckietown.dtros import TopicType, TopicDirection, ParamType, NodeType, NodeHealth

from duckietown.dtros.constants import ROS_INFRA_NODES, ROS_INFRA_TOPICS


FILES_API_DIR = "/data"
BAG_RECORDER_DIR = f"{FILES_API_DIR}/bags"
BAG_RECORDER_MAX_DURATION_SECS = 120


class DataProvider(object):

    def __init__(self):
        pass

    def renew_interest(self):
        pass


def default_node_info():
    return {
        'help': None,
        'type': NodeType.GENERIC.name,
        'health': NodeHealth.UNKNOWN.name,
        'health_value': NodeHealth.UNKNOWN.value,
        'health_reason': "None",
        # TODO: Turn health_stamp into elapsed time `secs_since_health`
        # 'health_stamp': None,
        'enabled': None,
        'machine': None,
        'module_type': None,
        'module_instance': None
    }


def default_topic_info(name, direction, node_agnostic=False):
    info = {
        'help': None,
        'message_type': None,
        'type': default_topic_type(name),
        'frequency': None,
        'bandwidth': None,
        'effective_frequency': None
    }
    if not node_agnostic:
        info.update({
            'healthy_frequency': None,
            'enabled': True
        })
    if direction:
        info['direction'] = TopicDirection(direction).name
    return info


def default_param_info():
    return {
        'help': None,
        'type': ParamType.UNKNOWN.name,
        'min_value': None,
        'max_value': None,
        'editable': False
    }


def default_service_info():
    return {}


def default_topic_type(topic):
    name_parts = topic.split('/')
    if len(name_parts) > 3 and name_parts[2] == 'diagnostics':
        return TopicType.DIAGNOSTICS.name
    else:
        return TopicType.GENERIC.name


def is_infra_node(node):
    return \
        node in ROS_INFRA_NODES \
        or node == rospy.get_name()


def is_infra_topic(topic):
    return \
        topic in ROS_INFRA_TOPICS \
        or default_topic_type(topic) == TopicType.DIAGNOSTICS.name