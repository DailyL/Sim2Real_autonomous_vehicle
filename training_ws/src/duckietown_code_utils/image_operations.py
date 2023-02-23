import cv2
import numpy as np

from .types import NPImage, NPImageBGR, NPImageGray, NPImageRGB

__all__ = ["gray2rgb", "bgr_from_rgb", "rgb_from_bgr", "zoom_image", "posneg"]


def gray2rgb(gray: NPImageGray) -> NPImageRGB:
    """
    Converts a H x W grayscale into a H x W x 3 RGB image
    by replicating the gray channel over R,G,B.

    :param gray: grayscale
    :type  gray: array[HxW](uint8),H>0,W>0

    :return: A RGB image in shades of gray.
    :rtype: array[HxWx3](uint8)
    """
    #    assert_gray_image(gray, 'input to gray2rgb')

    rgb = np.zeros((gray.shape[0], gray.shape[1], 3), dtype="uint8")
    for i in range(3):
        rgb[:, :, i] = gray
    return rgb


def bgr_from_rgb(rgb: NPImageRGB) -> NPImageBGR:
    bgr = cv2.cvtColor(rgb, cv2.COLOR_RGB2BGR)
    return bgr


def rgb_from_bgr(bgr: NPImageBGR) -> NPImageRGB:
    bgr = cv2.cvtColor(bgr, cv2.COLOR_BGR2RGB)
    return bgr


def zoom_image(im: NPImage, zoom: int = 4) -> NPImage:
    s = (im.shape[1] * zoom, im.shape[0] * zoom)
    imz = cv2.resize(im, s, interpolation=cv2.INTER_NEAREST)
    return imz


def posneg(value, max_value=None, skim=0, nan_color=(0.5, 0.5, 0.5), zero_color=(1.0, 1.0, 1.0)):
    """
    Converts a 2D float value to a RGB representation, where
    red is positive, blue is negative, white is zero.

    :param value: The field to represent.
     :type value: array[HxW]

    :param max_value:  Maximum of absolute value (if None, detect).
     :type max_value:  float,>0

    :param skim:       Fraction to skim (in percent).
     :type skim:       float,>0,<100

    :param nan_color:  Color to give for regions of NaN and Inf.
     :type nan_color:  color

    :return: posneg: A RGB image.
     :rtype: array[HxWx3](uint8)

    """

    # TODO: put this in reprep
    value = value.copy()
    if value.ndim > 2:
        value = value.squeeze()

    if value.dtype == np.dtype("uint8"):
        value = value.astype("float32")

    if len(value.shape) != 2:
        raise Exception("I expected a H x W image, got shape %s." % str(value.shape))

    isfinite = np.isfinite(value)
    isnan = np.logical_not(isfinite)
    # set nan to 0
    value[isnan] = 0

    if max_value is None:
        abs_value = abs(value)
        # if skim != 0:
        #     abs_value = skim_top(abs_value, skim)

        max_value = np.max(abs_value)

        if max_value == 0:
            result = np.zeros((value.shape[0], value.shape[1], 3), dtype="uint8")
            for i in range(3):
                result[:, :, i] = zero_color[i] * 255
            return result

    assert np.isfinite(max_value)

    positive = np.minimum(np.maximum(value, 0), max_value) / max_value
    negative = np.maximum(np.minimum(value, 0), -max_value) / -max_value
    positive_part = (positive * 255).astype("uint8")
    negative_part = (negative * 255).astype("uint8")

    result = np.zeros((value.shape[0], value.shape[1], 3), dtype="uint8")

    anysign = np.maximum(positive_part, negative_part)
    R = 255 - negative_part[:, :]
    G = 255 - anysign
    B = 255 - positive_part[:, :]

    # remember the nans
    R[isnan] = nan_color[0] * 255
    G[isnan] = nan_color[1] * 255
    B[isnan] = nan_color[2] * 255

    result[:, :, 0] = R
    result[:, :, 1] = G
    result[:, :, 2] = B

    return result
