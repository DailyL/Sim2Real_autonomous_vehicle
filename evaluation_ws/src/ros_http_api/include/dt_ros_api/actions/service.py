import rosservice as rs
from flask import Blueprint

from dt_ros_api.utils import \
    response_ok,\
    response_error
from dt_ros_api.knowledge_base import KnowledgeBase

rosservice = Blueprint('service', __name__)

# API handlers
#
# > ROS Node CLI Endpoints
#   - service/list      (Supported)
#   - service/type      (Supported)
#   - service/find      (Supported)
#   - service/info      (Supported)
#   - service/call      (Not Supported)
#   - service/uri       (Not Supported)
#
# > Duckietown Endpoints
#   - service/providers
#


@rosservice.route('/service/list')
def _list():
    try:
        return response_ok({
            'services': sorted(sorted(KnowledgeBase.get('/service/list', [])))
        })
    except Exception as e:
        return response_error(str(e))


@rosservice.route('/service/type/<path:service>')
def _type(service):
    service = '/' + service
    try:
        _service_type = rs.get_service_type(service)
        if _service_type:
            return response_ok({
                'service': service,
                'message_type': _service_type
            })
        else:
            return response_error("Service '{:s}' not found".format(service))
    except Exception as e:
        return response_error(str(e))


@rosservice.route('/service/find/<path:msg_type>')
def _find(msg_type):
    try:
        return response_ok({
            'message_type': msg_type,
            'services': rs.rosservice_find(msg_type)
        })
    except Exception as e:
        return response_error(str(e))


@rosservice.route('/service/info/<path:service>')
def _info(service):
    service = '/' + service
    key = lambda x: '/service/%s%s' % (x, service)
    try:
        info = {
            'service': service,
            'message_type': rs.get_service_type(service),
            'providers': KnowledgeBase.get(key('providers'), [])
        }
        info.update(KnowledgeBase.get(key('info'), {}))
        return response_ok(info)
    except Exception as e:
        return response_error(str(e))


@rosservice.route('/service/providers/<path:service>')
def _providers(service):
    service = '/' + service
    try:
        return response_ok({
            'service': service,
            'providers': KnowledgeBase.get('/service/providers%s' % service, [])
        })
    except Exception as e:
        return response_error(str(e))
