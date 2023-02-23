import socket
import ssl
import urllib.error
import urllib.parse
import urllib.request

from .instantiate_utils import indent
from .logging_logger import logger
from .memoization import memoize_simple

use_url = "http://35.156.29.30/~duckietown/ping"


@memoize_simple
def is_internet_connected(url=use_url, timeout=3):
    """Use an https server so we know that we are not fooled by
    over-reaching academic network admins"""
    socket.setdefaulttimeout(timeout)
    try:
        try:
            urllib.request.urlopen(url, timeout=timeout)
        except urllib.error.HTTPError as e:
            # we expect 404
            if e.code == 404:
                return True
            else:
                msg = "Man in the middle attack?"
                msg += "\n\n" + indent(str(e), "> ")
                return False
        return True
    except ssl.CertificateError as e:
        msg = "Detected proxy; no direct connection available."
        msg += "\n\n" + indent(str(e), "  > ")
        logger.warning(msg)
        return False
    except IOError as e:
        logger.warning(e)
        return False
