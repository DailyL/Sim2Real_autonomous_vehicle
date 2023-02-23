import copy
import os
import traceback
from dataclasses import dataclass
from typing import Dict, Optional, Sequence, Tuple, Union

import duckietown_code_utils as dtu
from .algo_structures import EasyAlgoFamily, EasyAlgoInstance

__all__ = [
    "get_easy_algo_db",
    "EasyAlgoDB",
]

NoneType = type(None)


class EasyAlgoDB:
    _singleton: "EasyAlgoDB" = None

    pattern = "*.easy_algo_family.yaml"

    def __init__(self, sources: Optional[Sequence[str]] = None, use_as_singleton: bool = False):
        if use_as_singleton:
            EasyAlgoDB._singleton = self
        if sources is None:
            sources = dtu.get_config_sources()
        self.all_yaml = dtu.look_everywhere_for_config_files("*.yaml", sources)

        self.family_name2config = load_family_config(self.all_yaml)
        for k, v in list(self.family_name2config.items()):
            self.family_name2config[k] = check_validity_instances(v)

    def query(self, family_name, query, raise_if_no_matches=False):
        if isinstance(query, list):
            res = {}
            for q in query:
                res.update(self.query(family_name, q, raise_if_no_matches=False))
            if raise_if_no_matches and not res:
                msg = "Could not find any match for the queries:"
                for q in query:
                    msg += f"\n- {q}"
                raise dtu.DTNoMatches(msg)
            return res
        else:
            family = self.get_family(family_name)
            instances = family.instances
            result = dtu.fuzzy_match(query, instances, raise_if_no_matches=raise_if_no_matches)
            return result

    def get_family(self, x: str):
        dtu.check_is_in("family", x, self.family_name2config)
        return self.family_name2config[x]

    def query_and_instance(self, family_name: str, query, raise_if_no_matches=False):
        results = self.query(family_name, query, raise_if_no_matches=raise_if_no_matches)
        stuff = dict((k, self.create_instance(family_name, k)) for k in results)
        return stuff

    def create_instance(self, family_name: str, instance_name_or_spec: Union[dict, str]):
        dtu.check_isinstance(instance_name_or_spec, (dict, str))

        family = self.get_family(family_name)
        if not family.valid:
            msg = (
                f"Cannot instantiate {instance_name_or_spec!r} because its family {family_name!r} is "
                f"invalid."
            )
            msg += "\n\n" + dtu.indent(family.error_if_invalid, "  > ")
            raise dtu.DTConfigException(msg)

        if isinstance(instance_name_or_spec, str):
            instance_name = instance_name_or_spec
            dtu.check_is_in("instance", instance_name, family.instances)
            instance = family.instances[instance_name]
            if not instance.valid:
                msg = (
                    f"Cannot instantiate {instance_name!r} because it is invalid:\n"
                    f"{dtu.indent(instance.error_if_invalid, '> ')}"
                )
                raise dtu.DTConfigException(msg)
            res = dtu.instantiate(instance.constructor, instance.parameters)
        elif isinstance(instance_name_or_spec, dict):
            _name, spec = _parse_inline_spec(instance_name_or_spec)
            res = dtu.instantiate(spec.constructor, spec.parameters)
        else:
            assert False

        interface = dtu.import_name(family.interface)
        if not isinstance(res, interface):
            msg = (
                f"I expected that {instance_name_or_spec!r} would be a {interface.__name__} but it is a "
                f"{type(res).__name__}."
            )
            raise dtu.DTConfigException(msg)

        return res


def get_easy_algo_db() -> EasyAlgoDB:
    if EasyAlgoDB._singleton is None:
        cache_algos = dtu.DuckietownConstants.use_cache_for_algos
        EasyAlgoDB._singleton = (
            dtu.get_cached("EasyAlgoDB", EasyAlgoDB) if cache_algos else EasyAlgoDB(use_as_singleton=True)
        )
    return EasyAlgoDB._singleton


@dataclass
class SpecValues:
    description: str
    constructor: str
    parameters: Dict[str, object]


def _parse_inline_spec(x: dict) -> Tuple[str, SpecValues]:
    dtu.check_isinstance(x, dict)
    if len(x) != 1:
        msg = f"Invalid spec: length is {len(x)}"
        dtu.raise_desc(ValueError, msg, x=x)
    key = list(x)[0]
    value = x[key]

    value = copy.deepcopy(value)
    if "description" in value:
        description = value.pop("description")
        dtu.dt_check_isinstance("description", description, str)
    else:
        description = None

    constructor = value.pop("constructor")
    dtu.dt_check_isinstance("constructor", constructor, str)

    parameters = value.pop("parameters")
    dtu.dt_check_isinstance("parameters", parameters, (dict, type(None)))

    if parameters is None:
        parameters = {}

    res = SpecValues(constructor=constructor, parameters=parameters, description=description)
    return key, res


def name_from_spec(x: Union[str, dict]) -> str:
    dtu.check_isinstance(x, (str, dict))
    if isinstance(x, str):
        return x
    elif isinstance(x, dict):
        name, _ = _parse_inline_spec(x)
        return name


def load_family_config(all_yaml: dict) -> Dict[str, EasyAlgoFamily]:
    """
    # now, for each family, we look for configuration files, which are:
    #
    #     ![ID].![family_name].yaml
    #
    #
    """
    if not isinstance(all_yaml, dict):
        msg = f"Expected a dict, got {type(all_yaml).__name__}"
        raise ValueError(msg)
    family_name2config = {}

    configs = dtu.look_everywhere_for_config_files2(EasyAlgoDB.pattern, all_yaml)
    configs.update(dtu.look_everywhere_for_config_files2("*.family.yaml", all_yaml))

    for filename, contents in list(configs.items()):
        c: EasyAlgoFamily = dtu.interpret_yaml_file(filename, contents, interpret_easy_algo_config)

        if c.family_name in family_name2config:
            one = family_name2config[c.family_name].filename
            two = c.filename
            msg = f"Repeated filename:\n{one}\n{two}"
            raise dtu.DTConfigException(msg)

        def interpret_instance_spec(filename, data):
            dtu.dt_check_isinstance("data", data, dict)

            basename = os.path.basename(filename)
            instance_name = dtu.id_from_basename_pattern(basename, c.instances_pattern)

            if c.default_constructor is not None and not "constructor" in data:
                description = "(not given)"
                constructor = c.default_constructor
                parameters = dict(data)
            else:
                description = data.pop("description")
                dtu.dt_check_isinstance("description", description, str)

                constructor = data.pop("constructor")
                dtu.dt_check_isinstance("constructor", constructor, str)

                parameters = data.pop("parameters")
                dtu.dt_check_isinstance("parameters", parameters, (dict, NoneType))

                if parameters is None:
                    parameters = {}

            return EasyAlgoInstance(
                family_name=c.family_name,
                instance_name=instance_name,
                description=description,
                filename=filename,
                constructor=constructor,
                parameters=parameters,
                valid=True,
                error_if_invalid=None,
            )

        c = check_validity_family(c)

        instances = {}
        _ = dtu.look_everywhere_for_config_files2(c.instances_pattern, all_yaml)
        # noinspection PyAssignmentToLoopOrWithParameter
        for filename, contents in list(_.items()):
            i = dtu.interpret_yaml_file(filename, contents, interpret_instance_spec, plain_yaml=True)
            if i.instance_name in instances:
                one = instances[i.instance_name].filename
                two = i.filename
                msg = f"Repeated filename:\n{one}\n{two}"
                raise dtu.DTConfigException(msg)

            # i = check_validity_instance(c, i)
            instances[i.instance_name] = i

        c = c._replace(instances=instances)
        family_name2config[c.family_name] = c

    return family_name2config


def check_validity_instances(family: EasyAlgoFamily) -> EasyAlgoFamily:
    instances = family.instances
    for name, i in list(family.instances.items()):
        i = check_validity_instance(family, i)
        instances[name] = i
    return family._replace(instances=instances)


@dtu.contract(f=EasyAlgoFamily, i=EasyAlgoInstance, returns=EasyAlgoInstance)
def check_validity_instance(f, i):
    if not f.valid:
        msg = "Instance not valid because family not valid."
        return i._replace(valid=False, error_if_invalid=msg)

    try:
        res = dtu.instantiate(i.constructor, i.parameters)
    except (TypeError, Exception) as e:
        # msg = str(e)
        msg = traceback.format_exc()
        return i._replace(valid=False, error_if_invalid=msg)

    interface = dtu.import_name(f.interface)
    #     print('interface: %s' % interface)
    if not isinstance(res, interface):
        msg = f"Expected a {interface.__name__} but it is a {type(res).__name__}."
        return i._replace(valid=False, error_if_invalid=msg)
    return i


def check_validity_test(f: EasyAlgoFamily, t: EasyAlgoInstance) -> EasyAlgoInstance:
    return t


@dtu.contract(f=EasyAlgoFamily, returns=EasyAlgoFamily)
def check_validity_family(f: EasyAlgoFamily) -> EasyAlgoFamily:
    f = check_validity_family_interface(f)
    return f


def check_validity_family_interface(f):
    # try to import interface
    symbol = f.interface
    try:
        dtu.import_name(symbol)
    except ValueError:
        # logger.error(e)
        error_if_invalid = f"Invalid symbol {symbol!r}."
        return f._replace(valid=False, error_if_invalid=error_if_invalid)
    return f


def interpret_easy_algo_config(filename: str, data: dict) -> EasyAlgoFamily:
    """Interprets the family config"""
    basename = os.path.basename(filename)
    family_name = dtu.id_from_basename_pattern(basename, EasyAlgoDB.pattern)
    instances_pattern = f"*.{family_name}.yaml"
    #     tests_pattern = '*.%s_test.yaml' % family_name

    data0 = dict(data)
    try:
        dtu.dt_check_isinstance("contents", data, dict)

        description = data.pop("description")
        dtu.dt_check_isinstance("description", description, str)

        interface = data.pop("interface")
        dtu.dt_check_isinstance("interface", interface, str)

        locations = data.pop("locations", None)
        default_constructor = data.pop("default_constructor", None)
    except Exception as e:
        msg = f"Cannot interpret data: \n\n{data0}"
        raise Exception(msg) from e

    if data:
        msg = f"Extra keys in configuration: {list(data)}"
        raise dtu.DTConfigException(msg)

    return EasyAlgoFamily(
        interface=interface,
        family_name=family_name,
        filename=filename,
        instances=None,
        instances_pattern=instances_pattern,
        description=description,
        valid=True,
        locations=locations,
        default_constructor=default_constructor,
        error_if_invalid=False,
    )
