import cv2
import numpy as np


def plotSegments(image, detections):
    """

    Draws a set of line segment detections on an image.

    Args:
        image (:obj:`numpy array`): an image
        detections (`dict`): a dictionary that has keys :py:class:`ColorRange` and values :py:class:`Detection`

    Returns:
        :obj:`numpy array`: the image with the line segments drawn on top of it.

    """

    im = np.copy(image)

    for color_range, det in list(detections.items()):

        # convert HSV color to BGR
        c = color_range.representative
        c = np.uint8([[[c[0], c[1], c[2]]]])
        color = cv2.cvtColor(c, cv2.COLOR_HSV2BGR).squeeze().astype(int)
        # plot all detected line segments and their normals
        for i in range(len(det.normals)):
            center = det.centers[i]
            normal = det.normals[i]
            im = cv2.line(
                im,
                tuple(center.astype(int)),
                tuple((center + 10 * normal).astype(int)),
                color=(0, 0, 0),
                thickness=2,
            )
            # im = cv2.circle(im, (center[0], center[1]), radius=3, color=color, thickness=-1)
        for line in det.lines:
            im = cv2.line(im, (line[0], line[1]), (line[2], line[3]), color=(0, 0, 0), thickness=5)
            im = cv2.line(
                im, (line[0], line[1]), (line[2], line[3]), color=tuple([int(x) for x in color]), thickness=2
            )
    return im


def plotMaps(image, detections):
    """

    Draws a set of color filter maps (the part of the images falling in a given color range) on an image.

    Args:
        image (:obj:`numpy array`): an image
        detections (`dict`): a dictionary that has keys :py:class:`ColorRange` and values :py:class:`Detection`

    Returns:
        :obj:`numpy array`: the image with the line segments drawn on top of it.

    """

    im = np.copy(image)
    im = cv2.cvtColor(cv2.cvtColor(im, cv2.COLOR_BGR2GRAY), cv2.COLOR_GRAY2BGR)

    color_map = np.zeros_like(im)

    for color_range, det in list(detections.items()):

        # convert HSV color to BGR
        c = color_range.representative
        c = np.uint8([[[c[0], c[1], c[2]]]])
        color = cv2.cvtColor(c, cv2.COLOR_HSV2BGR).squeeze().astype(int)
        color_map[np.where(det.map)] = color

    im = cv2.addWeighted(im, 0.3, color_map, 1 - 0.3, 0.0)

    return im
