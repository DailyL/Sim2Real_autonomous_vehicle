import numpy as np


class JPEG:
    engine = None

    @classmethod
    def init(cls):
        if cls.engine is None:
            from turbojpeg import TurboJPEG
            cls.engine = TurboJPEG()


def rgb_to_jpeg(im: np.ndarray) -> bytes:
    JPEG.init()
    return JPEG.engine.encode(im)


def jpeg_to_rgb(im: bytes) -> np.ndarray:
    JPEG.init()
    return JPEG.engine.decode(im)
