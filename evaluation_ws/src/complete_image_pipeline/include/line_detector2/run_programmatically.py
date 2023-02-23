import duckietown_code_utils as dtu
import duckietown_rosbag_utils as dbu
import duckietown_rosdata_utils as dru
from easy_algo import get_easy_algo_db
from easy_node.utils.timing import FakeContext
from easy_regression import ProcessorInterface, ProcessorUtilsInterface
from line_detector_interface import FAMILY_LINE_DETECTOR
from line_detector_interface.visual_state_fancy_display import vs_fancy_display


class LineDetectorProcessor(ProcessorInterface):
    def __init__(self, image_prep: str, line_detector: str):
        self.image_prep = image_prep
        self.line_detector = line_detector

    def process_log(self, bag_in, prefix: str, bag_out, prefix_out: str, utils: ProcessorUtilsInterface):
        algo_db = get_easy_algo_db()
        line_detector = algo_db.create_instance(FAMILY_LINE_DETECTOR, self.line_detector)
        image_prep = algo_db.create_instance("image_prep", self.image_prep)

        vehicle = dbu.which_robot(bag_in)
        topic = f"/{vehicle}/camera_node/image/compressed"
        context = FakeContext()
        transform = None
        frame = 0
        for compressed_img_msg in dbu.d8n_bag_read_with_progress(bag_in, topic):

            with context.phase("decoding"):
                try:
                    image_cv = dtu.bgr_from_jpg(compressed_img_msg.data)
                except ValueError as e:
                    msg = f"Could not decode image: {e}"
                    dtu.raise_wrapped(ValueError, e, msg)

            segment_list = image_prep.process(context, image_cv, line_detector, transform)

            rendered = vs_fancy_display(image_prep.image_cv, segment_list)
            rendered = dtu.d8_image_zoom_linear(rendered, 2)
            log_name = "log_name"
            time = 12
            rendered = dtu.add_duckietown_header(rendered, log_name, time, frame)
            out = dru.d8n_image_msg_from_cv_image(rendered, "bgr8", same_timestamp_as=compressed_img_msg)

            # Write to the bag
            bag_out.write("processed", out)

            # out = d8n_image_msg_from_cv_image(image_cv, "bgr8", same_timestamp_as=compressed_img_msg)
            bag_out.write("image", compressed_img_msg)

            frame += 1
