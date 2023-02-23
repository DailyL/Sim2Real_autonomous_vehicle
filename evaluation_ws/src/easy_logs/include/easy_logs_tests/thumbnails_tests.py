import os

import duckietown_code_utils as dtu


@dtu.unit_test
def test_thumbnails():
    id_log = "20160429223659_neptunus"
    cmd = ["rosrun", "easy_logs", "thumbnails", id_log, "-c", "rmake"]
    run_one(cmd)


@dtu.unit_test
def test_videos():
    id_log = "20160429223659_neptunus/{1:3}"
    cmd = ["rosrun", "easy_logs", "videos", id_log, "-c", "rmake"]
    run_one(cmd)


def run_one(cmd):
    v = False
    cwd = dtu.get_output_dir_for_test()
    if not os.path.exists(cwd):
        dtu.mkdirs_thread_safe(cwd)
    dtu.write_str_to_file("config echo 1", os.path.join(cwd, ".compmake.rc"))
    try:
        dtu.system_cmd_result(cwd, cmd, display_stdout=v, display_stderr=v, raise_on_error=True)
    finally:
        pass


#         if os.path.exists(cwd):
#             shutil.rmtree(cwd)
