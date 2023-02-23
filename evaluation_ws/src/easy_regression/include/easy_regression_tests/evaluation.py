import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTCheck
from easy_regression.conditions.references import parse_date_spec
from easy_regression.conditions.result_db import ResultDB, ResultDBEntry


def get_test_db():
    results = {
        "analyzer": {
            "log1": {
                "value2": 2,
                "value3": 3,
                "changed": 98,
                "same": 10,
            }
        }
    }
    current = ResultDBEntry(
        regression_test_name="", date="", host="", cpu="", user="", results=results, branch="", commit=""
    )
    results_old = {
        "analyzer": {
            "log1": {
                "value2": 2,
                "value3": 3,
                "same": 10,
                "changed": 100,
            }
        }
    }
    old = ResultDBEntry(
        regression_test_name="",
        date=parse_date_spec("2017-01-01"),
        host="",
        cpu="",
        user="",
        results=results_old,
        branch="",
        commit="commit-id",
    )
    rdb = ResultDB(current=current, entries=[old])
    return rdb


def raise_error(rdb, t, res, s):
    msg = s
    msg += "\n" + dtu.indent(str(res), "obtained: ")
    msg += "\n" + dtu.indent(str(t), "", "test: ")
    msg += "\n" + dtu.indent(str(rdb), "", "rdb: ")
    raise Exception(msg)


def run_checks(condition_result):
    rdb = get_test_db()
    for ct, expected in condition_result:
        t = RTCheck.from_string(ct)
        res = t.check(rdb)
        if not res.status == expected:
            raise_error(rdb, t, res, f"Expected {expected}")


@dtu.unit_test
def test_true():
    conditions_true = [
        ("v:analyzer/log1/value2 == 2", RTCheck.OK),
        ("v:analyzer/log1/value2 > 1", RTCheck.OK),
        ("v:analyzer/log1/value2 < 3", RTCheck.OK),
        ("v:analyzer/log1/value2 <= 2", RTCheck.OK),
    ]
    run_checks(conditions_true)


@dtu.unit_test
def test_false():
    conditions = [
        ("v:analyzer/log1/value2 == 1", RTCheck.FAIL),
        ("v:analyzer/log1/value2 > 2", RTCheck.FAIL),
        ("v:analyzer/log1/value2 < 2", RTCheck.FAIL),
        ("v:analyzer/log1/value2 <= 1", RTCheck.FAIL),
    ]
    run_checks(conditions)


@dtu.unit_test
def test_eval_error():
    conditions = [
        ("v:analyzer/log1/not_exist <= 1", RTCheck.ABNORMAL),
        ("v:analyzer/not_exist/value2 <= 1", RTCheck.ABNORMAL),
        ("v:not_exist/log1/value2 <= 1", RTCheck.ABNORMAL),
    ]
    run_checks(conditions)


@dtu.unit_test
def test_data_not_found():
    conditions = [
        ("v:analyzer/log1/value2@2016-01-12 <= 1", RTCheck.NODATA),
        ("v:analyzer/log1/value2~branchname <= 1", RTCheck.NODATA),
    ]
    run_checks(conditions)


@dtu.unit_test
def test_good_ref():
    conditions = [
        ("v:analyzer/log1/same@2017-01-01 == 10", RTCheck.OK),
        ("v:analyzer/log1/same == 10", RTCheck.OK),
        ("v:analyzer/log1/same@2017-01-01 == v:analyzer/log1/same", RTCheck.OK),
        ("v:analyzer/log1/same@2017-01-01 != v:analyzer/log1/same", RTCheck.FAIL),
        ("v:analyzer/log1/changed@2017-01-01 == 100", RTCheck.OK),
        ("v:analyzer/log1/changed == 98", RTCheck.OK),
        ("v:analyzer/log1/changed@2017-01-01 != v:analyzer/log1/same", RTCheck.OK),
        ("v:analyzer/log1/changed@2017-01-01 == v:analyzer/log1/same", RTCheck.FAIL),
    ]
    run_checks(conditions)


@dtu.unit_test
def test_good_ref_ratios():
    conditions = [
        ("v:analyzer/log1/changed@2017-01-01 == 100", RTCheck.OK),
        ("v:analyzer/log1/changed@2017-01-01 ==[3%] 98", RTCheck.OK),
        ("v:analyzer/log1/changed@2017-01-01 ==[1%] 98", RTCheck.FAIL),
        ("v:analyzer/log1/changed@2017-01-01 ==[2%] 98", RTCheck.OK),
    ]
    run_checks(conditions)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
