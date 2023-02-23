__all__ = ["logger"]

import logging

FORMAT = "%(name)15s|%(filename)15s:%(lineno)-4s - %(funcName)-15s| %(message)s"
#
#
# if Logger.root.handlers:
#     for handler in Logger.root.handlers:
#         if isinstance(handler, StreamHandler):
#             formatter = Formatter(FORMAT)
#             handler.setFormatter(formatter)
# else:
logging.basicConfig(format=FORMAT)

logger = logging.getLogger("duckietown_utils")
logger.setLevel(logging.DEBUG)
