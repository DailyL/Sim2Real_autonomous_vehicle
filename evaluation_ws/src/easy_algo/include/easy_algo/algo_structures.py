from collections import namedtuple

__all__ = ["EasyAlgoInstance", "EasyAlgoFamily"]
EasyAlgoFamily = namedtuple(
    "EasyAlgoFamily",
    [
        "filename",
        "family_name",
        "interface",
        "description",
        "locations",
        "default_constructor",
        "instances_pattern",
        "instances",
        "valid",
        "error_if_invalid",
    ],
)
#
#
# EasyAlgoTest = namedtuple('EasyAlgoTest',
#                               ['family_name',
#                                'test_name',
#                                'description',
#                                'filename', # where it was specified
#                                'constructor', # how to instance it
#                                'parameters',
#                                'valid', 'error_if_invalid'])


EasyAlgoInstance = namedtuple(
    "EasyAlgoInstance",
    [
        "family_name",
        "instance_name",
        "description",
        "filename",  # where it was specified
        "constructor",  # how to instance it
        "parameters",
        "valid",
        "error_if_invalid",
    ],
)
