from collections import defaultdict
from typing import Dict, Sequence, Union

import yaml

import duckietown_code_utils as dtu
from easy_node.node_description.configuration import EasyNodeConfig, load_configuration_for_nodes_in_package
from .get_configuration_files import get_all_configuration_files


class ValidationError(Exception):
    pass


class ConfigDB:
    _singleton = None

    def __init__(self):
        # Load all configuration
        # filename2contents = look_everywhere_for_config_files()

        dtu.logger.debug("Reading configuration files...")
        self.configs = get_all_configuration_files()
        self.package2nodes = {}

        packages = dtu.get_list_of_packages_in_catkin_ws()

        dtu.logger.debug(f"Reading packages configuration for {packages}")
        for p in packages:
            self.package2nodes[p] = load_configuration_for_nodes_in_package(p)

        dtu.logger.debug("Validating configuration...")

        for i, c in enumerate(self.configs):
            try:
                self.validate_file(c)
                c = c._replace(valid=True)
            except ValidationError as e:
                c = c._replace(valid=False)
                c = c._replace(error_if_invalid=str(e))

            self.configs[i] = c

    def validate_file(self, c):
        # first, check that indeed we have a package by that name
        if not c.package_name in self.package2nodes:
            msg = f'Invalid package "{c.package_name}".'
            raise ValidationError(msg)
        # check that there is a node by that name
        if not c.node_name in self.package2nodes[c.package_name]:
            msg = f'No node "{c.node_name}" in package "{c.package_name}". '
            raise ValidationError(msg)
        # check that all the extends exist
        for cn in c.extends:
            if not self.config_exists(c.package_name, c.node_name, cn):  # FIXME - doesn't exist
                msg = f"Referenced config {c.package_name}/{c.node_name}/{cn} does not exist. "
                raise ValidationError(msg)
        # Finally, check that the values correspond to values that we have
        # in the node configuration
        node_config = self.package2nodes[c.package_name][c.node_name]
        assert isinstance(node_config, EasyNodeConfig)
        known = node_config.parameters
        for k in c.values:
            if k not in known:
                msg = f'The parameter "{k}" is not known.\nKnown: {sorted(known)}.'
                raise ValidationError(msg)

    def find(self, package_name: str, node_name: str, config_name, date):
        results = []
        for c in self.configs:
            match = (
                (package_name == c.package_name)
                and (node_name == c.node_name)
                and (config_name == c.config_name)
            )
            if match:
                results.append(c)
        if len(results) > 1:
            raise NotImplementedError("Sort by date")
        if results:
            return results[0]
        else:
            return None

    def resolve(self, package_name: str, node_name: str, config_sequence: Union[list, tuple], date=None):
        """Returns a QueryResult"""
        if len(config_sequence) == 0:
            msg = f"Invalid empty config_sequence while querying for {package_name}/{node_name}"
            raise ValueError(msg)
        values = {}
        origin = {}
        origin_filename = {}

        if not package_name in self.package2nodes:
            msg = f'Could not find package "{package_name}"; I know {sorted(self.package2nodes)}.'
            raise dtu.DTConfigException(msg)
        nodes = self.package2nodes[package_name]
        if not node_name in nodes:
            msg = f'Could not find node "{node_name}" in package "{package_name}"; I know {sorted(nodes)}.'
            raise dtu.DTConfigException(msg)

        node_config = nodes[node_name]
        all_keys = list(node_config.parameters)

        overridden = defaultdict(lambda: [])
        using = []
        for config_name in config_sequence:
            if config_name == "defaults":
                using.append(config_name)

                for p in list(node_config.parameters.values()):

                    if p.has_default:
                        values[p.name] = p.default
                        origin_filename[p.name] = node_config.filename
                        origin[p.name] = config_name

            else:
                c = self.find(package_name, node_name, config_name, date=date)
                if c is not None:
                    using.append(config_name)

                    for k, v in list(c.values.items()):
                        if k in values:
                            overridden[k].append(origin[k])
                        values[k] = v
                        origin_filename[k] = c.filename
                        origin[k] = config_name

        if not using:
            msg = (
                f"Cannot find any configuration for {package_name}/{node_name} with config sequence "
                f"{':'.join(config_sequence)}"
            )
            raise dtu.DTConfigException(msg)

        return QueryResult(
            package_name, node_name, config_sequence, all_keys, values, origin, origin_filename, overridden
        )


def get_config_db() -> ConfigDB:
    if ConfigDB._singleton is None:
        ConfigDB._singleton = dtu.get_cached("ConfigDB", ConfigDB)
    return ConfigDB._singleton


class QueryResult:
    def __init__(
        self, package_name, node_name, config_sequence, all_keys, values, origin, origin_filename, overridden
    ):
        self.all_keys = all_keys
        self.values = values
        self.origin = origin
        self.package_name = package_name
        self.node_name = node_name
        self.config_sequence = config_sequence
        self.origin_filename = origin_filename
        self.overridden = overridden
        assert isinstance(config_sequence, (list, tuple))

    def is_complete(self):
        return len(self.all_keys) == len(self.values)

    def __str__(self):
        s = f"Configuration result for node `{self.node_name}` (package `{self.package_name}`)"
        s += f"\nThe configuration sequence was {list(self.config_sequence)}."
        s += "\nThe following is the list of parameters set and their origin:"
        s += "\n" + dtu.indent(config_summary(self.all_keys, self.values, self.origin), "  ")
        return s


# @dtu.contract(all_keys='seq(str)', values='dict', origin='dict(str:str)')
def config_summary(all_keys: Sequence[str], values: dict, origin: Dict[str, str]) -> str:
    table = []
    table.append(["-" * len(_) for _ in table[0]])
    for k in all_keys:
        if k in values:
            v = yaml.dump(values[k])
            v = v.strip()
            if v.endswith("..."):
                v = v[:-3]
            v = v.strip()
            table.append([k, v, dtu.friendly_path(origin[k])])
        else:
            table.append([k, "(unset)", "(not found)"])
    return dtu.format_table_plus(table, 4)
