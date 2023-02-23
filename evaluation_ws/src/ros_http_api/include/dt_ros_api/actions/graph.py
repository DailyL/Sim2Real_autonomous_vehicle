from flask import Blueprint

from duckietown.dtros import TopicDirection

from dt_ros_api.utils import \
    response_ok,\
    response_error
from dt_ros_api.knowledge_base import KnowledgeBase

rosgraph = Blueprint('graph', __name__)

# API handlers
#
# > ROS Node CLI Endpoints
#   (none)
#
# > Duckietown Endpoints
#   - graph/
#


@rosgraph.route('/graph')
def _graph():
    node_key = lambda x, n: '/node/%s%s' % (x, n)
    topic_key = lambda x, t: '/topic/%s%s' % (x, t)
    try:
        # put in nodes and topics
        nodes = {
            n: KnowledgeBase.get(node_key('info', n))
            for n in KnowledgeBase.get(node_key('list', ''), [])
            if KnowledgeBase.has(node_key('info', n))
        }
        topics = {
            t: KnowledgeBase.get(topic_key('info', t))
            for t in KnowledgeBase.get(topic_key('list', ''))
            if KnowledgeBase.has(topic_key('info', t))
        }
        # message_type is not delivered in graph
        for topic in topics:
            if 'message_type' in topics[topic]:
                del topics[topic]['message_type']
        # ---
        graph = {
            'nodes': list(nodes.keys()),
            'edges': {
                'node_to_topic': [],
                'topic_to_node': [],
                'node_to_node': [],
                'topic_to_topic': []
            }
        }
        # collect edges (node -> topic)
        graph['edges']['node_to_topic'].extend([
            {
                'from': n,
                'to': t
            }
            for t in topics
            for n in KnowledgeBase.get(topic_key('publishers', t), [])
        ])
        # collect edges (topic -> node)
        graph['edges']['topic_to_node'].extend([
            {
                'from': t,
                'to': n
            }
            for t in topics
            for n in KnowledgeBase.get(topic_key('subscribers', t), [])
        ])
        # collect edges (topic -> topic)
        edges = set()
        for t0 in topics:
            for n in KnowledgeBase.get(topic_key('subscribers', t0), []):
                for t1, t1_info in KnowledgeBase.get(node_key('topics', n), {}).items():
                    if t1_info['direction'] == TopicDirection.OUTBOUND.name:
                        edges.add((t0, n, t1))
            for n in KnowledgeBase.get(topic_key('publishers', t0), []):
                for t1, t1_info in KnowledgeBase.get(node_key('topics', n), {}).items():
                    if t1_info['direction'] == TopicDirection.INBOUND.name:
                        edges.add((t1, n, t0))
        graph['edges']['topic_to_topic'] = [
            {
                'from': t0,
                'middle': n,
                'to': t1
            }
            for t0, n, t1 in edges
        ]
        # collect edges (node -> node)
        edges = set()
        for n0 in graph['nodes']:
            for t, t_info in KnowledgeBase.get(node_key('topics', n0), {}).items():
                if t_info['direction'] == TopicDirection.OUTBOUND.name:
                    for n1 in KnowledgeBase.get(topic_key('subscribers', t), []):
                        edges.add((n0, t, n1))
                if t_info['direction'] == TopicDirection.INBOUND.name:
                    for n1 in KnowledgeBase.get(topic_key('publishers', t), []):
                        edges.add((n1, t, n0))
        graph['edges']['node_to_node'] = [
            {
                'from': n0,
                'middle': t,
                'to': n1
            }
            for n0, t, n1 in edges
        ]
        # ---
        return response_ok({
            'graph': graph,
            'nodes': nodes,
            'topics': topics
        })
    except Exception as e:
        return response_error(str(e))
