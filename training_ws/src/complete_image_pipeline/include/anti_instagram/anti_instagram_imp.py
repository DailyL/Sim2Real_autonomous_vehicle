import cv2
from .kmeans import getparameters2, identifyColors, runKMeans
from .scale_and_shift import scaleandshift
from anti_instagram.kmeans import CENTERS, CENTERS2
import numpy as np
import duckietown_code_utils as dtu
from .interface import AntiInstagramInterface

logger = dtu.logger


def calculate_transform(image):
    """
    Returns tuple (bool, float, parameters)

    success, health, parameters

    parameters['scale']
    parameters['shift']
    """
    centers4 = CENTERS2
    trained4, counter4, score4 = runKMeans(image, num_colors=4, init=centers4)
    trained4 = trained4[[0, 2, 3], :]
    counter4 = [counter4[0], counter4[2], counter4[3]]
    centers4 = centers4[[0, 2, 3], :]
    centers3 = CENTERS
    trained3, counter3, score3 = runKMeans(image, num_colors=3, init=centers3)
    decision34 = ((score3 + 3e7) > score4) > score4
    if decision34:
        logger.info("picked 3 colors")
        trained = trained3
        counter = counter3
        centers = centers3
    else:
        logger.info("picked 4 colors")
        trained = trained4
        counter = counter4
        centers = centers4

    # milansc: for debug reasons
    logger.info(("Score for 3 colors: " + str(score3)))
    logger.info(("Score for 4 colors: " + str(score4)))

    logger.info("...in calculate_transform: found centers:")
    logger.info(centers)
    logger.info("...in calculate_transform: found counter:")
    logger.info(counter)
    logger.info("...in calculate_transform: found trained centers:")
    logger.info(trained)

    mapping = identifyColors(trained, centers)
    r, g, b, cost = getparameters2(mapping, trained, counter, centers)

    if r[0][0] == 0.0:
        # XXX: not sure what this is supposed to be
        return False, 0.0, None

    scale = np.array([r[0][0][0], g[0][0][0], b[0][0][0]])
    shift = np.array([r[1][0], g[1][0], b[1][0]])

    eps = np.finfo("double").eps
    health = 1.0 / (cost + eps)

    parameters = dict(scale=scale, shift=shift)

    return True, float(health), parameters


#     # Estimates the scale and shift over multiple frame via an IIR filter with preference towards low-cost frames
#     IIR_weight=1000/(10000+cost)
#     #logger.info("cost = %f, IIR_weight = %f" % (cost, IIR_weight))
#     # self.scale = [r[0][0][0],g[0][0][0],b[0][0][0]]
#     # self.shift = [r[1][0], g[1][0],b[1][0]]
#     deltascale = np.array([r[0][0][0],g[0][0][0],b[0][0][0]])
#     deltashift = np.array([r[1][0], g[1][0],b[1][0]])
#     if testframe:
#         self.scale = deltascale
#         self.shift = deltashift
#     else:
#         self.scale = (self.scale+deltascale*IIR_weight)/(1+IIR_weight)
#         self.shift = (self.shift+deltashift*IIR_weight)/(1+IIR_weight)


class ScaleAndShift:

    """Represents the transformation"""

    def __init__(self, scale, shift):
        self.scale = scale
        self.shift = shift

    def __call__(self, image):
        corrected_image = scaleandshift(image, self.scale, self.shift)
        return corrected_image

    @staticmethod
    def identity():
        return ScaleAndShift([1.0, 1.0, 1.0], [0.0, 0.0, 0.0])


class AntiInstagram(AntiInstagramInterface):
    def __init__(self, median_blur=0):
        self.scale = [1.0, 1.0, 1.0]
        self.shift = [0.0, 0.0, 0.0]
        self.health = 0

        #         median_blur = 5
        self.median_blur = median_blur

    def applyTransform(self, image):
        corrected_image = scaleandshift(image, self.scale, self.shift)
        res = np.clip(corrected_image, 0, 255).astype("uint8")
        #         res = cv2.convertScaleAbs(corrected_image).astype('uint8')
        #         print res.dtype
        return res

    def calculateTransform(self, image):  # , testframe=False):
        if self.median_blur > 0:
            image = cv2.medianBlur(image, self.median_blur)
        success, self.health, parameters = calculate_transform(image)
        if not success:
            raise Exception("calculate_transform failed")
        self.scale = parameters["scale"]
        self.shift = parameters["shift"]
        logger.debug(f"Scale: {self.scale} shift: {self.shift}")

    def calculateHealth(self):
        return self.health
