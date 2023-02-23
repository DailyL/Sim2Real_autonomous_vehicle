# XXX: does not represent None as null, rather as '...\n'
from .type_checks import dt_check_isinstance


def yaml_load(s: str):
    dt_check_isinstance("s", s, str)
    from ruamel import yaml

    if s.startswith("..."):
        return None
    try:
        l = yaml.load(s, Loader=yaml.RoundTripLoader)
    except:
        l = yaml.load(s, Loader=yaml.UnsafeLoader)

    return l


def yaml_load_plain(s: str):
    dt_check_isinstance("s", s, str)
    from ruamel import yaml

    if s.startswith("..."):
        return None
    l = yaml.load(s, Loader=yaml.UnsafeLoader)
    # return remove_unicode(l)
    return l


def yaml_dump(s) -> str:
    from ruamel import yaml

    res = yaml.dump(s, Dumper=yaml.RoundTripDumper, allow_unicode=False)
    return res


def yaml_dump_pretty(ob) -> str:
    from ruamel import yaml

    return yaml.dump(ob, Dumper=yaml.RoundTripDumper)
