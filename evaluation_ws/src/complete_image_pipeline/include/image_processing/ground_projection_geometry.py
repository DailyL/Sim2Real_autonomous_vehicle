from typing import NewType, Optional, Tuple

import cv2
import numpy as np

import duckietown_code_utils as dtu

from .constants import BOARD_HEIGHT, BOARD_WIDTH, SQUARE_SIZE, X_OFFSET, Y_OFFSET


class Point:
    """
    Point class. Convenience class for storing ROS-independent 3D points.

    """

    x: float
    y: float
    z: Optional[float]

    def __init__(self, x=None, y=None, z=None):
        self.x = x  #: x-coordinate
        self.y = y  #: y-coordinate
        self.z = z  #: z-coordinate

    def __repr__(self):
        return f"P({self.x}, {self.y}, {self.z})"

    @staticmethod
    def from_message(msg) -> "Point":
        """
        Generates a class instance from a ROS message. Expects that the message has attributes ``x`` and
        ``y``.
        If the message additionally has a ``z`` attribute, it will take it as well. Otherwise ``z`` will be
        set to 0.

        Args:
            msg: A ROS message or another object with ``x`` and ``y`` attributes

        Returns:
            :py:class:`Point` : A Point object

        """
        x = msg.x
        y = msg.y
        try:
            z = msg.z
        except AttributeError:
            z = 0
        return Point(x, y, z)


ImageSpaceResdepPoint = NewType("ImageSpaceResdepPoint", Point)
ImageSpaceNormalizedPoint = NewType("ImageSpaceNormalizedPoint", Point)
GroundPoint = NewType("GroundPoint", Point)


class GroundProjectionGeometry:
    """
    Handles the Ground Projection operations.

    Note:
        All pixel and image operations in this class assume that the pixels and images are *already
        rectified*. If
        unrectified pixels or images are supplied, the outputs of these operations will be incorrect.

    Args:
        im_width (``int``): Width of the rectified image
        im_height (``int``): Height of the rectified image
        homography (``np.ndarray``): The 3x3 Homography matrix


    """

    im_width: int
    im_height: int
    H: np.ndarray
    Hinv: np.ndarray

    def __init__(self, im_width: int, im_height: int, homography: np.ndarray):

        self.im_width = im_width
        self.im_height = im_height
        H = np.array(homography)
        if H.shape != (3, 3):
            H0 = H
            H = H0.reshape((3, 3))
            dtu.logger.warning(f"reshaping your homography matrix:\nfrom\n{H0}\nto\n{H}")

        self.H = H
        self.Hinv = np.linalg.inv(self.H)

    def get_shape(self) -> Tuple[int, int]:
        """returns height, width of image"""
        return self.im_height, self.im_width

    def vector2pixel(self, vec: ImageSpaceNormalizedPoint) -> ImageSpaceResdepPoint:
        """
        Converts a ``[0,1] X [0,1]`` representation to ``[0, W] X [0, H]`` (from normalized to image
        coordinates).

        Args:
            vec (:py:class:`Point`): A :py:class:`Point` object in normalized coordinates. Only the ``x``
            and ``y`` values are used.

        Returns:
            :py:class:`Point` : A :py:class:`Point` object in image coordinates. Only the ``x`` and ``y``
            values are used.

        """
        x = self.im_width * vec.x
        y = self.im_height * vec.y
        return ImageSpaceResdepPoint(Point(x, y))

    def pixel2vector(self, pixel: ImageSpaceResdepPoint) -> ImageSpaceNormalizedPoint:
        """
        Converts a ``[0,W] X [0,H]`` representation to ``[0, 1] X [0, 1]``
        (from image to normalized coordinates).

        Args:
            pixel (:py:class:`Point`): A :py:class:`Point` object in image coordinates. Only the ``x`` and
            ``y`` values are used.

        Returns:
            :py:class:`Point` : A :py:class:`Point` object in normalized coordinates. Only the ``x`` and
            ``y`` values are used.

        """
        x = pixel.x / self.im_width
        y = pixel.y / self.im_height
        return ImageSpaceNormalizedPoint(Point(x, y))

    def pixel2ground(self, pixel: ImageSpaceNormalizedPoint) -> GroundPoint:
        """
        Projects a normalized pixel (``[0, 1] X [0, 1]``) to the ground
        plane using the homography matrix.

        Args:
            pixel (:py:class:`Point`): A :py:class:`Point` object in
            normalized coordinates. Only the ``x``and ``y`` values are used.

        Returns:
            :py:class:`Point` : A :py:class:`Point` object on the ground plane.
            Only the ``x`` and ``y`` values are used.

        """

        uv_raw = np.array([pixel.x, pixel.y, 1.0])
        ground_point = np.dot(self.H, uv_raw)
        x = ground_point[0]
        y = ground_point[1]
        z = ground_point[2]
        a = x / z
        b = y / z
        return GroundPoint(Point(a, b, 0.0))

    def vector2ground(self, vec: ImageSpaceNormalizedPoint) -> GroundPoint:
        pixel: ImageSpaceResdepPoint = self.vector2pixel(vec)
        return self.pixel2ground(pixel)

    def ground2pixel(self, point: GroundPoint) -> ImageSpaceNormalizedPoint:
        """
        Projects a point on the ground plane to a normalized pixel (``[0, 1] X [0, 1]``) using the
        homography matrix.

        Args:
            point (:py:class:`Point`): A :py:class:`Point` object on the ground plane. Only the ``x`` and
            ``y`` values are used.

        Returns:
            :py:class:`Point` : A :py:class:`Point` object in normalized coordinates. Only the ``x`` and
            ``y`` values are used.

        Raises:
            ValueError: If the input point's ``z`` attribute is non-zero. The point must be on the ground (
            ``z=0``).

        """
        if point.z != 0:
            msg = "This method assumes that the point is a ground point (z=0). "
            msg += f"However, the point is ({point.x},{point.y},{point.z})"
            raise ValueError(msg)

        ground_point = np.array([point.x, point.y, 1.0])
        image_point = np.dot(self.Hinv, ground_point)
        image_point = image_point / image_point[2]

        x = image_point[0]
        y = image_point[1]

        return ImageSpaceNormalizedPoint(Point(x, y))

    @staticmethod
    def estimate_homography(
        cv_image_rectified: dtu.NPImageBGR,
        board_w: int = BOARD_WIDTH,
        board_h: int = BOARD_HEIGHT,
        square_size: float = SQUARE_SIZE,
        x_offset: float = X_OFFSET,
        y_offset: float = Y_OFFSET,
    ) -> Tuple["GroundProjectionGeometry", str]:
        """
        Estimates the homography matrix from an image with a calibration board.

        By using an image of the checkerboard calibration pattern taken from the robot when placed at the
        origin
        marking, detects the corners of the squares and computes the best homography matrix from them. The
        arguments
        of this function determine the dimensions and the position of the checkerboard with respect to the
        robot origin.

        For more information on the called to perform these operations, consult the OpenCV reference for
        `findChessboardCorners <https://docs.opencv.org/2.4/modules/calib3d/doc
        /camera_calibration_and_3d_reconstruction.html?highlight=findhomography#findchessboardcorners>`_,
        `cornerSubPix <https://docs.opencv.org/2.4/modules/imgproc/doc/feature_detection.html#cornersubpix>`_,
        `findHomography <https://docs.opencv.org/2.4/modules/calib3d/doc
        /camera_calibration_and_3d_reconstruction.html?#findhomographyi>`_.


        Note:
            The provided image should be rectified.

        Args:
            cv_image_rectified (:obj:``numpy array``): A color (3-channel) OpenCV image
            board_w (`int`): The width of the calibration board (number of squares)
            board_h (`int`): The height of the calibration board (number of squares)
            square_size (`float`): Side of the square (in meters)
            x_offset (`float`): Distance from the robot origin to the first row of corners (top edge of the
            closest squares)
            y_offset: (`float`): Distance from the robot origin to the first column of corners (right edge
            of the left-most squares)


        Returns:
            tuple: An instance of the :py:class:`GroundProjectionGeometry` with the image dimensions of the
            calibration image and the calculated homography matrix, and a status sting that is `Homography
            could be corrupt.` or ``None``.

        Raises:
            RuntimeError: If no corners were found in image, or the corners couldn't be rearranged

        """

        cv_image_rectified = cv2.cvtColor(cv_image_rectified, cv2.COLOR_BGR2GRAY)

        ret, corners = cv2.findChessboardCorners(
            cv_image_rectified, (board_w, board_h), cv2.CALIB_CB_ADAPTIVE_THRESH
        )

        bgr_detected = cv_image_rectified.copy()
        cv2.drawChessboardCorners(bgr_detected, (7, 5), corners, ret)
        cv2.imwrite("/data/detected.png", bgr_detected)

        if not ret:
            msg = (
                "No corners found in image, or the corners couldn't be rearranged. Make sure that the "
                "camera is positioned correctly."
            )
            raise RuntimeError(msg)

        criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.01)
        corners_subpix = cv2.cornerSubPix(cv_image_rectified, corners, (11, 11), (-1, -1), criteria)

        src_pts = []
        for r in range(board_h):
            for c in range(board_w):
                src_pts.append(
                    np.array([r * square_size, c * square_size], dtype="float32")
                    + np.array([x_offset, -y_offset])
                )

        # OpenCV labels corners left-to-right, top-to-bottom
        # We're having a problem with our pattern since it's not rotation-invariant

        # only reverse order if first point is at bottom right corner
        if (corners[0])[0][0] < (corners[board_w * board_h - 1])[0][0] and (corners[0])[0][0] < (
            corners[board_w * board_h - 1]
        )[0][1]:
            src_pts.reverse()

        # Compute homography from image to ground
        H, status = cv2.findHomography(
            corners_subpix.reshape(len(corners_subpix), 2), np.array(src_pts), cv2.RANSAC
        )

        if H[1][2] > 0:
            status = "Homography could be corrupt."
        else:
            status = None

        e = GroundProjectionGeometry(
            im_height=cv_image_rectified.shape[1], im_width=cv_image_rectified.shape[0], homography=H
        )
        return e, status
