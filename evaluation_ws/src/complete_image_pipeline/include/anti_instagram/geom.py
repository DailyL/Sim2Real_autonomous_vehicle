#!/usr/bin/env python3
import sys

import cv2
import matplotlib.pyplot as plt
import numpy as np

# the main function is processGeom, it works in 3 steps:
# 1) identify the surface of the road, we don't want to look at anything extraneous
# 2) filter the image based on some color thresholds to identify regions of different colors (colorFilter)
# 3) find the contours within that filter and fill them in to form a mask for regions of interest

# threshold values for the colorFilter, taken from line_detector and then tweaked
hsv_white1 = np.array([0, 0, 150])
hsv_white2 = np.array([180, 90, 255])
hsv_yellow1 = np.array([20, 120, 150])
hsv_yellow2 = np.array([45, 255, 255])
hsv_red1 = np.array([0, 120, 100])
hsv_red2 = np.array([12, 255, 255])
hsv_red3 = np.array([165, 120, 100])
hsv_red4 = np.array([180, 255, 255])

# color independent version, works first by finding lane surface, then by identifying line edge pixels to transform later
# this is probably a better method than processGeom because it works in low lighting
def processGeom2(img, grad_th=50, contour_low=30, viz=False):
    orig = img
    # find lane surface
    img, _ = identifyLaneSurface(img)

    # use gradients as binary mask, line edges correspond to high gradient values
    h, w = img.shape[:2]
    l = np.sqrt(h * w)
    dx = cv2.Sobel(img, cv2.CV_32F, 1, 0)
    dy = cv2.Sobel(img, cv2.CV_32F, 0, 1)
    grad = (np.sqrt(np.mean(dx ** 2 + dy ** 2, 2)) > grad_th).astype(np.uint8)

    # filter out noise from gradient
    _, contours, _ = cv2.findContours(grad, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    contours = [contour for contour in contours if contour.shape[0] >= contour_low]
    mask = np.zeros((img.shape[0], img.shape[1]), dtype=np.uint8)
    # for co0ntour in contours:
    # cv2.fillPoly(mask,[contour],1)
    cv2.fillPoly(mask, contours, 1)
    inds = np.array(np.nonzero(mask))
    ret = img[inds[0, :], inds[1, :], :]
    fillmask = np.pad(mask, 1, mode="constant")
    disp = np.expand_dims(mask, axis=-1) * orig
    # cv2.floodFill(disp,fillmask,(img.shape[0]-1,img.shape[2]),0, flags=cv2.FLOODFILL_MASK_ONLY)

    if viz:

        cv2.imshow("img", orig)
        cv2.waitKey(0)
        cv2.imshow("img", img)
        cv2.waitKey(0)
        cv2.imshow("img", grad * 255)
        cv2.waitKey(0)
        cv2.imshow("img", mask * 255)
        cv2.waitKey(0)
        cv2.imshow("img", disp)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return mask


def processGeom(img, viz=False):
    # first narrow scope to surface of lane to avoid extraneous info
    orig = img
    img, _ = identifyLaneSurface(img)
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    colors = ["white", "yellow", "red"]
    masks = {}
    for color in colors:
        # filter colors to get binary mask
        mask = colorFilter(hsv, color, thresh=None)

        # find contours based on binary mask, filter out small noise
        # _, contours, _ = cv2.findContours(
        #     bw, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        # contours = [contour for contour in contours if contour.shape[0] >= 30]

        # create the masks, store only when nonempty
        # mask = np.zeros((img.shape[0], img.shape[1]), dtype=np.uint8)
        # cv2.drawContours(mask, contours, -1, 1, -1)
        # if len(np.unique(mask)) > 1:
        #     masks[color] = mask
        if np.any(mask):
            masks[color] = mask

    if viz:
        # cols = {'white': (255, 255, 255), 'yellow': (
        #     0, 255, 255), 'red': (0, 0, 255)}
        cv2.imshow("img", orig)
        cv2.waitKey(0)
        cv2.imshow("img", img)
        cv2.waitKey(0)
        tot = np.zeros_like(img)
        for col in masks:
            mimg = masks[col][..., np.newaxis] & img
            tot += mimg
            cv2.imshow("img", mimg)
            cv2.waitKey(0)
        cv2.imshow("img", tot)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return masks


def identifyLaneSurface(img, grad_th=50, visualize=False):
    h, w = img.shape[:2]
    l = np.sqrt(h * w)
    dx = cv2.Sobel(img, cv2.CV_32F, 1, 0)
    dy = cv2.Sobel(img, cv2.CV_32F, 0, 1)
    ks_dilate = int(round(l * 0.005))
    grad = cv2.dilate(
        (np.sqrt(np.mean(dx ** 2 + dy ** 2, 2)) > grad_th).astype(np.uint8),
        cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (ks_dilate, ks_dilate)),
    )
    mask = np.zeros((h + 2, w + 2), np.uint8)
    y_keep = int(round(h * 0.6))
    grad[y_keep:, :] = 0
    cv2.floodFill(grad, mask, (0, y_keep), 0, flags=cv2.FLOODFILL_MASK_ONLY)
    mask = mask[:-1, 1:-1]
    mask[0, :] = 0

    ks_close = int(round(l * 0.03))
    mask[1:, :] = cv2.morphologyEx(
        mask[1:, :], cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (ks_close, ks_close))
    )
    mask_ = np.zeros((h + 3, w + 2), np.uint8)
    cv2.floodFill(mask, mask_, (0, 0), 0, flags=cv2.FLOODFILL_MASK_ONLY)
    mask = 1 - mask_[2:-1, 1:-1]
    mask[: int(round(h * 0.3)), :] = 0
    processed_img = img * mask[..., np.newaxis]
    if visualize:
        plt.subplot(2, 2, 1)
        plt.imshow(img[..., ::-1])
        plt.subplot(2, 2, 2)
        plt.imshow(grad, cmap="gray")
        plt.subplot(2, 2, 3)
        plt.imshow(mask, cmap="gray")
        plt.subplot(2, 2, 4)
        plt.imshow(processed_img[..., ::-1])
        plt.get_current_fig_manager().full_screen_toggle()
        plt.show()
    return processed_img, mask


# taken out of line_detector1.py, thresh should be a numpy array of shape (n,3), this is to provide previous estimates


def colorFilter(img, color, thresh=None):
    # threshold colors in HSV space
    """TODO: use the previous kmeans estimate +- some range to be the threshold colors"""
    if thresh is not None:
        thresh = np.resize(np.uint8(thresh), (thresh.shape[0], 1, 3))
        thresh = cv2.cvtColor(thresh, cv2.COLOR_BGR2HSV)
        t1, t2 = thresh[0:2, ...]
    if color == "white":
        if thresh is None:
            t1, t2 = hsv_white1, hsv_white2
        bw = cv2.inRange(img, t1, t2)
    elif color == "yellow":
        if thresh is None:
            t1, t2 = hsv_yellow1, hsv_yellow2
        bw = cv2.inRange(img, t1, t2)
    elif color == "red":
        if thresh is None:
            t1, t2, t3, t4 = hsv_red1, hsv_red2, hsv_red3, hsv_red4
        else:
            t3, t4 = thresh[2:4, ...]
        bw1 = cv2.inRange(img, t1, t2)
        bw2 = cv2.inRange(img, t3, t4)
        bw = cv2.bitwise_or(bw1, bw2)
    else:
        raise Exception("Error: Undefined color strings...")
    h, w = img.shape[:2]
    l = np.sqrt(h * w)
    ks_open = int(round(l * 0.005))
    bw = cv2.morphologyEx(
        bw, cv2.MORPH_OPEN, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (ks_open, ks_open))
    )
    return bw


# geometric primitives, not used


def detectColor(bw, color):
    n = 20
    if color == "white":
        # white lines should be perpendicular to horizon
        w, h = 30, 80
    elif color == "yellow":
        # yellow should come in patches, separated by gray space
        w, h = 30, 30
    elif color == "red":
        # red lines are near parallel to the horizon
        w, h = 80, 30
    else:
        raise Exception("Error: Undefined color strings...")
    w, h = 100, 100
    r = contigRegion(bw, w, h, n)
    mask = np.zeros(bw.shape, dtype=np.uint8)
    for i in range(r.shape[0]):
        y, x = r[i, 0], r[i, 1]
        mask[y - h : y + h, x - w : x + w] = 1
    mask = cv2.bitwise_and(bw, mask)
    return mask


# not used


def contigRegion(bw, kx, ky, n):
    # kernel shape is based on some geometric primitive of lane (should be trapezoid instead of rectangle?)
    kernel = np.ones((ky, kx), np.float32)
    conv = cv2.filter2D(bw, -1, kernel)
    row, col = conv.shape[0], conv.shape[1]
    a = conv.reshape(row * col)
    # top n maximum indices
    a = a.argsort()[-n:][::-1]
    r = np.zeros((a.shape[0], 2))
    r[:, 0] = a // col + ky
    r[:, 1] = a % col + kx
    return r


if __name__ == "__main__":
    fname = sys.argv[1]
    img = cv2.imread(fname)
    masks = processGeom(img, viz=True)
    mask = processGeom2(img, grad_th=70, contour_low=30, viz=True)
