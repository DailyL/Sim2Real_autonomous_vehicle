import os

import duckietown_code_utils as dtu


def _cwd():
    cwd = dtu.get_output_dir_for_test()
    if not os.path.exists(cwd):
        dtu.mkdirs_thread_safe(cwd)
    return cwd


@dtu.unit_test
def test_cli1():
    cmd = ["rosrun", "easy_algo", "summary"]
    dtu.system_cmd_result(_cwd(), cmd, display_stdout=True, display_stderr=True, raise_on_error=True)


@dtu.unit_test
def test_cli2():
    cmd = ["rosrun", "easy_algo", "summary", "line_detector"]
    dtu.system_cmd_result(_cwd(), cmd, display_stdout=True, display_stderr=True, raise_on_error=True)
