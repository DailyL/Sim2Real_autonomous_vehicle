import numpy as np

from .types import NPImageRGB

__all__ = ["rgb_from_pil"]


def rgb_from_pil(im) -> NPImageRGB:
    im = np.asarray(im).astype(np.uint8)
    if len(im.shape) == 2:
        H, W = im.shape[:2]
        res = np.zeros(dtype="uint8", shape=(H, W, 3))
        res[:, :, 0] = im
        res[:, :, 1] = im
        res[:, :, 2] = im
        return res
    else:
        return im
