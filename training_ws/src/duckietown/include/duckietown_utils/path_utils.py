import os

from .exceptions import DTConfigException

__all__ = [
    "expand_all",
]


def expand_all(filename):
    """
    Expands ~ and ${ENV} in the string.

    Raises DTConfigException if some environment variables
    are not expanded.

    """
    fn = filename
    fn = os.path.expanduser(fn)
    fn = os.path.expandvars(fn)
    if "$" in fn:
        msg = "Could not expand all variables in path %r." % fn
        raise DTConfigException(msg)
    return fn


# def display_filename(filename):
#     """ Displays a filename in a possibly simpler way """
#     return friendly_path(filename)
