from typing import Tuple, Union

from .exceptions import DTConfigException

__all__ = [
    "dt_check_isinstance",
]


def dt_check_isinstance(what: str, x: object, t: Union[type, Tuple[type, ...]]):
    if not isinstance(x, t):
        msg = 'I expected that "%s" is a %s, obtained %s.' % (
            what,
            t.__name__,
            type(x).__name__,
        )
        raise DTConfigException(msg)
