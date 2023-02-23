from math import floor, sqrt

import numpy as np
import duckietown_code_utils as dtu
from scipy.ndimage.filters import gaussian_filter
from scipy.stats import entropy, multivariate_normal

from lane_filter_interface import LaneFilterInterface
from .visualization import plot_phi_d_diagram_bgr

__all__ = ["LaneFilterHistogram"]


class LaneFilterHistogram(LaneFilterInterface):
    """Generates an estimate of the lane pose.


    Creates and maintain a histogram grid filter to estimate the lane pose.
    Lane pose is defined as the tuple (`d`, `phi`) : lateral deviation and angulare deviation from the
    center of the lane.

    Predict step : Uses the estimated linear and angular velocities to predict the change in the lane pose.
    Update Step : The filter receives a segment list. For each segment, it extracts the corresponding lane
    pose "votes",
    and adds it to the corresponding part of the histogram.

    Best estimate correspond to the slot of the histogram with the highest voted value.

    Args:
        configuration (:obj:`List`): A list of the parameters for the filter

    """

    mean_d_0: float
    mean_phi_0: float
    sigma_d_0: float
    sigma_phi_0: float
    delta_d: float
    delta_phi: float
    d_max: float
    d_min: float
    phi_max: float
    phi_min: float
    cov_v: float
    linewidth_white: float
    linewidth_yellow: float
    lanewidth: float
    min_max: float
    sigma_d_mask: float
    sigma_phi_mask: float
    range_min: float
    range_est: float
    range_max: float

    def __init__(self, **kwargs):
        param_names = [
            "mean_d_0",
            "mean_phi_0",
            "sigma_d_0",
            "sigma_phi_0",
            "delta_d",
            "delta_phi",
            "d_max",
            "d_min",
            "phi_max",
            "phi_min",
            "cov_v",
            "linewidth_white",
            "linewidth_yellow",
            "lanewidth",
            "min_max",
            "sigma_d_mask",
            "sigma_phi_mask",
            "range_min",
            "range_est",
            "range_max",
        ]

        for p_name in param_names:
            assert p_name in kwargs, (p_name, param_names, kwargs)
            setattr(self, p_name, kwargs[p_name])

        self.d, self.phi = np.mgrid[
            self.d_min : self.d_max : self.delta_d, self.phi_min : self.phi_max : self.delta_phi
        ]

        self.d_pcolor, self.phi_pcolor = np.mgrid[
            self.d_min : (self.d_max + self.delta_d) : self.delta_d,
            self.phi_min : (self.phi_max + self.delta_phi) : self.delta_phi,
        ]

        self.belief = np.empty(self.d.shape)

        self.mean_0 = [self.mean_d_0, self.mean_phi_0]
        self.cov_0 = [[self.sigma_d_0, 0], [0, self.sigma_phi_0]]
        self.cov_mask = [self.sigma_d_mask, self.sigma_phi_mask]

        # Additional variables
        self.red_to_white = False
        self.use_yellow = True
        self.range_est_min = 0
        self.filtered_segments = []

        self.initialize()

    def initialize(self):
        pos = np.empty(self.d.shape + (2,))
        pos[:, :, 0] = self.d
        pos[:, :, 1] = self.phi
        RV = multivariate_normal(self.mean_0, self.cov_0)

        self.belief = RV.pdf(pos)

    def getStatus(self):
        return LaneFilterInterface.GOOD

    def get_entropy(self):
        belief = self.belief
        s = entropy(belief.flatten())
        return s

    def predict(self, dt, v, w):
        delta_t = dt
        d_t = self.d + v * delta_t * np.sin(self.phi)
        phi_t = self.phi + w * delta_t

        p_belief = np.zeros(self.belief.shape)

        # there has got to be a better/cleaner way to do this - just applying the process model to
        # translate each cell value
        for i in range(self.belief.shape[0]):
            for j in range(self.belief.shape[1]):
                if self.belief[i, j] > 0:
                    if (
                        d_t[i, j] > self.d_max
                        or d_t[i, j] < self.d_min
                        or phi_t[i, j] < self.phi_min
                        or phi_t[i, j] > self.phi_max
                    ):
                        continue

                    i_new = int(floor((d_t[i, j] - self.d_min) / self.delta_d))
                    j_new = int(floor((phi_t[i, j] - self.phi_min) / self.delta_phi))

                    p_belief[i_new, j_new] += self.belief[i, j]

        s_belief = np.zeros(self.belief.shape)
        gaussian_filter(p_belief, self.cov_mask, output=s_belief, mode="constant")

        if np.sum(s_belief) == 0:
            return
        self.belief = s_belief / np.sum(s_belief)

    # prepare the segments for the creation of the belief arrays
    def prepareSegments(self, segments):
        segmentsArray = []
        self.filtered_segments = []
        for segment in segments:
            # Optional transform from RED to WHITE
            if self.red_to_white and segment.color == segment.RED:
                segment.color = segment.WHITE

            # Optional filtering out YELLOW
            if not self.use_yellow and segment.color == segment.YELLOW:
                continue

            # we don't care about RED ones for now
            if segment.color != segment.WHITE and segment.color != segment.YELLOW:
                continue
            # filter out any segments that are behind us
            if segment.points[0].x < 0 or segment.points[1].x < 0:
                continue

            self.filtered_segments.append(segment)
            # only consider points in a certain range from the Duckiebot for the position estimation
            point_range = self.getSegmentDistance(segment)
            if self.range_est > point_range > self.range_est_min:
                segmentsArray.append(segment)
                # print functions to help understand the functionality of the code
                # print 'Adding segment to segmentsRangeArray[0] (Range: %s < 0.3)' % (point_range)
                # print 'Printout of last segment added: %s' % self.getSegmentDistance(segmentsRangeArray[
                # 0][-1])
                # print 'Length of segmentsRangeArray[0] up to now: %s' % len(segmentsRangeArray[0])

        return segmentsArray

    def update(self, segments):
        # prepare the segments for each belief array
        segmentsArray = self.prepareSegments(segments)
        # generate all belief arrays

        measurement_likelihood = self.generate_measurement_likelihood(segmentsArray)

        if measurement_likelihood is not None:
            self.belief = np.multiply(self.belief, measurement_likelihood)
            if np.sum(self.belief) == 0:
                self.belief = measurement_likelihood
            else:
                self.belief /= np.sum(self.belief)

    def generate_measurement_likelihood(self, segments):

        # initialize measurement likelihood to all zeros
        measurement_likelihood = np.zeros(self.d.shape)

        for segment in segments:
            d_i, phi_i, l_i, weight = self.generateVote(segment)

            # if the vote lands outside of the histogram discard it
            if d_i > self.d_max or d_i < self.d_min or phi_i < self.phi_min or phi_i > self.phi_max:
                continue

            i = int(floor((d_i - self.d_min) / self.delta_d))
            j = int(floor((phi_i - self.phi_min) / self.delta_phi))
            measurement_likelihood[i, j] += 1

        if np.linalg.norm(measurement_likelihood) == 0:
            return None
        measurement_likelihood /= np.sum(measurement_likelihood)
        return measurement_likelihood

    def getEstimate(self):
        maxids = np.unravel_index(self.belief.argmax(), self.belief.shape)
        d_max = self.d_min + (maxids[0] + 0.5) * self.delta_d
        phi_max = self.phi_min + (maxids[1] + 0.5) * self.delta_phi

        return [d_max, phi_max]

    def get_estimate(self):
        d, phi = self.getEstimate()
        res = {}
        res["d"] = d
        res["phi"] = phi
        return res

    def getMax(self):
        return self.belief.max()

    # generate a vote for one segment
    def generateVote(self, segment):
        p1 = np.array([segment.points[0].x, segment.points[0].y])
        p2 = np.array([segment.points[1].x, segment.points[1].y])
        t_hat = (p2 - p1) / np.linalg.norm(p2 - p1)

        n_hat = np.array([-t_hat[1], t_hat[0]])
        d1 = np.inner(n_hat, p1)
        d2 = np.inner(n_hat, p2)
        l1 = np.inner(t_hat, p1)
        l2 = np.inner(t_hat, p2)
        if l1 < 0:
            l1 = -l1
        if l2 < 0:
            l2 = -l2

        l_i = (l1 + l2) / 2
        d_i = (d1 + d2) / 2
        phi_i = np.arcsin(t_hat[1])
        if segment.color == segment.WHITE:  # right lane is white
            if p1[0] > p2[0]:  # right edge of white lane
                d_i -= self.linewidth_white
            else:  # left edge of white lane

                d_i = -d_i

                phi_i = -phi_i
            d_i -= self.lanewidth / 2

        elif segment.color == segment.YELLOW:  # left lane is yellow
            if p2[0] > p1[0]:  # left edge of yellow lane
                d_i -= self.linewidth_yellow
                phi_i = -phi_i
            else:  # right edge of white lane
                d_i = -d_i
            d_i = self.lanewidth / 2 - d_i

        # weight = distance
        weight = 1
        return d_i, phi_i, l_i, weight

    def get_inlier_segments(self, segments, d_max, phi_max):
        inlier_segments = []
        for segment in segments:
            d_s, phi_s, l, w = self.generateVote(segment)
            if abs(d_s - d_max) < self.delta_d and abs(phi_s - phi_max) < self.delta_phi:
                inlier_segments.append(segment)
        return inlier_segments

    # get the distance from the center of the Duckiebot to the center point of a segment
    def getSegmentDistance(self, segment):
        x_c = (segment.points[0].x + segment.points[1].x) / 2
        y_c = (segment.points[0].y + segment.points[1].y) / 2
        return sqrt(x_c ** 2 + y_c ** 2)

    def get_plot_phi_d(self, ground_truth=None) -> dtu.NPImageBGR:
        d, phi = self.getEstimate()
        return plot_phi_d_diagram_bgr(self, self.belief, phi=phi, d=d)
