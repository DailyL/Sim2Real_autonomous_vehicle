import cv2
import numpy as np

from duckietown_msgs.msg import Segment, SegmentList
from .fuzzing import fuzzy_segment_list_image_space
from .ldn import toSegmentMsg


class ImagePrep:
    FAMILY = "image_prep"

    def __init__(self, shape, top_cutoff, resampling_algorithm, fuzzy_mult=None, fuzzy_noise=None):
        self.shape = shape
        self.top_cutoff = top_cutoff
        self.fuzzy_mult = fuzzy_mult
        self.fuzzy_noise = fuzzy_noise
        self.resampling_algorithm = resampling_algorithm
        allowed = ["nearest", "linear"]
        if not resampling_algorithm in allowed:
            msg = f"Good values for resampling_algorithm: {allowed}, not {resampling_algorithm!r}."
            raise ValueError(msg)

    def process(self, context, image_cv, line_detector, transform):
        """Returns SegmentList"""

        shape = image_cv.shape
        if len(shape) != 3:
            msg = f"Expected shape with 3 elements, got {shape.__repr__()}"
            raise ValueError(msg)

        self.image_cv = image_cv
        with context.phase(f"resizing (method: {self.resampling_algorithm})"):
            # Resize and crop image
            h0, w0 = image_cv.shape[0:2]
            h1, w1 = self.shape

            if (h0, w0) != (h1, w1):
                # image_cv = cv2.GaussianBlur(image_cv, (5,5), 2)
                if self.resampling_algorithm == "nearest":
                    interpolation = cv2.INTER_NEAREST
                elif self.resampling_algorithm == "linear":
                    interpolation = cv2.INTER_LINEAR
                else:
                    raise NotImplementedError(self.resampling_algorithm)

                self.image_resized = cv2.resize(image_cv, (w1, h1), interpolation=interpolation)

            else:
                self.image_resized = image_cv

            self.image_cut = self.image_resized[self.top_cutoff :, :, :]

        with context.phase("correcting"):
            # apply color correction: AntiInstagram
            if transform is not None:
                self.image_corrected = transform(self.image_cut)
                # XXX
            #                 self.image_corrected = cv2.convertScaleAbs(_)
            else:
                self.image_corrected = self.image_cut

        with context.phase("detection"):
            # Set the image to be detected

            with context.phase("setImage"):
                line_detector.setImage(self.image_corrected)

            # Detect lines and normals
            with context.phase("white"):
                white = line_detector.detectLines("white")
            with context.phase("yellow"):
                yellow = line_detector.detectLines("yellow")

            with context.phase("red"):
                red = line_detector.detectLines("red")

            with context.phase("get_segment_list_normalized"):
                segment_list = get_segment_list_normalized(self.top_cutoff, self.shape, white, yellow, red)

        # SegmentList constructor
        if self.fuzzy_mult is not None:
            segment_list2 = fuzzy_segment_list_image_space(
                segment_list, n=self.fuzzy_mult, intensity=self.fuzzy_noise
            )
            return segment_list2
        else:
            return segment_list


def get_segment_list_normalized(top_cutoff, shape, white, yellow, red):
    segmentList = SegmentList()

    # Convert to normalized pixel coordinates, and add segments to segmentList
    s0, s1 = shape
    arr_cutoff = np.array((0, top_cutoff, 0, top_cutoff))
    arr_ratio = np.array((1.0 / s1, 1.0 / s0, 1.0 / s1, 1.0 / s0))

    if len(white.lines) > 0:
        lines_normalized_white = (white.lines + arr_cutoff) * arr_ratio
        segmentList.segments.extend(toSegmentMsg(lines_normalized_white, white.normals, Segment.WHITE))

    if len(yellow.lines) > 0:
        lines_normalized_yellow = (yellow.lines + arr_cutoff) * arr_ratio
        segmentList.segments.extend(toSegmentMsg(lines_normalized_yellow, yellow.normals, Segment.YELLOW))

    if len(red.lines) > 0:
        lines_normalized_red = (red.lines + arr_cutoff) * arr_ratio
        segmentList.segments.extend(toSegmentMsg(lines_normalized_red, red.normals, Segment.RED))

    return segmentList
