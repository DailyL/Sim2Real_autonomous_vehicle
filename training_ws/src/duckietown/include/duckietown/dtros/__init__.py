"""
The ``duckietown.dtros`` library provides the parent class for all Duckietown ROS Nodes
(i.e., ``DTROS``), as well as decorated ROS Publisher (``DTPublisher``) and ROS
Subscriber (``DTSubscriber``) classes.
These classes extend the original ROS classes by adding extra functionalities.


.. autoclass:: duckietown.dtros.DTROS

.. autoclass:: duckietown.dtros.dtpublisher.DTPublisher

.. autoclass:: duckietown.dtros.dtsubscriber.DTSubscriber


"""

import rospy
from .singleton import get_instance

# keep a copy to the original rospy objects
setattr(rospy, '__init_node__', rospy.init_node)
setattr(rospy, '__get_param__', rospy.get_param)
setattr(rospy, '__Publisher__', rospy.Publisher)
setattr(rospy, '__Subscriber__', rospy.Subscriber)

from .dtros import DTROS
from .dtparam import DTParam
from .constants import TopicType, NodeType, ParamType, NodeHealth, TopicDirection

# perform rospy decoration
from .decoration import rospy_decorate
rospy_decorate()
del rospy_decorate
