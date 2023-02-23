# This file performs the decoration of rospy upon import

# TODO: update this to point to the documentation about DTROS once ready
DOCS_DTROS = 'http://docs.duckietown.org'

import rospy

# import objects decorating rospy
from .dtpublisher import DTPublisher
from .dtsubscriber import DTSubscriber
from .dtparam import DTParam
from .constants import ParamType


def rospy_decorate():
    # decorate:
    # - rospy.init_node
    setattr(rospy, 'init_node', __rospy__init_node__)
    # rospy.get_param
    setattr(rospy, 'get_param', __rospy__get_param__)
    # - rospy.Publisher
    setattr(rospy, 'Publisher', DTPublisher)
    # - rospy.Subscriber
    setattr(rospy, 'Subscriber', DTSubscriber)


def __rospy__init_node__(*args, **kwargs):
    if '__dtros__' not in kwargs:
        print('[WARNING]: You are calling the function rospy.init_node() directly. '
              'This is fine, but your are missing out a lot of Duckietown features '
              'by not using the class DTROS instead. Check out the documentation '
              'at %s' % DOCS_DTROS)
    else:
        del kwargs['__dtros__']
    # ---
    return rospy.__init_node__(*args, **kwargs)


def __rospy__get_param__(param_name, default=rospy.client._Unspecified, dt_help=None):
    # check singleton
    if rospy.__instance__ is not None and not rospy.__instance__._has_param(param_name):
        DTParam(
            param_name,
            help=dt_help,
            param_type=ParamType.guess_type(default),
            default=None if default in [None, rospy.client._Unspecified] else default,
            __editable__=False  # only user-created DTParam objects result into subscribed params
        )
    # call super method
    return rospy.__get_param__(param_name, default)
