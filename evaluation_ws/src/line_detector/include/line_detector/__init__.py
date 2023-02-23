"""

    line_detector
    -------------

    The ``line_detector`` library packages classes and tools for handling line section extraction from images. The
    main functionality is in the :py:class:`LineDetector` class. :py:class:`Detections` is the output data class for
    the results of a call to :py:class:`LineDetector`, and :py:class:`ColorRange` is used to specify the colour ranges
    in which :py:class:`LineDetector` is looking for line segments.

    There are two plotting utilities also included: :py:func:`plotMaps` and :py:func:`plotSegments`

    .. autoclass:: line_detector.Detections

    .. autoclass:: line_detector.ColorRange

    .. autoclass:: line_detector.LineDetector

    .. autofunction:: line_detector.plotMaps

    .. autofunction:: line_detector.plotSegments


"""

from .line_detector import LineDetector
from .detections import Detections
from .color_range import ColorRange
from .plot_detections import plotSegments, plotMaps
