from math import floor

import numpy as np
from numpy.testing.utils import assert_almost_equal
from scipy.ndimage.filters import gaussian_filter
from scipy.stats import entropy, multivariate_normal

import duckietown_code_utils as dtu
from duckietown_msgs.msg import SegmentList
from lane_filter_interface import LaneFilterInterface
from .visualization import plot_phi_d_diagram_bgr

__all__ = [
    "LaneFilterClassic",
]


class LaneFilterClassic(dtu.Configurable, LaneFilterInterface):
    """"""

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

    def __init__(self, configuration):
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
        ]

        dtu.Configurable.__init__(self, param_names, configuration)

        self.d, self.phi = np.mgrid[
            self.d_min : self.d_max : self.delta_d, self.phi_min : self.phi_max : self.delta_phi
        ]
        # these are the bounds you would give to pcolor
        # there is one row and one column more
        # self.d, self.phi are the lower corners

        # Each cell captures this area:
        #         (X[i,   j],   Y[i,   j]),
        #         (X[i,   j+1], Y[i,   j+1]),
        #         (X[i+1, j],   Y[i+1, j]),
        #         (X[i+1, j+1], Y[i+1, j+1])
        self.d_pcolor, self.phi_pcolor = np.mgrid[
            self.d_min : (self.d_max + self.delta_d) : self.delta_d,
            self.phi_min : (self.phi_max + self.delta_phi) : self.delta_phi,
        ]

        self.belief = np.empty(self.d.shape)
        self.mean_0 = [self.mean_d_0, self.mean_phi_0]
        self.cov_0 = [[self.sigma_d_0, 0], [0, self.sigma_phi_0]]
        self.cov_mask = [self.sigma_d_mask, self.sigma_phi_mask]

        self.last_segments_used = None

        self.initialize()

    def getStatus(self):
        return LaneFilterInterface.GOOD

    def initialize(self):
        pos = np.empty(self.d.shape + (2,))
        pos[:, :, 0] = self.d
        pos[:, :, 1] = self.phi
        # XXX: statement with no effect
        # self.cov_0
        RV = multivariate_normal(self.mean_0, self.cov_0)

        n = pos.shape[0] * pos.shape[1]

        gaussian = RV.pdf(pos) * 0.5  # + 0.5/n

        gaussian = gaussian / np.sum(gaussian.flatten())

        uniform = np.ones(dtype="float32", shape=self.d.shape) * (1.0 / n)

        a = 0.01
        self.belief = a * gaussian + (1 - a) * uniform

        assert_almost_equal(self.belief.flatten().sum(), 1.0)

    def predict(self, dt, v, w):
        delta_t = dt
        d_t = self.d + v * delta_t * np.sin(self.phi)
        phi_t = self.phi + w * delta_t

        p_belief = np.zeros(self.belief.shape, dtype="float32")

        # there has got to be a better/cleaner way to do this - just applying
        # the process model to translate each cell value
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

        s_belief = np.zeros(self.belief.shape, dtype="float32")
        gaussian_filter(p_belief, self.cov_mask, output=s_belief, mode="constant")

        if np.sum(s_belief) == 0:
            # TODO: ok, what happens now? (@liam)
            return

        self.belief = s_belief / np.sum(s_belief)

    def get_status(self):
        # TODO: Detect abnormal states (@liam)
        return LaneFilterInterface.GOOD

    def update(self, segments):
        """Returns the likelihood"""
        self.last_segments_used = segments

        measurement_likelihood = self.generate_measurement_likelihood(segments)
        if measurement_likelihood is not None:
            self.belief = np.multiply(self.belief, measurement_likelihood)
            if np.sum(self.belief) == 0:
                self.belief = measurement_likelihood
            else:
                self.belief = self.belief / np.sum(self.belief)

        return measurement_likelihood

    @dtu.contract(segment_list=SegmentList)
    def generate_measurement_likelihood(self, segment_list):
        segments = segment_list.segments
        # initialize measurement likelihood to all zeros
        measurement_likelihood = np.zeros(self.d.shape, dtype="float32")
        for segment in segments:
            # we don't care about RED ones for now
            if segment.color != segment.WHITE and segment.color != segment.YELLOW:
                continue
            # filter out any segments that are behind us
            if segment.points[0].x < 0 or segment.points[1].x < 0:
                continue
            d_i, phi_i, _l_i, weight = self.generateVote(segment)
            # if the vote lands outside of the histogram discard it
            if d_i > self.d_max or d_i < self.d_min or phi_i < self.phi_min or phi_i > self.phi_max:
                continue
            i = int(floor((d_i - self.d_min) / self.delta_d))
            j = int(floor((phi_i - self.phi_min) / self.delta_phi))
            measurement_likelihood[i, j] += weight
        if np.linalg.norm(measurement_likelihood) == 0:
            return None
        measurement_likelihood /= np.sum(measurement_likelihood)
        return measurement_likelihood

    def get_estimate(self):
        maxids = np.unravel_index(self.belief.argmax(), self.belief.shape)

        # add 0.5 because we want the center of the cell
        d_max = self.d_min + (maxids[0] + 0.5) * self.delta_d
        phi_max = self.phi_min + (maxids[1] + 0.5) * self.delta_phi

        res = {}
        res["d"] = d_max
        res["phi"] = phi_max
        return res

    def getEstimate(self):
        """Returns a list with two elements: (d, phi)"""
        res = self.get_estimate()
        return [res["d"], res["phi"]]

    def getMax(self):
        return self.belief.max()

    def get_entropy(self):
        s = entropy(self.belief.flatten())
        return s

    def generateVote(self, segment):
        """

        return d_i, phi_i, l_i, weight

        XXX: What is l_i?
        """
        p1 = np.array([segment.points[0].x, segment.points[0].y])
        p2 = np.array([segment.points[1].x, segment.points[1].y])
        distance = np.linalg.norm(p2 - p1)
        t_hat = (p2 - p1) / distance
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

    def get_plot_phi_d(self, ground_truth=None) -> dtu.NPImageBGR:
        est = self.get_estimate()
        return plot_phi_d_diagram_bgr(self, self.belief, phi=est["phi"], d=est["d"])
