import logging

from flask import Flask
from flask_cors import CORS

from .actions.topic import rostopic
from .actions.node import rosnode
from .actions.param import rosparam
from .actions.service import rosservice
from .actions.graph import rosgraph
from .actions.bag import rosbag


class ROS_HTTP_API(Flask):

    def __init__(self, debug=False):
        super(ROS_HTTP_API, self).__init__(__name__)
        self.register_blueprint(rostopic)
        self.register_blueprint(rosnode)
        self.register_blueprint(rosparam)
        self.register_blueprint(rosservice)
        self.register_blueprint(rosgraph)
        self.register_blueprint(rosbag)
        # apply CORS settings
        CORS(self)
        # configure logging
        logging.getLogger('werkzeug').setLevel(
            logging.DEBUG if debug else logging.WARNING)