import numpy as np
from geometry import SE2_from_xytheta

from duckietown_segmaps.transformations import TransformationsInfo
from easy_algo import get_easy_algo_db
from .maps import FAMILY_SEGMAPS, SegmentsMap
from .transformations import FRAME_GLOBAL, FRAME_TILE

__all__ = ["compose_maps"]


def compose_maps(grid_spacing, tiles) -> SegmentsMap:
    db = get_easy_algo_db()

    tinfo = TransformationsInfo()

    partial = []

    for tile in tiles:
        cell = tile["cell"]
        name = tile["name"]
        rotation = tile["rotation"]
        tile_map = db.create_instance(FAMILY_SEGMAPS, name)

        x = cell[0] * grid_spacing
        y = cell[1] * grid_spacing
        theta = np.deg2rad(rotation)
        g = SE2_from_xytheta([x, y, theta])
        tinfo.add_transformation(frame1=FRAME_GLOBAL, frame2=FRAME_TILE, g=g)

        tile_map2 = tinfo.transform_map_to_frame(tile_map, FRAME_GLOBAL)
        partial.append(tile_map2)

    result = SegmentsMap.merge(partial)
    return result
