import os
from typing import cast

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
from duckietown_code_utils.cli import D8App
from .pipeline import run_pipeline

__all__ = [
    "SingleImagePipeline",
]


class SingleImagePipeline(D8App):
    """
    Runs the vision pipeline on a single image.
    """

    cmd = "rosrun complete_image_pipeline single_image_pipeline"

    def define_program_options(self, params):
        g = "Input/output"
        params.add_string("image", help="Image to use.", group=g, default=None)
        params.add_string("output", default=None, short="-o", help="Output directory", group=g)

    def go(self):
        vehicle_name = dtu.get_current_robot_name()

        # noinspection PyUnresolvedReferences
        output = self.options.output
        if output is None:
            output = "out/pipeline"  # + dtu.get_md5(self.options.image)[:6]
            self.info(f"No --output given, using {output}")

        # noinspection PyUnresolvedReferences
        opt_image = self.options.image
        if opt_image is not None:
            image_filename = opt_image
            if image_filename.startswith("http"):
                image_filename = dtu.get_file_from_url(image_filename)

            bgr = dtu.bgr_from_jpg_fn(image_filename)
        else:
            self.info("Validating using the ROS image stream...")
            import rospy
            from sensor_msgs.msg import CompressedImage

            topic_name = os.path.join("/", vehicle_name, "camera_node/image/compressed")

            self.info("Let's wait for an image. Say cheese!")

            # Dummy to get ROS message
            rospy.init_node("single_image")

            try:
                img_msg = cast(
                    CompressedImage, rospy.wait_for_message(topic_name, CompressedImage, timeout=10)
                )
                self.info("Image captured")
            except rospy.ROSException as e:
                self.info(
                    f"\n\n\nDidn't get any message: {e}\n MAKE SURE YOU USE DT SHELL COMMANDS OF VERSION "
                    "4.1.9 OR HIGHER!\n\n\n"
                )
                raise

            bgr = dtu.bgr_from_rgb(dru.rgb_from_ros(img_msg))
            self.info(f"Picture taken: {str(bgr.shape)} ")

        dtu.DuckietownConstants.show_timeit_benchmarks = True
        res, _stats = run_pipeline(bgr)

        self.info("Resizing images..")
        res = dtu.resize_small_images(res)
        self.info("Writing images..")
        dtu.write_bgr_images_as_jpgs(res, output)
