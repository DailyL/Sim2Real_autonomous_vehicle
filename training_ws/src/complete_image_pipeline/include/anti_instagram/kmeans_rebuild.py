#!/usr/bin/env python3
from collections import Counter

import cv2
import numpy as np
from sklearn.cluster import KMeans

from anti_instagram.calcLstsqTransform import calcTransform

CENTERS_BRYW = np.array([[60, 60, 60], [60, 60, 240], [50, 240, 240], [240, 240, 240]])
CENTERS_BYW = np.array([[60, 60, 60], [50, 240, 240], [240, 240, 240]])


class kMeansClass:
    """This class gives the ability to use the kMeans alg. with different numbers of initial centers"""

    input_image = []
    resized_image = []
    blurred_image = []
    image_array = []
    num_centers = -1
    blur_alg = []
    fac_resize = -1
    blur_kernel = -1
    trained_centers = []
    labels = []
    labelcount = Counter()
    color_array = []
    color_image_array = []

    # initialize
    def __init__(self, numCenters, blurAlg, resize, blurKer):
        self.input_image = None
        self.num_centers = int(numCenters)
        self.blur_alg = blurAlg
        self.fac_resize = float(resize)
        self.blur_kernel = int(blurKer)
        # set up array for center colors
        self.color_image_array = np.zeros((self.num_centers, 200, 200, 3), np.uint8)

    # re-shape input image for kMeans
    def _getimgdatapts(self, cv2img, fancyGeom=False):
        x, y, p = cv2img.shape
        cv2_tpose = cv2img.transpose()
        cv2_arr_tpose = np.reshape(cv2_tpose, [p, x * y])
        npdata = np.transpose(cv2_arr_tpose)
        return npdata

    def _blurImg(self):
        # blur image using median:
        if self.blur_alg == "median":
            self.blurred_image = cv2.medianBlur(self.resized_image, self.blur_kernel)

        # blur image using gaussian:
        elif self.blur_alg == "gaussian":
            self.blurred_image = cv2.GaussianBlur(self.resized_image, (self.blur_kernel, self.blur_kernel), 0)

        else:
            self.blurred_image = self.resized_image

    # apply kMeans alg
    def applyKM(self, img, max_it, fancyGeom=False):
        self.input_image = img
        # resize image
        self.resized_image = cv2.resize(self.input_image, (0, 0), fx=self.fac_resize, fy=self.fac_resize)

        # blur image
        self._blurImg()

        # prepare KMeans
        if self.trained_centers == []:
            # initialize kmeans with the random k-mans++ method
            kmc = KMeans(n_clusters=self.num_centers, init="k-means++", max_iter=max_it)
        else:
            # initialize kmeans with the previously found centers
            kmc = KMeans(n_clusters=self.num_centers, init=self.prevCenters, max_iter=max_it)

        # prepare data points
        self.image_array = self._getimgdatapts(self.blurred_image, fancyGeom=fancyGeom)

        # run KMeans
        kmc.fit(self.image_array)

        # get centers, labels and labelcount from KMeans
        self.trained_centers = kmc.cluster_centers_
        self.labels = kmc.labels_
        for i in np.arange(self.num_centers):
            self.labelcount[i] = np.sum(self.labels == i)

    def determineColor(self, trained_centers, withRed=True):
        idxRed = -1
        idxBlack = -1
        idxYellow = -1
        idxWhite = -1

        # define the true centers. This color is preset. The color transformation
        # tries to transform a picture such that the black areas will become true black.
        # The same applies for yellow, white and (if valid) red.
        trueBlack = [70, 50, 60]
        trueYellow = [50, 240, 230]
        trueWhite = [250, 250, 250]
        if withRed:
            trueRed = [50, 70, 240]

        # initialize arrays which save the errors to each true center
        # later the minimal error cluster center will be defined as this color
        errorBlack = np.zeros(self.num_centers)
        errorYellow = np.zeros(self.num_centers)
        errorWhite = np.zeros(self.num_centers)

        if withRed:
            errorRed = np.zeros(self.num_centers)

        # determine the error for each trained cluster center to all true centers
        for i in range(self.num_centers):
            errorBlack[i] = np.linalg.norm(trueBlack - trained_centers[i])
            errorYellow[i] = np.linalg.norm(trueYellow - trained_centers[i])
            errorWhite[i] = np.linalg.norm(trueWhite - trained_centers[i])
            if withRed:
                errorRed[i] = np.linalg.norm(trueRed - trained_centers[i])

        nTrueCenters = 3

        # sort the error arrays and save the corresponding index of the original array
        # in the following array. This allows us to determine the index of the cluster.
        errorBlackSortedIdx = np.argsort(errorBlack)
        errorYellowSortedIdx = np.argsort(errorYellow)
        errorWhiteSortedIdx = np.argsort(errorWhite)

        errorSorted = np.vstack([errorBlack, errorWhite, errorYellow])
        if withRed:
            errorRedSortedIdx = np.argsort(errorRed)
            errorSorted = np.vstack((errorSorted, errorRed))

        if withRed:
            nTrueCenters = 4
        ListOfIndices = []

        # boolean variables to determine whether the minimal error index has been found
        blackIdxFound = False
        whiteIdxFound = False
        yellowIdxFound = False
        if withRed:
            redIdxFound = False
        centersFound = False
        index = 0

        n_true_centers, n_trained_centers = errorSorted.shape
        errorList = np.reshape(errorSorted, (n_trained_centers * n_true_centers))

        # print "the number of trained centers is: " + str(n_trained_centers)
        # find for every true center the corresponding trained center.
        # this code considers the global minimum for assigning clusters,
        # instead of assigning first black, then white, yellow and red
        while not centersFound:

            # print(errorList)
            ind = np.argmin(errorList)
            category, ind_center = ind // n_trained_centers, ind % n_trained_centers

            if category == 0 and not blackIdxFound:
                ListOfIndices.append(ind_center)
                blackIdxFound = True
                idxBlack = ind_center

            if category == 1 and not whiteIdxFound:
                ListOfIndices.append(ind_center)
                whiteIdxFound = True
                idxWhite = ind_center

            if category == 2 and not yellowIdxFound:
                ListOfIndices.append(ind_center)
                yellowIdxFound = True
                idxYellow = ind_center

            if withRed:
                if category == 3 and not redIdxFound:
                    ListOfIndices.append(ind_center)
                    redIdxFound = True
                    idxRed = ind_center
                centersFound = blackIdxFound and whiteIdxFound and yellowIdxFound and redIdxFound
            else:
                centersFound = blackIdxFound and whiteIdxFound and yellowIdxFound

            # set entry in errorList to max
            errorList[category * n_trained_centers : (category + 1) * n_trained_centers + 1] = 1000

        # return the minimal error indices for the trained centers.
        if withRed:
            return (
                idxBlack,
                idxRed,
                idxYellow,
                idxWhite,
            )
        else:
            return idxBlack, idxYellow, idxWhite

    def detectOutlier(self, trainedCenters, trueCenters):  # YWRB
        n_centers, n_channels = trainedCenters.shape
        # trueCenters = np.vstack([[50, 240, 240], [240, 240, 240], [60, 60, 240], [60, 60, 60]])  # YWRB
        # print n_centers
        errors = np.zeros(n_centers)
        errorArrayTotal = np.zeros(n_centers)
        # leave one trained center out and estimate transform with the rest of the centers
        for i in range(n_centers):
            # leave out i-th trained center
            trainedCentersTemp = np.vstack([trainedCenters[0:i, :], trainedCenters[i + 1 : n_centers, :]])
            trueCenterstemp = np.vstack([trueCenters[0:i, :], trueCenters[i + 1 : n_centers, :]])
            # calculate transform with the other centers
            T = calcTransform(n_centers - 1, trainedCentersTemp, trueCenterstemp)
            T.calcTransform()

            errorArray = np.zeros(n_centers)
            # estimate the error of the transformed trained centers wrt. the true centers
            for j in range(n_centers):
                tempTrafoCenter = self.transformOneCenter(trainedCenters[j, :], T.shift, T.scale)
                tempTrueCenter = trueCenters[j]
                errorArray[j] = self.estimateError(tempTrafoCenter, tempTrueCenter)
            errorArrayTotal[i] = np.sum(errorArray)
            # print "error of trafo: " + str(errorArrayTotal[i])

        errorArraySortedIdx = np.argsort(errorArrayTotal)
        averageError = np.average(errorArrayTotal[1:n_centers])
        # print(averageError)
        return errorArraySortedIdx[0], [errorArraySortedIdx[0]], averageError  # return first element.
        # this set of centers leads to the lowest error and the left out center is therefore the outlier.

    def estimateError(self, trained_center, truecenter):
        return np.linalg.norm(truecenter - trained_center)

    def transformOneCenter(self, center, shift, scale):
        center = np.array(center)
        shift = np.array(shift)
        scale = np.array(scale)
        transformedCenter = np.zeros(center.shape)
        (n_channels,) = center.shape
        # print n_channels
        for i in range(n_channels):
            transformedCenter[i] = center[i] * scale[i] + shift[i]
            return transformedCenter
