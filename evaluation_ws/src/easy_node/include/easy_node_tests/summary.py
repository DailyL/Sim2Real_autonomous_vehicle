import duckietown_code_utils as dtu

from easy_node.user_config.summary import user_config_summary


@dtu.unit_test
def call_summary():
    print((user_config_summary()))


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
