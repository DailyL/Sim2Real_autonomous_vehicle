from anti_instagram.calcLstsqTransform import *


def detectOutlier(trainedCenters, trueCenters):  # YWRB
    n_centers, n_channels = trainedCenters.shape
    # trueCenters = np.vstack([[50, 240, 240], [240, 240, 240], [60, 60, 240], [60, 60, 60]])  # YWRB
    print(n_centers)
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
        print(("the transform is: shift - " + str(T.shift) + ", scale - " + str(T.scale)))
        # print "left out " + str(leaveOut) + ", new centers: " + str(tempArray)
        # transformedCenters = np.zeros((tempArray.shape))

        errorArray = np.zeros(n_centers)
        # estimate the error of the transformed trained centers wrt. the true centers
        for j in range(n_centers):
            tempTrafoCenter = transformOneCenter(trainedCenters[j, :], T.shift, T.scale)
            tempTrueCenter = trueCenters[j]
            errorArray[j] = estimateError(tempTrafoCenter, tempTrueCenter)
        errorArrayTotal[i] = np.sum(errorArray)
        print(("error of trafo: " + str(errorArrayTotal[i])))
    errorArraySortedIdx = np.argsort(errorArrayTotal)
    return errorArraySortedIdx[0], trainedCenters[errorArraySortedIdx[0]]  # return first element.
    # this set of centers leads to the lowest error and the left out center is therefore the outlier.


def estimateError(trained_center, truecenter):
    return np.linalg.norm(truecenter - trained_center)


def transformOneCenter(center, shift, scale):
    center = np.array(center)
    shift = np.array(shift)
    scale = np.array(scale)
    transformedCenter = np.zeros(center.shape)
    (n_channels,) = center.shape
    # print n_channels
    for i in range(n_channels):
        transformedCenter[i] = center[i] * scale[i] + shift[i]
    return transformedCenter
