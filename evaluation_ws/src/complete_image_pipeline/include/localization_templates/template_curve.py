import numpy as np

import duckietown_code_utils as dtu
from .map_localization_template import LocalizationTemplate

__all__ = ["TemplateBeforeCurve"]


class TemplateBeforeCurve(LocalizationTemplate):
    DATATYPE_COORDS = np.dtype([("phi", "float64"), ("d", "float64")])

    def __init__(self, tile_name, direction):
        assert direction in ["left", "right"]
        self.direction = direction
        LocalizationTemplate.__init__(self, tile_name, TemplateBeforeCurve.DATATYPE_COORDS)

    def _init_metrics(self):
        if self._map is None:
            self.get_map()  # need initialized
        width_yellow = self._map.constants["width_yellow"]
        width_white = self._map.constants["width_white"]
        lane_width = self._map.constants["lane_width"]
        self.tile_size = self._map.constants["tile_size"]
        self.offset = width_white + lane_width + width_yellow + lane_width / 2.0

        self.alpha0 = -np.deg2rad(45)

        self.center = np.array([+self.tile_size / 2, +self.tile_size / 2])

    @dtu.contract(returns="array", pose="SE2")
    def coords_from_pose(self, pose):
        """Returns an array with datatype DATATYPE_COORDS"""
        assert self.direction in ["left"]

        self._init_metrics()

        xy, theta = dtu.geo.translation_angle_from_SE2(pose)

        p = xy - self.center
        dist = np.hypot(p[0], p[1])
        d = self.offset - dist
        alpha = np.arctan2(p[1], p[0])

        forward = alpha + np.pi / 2

        phi = theta - forward

        res = np.zeros((), dtype=self.dt)
        # x is unused (projection)
        res["phi"] = phi
        res["d"] = d
        return res

    @dtu.contract(xy="array[2xN]", theta="array[N]")
    def coords_from_position_orientation(self, xy: np.ndarray, theta: np.ndarray):
        self._init_metrics()
        num = xy.shape[1]
        assert xy.shape == (2, num)
        assert theta.shape == (num,)
        p = (xy.T - self.center).T
        assert p.shape == (2, num)
        dist = np.hypot(p[0, :], p[1, :])
        d = self.offset - dist
        alpha = np.arctan2(p[1, :], p[0, :])
        forward = alpha + np.pi / 2
        phi = theta - forward
        res = np.zeros(len(phi), dtype=self.dt)
        # x is unused (projection)
        res["phi"] = phi
        res["d"] = d
        return res

    @dtu.contract(returns="SE2", res="array|dict")
    def pose_from_coords(self, res):
        """Returns an array with datatype dtu.DATATYPE_XYTHETA"""

        assert self.direction in ["left"]

        self._init_metrics()

        d = res["d"]
        phi = res["phi"]

        dist = self.offset - d
        forward = self.alpha0 + np.pi / 2
        xy = self.center + dist * np.array([np.cos(self.alpha0), np.sin(self.alpha0)])
        theta = forward + phi

        pose = dtu.geo.SE2_from_translation_angle(xy, theta)
        return pose
