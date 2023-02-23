import os

from quickapp import QuickApp

import duckietown_code_utils as dtu
import duckietown_rosbag_utils as dbu
import rosbag
from easy_logs import get_local_bag_file
from easy_logs.app_with_logs import D8AppWithLogs
from image_processing.more_utils import get_robot_camera_geometry_from_log
from .pipeline import run_pipeline

__all__ = [
    "SingleImagePipelineLog",
]


class SingleImagePipelineLog(D8AppWithLogs, QuickApp):
    """
    Runs the vision pipeline on the first image in a log.
    """

    cmd = "rosrun complete_image_pipeline single_image_pipeline_log"

    def define_options(self, params):
        g = "Pipeline"
        params.add_string("anti_instagram", default="baseline", help="Which anti_instagram to use", group=g)
        params.add_string("line_detector", default="baseline", help="Which line detector to use", group=g)
        params.add_string("image_prep", default="baseline", help="Which image prep to use", group=g)
        params.add_string("lane_filter", default="baseline", help="Which lane filter to use", group=g)

        params.add_flag("details")

        params.accept_extra()

    def define_jobs_context(self, context):
        db = self.get_easy_logs_db()

        extra = self.options.get_extra()
        if len(extra) == 0:
            query = "*"
        else:
            query = extra
        logs = db.query(query)
        output = self.options["output"]
        line_detector = self.options["line_detector"]
        image_prep = self.options["image_prep"]
        lane_filter = self.options["lane_filter"]
        anti_instagram = self.options["anti_instagram"]
        all_details = self.options["details"]

        self.info(f"anti_instagram: {anti_instagram}")
        self.info(f"image_prep: {image_prep}")
        self.info(f"line_detector: {line_detector}")
        self.info(f"lane_filter: {lane_filter}")

        for k, log in list(logs.items()):
            d = os.path.join(output, k)
            context.comp(look_at, log, d, anti_instagram, line_detector, image_prep, lane_filter, all_details)


def look_at(
    log,
    output: str,
    anti_instagram: str,
    line_detector: str,
    image_prep: str,
    lane_filter: str,
    all_details: bool,
) -> None:
    filename = get_local_bag_file(log)

    bag = rosbag.Bag(filename)

    vehicle_name = dbu.which_robot(bag)

    dtu.logger.info(f"Vehicle name: {vehicle_name}")

    brp = dbu.BagReadProxy(bag)
    rcg = get_robot_camera_geometry_from_log(brp)

    topic = dbu.get_image_topic(bag)
    res = dbu.d8n_read_all_images_from_bag(bag, topic, max_images=1)

    image_cv = res[0]["rgb"]

    #     dtu.logger.debug(dtu.describe_value(image_cv))

    image_cv_bgr = dtu.bgr_from_rgb(image_cv)

    dtu.DuckietownConstants.show_timeit_benchmarks = True
    res, _stats = run_pipeline(
        image_cv_bgr,
        gpg=rcg.gpg,
        rectifier=rcg.rectifier,
        anti_instagram_name=anti_instagram,
        line_detector_name=line_detector,
        image_prep_name=image_prep,
        lane_filter_name=lane_filter,
        all_details=all_details,
    )

    res = dtu.resize_small_images(res)

    dtu.write_bgr_images_as_jpgs(res, output)
