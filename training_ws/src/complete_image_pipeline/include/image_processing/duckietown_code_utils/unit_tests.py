from nose.tools import nottest

from .constants import DuckietownConstants
from .detect_environment import on_duckiebot
from .logging_logger import logger

__all__ = [
    "unit_test",
    "run_tests_for_this_module",
    "get_output_dir_for_test",
]

show_info = DuckietownConstants.debug_show_package_import_info


def unit_test(f):
    return f


def run_tests_for_this_module():
    pass


def get_output_dir_for_test():
    return "out-comptests"


if on_duckiebot():
    using_fake_tests = True
    # logger.warning('Unit tests are disabled because we are on a Duckiebot.')
else:
    try:
        # noinspection PyUnresolvedReferences
        from comptests import comptest  # as unit_test

        # noinspection PyUnresolvedReferences
        from comptests import run_module_tests  # as run_tests_for_this_module

        # noinspection PyUnresolvedReferences
        from comptests.comptests import (
            get_comptests_output_dir,
        )  # as get_output_dir_for_test

        if show_info:
            logger.warning("Using the Comptests testing framework.")

        using_fake_tests = False
        unit_test = nottest(comptest)
        run_tests_for_this_module = nottest(run_module_tests)
        get_output_dir_for_test = nottest(get_comptests_output_dir)
    except ImportError:
        if show_info:
            logger.warning("Unit tests are disabled because Comptests not found.")
        using_fake_tests = True


if using_fake_tests:

    @nottest
    def unit_test(f):
        return f

    @nottest
    def run_tests_for_this_module():
        pass

    @nottest
    def get_output_dir_for_test():
        return "out-comptests"
