from collections import OrderedDict
import fnmatch
import os

from .contracts_ import contract
from .exception_utils import check_isinstance, raise_wrapped
from .exceptions import DTConfigException
from .file_utils import write_data_to_file
from .friendly_path_imp import friendly_path
from .instantiate_utils import indent
from .locate_files_impl import locate_files
from .logging_logger import logger
from .paths import get_catkin_ws_src, get_duckiefleet_root, \
    get_duckietown_local_log_downloads, get_duckietown_data_dirs
from .yaml_pretty import yaml_load, yaml_load_plain, yaml_dump_pretty


def yaml_write_to_file(ob, filename):
    try:
        s = yaml_dump_pretty(ob)
    except:
        # todo : add log
        import yaml as alt
        s = alt.dump(ob)
    write_data_to_file(s, filename)


def yaml_load_file(filename, plain_yaml=False):
    if not os.path.exists(filename):
        msg = 'File does not exist: %s' % friendly_path(filename)
        raise ValueError(msg)
    with open(filename) as f:
        contents = f.read()
    return interpret_yaml_file(filename, contents,
                               f=lambda _filename, data: data,
                               plain_yaml=plain_yaml)


def interpret_yaml_file(filename, contents, f, plain_yaml=False):
    """
        f is a function that takes

            f(filename, data)

        f can raise KeyError, or DTConfigException """
    try:
        from ruamel.yaml.error import YAMLError

        try:
            if plain_yaml:
                data = yaml_load_plain(contents)
            else:
                data = yaml_load(contents)
        except YAMLError as e:
            msg = 'Invalid YAML content:'
            raise_wrapped(DTConfigException, e, msg, compact=True)
        except TypeError as e:
            msg = 'Invalid YAML content; this usually happens '
            msg += 'when you change the definition of a class.'
            raise_wrapped(DTConfigException, e, msg, compact=True)
        try:
            return f(filename, data)
        except KeyError as e:
            msg = 'Missing field "%s".' % e.args[0]
            raise DTConfigException(msg)

    except DTConfigException as e:
        msg = 'Could not interpret the contents of the file using %s()\n' % f.__name__
        msg += '   %s\n' % friendly_path(filename)
        msg += 'Contents:\n' + indent(contents[:300], ' > ')
        raise_wrapped(DTConfigException, e, msg, compact=True)


def get_config_sources():
    sources = []
    # We look in $DUCKIETOWN_ROOT/catkin_ws/src
    sources.append(get_catkin_ws_src())
    # then we look in $DUCKIETOWN_FLEET
    sources.append(get_duckiefleet_root())

    return sources


@contract(pattern=str, sources='seq(str)')
def look_everywhere_for_config_files(pattern, sources):
    """
        Looks for all the configuration files by the given pattern.
        Returns a dictionary filename -> contents.
    """
    check_isinstance(sources, list)

    logger.debug('Reading configuration files with pattern %s.' % pattern)

    results = OrderedDict()
    for s in sources:
        filenames = locate_files(s, pattern)
        for filename in filenames:
            contents = open(filename).read()
            results[filename] = contents
        logger.debug('%4d files found in %s' % (len(results), friendly_path(s)))
    return results


@contract(pattern=str, all_yaml='dict(str:str)')
def look_everywhere_for_config_files2(pattern, all_yaml):
    """
        Looks for all the configuration files by the given pattern.
        Returns a dictionary filename -> contents.

        all_yaml = filename -> contents.
    """

    results = OrderedDict()
    for filename, contents in list(all_yaml.items()):
        if fnmatch.fnmatch(filename, pattern):
            results[filename] = contents

    logger.debug('%4d configuration files with pattern %s.'
                 % (len(results), pattern))
    return results


@contract(patterns='list(str)')
def look_everywhere_for_files(patterns, strict=False, silent=False):
    """
        Looks for all the bag files
        Returns a list of basename -> filename.
    """
    sources = []
    # We look in $DUCKIETOWN_ROOT/catkin_ws/src
    # sources.append(get_catkin_ws_src())
    # then we look in $DUCKIETOWN_FLEET
    sources.append(get_duckiefleet_root())
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
                        msg = 'Two files with same name but different content:\n%s\n%s' % (one, two)
                        if strict:
                            raise DTConfigException(msg)
                        else:
                            if not silent:
                                logger.error(msg)
                            continue
                    else:
                        msg = 'Two copies of same file found:\n%s\n%s' % (one, two)
                        if not silent:
                            logger.warn(msg)
                        continue
                results[basename] = filename
    return results


def same_file_content(a, b):
    """ Just check the size """
    s1 = os.stat(a).st_size
    s2 = os.stat(b).st_size
    return s1 == s2

