from typing import List, Tuple

import cv2
import numpy as np
from numpy.testing.utils import assert_almost_equal

import duckietown_code_utils as dtu
from duckietown_msgs.msg import Segment, SegmentList, Vector2D
from image_processing.ground_projection_geometry import GroundPoint, GroundProjectionGeometry, Point
from .maps import SegmentsMap
from .transformations import FRAME_AXLE


def rotate(l: List, n: int) -> List:
    return l[n:] + l[:n]


def get_points_rect_coords(coords0: List, N, d):
    """Returns a list of world coordinates

    coords0 : list
    """
    n = len(coords0)
    points = list(range(n))

    def is_behind(i):
        w = coords0[i]
        behind = np.dot(N, w) + d < 0
        return behind

    # first check that not all are behind
    b = [is_behind(_) for _ in range(n)]

    if all(b):
        return []

    # there is at least one not behind
    while is_behind(points[0]):
        points = rotate(points, 1)

    assert not is_behind(points[0])
    # do the first one
    points.append(points[0])
    # now walk each point
    coords = []
    for i, id_point in enumerate(points):
        w = coords0[id_point]
        if i == 0:
            # assume the first one is not behind
            assert not is_behind(id_point)
            # print('%d: put first of course' % i)
            coords.append(w)
        else:
            previous = coords0[points[i - 1]]

            if is_behind(id_point):
                if is_behind(points[i - 1]):
                    # both outside just ignore
                    # print('%d: this and previous outside: add 1' % i)
                    pass
                else:
                    # this outside, previous was not
                    (
                        w_cut,
                        _,
                    ) = clip_to_plane(w, previous, N, d)
                    coords.append(w_cut)

                    # print('%d: this outside, previous was not: add 1' % i)
            else:  # not behind
                if is_behind(points[i - 1]):
                    # previous outside, this not
                    previous_cut, w = clip_to_plane(previous, w, N, d)
                    coords.append(previous_cut)
                    coords.append(w)
                    # print('%d: previous outside, this not: add 2' % i)
                else:
                    # previous inside, this also: normal
                    # print('%d: previous and this inside: add 1' % i)
                    coords.append(w)
    return coords[:-1]


def clip_to_view(coords, x_frustum, fov):
    theta1 = np.pi / 2 - fov / 2
    theta2 = -theta1

    planes = [
        (np.array([1, 0, 0]), -x_frustum),
        (np.array([np.cos(theta1), np.sin(theta1), 0]), 0),
        (np.array([np.cos(theta2), np.sin(theta2), 0]), 0),
        # (np.array([0,-1,0]), D), # y > - d
        # (np.array([0,+1,0]), D), # y < d
    ]

    for n_, d_ in planes:
        coords = get_points_rect_coords(coords, n_, d_)
        if not coords:
            # all outside
            return []
    return coords


def paint_polygon_world(
    base: dtu.NPImageBGR,
    coords,
    gpg: GroundProjectionGeometry,
    color,
    x_frustum,
    fov,
    do_faces_fill,
    do_faces_outline: bool,
):
    coords_inside = clip_to_view(coords, x_frustum, fov)
    if not coords_inside:
        return

    shift = 8
    S = 2 ** shift

    def pixel_from_world(c):
        p = gpg.ground2pixel(GroundPoint(Point(c[0], c[1], c[2])))
        return (int(p.x * S), int(p.y * S))  # not sure

    cv_points = np.array(list(map(pixel_from_world, coords_inside)), dtype="int32")
    #     cv2.fillConvexPoly(base, cv_points, color, shift=shift, lineType=AA)

    if do_faces_fill:
        cv2.fillPoly(base, [cv_points], color, shift=shift, lineType=AA)
    if do_faces_outline:
        cv2.polylines(base, [cv_points], True, (0, 0, 0), shift=shift, lineType=AA, thickness=3)
        cv2.polylines(base, [cv_points], True, color, shift=shift, lineType=AA, thickness=2)


def get_horizon_points(gpg: GroundProjectionGeometry, shift: int):
    x = +1000
    y = x * 3  # enough for field of view

    p_left = gpg.ground2pixel(GroundPoint(Point(x, y, 0)))

    p_right = gpg.ground2pixel(GroundPoint(Point(x, -y, 0)))

    S = 2 ** shift
    # XXX
    return (int(p_left.x * S), int(p_left.y * S)), (int(p_right.x * S), int(p_right.y * S))


def plot_ground_sky(base: dtu.NPImageBGR, gpg: GroundProjectionGeometry, color_ground, color_sky):
    # XXX: there is a bug somewhere here for shift != 0
    shift = 0
    S = 2 ** shift
    H, W = base.shape[:2]
    p1, p2 = get_horizon_points(gpg, shift)

    points = np.array([p1, (0, 0), (W * S, 0), p2], dtype="int32")
    cv2.fillPoly(base, [points], color_sky, lineType=AA)
    points2 = np.array([p1, (0, H * S), (W * S, H * S), p2], dtype="int32")
    cv2.fillPoly(base, [points2], color_ground, lineType=AA)


AA = cv2.LINE_AA


def plot_horizon(base: dtu.NPImageBGR, gpg: GroundProjectionGeometry, color_horizon, width: int = 2):
    shift = 8  # FIXME just for testing
    p1, p2 = get_horizon_points(gpg, shift)

    cv2.line(base, p1, p2, color_horizon, width, shift=shift, lineType=AA)


def plot_map(
    base0: dtu.NPImageBGR,
    sm: SegmentsMap,
    gpg: GroundProjectionGeometry,
    do_ground: bool = True,
    do_faces: bool = True,
    do_faces_outline: bool = False,
    do_segments: bool = True,
    do_horizon: bool = True,
) -> dtu.NPImageBGR:
    """
    base: already rectified image

    sm= SegmentsMap in frame FRAME_AXLE
    """
    image = base0.copy()
    x_frustum = +0.1
    fov = np.deg2rad(150)

    if do_ground:
        color_ground = (30, 10, 22)

        color_sky = (244, 134, 66)
        plot_ground_sky(image, gpg, color_ground, color_sky)

    if do_horizon:
        color_horizon = (255, 140, 80)
        plot_horizon(image, gpg, color_horizon)

    if do_faces or do_faces_outline:
        for face in sm.faces:
            # list of arrays with cut stuff
            coords = [sm.points[_].coords for _ in face.points]

            color = dtu.bgr_color_from_string(face.color)
            # don't do outline for black
            if face.color == "black":
                do_outline = False
            else:
                do_outline = do_faces_outline
            paint_polygon_world(
                image, coords, gpg, color, x_frustum, fov, do_faces_outline=do_outline, do_faces_fill=do_faces
            )

    if do_segments:
        for segment in sm.segments:
            p1 = segment.points[0]
            p2 = segment.points[1]

            # If we are both in FRAME_AXLE
            if (sm.points[p1].id_frame != FRAME_AXLE) or (sm.points[p2].id_frame != FRAME_AXLE):
                msg = "Cannot deal with points not in frame FRAME_AXLE"
                raise NotImplementedError(msg)

            w1 = sm.points[p1].coords
            w2 = sm.points[p2].coords

            coords_inside = clip_to_view([w1, w2], x_frustum, fov)

            if not coords_inside:
                continue

            #             print('coords_inside: %s' % coords_inside)
            w1 = coords_inside[0]
            w2 = coords_inside[1]
            # XXX: more generated
            uv1 = gpg.ground2pixel(GroundPoint(Point(w1[0], w1[1], w1[2])))
            uv2 = gpg.ground2pixel(GroundPoint(Point(w2[0], w2[1], w2[2])))
            uv1 = gpg.vector2pixel(uv1)  # FIXME
            uv2 = gpg.vector2pixel(uv2)  # FIXME
            shift = 8
            S = 2 ** shift
            width = 2
            paint = (255, 120, 120)
            #         paint = BGR_WHITE
            ti = lambda a, b: (int(np.round(a * S)), int(np.round(b * S)))

            p1 = ti(uv1.x, uv1.y)  # XXX uv?
            p2 = ti(uv2.x, uv2.y)  # XXX uv?
            cv2.line(image, p1, p2, paint, width, shift=shift, lineType=AA)

    return image


@dtu.contract(w1="array[w]", w2="array[3]", x_frustum="float")
def clip_to_frustum(w1, w2, x_frustum, noswap=False):
    if not noswap:
        if w1[0] > x_frustum:
            return clip_to_frustum(w2, w1, x_frustum)

    # n*p + d = 0
    n = np.array([1, 0, 0])
    d = -x_frustum
    return clip_to_plane(w1, w2, n, d)


@dtu.contract(w1="array[3]", w2="array[3]")
def clip_to_plane(w1: np.ndarray, w2: np.ndarray, n: np.ndarray, d: float) -> Tuple[np.ndarray, np.ndarray]:
    """
    Assumes that w1 is outside. Returns w1_cut, w2

    n*p + d > 0 inside
    n*p + d = 0 plane
    n*p + d < 0 outside

    w1 is outside

    """

    def inside(p):
        x = np.dot(n, p) + d
        return x >= 0

    assert not inside(w1)
    assert inside(w2)
    direction = w2 - w1

    # intersection = w2 + alpha * direction
    # n* (w2 + alpha * dir) + d = 0
    # (n*w2) + alpha (n*dir) + d = 0
    #   alpha = (-d-(n*w2))/(n*dir)
    alpha = (-d - np.dot(n, w2)) / (np.dot(n, direction))
    intersection = w2 + alpha * direction

    dist = np.dot(n, intersection) + d
    assert_almost_equal(dist, 0)

    w1_ = intersection
    return w1_, w2


def predict_segments(sm: SegmentsMap, gpg: GroundProjectionGeometry) -> SegmentList:
    """
    Predicts what segments the robot would see.

    Assumes map is in FRAME_AXLE.
    """
    x_frustum = +0.1
    fov = np.deg2rad(150)
    res = []
    for segment in sm.segments:
        p1 = segment.points[0]
        p2 = segment.points[1]

        # If we are both in FRAME_AXLE
        if (sm.points[p1].id_frame != FRAME_AXLE) or (sm.points[p2].id_frame != FRAME_AXLE):
            msg = "Cannot deal with points not in frame FRAME_AXLE"
            raise NotImplementedError(msg)

        w1 = sm.points[p1].coords
        w2 = sm.points[p2].coords

        coords_inside = clip_to_view([w1, w2], x_frustum, fov)

        if not coords_inside:
            continue
        w1 = coords_inside[0]
        w2 = coords_inside[1]
        point1 = Point(w1[0], w1[1], w1[2])
        point2 = Point(w2[0], w2[1], w2[2])

        pixel1 = gpg.ground2pixel(GroundPoint(point1))
        pixel2 = gpg.ground2pixel(GroundPoint(point2))
        normalized1 = gpg.pixel2vector(pixel1)
        normalized2 = gpg.pixel2vector(pixel2)

        pixels_normalized = [normalized1, normalized2]
        normal = Vector2D(0, 0)  # XXX: compute normal
        points = [point1, point2]

        #         color = segment_color_constant_from_string(segment.color)
        assert segment.color in [Segment.RED, Segment.YELLOW, Segment.WHITE]
        s = Segment(pixels_normalized=pixels_normalized, normal=normal, points=points, color=segment.color)
        res.append(s)

    return SegmentList(segments=res)
