#!/usr/bin/env python3
import numpy as np
from scipy.optimize import least_squares

# from anti_instagram.kmeans_rebuild import CENTERS_BRYW, CENTERS_BYW

# TODO fix import issue of centers
CENTERS_BRYW = np.array([[60, 60, 60], [60, 60, 240], [50, 240, 240], [240, 240, 240]])
CENTERS_BYW = np.array([[60, 60, 60], [50, 240, 240], [240, 240, 240]])
"""
This class calculates the optimal transform parameters based on the least squares optimization.
In this class there are two different ways to calculate this parameters. The first uses a standard least squares
method from numpy. The second uses a least squares method from scipy, which allows us to define bounds for the
parameters that are to be calculated.
The inputs:
- number of centers:      this is the number of centers which are used to compute the transform
- found centers:          this is an array containing the centers of the clusters.
- true centers:           this is the array containing the true centers
The outputs:
- scale and shift:        The scale and shift values correspond to 'a' and 'b' in y = a*x + b for each channel
Some theory:
We want to map the input color space [B, G, R] to the 'true' color space [B', G', R'].
The color transform:     |a_B    0       0      b_B|       |B|     |B'|
                         |0      a_G     0      b_G|   *   |G| =   |G'|
                         |0      0       a_R    b_R|       |R|     |R'|
                                                           |1|
is a transform based on a scale [a_B, a_G, a_R] and a shift [b_B, b_G, b_R]
with the Ansatz y = a*x + b per channel.
For each channel there are two unknown parameters, 'a' and 'b'. Thus we need AT LEAST TWO correspondences
(from the found center 1 to the 'true' center and from the found center 2 to the 'true' center),
so that we can build the per-channel equations:
|B1 1|  *   |a_B|   =   |B'|
|B2 1|      |b_B|       |B'|
|G1 1|  *   |a_G|   =   |G'|
|G2 1|      |b_G|       |G'|
|R1 1|  *   |a_R|   =   |R'|
|R2 1|      |b_R|       |R'|
  A     *     x     =    b
I.e. we want to solve the problem Ax=b for each channel, where x are the transform parameters,
b the desired color value and A the matrix containing the color values of the found centers.
"""


class calcTransform:

    # hardcoded centers from anti_instagram.kmeans
    centers_BYW = CENTERS_BYW
    centers_BRYW = CENTERS_BRYW

    true_centers = []  # n x 3 array, containing n 'true' centers in BGR
    num_centers = -1  # n
    found_centers = []  # n x 3 array, containing n found centers in BGR
    valueArrayBGR = []
    matrices_A = []  # 3 x n x 2 array, containing for each channel the found color values   |R1   1|
    #                                                                       |  ... |
    #                                                                       |Rn   1|
    vectors_b = []  # 3 x n array, containing the 'true' colors for each channel
    scale = []
    shift = []
    residuals = []
    residualNorm = -1

    # initialize
    def __init__(self, numOcenters, found_centers, true_centers=[]):
        assert numOcenters >= 2, "at least two centers needed. Otherwise under constrained"
        self.num_centers = numOcenters
        # if no true centers are provided
        if true_centers == []:
            if self.num_centers == 4:
                self.true_centers = self.centers_BRYW
            elif self.num_centers == 3:
                self.true_centers = self.centers_BYW
        else:
            self.true_centers = true_centers

        self.num_centers = numOcenters
        self.found_centers = found_centers
        self.scale = np.zeros(3, np.float64)
        self.shift = np.zeros(3, np.float64)
        self.residuals = np.zeros((3, 3), np.float64)
        self.valueArrayBGR = np.zeros((3, self.num_centers), np.uint8)

        # prepare input matrices
        for k in range(3):
            self.valueArrayBGR[k, :] = self.found_centers[:, k]
        self.matrices_A = np.zeros((3, self.num_centers, 2), np.uint8)
        self.matrices_A_row = np.zeros((3, self.num_centers), np.uint8)
        self.vectors_b = np.zeros((3, self.num_centers), np.uint8)
        for channel in range(3):
            # prepare vectors b for each channel
            self.vectors_b[channel, :] = self.true_centers[:, channel]
            # prepare matrices A for each channel
            self.matrices_A[channel] = np.array(
                ([[self.valueArrayBGR[channel, j], 1] for j in range(self.num_centers)])
            )

        # define error function for bounded Trafo analysis:
        self.funcLine = lambda tpl, x: tpl[0] * x + tpl[1]
        self.ErrorFunc = lambda tpl, x, y: self.funcLine(tpl, x) - y
        # define init parameters
        self.tplInit = (1.0, 0.0)
        # define bounds
        self.bounds = [(0.333, -100.0), (3.0, 100.0)]

    def returnResidualNorm(self):
        return self.residualNorm

    # this function uses the least squares method from numpy.linalg
    def calcTransform(self):
        # loop over the three color channels
        for channel in range(3):
            # calculate least squares
            X, r, rank, s = np.linalg.lstsq(self.matrices_A[channel], self.vectors_b[channel])
            self.scale[channel] = X[0]
            self.shift[channel] = X[1]
            if r:
                self.residuals[channel] = r
            else:
                self.residuals[channel] = 0
        self.residualNorm = np.linalg.norm(self.residuals)
        return self.scale, self.shift

    # this function uses the least squares method from scipy, which allows constrained parameters
    def calcBoundedTrafo(self):
        # loop over the three color channels
        for channel in range(3):
            tpl_param = least_squares(
                self.ErrorFunc,
                self.tplInit[:],
                args=(self.vectors_b[channel], self.valueArrayBGR[channel]),
                bounds=self.bounds,
            )
            self.scale[channel] = tpl_param.x[0]
            self.shift[channel] = tpl_param.x[1]
            return self.scale, self.shift
