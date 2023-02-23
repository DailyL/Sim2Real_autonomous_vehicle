import logging

from . import pipeline_test, synthetic, synthetic_curve, synthetic_intersection, synthetic_stopline_xy

mplogger = logging.getLogger("matplotlib.font_manager")
mplogger.setLevel(logging.CRITICAL)
