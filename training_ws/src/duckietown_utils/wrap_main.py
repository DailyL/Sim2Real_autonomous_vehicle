import sys
import traceback

from .logging_logger import logger

__all__ = ['wrap_main']


def wrap_main(f):
    # deprecated
    """ Wraps a main function and colors output """
    try:
        f()
    except Exception as e:
        s = traceback.format_exc(e)
        logger.error(s)
        sys.exit(2)

