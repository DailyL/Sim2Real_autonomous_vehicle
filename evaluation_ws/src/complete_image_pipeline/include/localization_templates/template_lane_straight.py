import numpy as np

import duckietown_code_utils as dtu
from .map_localization_template import LocalizationTemplate

__all__ = ["TemplateStraight"]


def phi_d_friendly(res):
    return f"phi: {np.rad2deg(res['phi'])} deg  d: {res['d']} m"


class TemplateStraight(LocalizationTemplate):
    DATATYPE_COORDS = np.dtype([("phi", "float64"), ("d", "float64")])

    def __init__(self, tile_name, default_x):
        self.default_x = default_x
        LocalizationTemplate.__init__(self, tile_name, TemplateStraight.DATATYPE_COORDS)

    def _init_metrics(self):
        if self._map is None:
            self.get_map()  # need initialized
        width_yellow = self._map.constants["width_yellow"]
        lane_width = self._map.constants["lane_width"]
        self.offset = width_yellow / 2 + lane_width / 2

    @dtu.contract(returns="array", pose="SE2")
    def coords_from_pose(self, pose):
        self._init_metrics()
        xy, theta = dtu.geo.translation_angle_from_SE2(pose)

        res = np.zeros((), dtype=self.dt)
        # x is unused (projection)
        res["phi"] = dtu.norm_angle(theta)
        res["d"] = xy[1] + self.offset
        return res

    @dtu.contract(xy="array[2xN]", theta="array[N]", returns="array[N]")
    def coords_from_position_orientation(self, xy, theta):
        self._init_metrics()
        num = xy.shape[1]
        assert xy.shape == (2, num)
        assert theta.shape == (num,)

        d = xy[1, :] + self.offset
        phi = dtu.norm_angle_v(theta)

        res = np.zeros(num, dtype=self.dt)
        res["phi"] = phi
        res["d"] = d
        return res

    @dtu.contract(returns="SE2", res="array|dict")
    def pose_from_coords(self, res):
        self._init_metrics()
        x = self.default_x
        y = res["d"] - self.offset
        theta = dtu.norm_angle(res["phi"])
        pose = dtu.geo.SE2_from_translation_angle([x, y], theta)
        return pose
