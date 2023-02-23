from typing import NewType, Tuple, TYPE_CHECKING

import numpy as np

__all__ = [
    "NPImage",
    "NPImageBGR",
    "NPImageRGB",
    "NPImageGray",
    "BGRColor8",
    "RGBColor8",
    "RGBColor01",
    "Color8",
    "Color01",
    "ColorString",
]

if TYPE_CHECKING:
    NPImage = NewType("NPImage", np.ndarray)
    NPImageBGR = NewType("NPImageBGR", NPImage)
    NPImageRGB = NewType("NPImageRGB", NPImage)
    NPImageGray = NewType("NPImageGray", NPImage)

else:
    NPImageGray = NPImageBGR = NPImageRGB = NPImage = np.ndarray

Color8 = Tuple[int, int, int]
BGRColor8 = NewType("BGRColor8", Color8)
RGBColor8 = NewType("RGBColor8", Color8)
Color01 = Tuple[float, float, float]
RGBColor01 = NewType("RGBColor01", Color01)
""" used by matplotlib """
BGRColor01 = NewType("BGRColor01", Color01)

ColorString = NewType("ColorString", str)
