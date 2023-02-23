import duckietown_code_utils as dtu
from easy_regression.conditions.implementation import _parse_regression_test_check
from easy_regression.conditions.interface import RTParseError
from easy_regression.conditions.references import parse_reference


@dtu.unit_test
def parse_condition_check_good():
    good = [
        "v:analyzer/test/statistic >= 12",
        "v:analyzer/test/statistic@2016-12-01 <= 2",
    ]
    for g in good:
        _parse_regression_test_check(g)


@dtu.unit_test
def parse_condition_check_bad():
    bad = [
        "v:analyzer/test",
        "v:analyzer/test/statistic@2016-12-0a",
        "v:analyzer/test/statistic@",
        "v:analyzer/test/statistic~",
        "v:analyzer/test/statistic~@2016-12-01",
    ]
    for b in bad:
        try:
            res = parse_reference(b)
        except RTParseError:
            pass
        else:
            msg = "Expected DTParseError."
            msg += f"\nString: {b!r}"
            msg += f"\nReturns: {res}"
            raise Exception(msg)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
