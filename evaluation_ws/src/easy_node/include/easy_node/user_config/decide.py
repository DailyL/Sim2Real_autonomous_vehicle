import os
from typing import Tuple

import duckietown_code_utils as dtu

__all__ = ["get_user_configuration", "get_config_sequence"]


def get_config_sequence() -> Tuple[str, ...]:
    """Reads the variable EasyNode.ENV

    it is taken as a colon-separated list of names.
    """
    from easy_node.easy_node import EasyNode

    if not EasyNode.ENV in os.environ:
        msg = f'Could not find the environment variable "{EasyNode.ENV}".'
        raise dtu.DTConfigException(msg)

    s = os.environ[EasyNode.ENV]
    tokens = [_ for _ in s.split(":") if _.strip()]
    if not tokens:
        msg = f"The variable {EasyNode.ENV} is empty."
        raise dtu.DTConfigException(msg)

    return tuple(tokens)


def get_user_configuration(package_name, node_name):
    from easy_node.user_config.db import get_config_db

    config_sequence = get_config_sequence()
    db = get_config_db()
    return db.resolve(package_name, node_name, config_sequence, date=None)
