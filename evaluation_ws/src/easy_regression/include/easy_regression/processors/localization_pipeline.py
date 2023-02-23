import duckietown_code_utils as dtu
import duckietown_rosbag_utils as dbu
import duckietown_rosdata_utils as dru
import rospy
from complete_image_pipeline.pipeline import run_pipeline

from easy_regression import ProcessorInterface, ProcessorUtilsInterface
from image_processing.more_utils import get_robot_camera_geometry_from_log

__all__ = [
    "LocalizationPipelineProcessor",
]

logger = dtu.logger


class LocalizationPipelineProcessor(ProcessorInterface):
    line_detector: str
    image_prep: str
    lane_filter: str
    anti_instagram: str
    all_details: bool

    def __init__(self, line_detector: str, image_prep: str, lane_filter: str, anti_instagram: str):
        self.line_detector = line_detector
        self.image_prep = image_prep
        self.lane_filter = lane_filter
        self.anti_instagram = anti_instagram
        self.all_details = False

    def process_log(
        self,
        bag_in: dbu.BagReadProxy,
        prefix_in: str,
        bag_out,
        prefix_out: str,
        utils: ProcessorUtilsInterface,
    ):
        log_name = utils.get_log().log_name

        vehicle_name = dbu.which_robot(bag_in)

        logger.info(f"Vehicle name: {vehicle_name}")

        topic = dbu.get_image_topic(bag_in)

        rcg = get_robot_camera_geometry_from_log(bag_in)

        bgcolor = dtu.ColorConstants.BGR_DUCKIETOWN_YELLOW

        sequence = bag_in.read_messages_plus(topics=[topic])
        for _i, mp in enumerate(sequence):

            bgr = dtu.bgr_from_rgb(dru.rgb_from_ros(mp.msg))

            res, stats = run_pipeline(
                bgr,
                gpg=rcg.gpg,
                rectifier=rcg.rectifier,
                line_detector_name=self.line_detector,
                image_prep_name=self.image_prep,
                lane_filter_name=self.lane_filter,
                anti_instagram_name=self.anti_instagram,
                all_details=self.all_details,
            )

            rect = (480, 640) if not self.all_details else (240, 320)
            res = dtu.resize_images_to_fit_in_rect(res, rect, bgcolor=bgcolor)

            msg = (
                f"abs: {mp.time_absolute}  window: {mp.time_window}  from log: "
                f"{mp.time_from_physical_log_start}"
            )
            dtu.logger.info(msg)
            headers = [
                f"Robot: {vehicle_name} log: {log_name} time: {mp.time_from_physical_log_start:.2f} s",
                f"Algorithms | color correction: {self.anti_instagram} | preparation: {self.image_prep} | "
                f"detector: {self.line_detector} | filter: {self.lane_filter}",
            ]

            res = dtu.write_bgr_images_as_jpgs(res, dirname=None, bgcolor=bgcolor)

            cv_image = res["all"]

            for head in reversed(headers):
                max_height = 35
                cv_image = dtu.add_header_to_bgr(cv_image, head, max_height=max_height)

            otopic = "all"

            omsg = dru.d8_compressed_image_from_cv_image(cv_image, same_timestamp_as=mp.msg)
            t = rospy.Time.from_sec(mp.time_absolute)
            dtu.logger.info(f"written {otopic!r} at t = {t.to_sec()}")
            bag_out.write(prefix_out + "/" + otopic, omsg, t=t)

            for name, value in list(stats.items()):
                utils.write_stat(prefix_out + "/" + name, value, t=t)
