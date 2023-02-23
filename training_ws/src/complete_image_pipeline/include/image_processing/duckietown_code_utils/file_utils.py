import os

from .friendly_path_imp import friendly_path
from .logging_logger import logger
from .mkdirs import d8n_make_sure_dir_exists
from .path_utils import expand_all


def read_str_from_file(filename: str) -> str:
    with open(filename, "r") as f:
        return f.read()


def read_bytes_from_file(filename: str) -> bytes:
    with open(filename, "rb") as f:
        return f.read()


def write_str_to_file(data: str, filename: str):
    b: bytes = data.encode()
    return write_data_to_file(b, filename)


def write_data_to_file(data: bytes, filename: str):
    """
    Writes the data to the given filename.
    If the data did not change, the file is not touched.

    """
    if not isinstance(data, bytes):
        msg = 'Expected "data" to be a string, not %s.' % type(data).__name__
        raise ValueError(msg)
    if len(filename) > 256:
        msg = "Invalid argument filename: too long. Did you confuse it with data?"
        raise ValueError(msg)

    filename = expand_all(filename)
    d8n_make_sure_dir_exists(filename)

    if os.path.exists(filename):
        with open(filename, "rb") as _:
            current = _.read()
        if current == data:
            if not "assets/" in filename:
                logger.debug("already up to date %s" % friendly_path(filename))
            return

    with open(filename, "wb") as f:
        f.write(data)
    logger.debug("Written to: %s" % friendly_path(filename))
