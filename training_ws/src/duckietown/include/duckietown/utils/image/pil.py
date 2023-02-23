import numpy as np
from PIL import Image


def np_to_pil(im: np.ndarray, mode=None) -> Image:
    return Image.fromarray(im, mode=mode)


def pil_to_np(im: Image) -> np.ndarray:
    return np.array(im)
