import os
from typing import List

import duckietown_code_utils as dtu
import rosbag
from easy_algo import get_easy_algo_db
from easy_regression.analyzer_interface import AnalyzerInterface


def print_results(analyzers: List[str], results_all, out: str):
    base = os.path.join(out, "statistics")
    yaml_data = dtu.yaml_dump_pretty(results_all)
    dtu.write_str_to_file(yaml_data, os.path.join(base, "statistics.yaml"))
    print((dtu.indent(yaml_data, "print_results ")))

    for a in analyzers:
        dtu.write_str_to_file(dtu.yaml_dump_pretty(results_all[a]), os.path.join(base, f"{a}.table.yaml"))
        s = ""
        s += "\n" + "-" * 10 + f" Results for {a} " + "-" * 10
        table = table_for_analyzer(results_all[a])
        s += "\n" + dtu.indent(dtu.format_table_plus(table, colspacing=3), "  ")
        s += "\n"
        dtu.write_str_to_file(s, os.path.join(base, f"{a}.table.txt"))


def table_for_analyzer(results_all):
    from easy_regression.cli.run_regression_tests import ALL_LOGS

    keys = list(results_all[ALL_LOGS].keys())

    head = ["log name"] + keys
    table = [head]
    for k, v in list(results_all.items()):
        row = [k]

        for key in keys:
            value = v[key]
            if isinstance(value, (float, int)):
                row.append(value)
            elif isinstance(value, dict):
                s = ""
                for mk, mv in list(value.items()):
                    s += f"\n {mk}  {mv}"
                row.append(s)
            else:
                row.append(type(value).__name__)

        if k == ALL_LOGS:
            table.append([""] * len(head))
        table.append(row)

    return table


def job_merge(results, analyzer):
    """
    results: log name -> results dict
    """
    easy_algo_db = get_easy_algo_db()
    analyzer_instance = easy_algo_db.create_instance("analyzer", analyzer)

    results = list(results.values())

    total = merge_n(analyzer_instance, results)
    return total


@dtu.contract(analyzer=AnalyzerInterface)
def merge_n(analyzer: AnalyzerInterface, results) -> dict:
    if len(results) == 1:
        return results[0]
    else:
        first = results[0]
        rest = merge_n(analyzer, results[1:])
        r = {}
        analyzer.reduce(first, rest, r)
        return r


def job_analyze(log: str, analyzer: str):
    easy_algo_db = get_easy_algo_db()
    analyzer_instance = easy_algo_db.create_instance("analyzer", analyzer)
    in_bag = rosbag.Bag(log)
    results = {}
    dtu.logger.info(f"Running {analyzer} on {log}")
    analyzer_instance.analyze_log(in_bag, results)
    in_bag.close()
    return results
