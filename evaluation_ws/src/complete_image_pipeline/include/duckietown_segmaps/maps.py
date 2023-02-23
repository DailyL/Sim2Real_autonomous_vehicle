from dataclasses import dataclass, replace
from typing import Dict, List, NewType, Optional

import numpy as np
from geometry import SE2value
from numpy.testing.utils import assert_almost_equal

import duckietown_code_utils as dtu
from .transformations import FRAME_AXLE, FRAME_GLOBAL, FrameName, TransformationsInfo

__all__ = [
    "SegMapSegment",
    "SegMapPoint",
    "SegMapFace",
    "FAMILY_SEGMAPS",
    "SegmentsMap",
    "PointName",
    "plot_map_and_segments",
    "get_normal_outward_for_segment",
]

PointName = NewType("PointName", str)


@dataclass
class SegMapPoint:
    id_frame: FrameName
    coords: np.ndarray


@dataclass
class SegMapSegment:
    points: List[PointName]
    color: dtu.ColorString


@dataclass
class SegMapFace:
    points: List[PointName]
    color: dtu.ColorString


FAMILY_SEGMAPS = FrameName("segmap")


class SegmentsMap:
    points: Dict[PointName, SegMapPoint]
    segments: List[SegMapSegment]
    faces: List[SegMapFace]

    def __init__(
        self,
        points: Dict[PointName, SegMapPoint],
        segments: List[SegMapSegment],
        faces: List[SegMapFace],
        constants: Optional[Dict[str, float]] = None,
    ):
        if constants is None:
            constants = {}
        self.points = points
        self.segments = segments
        self.faces = faces
        self.constants = constants
        self.validate()

    @staticmethod
    def empty():
        return SegmentsMap(points={}, segments=[], faces=[], constants={})

    def validate(self):
        for k, p in list(self.points.items()):
            dtu.check_isinstance(p, SegMapPoint)
            dtu.check_isinstance(k, str)

            coords = p.coords
            if not isinstance(coords, np.ndarray):
                self.points[k] = replace(p, coords=np.array(coords))

        for S in self.segments:
            dtu.check_isinstance(S, SegMapSegment)
            for p in S.points:
                if not p in self.points:
                    msg = f"Invalid point {p!r}"
                    raise ValueError(msg)
            assert len(S.points) == 2

            w1 = self.points[S.points[0]].coords
            w2 = self.points[S.points[1]].coords

            dist = np.linalg.norm(w1 - w2)
            if dist == 0:
                msg = f"This is a degenerate segment (points: {w1} {w2}) "
                msg += f"names: {S.points}"
                raise ValueError(msg)

        for F in self.faces:
            dtu.check_isinstance(F, SegMapFace)
            for p in F.points:
                if not p in self.points:
                    msg = f"Invalid point {p!r}"
                    raise ValueError(msg)

    @staticmethod
    def merge(sms: "List[SegmentsMap]") -> "SegmentsMap":
        points = {}
        segments = []
        faces = []
        constants = {}
        for i, sm in enumerate(sms):
            # first, make sure the names are different
            sm2 = add_prefix(sm, f"m{i}_")
            points.update(sm2.points)
            segments.extend(sm2.segments)
            faces.extend(sm2.faces)
            # XXX: what if conflict?
            constants.update(sm2.constants)

        return SegmentsMap(points=points, faces=faces, segments=segments, constants=constants)

    @staticmethod
    def from_yaml(data) -> "SegmentsMap":
        points = data["points"]
        faces = data["faces"]
        segments = data["segments"]

        points2 = {}
        for k, p in list(points.items()):
            points2[k] = SegMapPoint(id_frame=p[0], coords=np.array(p[1]))

        segments2 = []
        for S in segments:
            if not isinstance(S, SegMapSegment):
                S = SegMapSegment(points=S["points"], color=S["color"])
            segments2.append(S)

        faces2 = []
        for f in faces:
            F = SegMapFace(points=f["points"], color=f["color"])
            faces2.append(F)

        return SegmentsMap(points=points2, faces=faces2, segments=segments2)


def plot_map_and_segments(
    sm: SegmentsMap,
    tinfo: TransformationsInfo,
    segments: List[SegMapSegment],
    dpi: int = 120,
    ground_truth: Optional[SE2value] = None,
    bgcolor=dtu.ColorConstants.RGB_DUCKIETOWN_YELLOW,
):
    """Returns a BGR image"""
    figure_args = dict(facecolor=dtu.matplotlib_01_from_rgb(bgcolor))
    a = dtu.CreateImageFromPylab(dpi=dpi, figure_args=figure_args)

    with a as pylab:
        _plot_map_segments(sm, pylab, FRAME_GLOBAL)
        _plot_detected_segments(tinfo, segments, pylab)

        # draw arrow
        L = 0.1

        if ground_truth is not None:
            (x, y), _ = dtu.geo.translation_angle_from_SE2(ground_truth)
            x1, y1, _ = np.dot(ground_truth, [L, 0, 1])
            pylab.plot(x, y, "co", markersize=12)
            pylab.plot([x, x1], [y, y1], "c-", linewidth=4)

        w1 = tinfo.transform_point(np.array([0, 0, 0]), frame1=FRAME_AXLE, frame2=FRAME_GLOBAL)
        w2 = tinfo.transform_point(np.array([L, 0, 0]), frame1=FRAME_AXLE, frame2=FRAME_GLOBAL)

        pylab.plot([w1[0], w2[0]], [w1[1], w2[1]], "m-")
        pylab.plot(w1[0], w1[1], "mo", markersize=6)

        pylab.axis("equal")

    return a.get_bgr()


def _plot_detected_segments(tinfo: TransformationsInfo, segments: List[SegMapSegment], pylab):
    for segment in segments:
        p1 = segment.points[0]
        p2 = segment.points[1]

        f = lambda _: np.array([_.x, _.y, _.z])

        w1 = tinfo.transform_point(f(p1), frame1=FRAME_AXLE, frame2=FRAME_GLOBAL)
        w2 = tinfo.transform_point(f(p2), frame1=FRAME_AXLE, frame2=FRAME_GLOBAL)

        #         dtu.logger.debug('Plotting w1 %s w2 %s' % (w1, w2))
        pylab.plot([w1[0], w2[0]], [w1[1], w2[1]], "m-")

        p_hat = w1 * 0.5 + w2 * 0.5
        n_hat = get_normal_outward_for_segment(w2, w1)
        d = np.linalg.norm(w1 - w2)
        o = p_hat + d / 3 * n_hat

        pylab.plot([p_hat[0], o[0]], [p_hat[1], o[1]], "r-")


def _plot_map_segments(sm: SegmentsMap, pylab, expect_frame: FrameName, plot_ref_segments: bool = True):
    for face in sm.faces:
        xs = []
        ys = []
        for p in face.points:
            if sm.points[p].id_frame != expect_frame:
                msg = f"Expected points in frame {expect_frame!r}, got {sm.points[p].id_frame!r}"
                raise NotImplementedError(msg)

            coords = sm.points[p].coords
            xs.append(coords[0])
            ys.append(coords[1])

        xs.append(xs[0])
        ys.append(ys[0])
        facecolor = face.color
        edgecolor = "none"
        pylab.fill(xs, ys, facecolor=facecolor, edgecolor=edgecolor)

    if plot_ref_segments:
        for segment in sm.segments:
            p1 = segment.points[0]
            p2 = segment.points[1]

            # If we are both in FRAME_AXLE
            if not (sm.points[p1].id_frame == expect_frame) and (sm.points[p2].id_frame == expect_frame):
                msg = f"Cannot deal with points not in frame {expect_frame!r}"
                raise NotImplementedError(msg)

            w1 = np.array(sm.points[p1].coords)
            w2 = np.array(sm.points[p2].coords)

            color = "c-"
            pylab.plot([w1[0], w2[0]], [w1[1], w2[1]], color)

            n = get_normal_outward_for_segment(w1, w2)
            center = 0.51 * w1 + 0.49 * w2
            L = 0.05

            center2 = center + n * L

            pylab.plot([center[0], center2[0]], [center[1], center2[1]], color)


#
# def get_normal_outward_for_segment_old(w1: np.ndarray, w2: np.ndarray) -> np.ndarray:
#     """ Outward points towards black """
#     d = w2 - w1
#     #   w2
#     #   |  --->
#     #   w1
#     dn = np.linalg.norm(d)
#     if dn == 0:
#         msg = 'Could not compute normal for segment with two points equal:'
#         msg += ' %s %s' % (w1, w2)
#         raise ValueError(msg)
#     d = d / dn
#
#     z = np.array([0, 0, 1])
#     c = np.cross(d, z)
#     if False:
#         assert_almost_equal(np.linalg.norm(c), 1.0)
#     return c


def get_normal_outward_for_segment(w1: np.ndarray, w2: np.ndarray) -> np.ndarray:
    """Outward points towards black."""
    d = w2 - w1
    #   w2
    #   |  --->
    #   w1
    dn = np.hypot(d[0], d[1])
    if dn == 0:
        msg = "Could not compute normal for segment with two points equal:"
        msg += f" {w1} {w2}"
        raise ValueError(msg)
    d = d / dn

    #     c1 = d2*z3 - d3*z2
    #     c2 = d3*z1 - d1*z3
    #     c3 = d1*z2 - d2*z1

    c0 = np.array([d[1], -d[0], 0])

    if False:
        z = np.array([0, 0, 1])
        c = np.cross(d, z)
        assert_almost_equal(np.linalg.norm(c), 1.0)
        assert_almost_equal(np.linalg.norm(c0), 1.0)
        assert_almost_equal(c0, c[:2])

    return c0


# TODO: move away
assert_almost_equal(np.array([0, -1, 0]), get_normal_outward_for_segment(np.array([0, 0]), np.array([2, 0])))


def add_prefix(sm: SegmentsMap, prefix: str) -> SegmentsMap:
    points = {}
    faces = []
    segments = []
    for k, v in list(sm.points.items()):
        points[prefix + k] = v
    for face in sm.faces:
        points2 = list(PointName(prefix + _) for _ in face.points)
        faces.append(replace(face, points=points2))
    for segment in sm.segments:
        points2 = list(PointName(prefix + _) for _ in segment.points)
        segments.append(replace(segment, points=points2))

    return SegmentsMap(points=points, faces=faces, segments=segments, constants=sm.constants)
