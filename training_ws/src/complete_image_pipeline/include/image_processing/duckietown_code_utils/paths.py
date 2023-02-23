import os
from typing import Dict, List

from .constants import DuckietownConstants
from .disk_hierarchy import get_dt_tmp_dir
from .exceptions import DTConfigException
from .locate_files_impl import locate_files
from .logging_logger import logger
from .path_utils import expand_all

__all__ = [
    "get_duckietown_root",
    "get_duckiefleet_root",
    "get_duckietown_data_dirs",
    "get_duckietown_local_log_downloads",
    "get_machines_files_path",
    "get_catkin_ws_src",
    "get_list_of_packages_in_catkin_ws",
    "is_ignored_by_catkin",
    "get_duckietown_cache_dir",
]


def get_duckietown_root() -> str:
    """Returns the path of DUCKIETOWN_ROOT and checks it exists"""
    return _get_dir(DuckietownConstants.DUCKIETOWN_ROOT_variable)


def get_duckiefleet_root() -> str:
    """
    Returns the path of DUCKIEFLEET_ROOT and checks it exists.
    Raises DTConfigException.
    """

    # If the environment variable is set:
    vname = DuckietownConstants.DUCKIEFLEET_ROOT_variable
    if vname in os.environ:
        return _get_dir(vname)
    else:
        msg = f"The environment variable {vname} is not defined,"
        msg += " so I will look for the default directories."
        logger.info(msg)

        defaults = DuckietownConstants.duckiefleet_root_defaults
        found = []
        for d in defaults:
            d2 = expand_all(d)
            if os.path.exists(d2):
                found.append(d2)
        if not found:
            msg = "Could not find any of the default directories:"
            for d in defaults:
                msg += f"\n- {d}"
            raise DTConfigException(msg)

        if len(found) > 1:
            msg = "I found more than one match for the default directories:"
            for d in found:
                msg += f"\n- {d}"
            raise DTConfigException(msg)

        return found[0]


def get_duckietown_data_dirs() -> List[str]:
    """
    Returns the paths in DUCKIETOWN_DATA and checks they exists.

    Raises DTConfigException if the var or dirs do not exist.
    """

    v = DuckietownConstants.DUCKIETOWN_DATA_variable
    if not v in os.environ:
        msg = f"No env variable {v} found."
        raise DTConfigException(msg)

    s = expand_all(os.environ[v])
    dirs = []
    for dirname in s.split(":"):
        if not os.path.exists(dirname):
            msg = f"Directory mentioned in {v} not found: {dirname}"
            raise DTConfigException(msg)
        dirs.append(dirname)

    return dirs


def get_duckietown_cache_dir() -> str:
    temp_dir = get_dt_tmp_dir()
    dirname = os.path.join(temp_dir, "caches")
    return dirname


def get_duckietown_local_log_downloads() -> str:
    """Returns the directory to use for local downloads of logs"""
    temp_dir = get_dt_tmp_dir()
    d = os.path.join(temp_dir, "downloads")
    if not os.path.exists(d):
        os.makedirs(d)
    return d


def get_machines_files_path() -> str:
    """Gets the path to the machines file. It might not exist."""
    duckietown_root = get_duckietown_root()
    machines = os.path.join(duckietown_root, DuckietownConstants.machines_path_rel_to_root)
    return machines


def get_catkin_ws_src() -> str:
    """Returns the path to the src/ dir in catkin_ws"""
    if "CATKIN_WS_DIR" in os.environ:
        d = os.environ["CATKIN_WS_DIR"]
        return os.path.join(d, "src")

    duckietown_root = get_duckietown_root()
    machines = os.path.join(duckietown_root, "catkin_ws/src")
    return machines


def get_list_of_packages_in_catkin_ws() -> Dict[str, str]:
    """
    Returns an ordered dictionary <package name>: <package dir>
    of packages that exist in catkin_ws/src.

    Raises DTConfigException if $DUCKIETOWN_ROOT is not set.
    """
    src = get_catkin_ws_src()
    package_files = locate_files(src, "package.xml")
    results = {}
    for p in package_files:
        dn = os.path.dirname(p)
        entry = os.path.basename(dn)
        if not is_ignored_by_catkin(dn):
            results[entry] = dn
        else:
            # logger.debug('Not considering %s' % dn)
            pass
    # We expect at least these two packages
    if not "duckietown" in results:
        raise ValueError("Could not find the duckietown ROS package.")
    # if not "what_the_duck" in results:
    #     raise ValueError("Could not find what_the_duck")
    return results


def is_ignored_by_catkin(dn: str) -> bool:
    """Returns true if the directory is inside one with CATKIN_IGNORE"""
    while dn != "/":
        i = os.path.join(dn, "CATKIN_IGNORE")
        if os.path.exists(i):
            return True
        dn = os.path.dirname(dn)
        if not dn:
            break
    return False


def _get_dir(variable_name: str) -> str:
    """
    Raises DTConfigException if it does not exist or the environment
    variable is not set.
    """
    if not variable_name in os.environ:
        msg = "Environment variable {!r} not defined.".format(variable_name)
        raise DTConfigException(msg)

    fn = expand_all(os.environ[variable_name])

    if not os.path.exists(fn):
        msg = f"Could not get {variable_name}: dir does not exist: {fn}"
        raise DTConfigException(msg)

    return fn
