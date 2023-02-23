from duckietown_msgs.msg import Segment, SegmentList
from image_processing.ground_projection_geometry import GroundProjectionGeometry, ImageSpaceResdepPoint
from image_processing.rectification import Rectify

__all__ = ["rectify_segments", "rectify_segment"]


def rectify_segment(rectify: Rectify, gpg: GroundProjectionGeometry, s1: Segment) -> Segment:
    pixels_normalized = []

    for i in (0, 1):
        # normalized coordinates
        nc = s1.pixels_normalized[i]
        # get pixel coordinates
        pixels = gpg.vector2pixel(nc)
        # rectify
        pr = rectify.rectify_point(pixels)
        # recompute normalized coordinates
        # t = Pixel(pr[0], pr[1])
        v = gpg.pixel2vector(ImageSpaceResdepPoint(pr))
        pixels_normalized.append(v)

    s2 = Segment(color=s1.color, pixels_normalized=pixels_normalized)
    return s2


def rectify_segments(
    rectify: Rectify, gpg: GroundProjectionGeometry, segment_list: SegmentList
) -> SegmentList:
    res = []

    for segment in segment_list.segments:
        s2 = rectify_segment(rectify, gpg, segment)
        res.append(s2)

    return SegmentList(segments=res)
