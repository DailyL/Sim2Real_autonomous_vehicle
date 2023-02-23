import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTParseError
from easy_regression.conditions.references import parse_reference


@dtu.unit_test
def parse_references_check_good():
    good = [
        "v:analyzer/test/statistic",
        "v:analyzer/test/statistic@2016-12-01",
        "v:analyzer/log/statistic~master@2016-12-01",
        "v:analyzer/log/statistic~master",
    ]
    for g in good:
        parse_reference(g)


@dtu.unit_test
def parse_one():
    s = "v:analyzer/log/statistic?hash"
    a = parse_reference(s)
    assert a.commit == "hash", a
    print(a)


@dtu.unit_test
def parse_references_check_bad():
    bad = [
        "v:analyzer/test",
        "v:analyzer/test/statistic@2016-12-0a",
        "v:analyzer/test/statistic@",
        "v:analyzer/test/statistic~",
        "v:analyzer/test/statistic~@2016-12-01",
        #         'v:analyzer/log/statistic~master?hash',
        "v:analyzer/log/statistic@2016-12-01?hash",
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
