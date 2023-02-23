import duckietown_code_utils as dtu
from easy_logs import filters_slice, get_easy_logs_db2, logger


def get_test_db():
    return get_easy_logs_db2(do_not_use_cloud=False, do_not_use_local=True, ignore_cache=False)


@dtu.unit_test
def parse_expressions():
    db = get_test_db()
    logs = db.logs
    one = list(logs.keys())[0]
    #     l0 = logs[one]
    #     print yaml_dump_pretty(l0._asdict())
    query = one + "/{10:15}"
    res = dtu.fuzzy_match(query, logs, filters=filters_slice, raise_if_no_matches=True)

    assert len(res) == 1
    l1 = res[list(res)[0]]

    assert l1.t0 == 10, l1.t0
    assert l1.t1 == 15, l1.t1
    assert l1.length == 5, l1.length

    query = one + "/{10:15}/{1:3}"
    res2 = dtu.fuzzy_match(query, logs, filters=filters_slice, raise_if_no_matches=True)
    assert len(res2) == 1

    l2 = res2[list(res2)[0]]
    #     print l2.t0, l2.t1, l2.length
    assert l2.t0 == 11
    assert l2.t1 == 13
    assert l2.length == 2, l1.length


@dtu.unit_test
def parse_expressions2():
    db = get_test_db()
    logs = db.logs
    one = list(logs.keys())[0]
    query = one + "/{10.5:15.5}"
    res = dtu.fuzzy_match(query, logs, filters=filters_slice, raise_if_no_matches=True)

    assert len(res) == 1
    l1 = res[list(res)[0]]
    assert l1.t0 == 10.5, l1.t0
    assert l1.t1 == 15.5, l1.t1
    assert l1.length == 5, l1.length


@dtu.unit_test
def parse_expressions3():
    db = get_test_db()
    logs = db.logs
    one = list(logs.keys())[0]
    query = one + "/{:2.5}"
    res = dtu.fuzzy_match(query, logs, filters=filters_slice, raise_if_no_matches=True)

    assert len(res) == 1
    l1 = res[list(res)[0]]
    assert l1.t0 == 0, l1.t0
    assert l1.t1 == 2.5, l1.t1


@dtu.unit_test
def parse_expressions4():
    db = get_test_db()
    logs = db.logs
    one = list(logs.keys())[0]
    query = one + "/{1:}"
    res = dtu.fuzzy_match(query, logs, filters=filters_slice, raise_if_no_matches=True)
    logger.info(res)
    assert len(res) == 1
    l1 = res[list(res)[0]]
    assert l1.t0 == 1


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
