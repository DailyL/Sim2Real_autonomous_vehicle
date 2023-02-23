import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTParseError

s = """
description: |
    A simple regression test.

constructor: easy_regression.RegressionTest
parameters:
    logs:
    - 20160223-amadoa-amadobot-RCDP2
    processors: []
    analyzers:
    - count_messages

    checks:
    - desc: The number of messages read should remain the same.
      cond: |
        v:count_messages/20160223-amadoa-amadobot-RCDP2/num_messages == 5330
        v:count_messages/all/num_messages == 5330
"""

s_fail = """
description: |
    A simple regression test.

constructor: easy_regression.RegressionTest
parameters:
    logs:
    - 20160223-amadoa-amadobot-RCDP2
    processors: []
    analyzers:
    - count_messages

    checks:
    - desc: The number of messages read should remain the same.
      cond: |
        v:count_messages/20160223-amadoa-amadobot-RCDP2/num_messages == 5330
        v:count_messages/all/num_messages = 5330
"""


@dtu.unit_test
def parse_reg_test():
    x = dtu.yaml_load(s)
    # if isinstance(x['description'], unicode):
    #     msg = 'I do not expect Unicode'
    #     msg += '\n' + x.__repr__()
    #     raise ValueError(msg)
    _ = dtu.instantiate(x["constructor"], x["parameters"])


@dtu.unit_test
def parse_reg_fail():
    x = dtu.yaml_load(s_fail)
    print((x.__repr__()))
    try:
        _ = dtu.instantiate(x["constructor"], x["parameters"])
    except RTParseError:
        pass
    else:
        raise Exception("Expected failure")


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
