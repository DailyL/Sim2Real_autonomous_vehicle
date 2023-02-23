
__all__ = [
    'DuckietownConstants',
]


class DuckietownConstants(object):
    DUCKIETOWN_ROOT_variable = 'DUCKIETOWN_ROOT'
    DUCKIETOWN_TMP_variable = 'DUCKIETOWN_TMP'
    DUCKIEFLEET_ROOT_variable = 'DUCKIEFLEET_ROOT'
    DUCKIETOWN_DATA_variable = 'DUCKIETOWN_DATA'
    DUCKIETOWN_CONFIG_SEQUENCE_variable = 'DUCKIETOWN_CONFIG_SEQUENCE'

    # The name of a hypothetical robot used in the unit tests.
    ROBOT_NAME_FOR_TESTS = 'robbie'

    # If the environment variable is not set, use these:
    duckiefleet_root_defaults = [
        '~/duckiefleet',
        '~/duckiefleet-fall2017',
    ]

    # path of machines file inside DUCKIEFLEET_ROOT
    machines_path_rel_to_root = 'catkin_ws/src/00-infrastructure/duckietown/machines'

    use_cache_for_algos = False

    enforce_no_tabs = True
    enforce_naming_conventions = True

    # The rules for good readmes do not apply to these packages
    good_readme_exceptions = ['apriltags_ros', 'apriltags', 'duckietown', 'isam']

    # Show more information about dependencies
    debug_show_package_import_info = False

    ADD_SHORTCUT_TAG = '@create-shortcut-for-this'

    show_timeit_benchmarks = False

