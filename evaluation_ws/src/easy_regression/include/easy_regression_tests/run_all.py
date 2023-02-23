import os
import shutil

import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTCheck


def run(which, expect):
    v = False

    cur_dir = os.getcwd()
    dest = os.path.join(cur_dir, f"out/regression-output/{which}")
    cwd = dtu.get_output_dir_for_test()
    if not os.path.exists(cwd):
        dtu.mkdirs_thread_safe(cwd)

    try:
        cmd = [
            "rosrun",
            "easy_regression",
            "run",
            "--expect",
            expect,
            "--test",
            which,
            "-o",
            dest,
            "-c",
            "rmake",
        ]

        dtu.system_cmd_result(cwd, cmd, display_stdout=v, display_stderr=v, raise_on_error=True)
    finally:
        if False:
            shutil.rmtree(cwd)


@dtu.unit_test
def run_abnormal1():
    run("expect_abnormal1", RTCheck.ABNORMAL)


@dtu.unit_test
def run_abnormal3():
    run("expect_abnormal3", RTCheck.ABNORMAL)


@dtu.unit_test
def run_dontrun1():
    try:
        run("expect_dontrun1", RTCheck.OK)
    except dtu.CmdException as e:
        if "NOT-existing" in e.res.stderr:
            return
        raise


@dtu.unit_test
def run_ok1():
    run("expect_ok1", RTCheck.OK)


@dtu.unit_test
def run_nodata1():
    run("expect_nodata1", RTCheck.NODATA)


@dtu.unit_test
def run_nodata2():
    run("expect_nodata2", RTCheck.NODATA)


@dtu.unit_test
def run_fail1():
    run("expect_fail1", RTCheck.FAIL)


@dtu.unit_test
def run_rt_small_video():
    run("rt_small_video", RTCheck.OK)


@dtu.unit_test
def run_rt_small_video_lane_dets():
    run("rt_small_video_lane_dets", RTCheck.OK)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
