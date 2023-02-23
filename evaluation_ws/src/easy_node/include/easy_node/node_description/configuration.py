import os
from collections import namedtuple

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
from sensor_msgs.msg import CompressedImage

__all__ = [
    "EasyNodeConfig",
    "load_configuration",
    "PROCESS_THREADED",
    "PROCESS_VALUES",
    "PROCESS_SYNCHRONOUS",
]

EasyNodeConfig = namedtuple(
    "EasyNodeConfig",
    "filename package_name node_type_name description parameters subscriptions " "contracts publishers",
)
EasyNodeParameter = namedtuple("EasyNodeParameter", "name desc type has_default default")
EasyNodeSubscription = namedtuple(
    "EasyNodeSubscription", "name desc type topic queue_size process latch timeout"
)
EasyNodePublisher = namedtuple("EasyNodePublisher", "name desc type topic queue_size latch")

PROCESS_THREADED = "threaded"
PROCESS_SYNCHRONOUS = "synchronous"
PROCESS_VALUES = [PROCESS_THREADED, PROCESS_SYNCHRONOUS]

# type = int, bool, float, or None (anything)
DEFAULT_NOT_GIVEN = "default-not-given"

NoneType = type(None)


def merge_configuration(c1: EasyNodeConfig, c2: EasyNodeConfig) -> EasyNodeConfig:
    """Merges two configurations. Values in c2 override the ones in c1"""
    parameters = {}
    subscriptions = {}
    contracts = {}
    publishers = {}
    for c in [c1, c2]:
        parameters.update(c.parameters)
        subscriptions.update(c.subscriptions)
        contracts.update(c.contracts)
        publishers.update(c.publishers)
    res = EasyNodeConfig(
        filename=c2.filename,  # XXX
        package_name=c2.package_name,
        node_type_name=c2.node_type_name,
        description=c2.description,
        parameters=parameters,
        subscriptions=subscriptions,
        contracts=contracts,
        publishers=publishers,
    )
    return res


def load_configuration_baseline():
    """Get the baseline configuration."""
    c1 = load_configuration_package_node("easy_node", "easy_node")
    return c1


def load_configuration_package_node(package_name: str, node_type_name: str) -> EasyNodeConfig:
    path = dru.get_ros_package_path(package_name)
    look_for = f"{node_type_name}.easy_node.yaml"
    found = dtu.locate_files(path, look_for)
    if not found:
        msg = f"Could not find EasyNode configuration {look_for!r}."
        raise dtu.DTConfigException(msg)  # XXX

    fn = found[0]
    contents = open(fn).read()
    c = load_configuration(fn, contents)
    c = c._replace(package_name=package_name)
    c = c._replace(node_type_name=node_type_name)

    # Add the common parameters
    if node_type_name != "easy_node":
        c0 = load_configuration_baseline()
        c = merge_configuration(c0, c)

    return c


def load_configuration(realpath, contents) -> EasyNodeConfig:
    # TODO: load "version" string
    try:
        try:
            data = dtu.yaml_load(contents)
        except Exception as e:
            msg = "Could not parse YAML file properly:"
            dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
            raise  # ide not smart
        if not isinstance(data, dict):
            msg = f"Expected a dict, got {type(data).__name__}."
            raise dtu.DTConfigException(msg)
        try:
            parameters = data.pop("parameters")
            subscriptions = data.pop("subscriptions")
            publishers = data.pop("publishers")
            contracts = data.pop("contracts")
            description = data.pop("description")
        except KeyError as e:
            key = e.args[0]
            msg = f"Invalid configuration: missing field {key!r}."
            raise dtu.DTConfigException(msg)

        if not isinstance(description, (str, NoneType)):
            msg = f"Description should be a string, not {type(description).__name__}."
            raise dtu.DTConfigException(msg)

        if data:
            msg = f"Spurious fields found: {sorted(data)}"
            raise dtu.DTConfigException(msg)

        parameters = load_configuration_parameters(parameters)
        subscriptions = load_configuration_subscriptions(subscriptions)
        contracts = load_configuration_contracts(contracts)
        publishers = load_configuration_publishers(publishers)

        return EasyNodeConfig(
            filename=realpath,
            parameters=parameters,
            contracts=contracts,
            subscriptions=subscriptions,
            publishers=publishers,
            package_name=None,
            description=description,
            node_type_name=None,
        )
    except dtu.DTConfigException as e:
        msg = f"Invalid configuration at {realpath}: "
        dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)


def load_configuration_parameters(data: dict) -> dict:
    res = {}
    for k, v in list(data.items()):
        try:
            check_good_name(k)
            res[k] = load_configuration_parameter(k, v)
        except dtu.DTConfigException as e:
            msg = f"Invalid parameter entry {k!r}:"
            dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
    return res


def load_configuration_subscriptions(data: dict) -> dict:
    res = {}
    for k, v in list(data.items()):
        try:
            check_good_name(k)
            res[k] = load_configuration_subscription(k, v)
        except dtu.DTConfigException as e:
            msg = f"Invalid subscription entry {k!r}:"
            dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
    return res


def load_configuration_publishers(data: dict) -> dict:
    res = {}
    for k, v in list(data.items()):
        try:
            check_good_name(k)
            res[k] = load_configuration_publisher(k, v)
        except dtu.DTConfigException as e:
            msg = f"Invalid publisher entry {k!r}:"
            dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)
    return res


def preprocess_desc(d):
    if d is not None:
        return d.strip()


def load_configuration_parameter(name, data):
    #     verbose:
    #         desc: Whether the node is verbose or not.
    #         type: bool
    #         default: true
    #
    try:
        desc = data.pop("desc", None)
        desc = preprocess_desc(desc)
        type_ = data.pop("type")

        if "default" in data:
            default = data.pop("default")
            has_default = True
        else:
            default = DEFAULT_NOT_GIVEN
            has_default = False

    except KeyError as e:
        msg = f"Could not find field {e.args[0]!r}."
        raise dtu.DTConfigException(msg)

    if data:
        msg = f"Extra keys: {data!r}"
        raise dtu.DTConfigException(msg)

    if not isinstance(desc, (str, NoneType)):
        msg = f"Description should be a string, not {type(desc).__name__}."
        raise dtu.DTConfigException(msg)

    type2T = {
        "bool": bool,
        "str": str,
        "int": int,
        "float": float,
        "any": None,
        None: None,
        "dict": dict,
    }

    if not type_ in type2T:
        raise NotImplementedError(type_)
    T = type2T[type_]

    if has_default and default is not None and T is not None:
        default = T(default)

    return EasyNodeParameter(name=name, desc=desc, type=T, has_default=has_default, default=default)


def check_good_name(k):
    # TODO
    pass


def message_class_from_string(s):
    if not "/" in s:
        msg = ""
        msg += f'Invalid message name "{s}".\n'
        msg += 'I expected that the name of the message is in the format "PACKAGE/MSG".\n '
        msg += 'E.g. "sensor_msgs/Joy" or "duckietown_msgs/BoolStamped".'
        raise dtu.DTConfigException(msg)

    # e.g. "std_msgs/Header"
    i = s.index("/")
    package = s[:i]
    name = s[i + 1 :]
    symbol = f"{package}.msg.{name}"
    try:
        msgclass = dtu.import_name(symbol)
        return msgclass
    except ValueError as e:
        msg = f'Cannot import type for message "{s}" ({symbol}).'
        dtu.raise_wrapped(dtu.DTConfigException, e, msg, compact=True)


def load_configuration_subscription(name, data):
    #      image:
    #         desc: Image to read
    #         topic: ~image
    #         type: CompressedImage
    #         queue_size: 1
    try:
        desc = data.pop("desc", None)
        desc = preprocess_desc(desc)
        latch = data.pop("latch", None)
        timeout = data.pop("timeout", None)
        topic = data.pop("topic")
        type_ = data.pop("type")
        queue_size = data.pop("queue_size", None)
        process = data.pop("process", PROCESS_SYNCHRONOUS)
        if not process in PROCESS_VALUES:
            msg = f"Invalid value of process {process!r} not in {PROCESS_VALUES!r}."
            raise dtu.DTConfigException(msg)

    except KeyError as e:
        msg = f"Could not find field {e!r}."
        raise dtu.DTConfigException(msg)

    if not isinstance(desc, (str, NoneType)):
        msg = f"Description should be a string, not {type(desc).__name__}."
        raise dtu.DTConfigException(msg)

    if data:
        msg = f"Extra keys: {data!r}"
        raise dtu.DTConfigException(msg)
    T = message_class_from_string(type_)

    return EasyNodeSubscription(
        name=name,
        desc=desc,
        topic=topic,
        timeout=timeout,
        type=T,
        queue_size=queue_size,
        latch=latch,
        process=process,
    )


def load_configuration_publisher(name, data):
    try:
        desc = data.pop("desc", None)
        desc = preprocess_desc(desc)
        latch = data.pop("latch", None)
        topic = data.pop("topic")
        type_ = data.pop("type")
        queue_size = data.pop("queue_size", None)

    except KeyError as e:
        msg = f"Could not find field {e!r}."
        raise dtu.DTConfigException(msg)

    if not isinstance(desc, (str, NoneType)):
        msg = f"Description should be a string, not {type(desc).__name__}."
        raise dtu.DTConfigException(msg)

    if data:
        msg = f"Extra keys: {data!r}"
        raise dtu.DTConfigException(msg)

    T = message_class_from_string(type_)

    return EasyNodePublisher(name=name, desc=desc, topic=topic, type=T, queue_size=queue_size, latch=latch)


def load_configuration_contracts(data):
    # TODO
    return {}


def load_configuration_for_nodes_in_package(package_name: str):
    """
    returns dict node_name -> config
    """
    suffix = ".easy_node.yaml"
    package_dir = dru.get_ros_package_path(package_name)
    configs = dtu.locate_files(package_dir, "*" + suffix)
    res = {}
    for c in configs:
        node_name = os.path.basename(c).replace(suffix, "")
        res[node_name] = load_configuration_package_node(package_name, node_name)
    return res


def format_enc(enc: EasyNodeConfig, descriptions: bool = False) -> str:
    s = f'Configuration for node "{enc.node_type_name}" in package "{enc.package_name}"'
    s += "\n" + "=" * len(s)

    S = " " * 4
    s += "\n\n Parameters\n\n"
    s += dtu.indent(format_enc_parameters(enc, descriptions), S)
    s += "\n\n Subcriptions\n\n"
    s += dtu.indent(format_enc_subscriptions(enc, descriptions), S)
    s += "\n\n Publishers\n\n"
    s += dtu.indent(format_enc_publishers(enc, descriptions), S)
    return s


def format_enc_parameters(enc: EasyNodeConfig, descriptions: bool) -> str:
    table = [
        [
            "name",
            "type",
            "default",
            "description",
        ]
    ]

    for p in list(enc.parameters.values()):
        if p.desc:
            desc = dtu.wrap_line_length(p.desc, 80)
        else:
            desc = "(none)"
        if p.has_default:
            default = p.default
        else:
            default = "(none)"
        if p.type is None:
            t = "(n/a)"
        else:
            t = p.type.__name__
        table.append([p.name, t, default, desc])
    if not descriptions:
        dtu.remove_table_field(table, "description")
    return dtu.format_table_plus(table, 2)


def format_enc_subscriptions(enc: EasyNodeConfig, descriptions: bool) -> str:
    table = [
        [
            "name",
            "type",
            "topic",
            "options",
            "process",
            "description",
        ]
    ]

    for p in list(enc.subscriptions.values()):
        if p.desc:
            desc = dtu.wrap_line_length(p.desc, 80)
        else:
            desc = "(none)"
        options = []
        if p.queue_size is not None:
            options.append(f"queue_size = {p.queue_size}")
        if p.latch is not None:
            options.append(f"latch = {p.latch} ")
        if p.timeout is not None:
            options.append(f"timeout = {p.timeout} ")

        options = "\n".join(options)
        table.append([p.name, p.type.__name__, p.topic, options, p.process, desc])
    if not descriptions:
        dtu.remove_table_field(table, "description")
    return dtu.format_table_plus(table, 2)


@dtu.contract(enc=EasyNodeConfig, returns=str)
def format_enc_publishers(enc, descriptions):
    table = [
        [
            "name",
            "type",
            "topic",
            "options",
            "description",
        ]
    ]

    for p in list(enc.publishers.values()):
        if p.desc:
            desc = dtu.wrap_line_length(p.desc, 80)
        else:
            desc = "(none)"
        options = []
        if p.queue_size is not None:
            options.append(f"queue_size = {p.queue_size} ")
        if p.latch is not None:
            options.append(f"latch = {p.latch}")

        options = "\n".join(options)
        table.append([p.name, p.type.__name__, p.topic, options, desc])
    if not descriptions:
        dtu.remove_table_field(table, "description")
    return dtu.format_table_plus(table, 2)
