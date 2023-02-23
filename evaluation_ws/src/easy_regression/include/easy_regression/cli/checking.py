import getpass
import os
import socket
from datetime import datetime
from typing import List

import duckietown_code_utils as dtu
from easy_algo import get_easy_algo_db
from easy_regression.cli.db_yaml import get_unique_filename, yaml_from_rdbe
from easy_regression.conditions.interface import CheckResult, RTCheck
from easy_regression.conditions.result_db import ResultDB, ResultDBEntry


def git_cmd(cmd):
    cwd = dtu.get_duckietown_root()
    res = dtu.system_cmd_result(cwd, cmd, display_stdout=False, display_stderr=False, raise_on_error=True)
    return res.stdout.strip()


def make_entry(rt_name, results_all):
    user = getpass.getuser()
    hostname = socket.gethostname()
    date = dtu.format_datetime_as_YYYY_MM_DD(datetime.now())
    import platform

    cpu = platform.processor()
    try:
        branch = git_cmd("git rev-parse --abbrev-ref HEAD")
        commit = git_cmd("git rev-parse --verify HEAD")
    except dtu.CmdException:
        dtu.logger.info("no repo detected")
        branch = "not-available"
        commit = "not-available"
    current = ResultDBEntry(
        regression_test_name=rt_name,
        date=date,
        host=hostname,
        cpu=cpu,
        user=user,
        results=results_all,
        branch=branch,
        commit=commit,
    )
    return current


def compute_check_results(rt_name, rt, results_all):
    current = make_entry(rt_name, results_all)

    algo_db = get_easy_algo_db()
    entries_names = algo_db.query("rdbe", f"parameters:regression_test_name:{rt_name}")
    dtu.logger.info(f"entries: {list(entries_names)}")
    entries = []
    for name in entries_names:
        e = algo_db.create_instance("rdbe", name)
        entries.append(e)

    rdb = ResultDB(current=current, entries=entries)

    res = []
    for cwc in rt.get_checks():
        for check in cwc.checks:
            r = check.check(rdb)
            assert isinstance(r, CheckResult)
            res.append(r)
    return res


def display_check_results(results, out):
    s = ""
    s += f"\n{len(results)} results to report"
    for i, r in enumerate(results):
        s += "\n" + dtu.indent(str(r), "", f"{i + 1} of {len(results)}: ")
    print(s)
    fn = os.path.join(out, "check_results.txt")
    dtu.write_str_to_file(s, fn)


def write_to_db(rt_name, results_all, out):
    rdbe = make_entry(rt_name, results_all)
    fn = get_unique_filename(rt_name, rdbe)
    s = yaml_from_rdbe(rdbe)
    filename = os.path.join(out, fn)
    dtu.write_str_to_file(s, filename)


def fail_if_not_expected(results: List[CheckResult], expect):
    statuses = [r.status for r in results]
    summary = summarize_statuses(statuses)
    if summary != expect:
        msg = f"Expected status {expect!r}, but got {summary!r}."
        for i, r in enumerate(results):
            msg += "\n" + dtu.indent(str(r), "", f"{i + 1} of {len(results)}: ")
        raise Exception(msg)


def summarize_statuses(codes):
    # abnormal + ... = abnormal
    # fail + .. = fail
    # notfound + ... = notfound
    for c in codes:
        assert c in RTCheck.CHECK_RESULTS
    if RTCheck.ABNORMAL in codes:
        return RTCheck.ABNORMAL
    if RTCheck.FAIL in codes:
        return RTCheck.FAIL
    if RTCheck.NODATA in codes:
        return RTCheck.NODATA
    for c in codes:
        assert c == RTCheck.OK
    return RTCheck.OK
