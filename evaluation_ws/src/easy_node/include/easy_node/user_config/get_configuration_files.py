import os
from collections import namedtuple

import yaml
from dateutil.parser import parse
from frozendict import frozendict
from yaml.error import YAMLError

import duckietown_code_utils as dtu

SUFFIX = ".config.yaml"

ConfigInfo = namedtuple(
    "ConfigInfo",
    "filename package_name node_name config_name date_effective description extends "
    "values "
    "valid error_if_invalid ",
)

__all__ = ["get_all_configuration_files", "search_all_configuration_files", "interpret_config_file"]


def get_all_configuration_files():
    """
    Gets all the configuration files for easynodes.

    These are of the form

        package-node.![name].config.yaml

    For timing:

        package-node.![name].201XMMDD.config.yaml
    """
    configs = search_all_configuration_files()
    results = []
    for filename in configs:
        c = interpret_config_file(filename)
        results.append(c)
    return results


def search_all_configuration_files():
    # We look in $DUCKIETOWN_ROOT/catkin_ws/src
    # then we look in $DUCKIETOWN_FLEET
    sources = [dtu.get_catkin_ws_src(), dtu.get_duckiefleet_root()]

    configs = []
    pattern = "*" + SUFFIX
    dtu.logger.info(f"Looking for {pattern} files.")
    for s in sources:
        fs = dtu.locate_files(s, pattern)
        dtu.logger.info(f"{len(fs):4d} files in {s}")
        configs.extend(fs)

    #     logger.debug('I found:\n' + "\n".join(configs))

    return configs


def interpret_config_file(filename: str) -> ConfigInfo:
    """
    Returns a ConfigInfo.
    """
    try:
        basename = os.path.basename(filename)
        base = basename.replace(SUFFIX, "")
        # now we have something like
        #   package-node.config_name.date
        # or
        #   package-node.config_name
        if not "." in base:
            msg = f"Invalid filename {filename!r}."
            raise dtu.DTConfigException(msg)

        tokens = base.split(".")
        if len(tokens) > 3:
            msg = f"Too many periods/tokens (tokens={tokens})"
            raise dtu.DTConfigException(msg)

        if len(tokens) <= 2:
            #  package-node.config_name
            package_node = tokens[0]
            if not "-" in package_node:
                msg = f'Expected a "-" in "{package_node}".'
                raise dtu.DTConfigException(msg)
            i = package_node.index("-")
            package_name = package_node[:i]
            node_name = package_node[i + 1 :]
        else:
            package_name = node_name = None  # FIXME: should we bail?

        config_name = tokens[1]

        if len(tokens) == 3:
            # package-node.config_name.date
            date_effective = tokens[2]
        else:
            date_effective = "20170101"

        try:
            date_effective = parse(date_effective)
        except:
            msg = f'Cannot interpret "{date_effective}" as a date.'
            raise dtu.DTConfigException(msg)

        # now read file

        with open(filename) as f:
            contents = f.read()
        try:
            try:
                data = yaml.load(contents, Loader=yaml.Loader)
            except YAMLError as e:
                dtu.raise_wrapped(dtu.DTConfigException, e, "Invalid YAML", compact=True)
                raise
            if not isinstance(data, dict):
                msg = "Expected a dictionary inside."
                raise dtu.DTConfigException(msg)

            for field in ["description", "values"]:
                if not field in data:
                    msg = f'Missing field "{field}".'
                    raise dtu.DTConfigException(msg)

            description = data.pop("description")
            if not isinstance(description, str):
                msg = f'I expected that "description" is a string, obtained {description!r}.'
                raise dtu.DTConfigException(msg)

            extends = data.pop("extends", [])
            if not isinstance(extends, list):
                msg = f'I expected that "extends" is a list, obtained {extends!r}.'
                raise dtu.DTConfigException(msg)

            values = data.pop("values")
            if not isinstance(values, dict):
                msg = f'I expected that "values" is a dictionary, obtained {type(values)}.'
                raise dtu.DTConfigException(msg)

            # Freeze the data
            extends = tuple(extends)
            values = frozendict(values)

        except dtu.DTConfigException as e:
            msg = "Could not interpret the contents of the file\n"
            msg += f"   {dtu.friendly_path(filename)}\n"
            msg += "Contents:\n" + dtu.indent(contents, " > ")
            dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
            raise

        return ConfigInfo(
            filename=filename,
            package_name=package_name,
            node_name=node_name,
            config_name=config_name,
            date_effective=date_effective,
            extends=extends,
            description=description,
            values=values,
            # not decided
            valid=None,
            error_if_invalid=None,
        )

    except dtu.DTConfigException as e:
        msg = f"Invalid file {dtu.friendly_path(filename)}"
        dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
