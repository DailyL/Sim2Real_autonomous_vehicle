from typing import Optional

import numpy as np
from geometry import SE2value

import duckietown_code_utils as dtu
from duckietown_segmaps import FAMILY_SEGMAPS, FRAME_GLOBAL, SegmentsMap
from easy_algo import get_easy_algo_db

FAMILY_LOC_TEMPLATES = "localization_template"

__all__ = [
    "LocalizationTemplate",
    "FAMILY_LOC_TEMPLATES",
]


class LocalizationTemplate:
    """Represents a template on which we can localize."""

    tile_name: str
    _map: Optional[SegmentsMap]

    def __init__(self, tile_name: str, dt):
        self.dt = dt
        self.tile_name = tile_name
        self._map = None

    def get_map(self) -> SegmentsMap:
        if self._map is None:
            # Need to do this here and not in constructor
            # because otherwise there is a loop in EasyAlgo
            db = get_easy_algo_db()
            self._map = db.create_instance(FAMILY_SEGMAPS, self.tile_name)

            frames = set(_.id_frame for _ in list(self._map.points.values()))
            if frames != {FRAME_GLOBAL}:
                msg = (
                    f"Expected that all points in the map {self.tile_name!r} are in the frame "
                    f"{FRAME_GLOBAL!r}."
                )
                msg += f" These are the frames: {frames}."
                raise ValueError(msg)
        return self._map

    @dtu.contract(xy="array[2xN]", theta="array[N]")
    def coords_from_position_orientation(self, xy: np.ndarray, theta: np.ndarray) -> np.ndarray:
        ...

    def coords_from_pose(self, pose: SE2value) -> np.ndarray:
        ...

    def get_coords_datatype(self):
        return self.dt
