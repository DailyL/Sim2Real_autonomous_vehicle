import os

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
from easy_regression.conditions.result_db import ResultDBEntry


def yaml_from_rdbe(r: ResultDBEntry) -> str:
    d = {}
    d["description"] = "The result of running a unit test"
    d["constructor"] = "easy_regression.rdbe_from_yaml"
    d["parameters"] = r._asdict()
    return dtu.yaml_dump_pretty(d)


def rdbe_from_yaml(**parameters):
    return ResultDBEntry(**parameters)


def get_unique_filename(rt_name: str, rdbe: ResultDBEntry) -> str:
    commit = rdbe.commit[-8:]
    d = rdbe.date.replace("-", "")
    basename = rt_name + f"_{d}_{rdbe.branch}_{commit}.rdbe.yaml"

    dr = dru.get_ros_package_path("easy_regression")
    filename = os.path.join(dr, "db", rt_name, basename)
    return filename
