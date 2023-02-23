import rosparam as rp
from flask import Blueprint

from dt_ros_api.utils import \
    response_ok,\
    response_error
from dt_ros_api.knowledge_base import KnowledgeBase
from dt_ros_api.constants import default_param_info

rosparam = Blueprint('param', __name__)

# API handlers
#
# > ROS Node CLI Endpoints
#   - param/list        (Supported)
#   - param/set         (Not Supported)  * It might be supported in the future
#   - param/get         (Supported)
#   - param/load        (Not Supported)
#   - param/dump        (Not Supported)
#   - param/delete      (Not Supported)
#
# > Duckietown Endpoints
#   - param/info
#


@rosparam.route('/param/list')
@rosparam.route('/param/list/<path:ns>')
def _list(ns=''):
    ns = '/' + ns
    try:
        return response_ok({
            'parameters': sorted(rp.list_params(ns))
        })
    except Exception as e:
        return response_error(str(e))


@rosparam.route('/param/get/<path:param>')
def _get(param):
    param = '/' + param
    try:
        return response_ok({
            'parameter': param,
            'value': rp.get_param(param)
        })
    except Exception as e:
        return response_error(str(e))


@rosparam.route('/param/info/<path:param>')
def _info(param):
    param = '/' + param
    try:
        info = {
            'param': param,
            'value': rp.get_param(param)
        }
        info.update(KnowledgeBase.get('/param/info%s' % param, default_param_info()))
        return response_ok(info)
    except Exception as e:
        return response_error(str(e))
