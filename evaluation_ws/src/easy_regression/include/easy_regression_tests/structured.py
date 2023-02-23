import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTCheck
from easy_regression.conditions.result_db import ResultDB, ResultDBEntry
from easy_regression_tests.evaluation import raise_error


def get_test_db():
    results = {
        "analyzer": {
            "log1": {
                "value2": 1,
                "composite": {"a": 2, "b": {"c": 3}},
            }
        }
    }
    current = ResultDBEntry(
        regression_test_name="", date="", host="", cpu="", user="", results=results, branch="", commit=""
    )

    rdb = ResultDB(current=current, entries=[])
    return rdb


def run_checks(condition_result):
    rdb = get_test_db()
    for ct, expected in condition_result:
        t = RTCheck.from_string(ct)
        res = t.check(rdb)
        if not res.status == expected:
            raise_error(rdb, t, res, f"Expected {expected}")


@dtu.unit_test
def test_composite_true():
    conditions_true = [
        ("v:analyzer/log1/value2 == 1", RTCheck.OK),
        ("v:analyzer/log1/composite/a == 2", RTCheck.OK),
        ("v:analyzer/log1/composite/b/c == 3", RTCheck.OK),
    ]
    run_checks(conditions_true)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
