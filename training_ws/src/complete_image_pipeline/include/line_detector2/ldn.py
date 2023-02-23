import cv2
import numpy as np
from anti_instagram import AntiInstagram

import duckietown_code_utils as dtu
from cv_bridge import CvBridge
from duckietown_msgs.msg import Segment, SegmentList
from easy_algo import get_easy_algo_db
from easy_node import EasyNode
from .plotting import color_segment, drawLines


class LineDetectorNode2(EasyNode):
    def __init__(self):
        EasyNode.__init__(self, "line_detector2", "line_detector_node2")

        self.detector = None
        self.bridge = CvBridge()
        self.ai = AntiInstagram()
        self.active = True

        # Only be verbose every 10 cycles
        self.intermittent_interval = 100
        self.intermittent_counter = 0

    def on_parameters_changed(self, _first_time, updated):

        if "verbose" in updated:
            self.info(f"Verbose is now {self.config.verbose!r}")

        if "line_detector" in updated:
            db = get_easy_algo_db()
            self.detector = db.create_instance("line_detector", self.config.line_detector)

    def on_received_switch(self, context, switch_msg):
        self.active = switch_msg.data

    def on_received_transform(self, context, transform_msg):
        self.ai.shift = transform_msg.s[0:3]
        self.ai.scale = transform_msg.s[3:6]

        self.info("AntiInstagram transform received")

    def on_received_image(self, context, image_msg):
        if not self.active:
            return

        self.intermittent_counter += 1

        with context.phase("decoding"):
            # Decode from compressed image with OpenCV
            try:
                image_cv = dtu.bgr_from_jpg(image_msg.data)
            except ValueError as e:
                self.error(f"Could not decode image: {e}")
                return

        with context.phase("resizing"):
            # Resize and crop image
            hei_original, wid_original = image_cv.shape[0:2]

            if self.config.img_size[0] != hei_original or self.config.img_size[1] != wid_original:
                # image_cv = cv2.GaussianBlur(image_cv, (5,5), 2)
                image_cv = cv2.resize(
                    image_cv,
                    (self.config.img_size[1], self.config.img_size[0]),
                    interpolation=cv2.INTER_NEAREST,
                )
            image_cv = image_cv[self.config.top_cutoff :, :, :]

        with context.phase("correcting"):
            # apply color correction
            image_cv_corr = self.ai.applyTransform(image_cv)
        #             image_cv_corr = cv2.convertScaleAbs(image_cv_corr)

        with context.phase("detection"):
            # Set the image to be detected
            self.detector.setImage(image_cv_corr)

            # Detect lines and normals
            white = self.detector.detectLines("white")
            yellow = self.detector.detectLines("yellow")
            red = self.detector.detectLines("red")

        with context.phase("preparing-images"):
            # SegmentList constructor
            segmentList = SegmentList()
            segmentList.header.stamp = image_msg.header.stamp

            # Convert to normalized pixel coordinates, and add segments to segmentList
            top_cutoff = self.config.top_cutoff
            s0, s1 = self.config.img_size[0], self.config.img_size[1]

            arr_cutoff = np.array((0, top_cutoff, 0, top_cutoff))
            arr_ratio = np.array((1.0 / s1, 1.0 / s0, 1.0 / s1, 1.0 / s0))
            if len(white.lines) > 0:
                lines_normalized_white = (white.lines + arr_cutoff) * arr_ratio
                segmentList.segments.extend(
                    toSegmentMsg(lines_normalized_white, white.normals, Segment.WHITE)
                )
            if len(yellow.lines) > 0:
                lines_normalized_yellow = (yellow.lines + arr_cutoff) * arr_ratio
                segmentList.segments.extend(
                    toSegmentMsg(lines_normalized_yellow, yellow.normals, Segment.YELLOW)
                )
            if len(red.lines) > 0:
                lines_normalized_red = (red.lines + arr_cutoff) * arr_ratio
                segmentList.segments.extend(toSegmentMsg(lines_normalized_red, red.normals, Segment.RED))

            self.intermittent_log(
                "# segments: white %3d yellow %3d red %3d"
                % (len(white.lines), len(yellow.lines), len(red.lines))
            )

        # Publish segmentList
        with context.phase("publishing"):
            self.publishers.segment_list.publish(segmentList)

        # VISUALIZATION only below

        if self.config.verbose:
            with context.phase("draw-lines"):
                # Draw lines and normals
                image_with_lines = np.copy(image_cv_corr)
                drawLines(image_with_lines, white.lines, (0, 0, 0))
                drawLines(image_with_lines, yellow.lines, (255, 0, 0))
                drawLines(image_with_lines, red.lines, (0, 255, 0))

            with context.phase("published-images"):
                # Publish the frame with lines
                out = dru.d8n_image_msg_from_cv_image(image_with_lines, "bgr8", same_timestamp_as=image_msg)
                self.publishers.image_with_lines.publish(out)

            with context.phase("pub_edge/pub_segment"):
                out = dru.d8n_image_msg_from_cv_image(
                    self.detector.edges, "mono8", same_timestamp_as=image_msg
                )
                self.publishers.edge.publish(out)

                colorSegment = color_segment(white.area, red.area, yellow.area)
                out = dru.d8n_image_msg_from_cv_image(colorSegment, "bgr8", same_timestamp_as=image_msg)
                self.publishers.color_segment.publish(out)

        if self.intermittent_log_now():
            self.info("stats from easy_node\n" + dtu.indent(context.get_stats(), "> "))

    def intermittent_log_now(self):
        return self.intermittent_counter % self.intermittent_interval == 1

    def intermittent_log(self, s):
        if not self.intermittent_log_now():
            return
        self.info(f"{self.intermittent_counter:3d}:{s}")


def toSegmentMsg(lines, normals, color):
    segmentMsgList = []
    for x1, y1, x2, y2, norm_x, norm_y in np.hstack((lines, normals)):
        segment = Segment()
        segment.color = color
        segment.pixels_normalized[0].x = x1
        segment.pixels_normalized[0].y = y1
        segment.pixels_normalized[1].x = x2
        segment.pixels_normalized[1].y = y2
        segment.normal.x = norm_x
        segment.normal.y = norm_y
        segmentMsgList.append(segment)
    return segmentMsgList
