import numpy as np
from geometry import SE2value
from numpy.ma.testutils import assert_almost_equal

import duckietown_code_utils as dtu
from localization_templates import LocalizationTemplate

__all__ = [
    "TemplateXYStopline",
]


class TemplateXYStopline(LocalizationTemplate):
    """

    Coordinates:

        dstop: distance from stop line
        d: usual meaning


    """

    DATATYPE_COORDS_DSTOP = np.dtype([("dstop", "float64"), ("d", "float64")])

    def __init__(self, tile_name):
        LocalizationTemplate.__init__(self, tile_name, TemplateXYStopline.DATATYPE_COORDS_DSTOP)

        start = dict(d=0.04, dstop=0.24)
        pose = self.pose_from_coords(start)
        again = self.coords_from_pose(pose)
        assert_almost_equal(start["d"], again["d"])
        assert_almost_equal(start["dstop"], again["dstop"])

    def _init_metrics(self):
        if self._map is None:
            self.get_map()  # need initialized
        width_yellow = self._map.constants["width_yellow"]
        width_red = self._map.constants["width_red"]
        tile_size = self._map.constants["tile_size"]
        lane_width = self._map.constants["lane_width"]
        self.offset = width_yellow / 2 + lane_width / 2

        stop_line_starts_at = tile_size / 2 - width_red
        self.offset_dstop = stop_line_starts_at

    def coords_from_pose(self, pose: SE2value) -> np.ndarray:
        """Returns an array with datatype DATATYPE_COORDS"""
        self._init_metrics()
        xy, _ = dtu.geo.translation_angle_from_SE2(pose)

        res = np.zeros((), dtype=self.dt)
        # x is unused (projection)
        res["d"] = xy[1] + self.offset  # OK

        res["dstop"] = self.offset_dstop - xy[0]
        return res

    @dtu.contract(xy="array[2xN]", theta="array[N]")
    def coords_from_position_orientation(self, xy, theta):
        self._init_metrics()
        num = xy.shape[1]

        res = np.zeros(num, dtype=self.dt)
        res["d"] = xy[1, :] + self.offset
        res["dstop"] = -xy[0, :] + self.offset_dstop
        return res

    @dtu.contract(returns="SE2", res="array|dict")
    def pose_from_coords(self, res):
        self._init_metrics()

        y = res["d"] - self.offset  # OK
        x = self.offset_dstop - res["dstop"]

        theta = 0
        pose = dtu.geo.SE2_from_translation_angle([x, y], theta)
        return pose
