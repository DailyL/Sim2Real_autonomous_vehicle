from collections import OrderedDict
from typing import Dict, Tuple

import cv2
import numpy as np

from .exception_utils import check_isinstance
from .image_operations import gray2rgb
from .types import Color8, NPImage


def d8_image_zoom_linear(cv_image: NPImage, ratio: int = 4) -> NPImage:
    #     """ Zooms up by the given ratio """
    H, W, _ = cv_image.shape
    W2 = int(W * ratio)
    H2 = int(H * ratio)
    res = cv2.resize(cv_image, (W2, H2), interpolation=cv2.INTER_NEAREST)
    return res


def d8_image_resize_no_interpolation(cv_image: NPImage, new_shape: Tuple[int, int]) -> NPImage:
    """
    new_shape = (H, W)
    """
    H, W = new_shape
    res = cv2.resize(cv_image, (W, H), interpolation=cv2.INTER_NEAREST)
    return res


def d8_image_resize_fit(cv_image: NPImage, W: int, interpolation=cv2.INTER_LINEAR) -> NPImage:
    """
    Resize the image such that it fits in exactly width = W.
    """
    H0, W0 = cv_image.shape[:2]
    H = int(W * 1.0 / W0 * H0)
    res = cv2.resize(cv_image, (W, H), interpolation=interpolation)
    return res


def d8_image_resize_fit_height(cv_image: NPImage, H: int) -> NPImage:
    """
    Resize the image such that it fits in exactly width = W.
    """
    H0, W0 = cv_image.shape[:2]
    W = int(H * 1.0 / H0 * W0)
    res = cv2.resize(cv_image, (W, H), interpolation=cv2.INTER_LINEAR)
    return res


def d8_image_resize_fit_in_rect(
    img: NPImage, shape: Tuple[int, int], bgcolor: Color8 = (128, 128, 128)
) -> NPImage:
    if img.shape[0] > shape[0]:
        img = d8_image_resize_fit_height(img, shape[0])
    if img.shape[1] > shape[1]:
        img = d8_image_resize_fit(img, shape[1])

    assert img.shape[0] <= shape[0]
    assert img.shape[1] <= shape[1]

    res = np.zeros(dtype=img.dtype, shape=(shape[0], shape[1], 3))
    for i in (0, 1, 2):
        res[:, :, i].fill(bgcolor[i])

    pad0 = int((shape[0] - img.shape[0]) / 2)
    pad1 = int((shape[1] - img.shape[1]) / 2)

    for i in (0, 1, 2):
        res[pad0 : pad0 + img.shape[0], pad1 : pad1 + img.shape[1], i] = img[:, :, i]

    return res


def resize_small_images(image_dict: Dict[str, NPImage]) -> Dict[str, NPImage]:
    check_isinstance(image_dict, dict)
    max_H, max_W = 0, 0
    for _, image in list(image_dict.items()):
        H, W = image.shape[0:2]
        max_H = max(max_H, W)
        max_W = max(max_W, W)

    d = OrderedDict()
    for k, image in list(image_dict.items()):
        if len(image.shape) == 2:  # grayscale
            image = gray2rgb(image)

        H, W = image.shape[0:2]
        ratio = max(max_H * 1.0 / H, max_W * 1.0 / W)
        ratio = int(np.ceil(ratio))
        if ratio > 1:
            image2 = d8_image_zoom_linear(image, ratio)
        else:
            image2 = image
        d[k] = image2
    return d


def resize_images_to_fit_in_rect(
    image_dict: Dict[str, NPImage], shape: Tuple[int, int], bgcolor: Color8
) -> Dict[str, NPImage]:
    check_isinstance(image_dict, dict)

    d = {}
    for k, image in list(image_dict.items()):
        d[k] = d8_image_resize_fit_in_rect(image, shape, bgcolor)
    return d
