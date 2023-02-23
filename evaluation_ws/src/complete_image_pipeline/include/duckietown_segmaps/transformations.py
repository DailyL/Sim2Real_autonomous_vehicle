from typing import Dict, NewType, Tuple, TYPE_CHECKING

import numpy as np
from geometry import SE2value, SE3value

import duckietown_code_utils as dtu

__all__ = [
    "TransformationsInfo",
    "FrameName",
    "FRAME_AXLE",
    "FRAME_GLOBAL",
    "FRAME_TILE",
]

FrameName = NewType("FrameName", str)

FRAME_AXLE = FrameName("axle")
FRAME_TILE = FrameName("tile")
FRAME_GLOBAL = FrameName("global")

if TYPE_CHECKING:
    from .maps import SegMapPoint, SegmentsMap


class TransformationsInfo:
    """Keeps track of transformations between poses"""

    t: Dict[Tuple[FrameName, FrameName], SE3value]

    def __init__(self):
        self.t = {}

    def add_transformation(self, frame1: FrameName, frame2: FrameName, g: SE2value):
        """frame2 expressed in frame1 is g in SE(2)"""
        if g.shape == (3, 3):
            g = dtu.geo.SE3_from_SE2(g)
        elif g.shape == (4, 4):
            pass

        self.t[(frame1, frame2)] = np.linalg.inv(g)
        self.t[(frame2, frame1)] = g
        self.t[(frame1, frame1)] = np.eye(4)
        self.t[(frame2, frame2)] = np.eye(4)

    def transform_point(self, xyz: np.ndarray, frame1: FrameName, frame2: FrameName) -> np.ndarray:
        """Transforms point xyz in frame1 to frame2"""
        key = (frame1, frame2)

        if not key in self.t:
            msg = f"Could not find transformation {str(key)}."
            raise ValueError(msg)

        g = self.t[key]

        xyzw = np.array([xyz[0], xyz[1], xyz[2], 1])
        r = np.dot(g, xyzw)
        res = r[0:3]
        return res

    def transform_map_to_frame(self, smap: "SegmentsMap", frame2: FrameName) -> "SegmentsMap":
        return _transform_map_to_frame(self, smap, frame2)


def _transform_map_to_frame(
    tinfo: TransformationsInfo, smap: "SegmentsMap", frame2: FrameName
) -> "SegmentsMap":
    from .maps import SegMapPoint, SegmentsMap

    def transform_point(p):
        frame1 = p.id_frame
        coords = p.coords
        coords2 = tinfo.transform_point(coords, frame1=frame1, frame2=frame2)
        return SegMapPoint(id_frame=frame2, coords=coords2)

    points2 = {}
    for k, v in list(smap.points.items()):
        points2[k] = transform_point(v)

    return SegmentsMap(points=points2, segments=smap.segments, faces=smap.faces, constants=smap.constants)
