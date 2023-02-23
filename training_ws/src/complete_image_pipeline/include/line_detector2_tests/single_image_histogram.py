from typing import Dict

import cv2
import numpy as np
from reprep.graphics.filter_posneg import posneg

import duckietown_code_utils as dtu


@dtu.unit_test
def single_image_histograms():
    p = dtu.require_resource("frame0002.jpg")

    image_cv = dtu.image_cv_from_jpg_fn(p)

    res = go(image_cv)
    outd = dtu.get_output_dir_for_test()
    dtu.write_bgr_images_as_jpgs(res, outd)


def go(image_bgr: dtu.NPImageBGR) -> Dict[str, dtu.NPImageBGR]:
    res = {}

    H, _W = image_bgr.shape[:2]
    cut = 0.3
    image_bgr_cut = image_bgr[int(cut * H) :, :, :]

    res["image_bgr"] = image_bgr
    res["image_bgr_cut"] = image_bgr_cut

    hsv_map = np.zeros((180, 256, 3), np.uint8)
    hsv_map_h, hsv_map_s = np.indices(hsv_map.shape[:2])
    hsv_map[:, :, 0] = hsv_map_h
    hsv_map[:, :, 1] = hsv_map_s
    hsv_map[:, :, 2] = 255
    hsv_map = cv2.cvtColor(hsv_map, cv2.COLOR_HSV2BGR)
    #     cv2.imshow('hsv_map', hsv_map)
    res["hsv_map"] = hsv_map

    hist_scale = 10

    hsv = cv2.cvtColor(image_bgr_cut, cv2.COLOR_BGR2HSV)
    #     dark = hsv[...,2] < 32
    #     hsv[dark] = 0
    h0 = cv2.calcHist([hsv], [0, 1], None, [180, 256], [0, 180, 0, 256])

    res["another"] = posneg(h0)

    #     hf = h0.flatten()
    #     c = np.empty_like(h0)
    #     for i in range(c.shape[0]):
    #         for j in range(c.shape[1]):
    #             c[i,j]=stats.percentileofscore(hf, h0[i,j])
    #     res['another2'] = posneg(c)

    h = h0 * hist_scale
    #     h = np.clip(h*0.005*hist_scale, 0, 1)
    vis = hsv_map * h[:, :, np.newaxis] / 255.0
    res["vis"] = vis

    used = h > 0
    res["vis2"] = hsv_map * used[:, :, np.newaxis]
    return res


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
