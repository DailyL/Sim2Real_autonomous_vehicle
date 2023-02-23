import os
import time
import signal
import datetime
import subprocess
import dataclasses
from enum import IntEnum

from flask import Blueprint, request

from dt_device_utils import get_device_hostname
from dt_ros_api.utils import response_ok, response_error
from dt_ros_api.constants import (
    FILES_API_DIR,
    BAG_RECORDER_DIR,
    BAG_RECORDER_MAX_DURATION_SECS
)


rosbag = Blueprint('rosbag', __name__)
shelf = dict()


@dataclasses.dataclass
class ROSBag:

    class Status(IntEnum):
        INIT = -1
        RECORDING = 0
        POSTPROCESSING = 1
        READY = 2
        ERROR = 10

    @dataclasses.dataclass
    class Recorder:
        process: subprocess.Popen
        pid: int
        pgid: int

    recorder: Recorder
    path: str
    status: Status


@rosbag.route('/bag/record/start/<path:experiment>', methods=['POST', 'GET'])
def _rosbag_start(experiment: str):
    # record specified topics, or all if not specified
    if request.method == "POST":
        topics = request.form.get("topics", "--all").split(":")
    else:
        topics = request.args.get("topics", "--all").split(":")
    destination_dir = os.path.join(BAG_RECORDER_DIR, experiment.lstrip('/'))
    # make sure target directory exists
    subprocess.run(["mkdir", "-p", destination_dir])
    bag_name = datetime.datetime.now().isoformat().replace(':', '_').split('.')[0]
    bag_path = os.path.abspath(os.path.join(destination_dir, f"{bag_name}.bag"))

    # compile command
    cmd = [
        "rosbag",
        "record",
        # this means infinite buffer size
        "--buffsize=0",
        f"--output-name={bag_path}",
        f"--duration={BAG_RECORDER_MAX_DURATION_SECS}",
    ] + topics
    # launch recorder
    proc = subprocess.Popen(
        cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, preexec_fn=os.setpgrp)
    # store Bag recorder info
    bag = ROSBag(
        ROSBag.Recorder(proc, proc.pid, os.getpgid(proc.pid)),
        bag_path,
        ROSBag.Status.RECORDING
    )
    # store bag handler
    shelf[bag_name] = bag
    # return current API rosbag
    return response_ok({
        'name': bag_name,
        'local': bag_path,
        'cmd': cmd
    })


def _is_only_initialized(bag):
    return not os.path.isfile(f"{bag.path}") and not os.path.isfile(f"{bag.path}.active")


def _is_running(bag):
    return bag.recorder.process.poll() is None


def _is_postprocessing(bag):
    return os.path.isfile(f"{bag.path}.active")


def _is_ready(bag):
    return os.path.isfile(f"{bag.path}") and not os.path.isfile(f"{bag.path}.active")


@rosbag.route('/bag/record/status/<string:bag_name>')
def _rosbag_status(bag_name: str):
    bag = shelf.get(bag_name, None)
    if bag is None:
        return response_error(f"No bag with name `{bag_name}` is being recorded")
    # check if the files are there
    if _is_only_initialized(bag):
        bag.status = ROSBag.Status.INIT
    # check if the bag is being recorded
    elif _is_running(bag):
        bag.status = ROSBag.Status.RECORDING
    # check if the bag is being post-processed
    elif _is_postprocessing(bag):
        bag.status = ROSBag.Status.POSTPROCESSING
    # check if the bag is being post-processed
    elif _is_ready(bag):
        bag.status = ROSBag.Status.READY
    else:
        bag.status = ROSBag.Status.ERROR
    # extra data
    extra = {}
    if bag.status == ROSBag.Status.READY:
        bag_uri = os.path.relpath(bag.path, FILES_API_DIR)
        extra['url'] = f'http://{get_device_hostname()}.local/files/data/{bag_uri}'
    # return current API rosbag
    return response_ok({
        'name': bag_name,
        'status': bag.status.name,
        'local': bag.path,
        **extra
    })


@rosbag.route('/bag/record/stop/<string:bag_name>')
def _rosbag_stop(bag_name: str):
    bag = shelf.get(bag_name, None)
    if bag is None:
        return response_error(f"No bag with name `{bag_name}` is being recorded")
    # stop recording
    try:
        os.killpg(bag.recorder.pgid, signal.SIGINT)
    except ProcessLookupError:
        pass
    # wait for the bag to be completed
    while _is_running(bag):
        time.sleep(1)
    # return current API rosbag
    return response_ok({
        'name': bag_name
    })


@rosbag.route('/bag/delete/<string:bag_name>')
def _rosbag_delete(bag_name: str):
    bag: ROSBag = shelf.get(bag_name, None)
    if bag is None:
        return response_error(f"No bag with name `{bag_name}` is being recorded")
    # make sure the recording is over
    if not _is_ready(bag):
        return response_error(f"Bag is still recording")
    # delete recording
    try:
        os.remove(bag.path)
    except BaseException as e:
        return response_error(f"Error: {str(e)}")
    # return current API rosbag
    return response_ok({
        'name': bag_name
    })
