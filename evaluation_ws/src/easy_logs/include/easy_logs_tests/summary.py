import duckietown_code_utils as dtu
from easy_logs.easy_logs_summary_imp import format_logs
from easy_logs.logs_db import get_easy_logs_db2


@dtu.unit_test
def call_summary():
    try:
        db = get_easy_logs_db2(do_not_use_cloud=True, do_not_use_local=False, ignore_cache=False)
        logs = db.query(query="*")
        s = format_logs(logs)
        return s
    except dtu.DTNoMatches:
        pass


@dtu.unit_test
def cloud():
    get_easy_logs_db2(do_not_use_cloud=False, do_not_use_local=False, ignore_cache=False)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
