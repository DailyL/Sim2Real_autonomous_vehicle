import rostopic as rt
from flask import Blueprint

from dt_ros_api.utils import \
    response_ok,\
    response_error
from dt_ros_api.knowledge_base import KnowledgeBase
from dt_ros_api.constants import default_topic_type

rostopic = Blueprint('topic', __name__)

# API handlers
#
# > ROS Node CLI Endpoints
#   - topic/list      (Supported)
#   - topic/type      (Supported)
#   - topic/find      (Supported)
#   - topic/info      (Supported)
#   - topic/hz        (Supported)     * Enabled by Diagnostics
#   - topic/bw        (Supported)     * Enabled by Diagnostics
#   - topic/delay     (Not Supported)
#   - topic/echo      (Not Supported)
#   - topic/pub       (Not Supported)
#
# > Duckietown Endpoints
#   - topic/publishers
#   - topic/subscribers
#   - topic/dttype
#


@rostopic.route('/topic/list')
def _list():
    try:
        return response_ok({
            'topics': sorted(KnowledgeBase.get('/topic/list', []))
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/type/<path:topic>')
def _type(topic):
    topic = '/' + topic
    try:
        _topic_type, _, _ = rt.get_topic_type(topic)
        if _topic_type:
            return response_ok({
                'topic': topic,
                'message_type': _topic_type
            })
        else:
            return response_error("Topic '{:s}' not found".format(topic))
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/find/<path:msg_type>')
def _find(msg_type):
    try:
        return response_ok({
            'message_type': msg_type,
            'topics': rt.find_by_type(msg_type)
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/info/<path:topic>')
def _info(topic):
    topic = '/' + topic
    key = lambda x: '/topic/%s%s' % (x, topic)
    try:
        info = {
            'topic': topic,
            'type': KnowledgeBase.get(key('type'), default_topic_type(topic)),
            'publishers': KnowledgeBase.get(key('publishers'), []),
            'subscribers': KnowledgeBase.get(key('subscribers'), [])
        }
        info.update(KnowledgeBase.get(key('info'), {}))
        info['message_type'] = rt.get_topic_type(topic)[0]
        return response_ok(info)
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/hz/<path:topic>')
def _hz(topic):
    key = lambda s: '/topic/{0}/{1}'.format(s, topic)
    try:
        hz_time, hz = KnowledgeBase.get(key('hz'), None, get_time=True)
        info = KnowledgeBase.get(key('info'), {'effective_frequency': -1})
        # return
        return response_ok({
            'topic': '/' + topic,
            'frequency': hz,
            'effective_frequency': info['effective_frequency'],
            'secs_since_update': hz_time
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/bw/<path:topic>')
def _bw(topic):
    key = '/topic/bw/' + topic
    try:
        bw_time, bw = KnowledgeBase.get(key, None, get_time=True)
        # return
        return response_ok({
            'topic': '/' + topic,
            'bandwidth': bw,
            'secs_since_update': bw_time
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/publishers/<path:topic>')
def _publishers(topic):
    topic = '/' + topic
    try:
        return response_ok({
            'topic': topic,
            'publishers': KnowledgeBase.get('/topic/publishers%s' % topic, [])
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/subscribers/<path:topic>')
def _subscribers(topic):
    topic = '/' + topic
    try:
        return response_ok({
            'topic': topic,
            'subscribers': KnowledgeBase.get('/topic/subscribers%s' % topic, [])
        })
    except Exception as e:
        return response_error(str(e))


@rostopic.route('/topic/dttype/<path:topic>')
def _dttype(topic):
    topic = '/' + topic
    try:
        return response_ok({
            'topic': topic,
            'type': KnowledgeBase.get('/topic/type%s' % topic, default_topic_type(topic))
        })
    except Exception as e:
        return response_error(str(e))
