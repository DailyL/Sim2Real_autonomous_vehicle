import os

import numpy as np
from reprep.plot_utils.axes import turn_all_axes_off

import duckietown_code_utils as dtu
from complete_image_pipeline.image_simulation import simulate_image, SimulationData
from duckietown_code_utils.cli import D8App
from easy_algo import get_easy_algo_db
from image_processing.more_utils import get_robot_camera_geometry
from .maps import _plot_map_segments, FAMILY_SEGMAPS, SegmentsMap

__all__ = ["DisplayTileAndMaps", "simulate_camera_view"]
logger = dtu.logger


class DisplayTileAndMaps(D8App):
    """
    Displays the segment maps.
    """

    usage = """
    
Use as follows:

    $ rosrun complete_image_pipeline display_segmaps [pattern]

For example:

    $ rosrun complete_image_pipeline display_segmaps 'DT17*'
    
    """

    def define_program_options(self, params):
        params.accept_extra()

    def go(self):
        out = "out/maps"
        extra = self.options.get_extra()

        if len(extra) == 0:
            query = "*"
        else:
            query = extra

        db = get_easy_algo_db()
        maps = list(db.query_and_instance(FAMILY_SEGMAPS, query))

        self.debug(f"maps: {maps}")
        for id_map in maps:
            display_map(id_map, out)


def display_map(id_map: str, out: str):
    logger.info(f"id_map = {id_map}")
    db = get_easy_algo_db()
    smap = db.create_instance(FAMILY_SEGMAPS, id_map)
    texture_png = get_texture(smap, dpi=600)
    fn = os.path.join(out, id_map, f"{id_map}-texture.png")
    dtu.write_data_to_file(texture_png, fn)

    simdata = simulate_camera_view(smap, robot_name=dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS)

    fn = os.path.join(out, id_map, f"{id_map}-rectified_synthetic.jpg")
    dtu.write_bgr_to_file_as_jpg(simdata.rectified_synthetic_bgr, fn)
    fn = os.path.join(out, id_map, f"{id_map}-rectified_segments.jpg")
    dtu.write_bgr_to_file_as_jpg(simdata.rectified_segments_bgr, fn)
    fn = os.path.join(out, id_map, f"{id_map}-distorted_synthetic.jpg")
    dtu.write_bgr_to_file_as_jpg(simdata.distorted_synthetic_bgr, fn)


def get_texture(smap: SegmentsMap, dpi: int) -> bytes:
    figure_args = dict(figsize=(2, 2), facecolor="green")
    a = dtu.CreateImageFromPylab(dpi=dpi, figure_args=figure_args)
    frames = list(set(_.id_frame for _ in list(smap.points.values())))
    id_frame = frames[0]
    #     print('frames: %s choose %s' % (frames, id_frame))
    with a as pylab:
        _plot_map_segments(smap, pylab, id_frame, plot_ref_segments=False)
        pylab.axis("equal")
        turn_all_axes_off(pylab)
        pylab.tight_layout()
    png = a.get_png()
    return png


def simulate_camera_view(sm: SegmentsMap, robot_name: str) -> SimulationData:
    rcg = get_robot_camera_geometry(robot_name)

    pose = dtu.geo.SE2_from_translation_angle([0, -0.05], -np.deg2rad(-5))
    res = simulate_image(sm, pose, gpg=rcg.gpg, rectifier=rcg.rectifier, blur_sigma=0.3)
    return res
