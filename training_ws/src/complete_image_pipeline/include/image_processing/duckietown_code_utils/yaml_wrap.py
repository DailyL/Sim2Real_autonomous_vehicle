import fnmatch
import os
from collections import OrderedDict
from typing import Callable, Dict, List, Sequence, TypeVar

from .exception_utils import check_isinstance, raise_wrapped
from .exceptions import DTConfigException
from .file_utils import write_data_to_file
from .friendly_path_imp import friendly_path
from .instantiate_utils import indent
from .locate_files_impl import locate_files
from .logging_logger import logger
from .paths import (
    get_catkin_ws_src,
    get_duckiefleet_root,
    get_duckietown_data_dirs,
    get_duckietown_local_log_downloads,
)
from .type_checks import dt_check_isinstance
from .yaml_pretty import yaml_dump_pretty, yaml_load, yaml_load_plain

__all__ = [
    "yaml_load_file",
    "yaml_write_to_file",
    "interpret_yaml_file",
    "look_everywhere_for_config_files2",
    "get_config_sources",
    "look_everywhere_for_config_files",
    "look_everywhere_for_files",
]


def yaml_write_to_file(ob, filename):
    try:
        s = yaml_dump_pretty(ob)
    except:
        # todo : add log
        import yaml as alt

        s = alt.dump(ob)
    write_data_to_file(s, filename)


def yaml_load_file(filename: str, plain_yaml: bool = False):
    if not os.path.exists(filename):
        msg = f"File does not exist: {friendly_path(filename)}"
        raise ValueError(msg)
    with open(filename) as f:
        contents = f.read()
    return interpret_yaml_file(filename, contents, f=lambda _filename, data: data, plain_yaml=plain_yaml)


Y = TypeVar("Y")


def interpret_yaml_file(
    filename: str, contents: str, f: Callable[[str, dict], Y], plain_yaml: bool = False
) -> Y:
    """
    f is a function that takes

        f(filename, data)

    f can raise KeyError, or DTConfigException"""
    dt_check_isinstance("contents", contents, str)
    assert isinstance(contents, str), contents
    try:
        from ruamel.yaml.error import YAMLError

        data = None
        try:
            if plain_yaml:
                data = yaml_load_plain(contents)
            else:
                data = yaml_load(contents)
        except YAMLError as e:
            msg = "Invalid YAML content:"
            raise_wrapped(DTConfigException, e, msg, compact=True)

        except TypeError as e:
            msg = "Invalid YAML content; this usually happens "
            msg += "when you change the definition of a class."
            raise_wrapped(DTConfigException, e, msg, compact=True)

        dt_check_isinstance("data", data, dict)

        try:
            return f(filename, data)
        except KeyError as e:
            msg = f'Missing field "{e.args[0]}".'
            raise DTConfigException(msg)

    except DTConfigException as e:
        msg = f"Could not interpret the contents of the file using {f.__name__}()\n"
        msg += f"   {friendly_path(filename)}\n"
        msg += "Contents:\n" + indent(contents[:300], " > ")
        raise_wrapped(DTConfigException, e, msg, compact=True)


def get_config_sources() -> List[str]:
    sources = []
    # We look in $DUCKIETOWN_ROOT/catkin_ws/src
    sources.append(get_catkin_ws_src())
    # then we look in $DUCKIETOWN_FLEET
    try:
        fleet = get_duckiefleet_root()
    except DTConfigException as e:
        logger.warn(f"cannot run get_duckiefleet_root(): {e}")
    else:
        sources.append(fleet)

    return sources


def look_everywhere_for_config_files(pattern: str, sources: Sequence[str]) -> Dict[str, str]:
    """
    Looks for all the configuration files by the given pattern.
    Returns a dictionary filename -> contents.
    """
    check_isinstance(sources, list)

    logger.debug(f"Reading configuration files with pattern {pattern}.")

    results = {}
    for s in sources:
        filenames = locate_files(s, pattern)
        for filename in filenames:
            with open(filename) as _:
                contents = _.read()
            results[filename] = contents
        logger.debug(f"{len(results):4d} files found in {s}")
    return results


def look_everywhere_for_config_files2(pattern: str, all_yaml: Dict[str, str]) -> Dict[str, str]:
    """
    Looks for all the configuration files by the given pattern.
    Returns a dictionary filename -> contents.

    all_yaml = filename -> contents.
    """

    results = OrderedDict()
    for filename, contents in list(all_yaml.items()):
        if fnmatch.fnmatch(filename, pattern):
            results[filename] = contents

    logger.debug(f"{len(results):4d} configuration files with pattern {pattern}.")
    return results


def look_everywhere_for_files(
    patterns: List[str], strict: bool = False, silent: bool = False
) -> Dict[str, str]:
    """
    Looks for all the bag files
    Returns a dict of basename -> filename.
    """
    sources = []
    # We look in $DUCKIETOWN_ROOT/catkin_ws/src
    # sources.append(get_catkin_ws_src())
    # then we look in $DUCKIETOWN_FLEET
    try:
        r = get_duckiefleet_root()
    except DTConfigException as e:
        logger.warning(f"no duckiefleet found: {e}")
    else:
        sources.append(r)
    for d in get_duckietown_data_dirs():
        sources.append(d)
    # downloads
    p = get_duckietown_local_log_downloads()
    if os.path.exists(p):
        sources.append(p)

    results = OrderedDict()
    for s in sources:
        for pattern in patterns:
            # logger.debug('Looking for files with pattern %s...' % pattern)
            filenames = locate_files(s, pattern, case_sensitive=False)
            # logger.debug('%5d files in %s' % (len(filenames), friendly_path(s)))
            for filename in filenames:
                basename = os.path.basename(filename)
                if basename in results:
                    one = filename
                    two = results[basename]
                    if not same_file_content(one, two):
                        msg = f"Two files with same name but different content:\n{one}\n{two}"
                        if strict:
                            raise DTConfigException(msg)
                        else:
                            if not silent:
                                logger.error(msg)
                            continue
                    else:
                        msg = f"Two copies of same file found:\n{one}\n{two}"
                        if not silent:
                            logger.warn(msg)
                        continue
                results[basename] = filename
    return results


def same_file_content(a, b):
    """Just check the size"""
    s1 = os.stat(a).st_size
    s2 = os.stat(b).st_size
    return s1 == s2
