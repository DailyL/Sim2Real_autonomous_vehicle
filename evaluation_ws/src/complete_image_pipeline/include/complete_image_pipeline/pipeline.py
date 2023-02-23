from typing import Dict, Tuple

import cv2
import matplotlib
import numpy as np

import duckietown_code_utils as dtu
from anti_instagram import AntiInstagramInterface
from duckietown_msgs.msg import Segment, SegmentList
from duckietown_segmaps import FRAME_AXLE, FRAME_GLOBAL
from duckietown_segmaps.draw_map_on_images import plot_map, predict_segments
from duckietown_segmaps.maps import plot_map_and_segments
from duckietown_segmaps.transformations import TransformationsInfo
from easy_algo import get_easy_algo_db
from easy_node.utils.timing import FakeContext, ProcessingTimingStats
from ground_projection.ground_projection_interface import find_ground_coordinates
from ground_projection.segment import rectify_segments
from image_processing.ground_projection_geometry import GroundProjectionGeometry
from image_processing.rectification import Rectify
from lane_filter import FAMILY_LANE_FILTER
from lane_filter_generic import LaneFilterMoreGeneric
from line_detector2.image_prep import ImagePrep
from line_detector_interface import FAMILY_LINE_DETECTOR
from line_detector_interface.visual_state_fancy_display import normalized_to_image, vs_fancy_display
from localization_templates import FAMILY_LOC_TEMPLATES

logger = dtu.logger


@dtu.contract(ground_truth="SE2|None", image="array[HxWx3](uint8)")
def run_pipeline(
    image: dtu.NPImageBGR,
    gpg: GroundProjectionGeometry,
    rectifier: Rectify,
    line_detector_name: str,
    image_prep_name: str,
    lane_filter_name: str,
    anti_instagram_name: str,
    all_details: bool = False,
    ground_truth=None,
    actual_map=None,
) -> Tuple[Dict[str, dtu.NPImageBGR], Dict[str, float]]:
    """
    Image: numpy (H,W,3) == BGR
    Returns a dictionary, res with the following fields:

        res['input_image']

    ground_truth = pose
    """

    logger.debug(f"backend: {matplotlib.get_backend()}")
    logger.debug(f"fname: {matplotlib.matplotlib_fname()}")

    quick: bool = False

    dtu.check_isinstance(image, np.ndarray)

    res: Dict[str, dtu.NPImageBGR] = {}
    stats = {}

    res["Raw input image"] = image
    algo_db = get_easy_algo_db()
    line_detector = algo_db.create_instance(FAMILY_LINE_DETECTOR, line_detector_name)
    lane_filter = algo_db.create_instance(FAMILY_LANE_FILTER, lane_filter_name)
    image_prep = algo_db.create_instance(ImagePrep.FAMILY, image_prep_name)
    ai = algo_db.create_instance(AntiInstagramInterface.FAMILY, anti_instagram_name)

    pts = ProcessingTimingStats()
    pts.reset()
    pts.received_message()
    pts.decided_to_process()

    if all_details:
        segment_list = image_prep.process(FakeContext(), image, line_detector, transform=None)

        res["segments_on_image_input"] = vs_fancy_display(image_prep.image_cv, segment_list)
        res["segments_on_image_resized"] = vs_fancy_display(image_prep.image_resized, segment_list)

    with pts.phase("calculate AI transform"):
        ai.calculateTransform(image)

    with pts.phase("apply AI transform"):

        transformed = ai.applyTransform(image)

        if all_details:
            res["image_input_transformed"] = transformed

    with pts.phase("edge detection"):
        # note: do not apply transform twice!
        segment_list2 = image_prep.process(pts, image, line_detector, transform=ai.applyTransform)

        if all_details:
            res["resized and corrected"] = image_prep.image_corrected

    logger.debug(f"segment_list2: {len(segment_list2.segments)}")

    if all_details:
        res["segments_on_image_input_transformed"] = vs_fancy_display(image_prep.image_cv, segment_list2)

    if all_details:
        res["segments_on_image_input_transformed_resized"] = vs_fancy_display(
            image_prep.image_resized, segment_list2
        )

    if all_details:
        grid = get_grid(image.shape[:2])
        res["grid"] = grid
        res["grid_remapped"] = rectifier.rectify(grid)

    #     res['difference between the two'] = res['image_input']*0.5 + res['image_input_rect']*0.5

    with pts.phase("rectify_segments"):
        segment_list2_rect = rectify_segments(rectifier, gpg, segment_list2)

    # Project to ground
    with pts.phase("find_ground_coordinates"):
        sg = find_ground_coordinates(gpg, segment_list2_rect)

    lane_filter.initialize()

    # lane_filter.get_plot_phi_d()
    if all_details:
        res["prior"] = lane_filter.get_plot_phi_d()

    with pts.phase("lane filter update"):
        logger.info(type(lane_filter).__name__)
        if type(lane_filter).__name__ == "LaneFilterHistogram":
            # XXX merging pain
            _likelihood = lane_filter.update(sg.segments)
        else:
            _likelihood = lane_filter.update(sg)

    if not quick:
        with pts.phase("lane filter plot"):
            res["likelihood"] = lane_filter.get_plot_phi_d(ground_truth=ground_truth)
    easy_algo_db = get_easy_algo_db()

    if isinstance(lane_filter, LaneFilterMoreGeneric):
        template_name = lane_filter.localization_template
    else:
        template_name = "DT17_template_straight_straight"
        dtu.logger.debug(f"Using default template {template_name!r} for visualization")

    localization_template = easy_algo_db.create_instance(FAMILY_LOC_TEMPLATES, template_name)

    with pts.phase("lane filter get_estimate()"):
        est = lane_filter.get_estimate()

    # Coordinates in TILE frame
    g = localization_template.pose_from_coords(est)
    tinfo = TransformationsInfo()
    tinfo.add_transformation(frame1=FRAME_GLOBAL, frame2=FRAME_AXLE, g=g)

    if all_details:
        if actual_map is not None:
            #         sm_axle = tinfo.transform_map_to_frame(actual_map, FRAME_AXLE)
            res["real"] = plot_map_and_segments(
                actual_map, tinfo, sg.segments, dpi=120, ground_truth=ground_truth
            )

    with pts.phase("rectify"):
        rectified0 = rectifier.rectify(image)

    rectified = ai.applyTransform(rectified0)

    if all_details:
        res["image_input_rect"] = rectified

    res["segments rectified on image rectified"] = vs_fancy_display(rectified, segment_list2_rect)

    assumed = localization_template.get_map()

    if not quick:
        with pts.phase("plot_map_and_segments"):
            res["model assumed for localization"] = plot_map_and_segments(
                assumed, tinfo, sg.segments, dpi=120, ground_truth=ground_truth
            )

    assumed_axle = tinfo.transform_map_to_frame(assumed, FRAME_AXLE)

    with pts.phase("plot_map reprojected"):
        res["map reprojected on image"] = plot_map(
            rectified,
            assumed_axle,
            gpg,
            do_ground=False,
            do_horizon=True,
            do_faces=False,
            do_faces_outline=True,
            do_segments=False,
        )

    with pts.phase("quality computation"):
        predicted_segment_list_rectified = predict_segments(sm=assumed_axle, gpg=gpg)
        quality_res, quality_stats = judge_quality(
            image, segment_list2_rect, predicted_segment_list_rectified
        )
        res.update(quality_res)

    #     res['blurred']= cv2.medianBlur(image, 11)
    stats["estimate"] = est
    stats.update(quality_stats)

    dtu.logger.info(pts.get_stats())
    return res, stats


def judge_quality(image: dtu.NPImageBGR, observed_segment_list, predicted_segment_list):
    res = {}
    stats = {}

    #     mask2gray = lambda x: (x * 255).clip(0, 255).astype('uint8')
    H, W, _ = image.shape
    r = 1
    reason_shape = (H * r, W * r, 3)
    observed_width = int(14 * r)
    predicted_width = int(50 * r)

    summary_bgr = np.zeros(reason_shape, "uint8")

    ratios = []
    for color in [
        Segment.WHITE,
        Segment.YELLOW,
        Segment.RED,
    ]:
        predicted = only_one_color(predicted_segment_list, color)
        predicted_mask = np.zeros(reason_shape[0:2], "float32")
        _draw_segment_list_on_image(predicted_mask, segment_list=predicted, width=predicted_width)

        predicted_mask = np.sign(predicted_mask) * 255

        observed = only_one_color(observed_segment_list, color)
        observed_mask = np.zeros(reason_shape[0:2], "float32")
        _draw_segment_list_on_image(observed_mask, segment_list=observed, width=observed_width)
        observed_mask = np.sign(observed_mask)

        explained = np.sign(observed_mask * predicted_mask)
        not_explained = observed_mask - explained

        _B, G, R = 0, 1, 2
        summary_bgr[:, :, R] |= (not_explained * 255).astype("uint8")
        summary_bgr[:, :, G] |= (explained * 255).astype("uint8")

        ratio_explained = 1 - (np.sum(not_explained) / (np.sum(explained) + np.sum(not_explained) + 1))
        ratios.append(ratio_explained)
    #         res['predicted %s' % color] = mask2gray(predicted_mask)
    #         res['observed %s' % color] = mask2gray(observed_mask)
    #         res['explained %s = %d%%' % (color, ratio_explained*100)] = mask2gray(explained)

    avg = np.mean(ratios)

    percent = lambda x: f"{int(x * 100)}%"
    s = f"W {percent(ratios[0])} Y {percent(ratios[1])} R {percent(ratios[2])}"
    res[f"explained {percent(avg)} [{s}]"] = summary_bgr

    stats["quality"] = avg
    stats["ratios"] = ratios
    return res, stats


def _draw_segment_list_on_image(mask, segment_list, width):
    shape = mask.shape[:2]

    for segment in segment_list.segments:
        p1 = segment.pixels_normalized[0]
        p2 = segment.pixels_normalized[1]

        P1 = normalized_to_image(p1, shape)
        P2 = normalized_to_image(p2, shape)

        paint = 255

        cv2.line(mask, P1, P2, paint, width)


@dtu.contract(segment_list=SegmentList, color=int, returns=SegmentList)
def only_one_color(segment_list, color):
    segments = [s for s in segment_list.segments if s.color == color]
    return SegmentList(segments=segments)


def get_grid(shape, L=32, col=None):
    """Creates a grid of given shape"""
    if col is None:
        col = {0: (255, 0, 0), 1: (0, 255, 0)}
    H, W = shape
    res = np.zeros((H, W, 3), "uint8")
    for i in range(H):
        for j in range(W):
            cx = int(i / L)
            cy = int(j / L)
            coli = (cx + cy) % 2
            res[i, j, :] = col[coli]
    return res
