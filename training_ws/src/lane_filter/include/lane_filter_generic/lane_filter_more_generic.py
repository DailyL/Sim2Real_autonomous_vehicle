import math
from collections import defaultdict, namedtuple
from typing import Iterator, List

import numpy as np
from geometry import SE2_from_translation_angle, SO2_from_angle
from numpy.testing.utils import assert_almost_equal
from scipy.stats import entropy

import duckietown_code_utils as dtu
from duckietown_msgs.msg import Segment, SegmentList
from duckietown_segmaps.maps import get_normal_outward_for_segment, SegMapSegment, SegmentsMap
from easy_algo import get_easy_algo_db
from grid_helper import (
    convert_unit,
    grid_helper_annotate_axes,
    grid_helper_mark_point,
    grid_helper_plot_field,
    grid_helper_set_axes,
    GridHelper,
)
from grid_helper.voting_grid import array_as_string_sign, check_no_nans
from lane_filter_interface import LaneFilterInterface
from localization_templates import FAMILY_LOC_TEMPLATES, LocalizationTemplate

__all__ = [
    "LaneFilterMoreGeneric",
]

logger = dtu.logger


class LaneFilterMoreGeneric(dtu.Configurable, LaneFilterInterface):
    """ """

    localization_template: str
    _localization_template: LocalizationTemplate

    variables: dict
    precision: float
    belief: np.ndarray
    optimize: bool
    bounds_theta_deg: List[float]
    F: object
    rep_map: "PNRep"

    def __init__(self, configuration):
        param_names = [
            "localization_template",
            "delta_segment",
            "variables",
            "F",
            "optimize",
            "bounds_theta_deg",
            "precision",
        ]

        dtu.Configurable.__init__(self, param_names, configuration)

        self.grid_helper = GridHelper(dict(self.variables), precision=self.precision)

        self.initialize_belief()
        self.last_segments_used = None

        self.delta_segment = float(self.delta_segment)

    def initialize_belief(self):
        self.belief = self.grid_helper.create_new()

        n = self.belief.shape[0] * self.belief.shape[1]
        self.belief.fill(1.0 / n)

        assert_almost_equal(self.belief.flatten().sum(), 1.0)

    def initialize(self):
        easy_algo_db = get_easy_algo_db()
        self._localization_template = easy_algo_db.create_instance(
            FAMILY_LOC_TEMPLATES, self.localization_template
        )
        self.initialize_belief()

        sm = self._localization_template.get_map()
        self.rep_map = get_compat_representation_map(sm, self.delta_segment)

    def predict(self, dt, v, w):
        pass

    def get_status(self):
        # TODO
        return LaneFilterInterface.GOOD

    def getStatus(self):
        return self.get_status()

    def update(self, segment_list: SegmentList):
        """Returns the likelihood"""

        self.last_segments_used = segment_list.segments

        with dtu.timeit_clock("generating likelihood"):
            if not self.optimize:
                measurement_likelihood = self.generate_measurement_likelihood(segment_list.segments)
            else:
                measurement_likelihood = self.generate_measurement_likelihood_faster(segment_list.segments)
        check_no_nans(measurement_likelihood)
        with dtu.timeit_clock("multiply belief"):
            if measurement_likelihood is not None:
                s_m = np.sum(measurement_likelihood)
                if s_m == 0:
                    logger.warning("flat likelihood - not updating")
                else:

                    self.belief = np.multiply(self.belief, measurement_likelihood)
                    s = np.sum(self.belief)
                    if s == 0:
                        logger.warning("flat belief, just use likelihood")
                        self.belief = measurement_likelihood

                    alpha = 1.0 / s
                    self.belief = self.belief * alpha

        return measurement_likelihood

    def generate_measurement_likelihood_faster(self, segments: List[Segment]):
        with dtu.timeit_clock(f"get_compat_representation_obs ({len(segments)} segments)"):
            rep_obs = get_compat_representation_obs(segments)
            rep_map = self.rep_map

        with dtu.timeit_clock(
            f"generate_votes_faster (map: {len(rep_map.weight)}, obs: {len(rep_obs.weight)})"
        ):
            votes = generate_votes_faster(rep_map, rep_obs)

            if self.bounds_theta_deg is not None:
                weight = votes.weight.copy()
                theta_min = np.deg2rad(self.bounds_theta_deg[0])
                theta_max = np.deg2rad(self.bounds_theta_deg[1])
                num_outside = 0
                for i in range(weight.shape[0]):

                    theta = votes.theta[i]

                    if not (theta_min <= theta <= theta_max):
                        weight[i] = 0
                        num_outside += 1

                # print('Removed %d of %d because outside box' % (num_outside, len(weight)))
                votes = remove_zero_weight(votes._replace(weight=weight))

        with dtu.timeit_clock(f"compute pos iterative ({len(votes.weight)})"):
            locations = self._localization_template.coords_from_position_orientation(votes.p, votes.theta)

            num = len(locations)
            est = np.zeros((2, num))
            for i in range(2):
                v = list(self.variables)[i]
                est[i, :] = locations[v]

        F = self.F

        compare = False

        with dtu.timeit_clock(f"add voting faster ({len(votes.weight)})"):
            measurement_likelihood = self.grid_helper.create_new("float32")
            measurement_likelihood.fill(0)

            if compare:
                counts1 = np.zeros(measurement_likelihood.shape, dtype="int")
            else:
                counts1 = None

            added = self.grid_helper.add_vote_faster(
                measurement_likelihood, est, votes.weight, F=F, counts=counts1
            )

        #             print('Counts (new):\n'  + array_as_string(counts1, lambda x: ' %3d' % x))

        if compare:
            with dtu.timeit_clock("add voting (traditional)"):
                measurement_likelihood_classic = self.grid_helper.create_new("float32")
                measurement_likelihood_classic.fill(0)
                hit = miss = 0
                counts2 = np.zeros(measurement_likelihood.shape, dtype="int")
                for i in range(len(locations)):
                    loc = locations[i]
                    weight = votes.weight[i]
                    value = dict((k, loc[k]) for k in self.variables)

                    added = self.grid_helper.add_vote(
                        measurement_likelihood_classic, value, weight, F=F, counts=counts2
                    )

                    hit += added > 0
                    miss += added == 0

                #             dtu.logger.debug('tradoitional hit: %s miss : %s' % (hit, miss))
                #             print('Counts (old):\n'  + array_as_string(counts2, lambda x: ' %3d' % x))
                #
                diff = measurement_likelihood - measurement_likelihood_classic

                deviation = np.max(np.abs(diff))
                if deviation > 1e-6:
                    s = array_as_string_sign(diff)
                    print(f"max deviation: {deviation}")
                    print(s)

        return measurement_likelihood

    def generate_measurement_likelihood(self, segments: List[Segment]):
        # initialize measurement likelihood to all zeros
        measurement_likelihood = self.grid_helper.create_new("float32")
        measurement_likelihood.fill(0)
        hit = miss = 0

        pose_weight = []

        num_by_color = defaultdict(lambda: 0)

        adjust_by_number = False  # add to configuration

        with dtu.timeit_clock(f"pose gen for {len(segments)} segs"):

            for segment in segments:
                num_by_color[segment.color] += 1

            for segment in segments:
                for pose, weight in self.generate_votes(segment, self.delta_segment):

                    if self.bounds_theta_deg is not None:
                        theta_deg = np.rad2deg(dtu.norm_angle(dtu.geo.angle_from_SE2(pose)))
                        m, M = self.bounds_theta_deg
                        if not (m <= theta_deg < M):
                            continue

                    if adjust_by_number:
                        n = num_by_color[segment.color]
                        weight_adjusted = weight * 1.0 / n
                    else:
                        weight_adjusted = weight
                    pose_weight.append((pose, weight_adjusted))

        values = []
        with dtu.timeit_clock(f"generating coords for {len(pose_weight)} votes"):
            for pose, weight in pose_weight:
                est = self._localization_template.coords_from_pose(pose)
                value = dict((k, float(est[k])) for k in self.variables)
                values.append((value, weight))

        with dtu.timeit_clock(f"add voting for {len(pose_weight)} votes"):
            for value, weight in values:
                #                 if value['dstop'] > 0.3:
                #                     print('value:%s' % value)
                #                 else:
                #                     continue
                added = self.grid_helper.add_vote(measurement_likelihood, value, weight, F=self.F)
                hit += added > 0
                miss += added == 0

        dtu.logger.debug(f"hit: {hit} miss : {miss}")
        if np.linalg.norm(measurement_likelihood) == 0:
            return None

        return measurement_likelihood

    def get_estimate(self):
        # TODO: make F parameter
        return self.grid_helper.get_max_weighted(self.belief, F=1)

    @dtu.deprecated("use get_estimate")
    def getEstimate(self):
        """Returns a list with two elements: (d, phi)"""
        res = self.get_estimate()
        return [res["d"], res["phi"]]

    def getMax(self):
        return self.belief.max()

    def get_entropy(self):
        s = entropy(self.belief.flatten())
        return s

    def generate_votes(self, segment, delta):
        """
        yields xytheta, weight
        """
        p1 = np.array([segment.points[0].x, segment.points[0].y, segment.points[0].z])
        p2 = np.array([segment.points[1].x, segment.points[1].y, segment.points[1].z])
        p_hat = 0.5 * p1 + 0.5 * p2
        d = np.linalg.norm(p1 - p2)
        weight = d
        n_hat = get_normal_outward_for_segment(p2, p1)

        # SegmentsMap
        sm = self._localization_template.get_map()

        num = 0
        for map_segment in sm.segments:
            if map_segment.color == segment.color:
                for p, n in iterate_segment_sections(sm, map_segment, delta):
                    xy, theta = get_estimate(p, n, p_hat, n_hat)
                    pose = SE2_from_translation_angle(xy, theta)
                    yield pose, weight
                    num += 1
        if num == 0:
            msg = f"No segment found for {segment.color}"
            dtu.logger.debug(msg)

    def get_plot_phi_d(
        self, ground_truth=None, bgcolor: dtu.RGBColor8 = dtu.ColorConstants.RGB_DUCKIETOWN_YELLOW
    ):
        facecolor = dtu.matplotlib_01_from_rgb(bgcolor)
        figure_args = dict(facecolor=facecolor)
        a = dtu.CreateImageFromPylab(dpi=120, figure_args=figure_args)

        gh = self.grid_helper
        with a as pylab:
            grid_helper_plot_field(gh, self.belief, pylab)
            grid_helper_annotate_axes(gh, pylab)

            estimate = self.get_estimate()
            if ground_truth is not None:
                ground_truth_location = self._localization_template.coords_from_pose(ground_truth)
                grid_helper_mark_point(gh, pylab, ground_truth_location, color="green", markersize=4)
            grid_helper_mark_point(gh, pylab, estimate, color="magenta", markersize=10)

            s = ""
            s += f"status = {self.get_status()}"
            for name, spec in zip(gh._names, gh._specs):
                convert = lambda x: "%.2f %s" % (
                    convert_unit(x, spec.units, spec.units_display),
                    spec.units_display,
                )
                s += "\n"
                s += f"\nest {name} = {convert(estimate[name])}"
                if ground_truth is not None:
                    s += f"\ntrue {name} = {convert(ground_truth_location[name])}"
                    err = np.abs(ground_truth_location[name] - estimate[name])
                    s += f"\nabs err = {convert(err)}"
                    cell = spec.resolution
                    percent = 100.0 / cell * err
                    s += f"\nrel err = {percent:.1f} % of cell"
                    s += "\n true = green dot"

            s += "\n"
            s += f"\nentropy = {self.get_entropy():.4f}"
            s += f"\nmax = {self.belief.max():.4f}"
            s += f"\nmin = {self.belief.min():.4f}"

            pylab.annotate(s, xy=(0.7, 0.45), xycoords="figure fraction")
            grid_helper_set_axes(gh, pylab)

        return a.get_bgr()


@dtu.contract(delta="float,>0")
def iterate_segment_sections(sm: SegmentsMap, map_segment: SegMapSegment, delta: float) -> Iterator:
    """Yields point, normal"""
    w1 = np.array(sm.points[map_segment.points[0]].coords)
    w2 = np.array(sm.points[map_segment.points[1]].coords)
    dist = np.linalg.norm(w1 - w2)

    if dist == 0:
        msg = f"Could not use degenerate segment (points: {w1} {w2}) "
        raise ValueError(msg)

    map_segment_n = get_normal_outward_for_segment(w1, w2)
    # going from w1 to w2
    dirv = (w2 - w1) / dist
    n = int(np.ceil(dist / delta))

    assert n >= 1
    for i in range(n):
        s = i + 0.5  # take middle of segment
        p = w1 + dirv * delta * s
        yield p, map_segment_n


def get_estimate(t, n, t_est, n_est):
    """Returns xy, theta"""
    # find theta that makes n and n_est rotate
    alpha1 = np.arctan2(n[1], n[0])
    alpha2 = np.arctan2(n_est[1], n_est[0])
    theta = dtu.norm_angle(alpha2 - alpha1)

    R = SO2_from_angle(theta)
    double_check = False
    if double_check:
        #         print('alpha %s %s theta: %s' % (np.rad2deg(alpha1),
        #                                      np.rad2deg(alpha2),
        #                                      np.rad2deg(theta)))
        assert_almost_equal(np.dot(R, n[:2]), n_est[:2])

    t = t[0:2]
    t_est = t_est[0:2]
    xy = t - np.dot(R.T, t_est)

    # verify
    # xy + R(theta) t_est == t
    if double_check:
        #         print('t %s t_est %s xy %s' % (t, t_est, xy))
        assert_almost_equal(xy + np.dot(R.T, t_est), t)

    return xy, -theta


def get_estimate_2(t, n, t_est, n_est):
    """Returns xy, theta"""
    # find theta that makes n and n_est rotate
    C = n[0] * n_est[0] + n[1] * n_est[1]
    S = n[0] * n_est[1] - n[1] * n_est[0]

    # R' = C S
    #     -S C

    xy0 = t[0] - C * t_est[0] - S * t_est[1]
    xy1 = t[1] + S * t_est[0] - C * t_est[1]
    xy = np.array([xy0, xy1])

    theta = -math.acos(C) * np.sign(S)

    return xy, theta


PNRep = namedtuple("PNRep", "t n color weight")


def get_compat_representation_map(sm: SegmentsMap, delta_segment) -> PNRep:
    sections = []

    for map_segment in sm.segments:
        for p, n in iterate_segment_sections(sm, map_segment, delta_segment):
            sections.append((map_segment.color, p, n))
    n = len(sections)
    C = np.empty(shape=n, dtype="uint8")
    T = np.empty(shape=(2, n), dtype="float32")
    N = np.empty(shape=(2, n), dtype="float32")
    W = np.empty(shape=n, dtype="float32")
    for i, (col, p, n) in enumerate(sections):
        C[i] = col
        T[0, i] = p[0]
        T[1, i] = p[1]
        N[0, i] = n[0]
        N[1, i] = n[1]
        W[i] = 1

    C.flags.writeable = False
    T.flags.writeable = False
    N.flags.writeable = False
    W.flags.writeable = False

    return PNRep(t=T, color=C, n=N, weight=W)


def get_compat_representation_obs(segments, precision="float32"):
    num = len(segments)
    C = np.empty(shape=num, dtype="uint8")  # color
    T = np.empty(shape=(2, num), dtype=precision)  # position
    N = np.empty(shape=(2, num), dtype=precision)  # normal
    W = np.empty(shape=num, dtype=precision)  # weight

    for i in range(num):
        segment = segments[i]
        points = segment.points
        color = segment.color

        p1 = np.array((points[0].x, points[0].y))
        p2 = np.array((points[1].x, points[1].y))
        p_hat = p1 * 0.5 + p2 * 0.5

        diff = p1 - p2
        distance = np.hypot(diff[0], diff[1])

        weight = distance

        C[i] = color
        T[0, i] = p_hat[0]
        T[1, i] = p_hat[1]
        N[0, i] = +diff[1] / distance
        N[1, i] = -diff[0] / distance
        W[i] = weight

        if False:
            diffn = diff / distance
            n_hat = np.array((diffn[1], -diffn[0], 0))
            n_hat_slow = get_normal_outward_for_segment(p2, p1)
            assert_almost_equal(n_hat, n_hat_slow)

            assert segment.points[0].z == 0
            assert segment.points[1].z == 0

    C.flags.writeable = False
    T.flags.writeable = False
    N.flags.writeable = False
    W.flags.writeable = False

    return PNRep(t=T, color=C, n=N, weight=W)


PNVotes = namedtuple("PNVotes", "p theta weight")


def generate_votes_faster(rep_map, rep_obs, precision="float32"):
    num_map = len(rep_map.color)
    num_obs = len(rep_obs.color)
    max_votes = num_map * num_obs
    vote_p = np.zeros(dtype=precision, shape=(2, max_votes))
    vote_theta = np.zeros(dtype=precision, shape=max_votes)
    vote_weight = np.zeros(dtype=precision, shape=max_votes)
    k = 0

    for i in range(num_map):
        c1 = rep_map.color[i]
        w1 = rep_map.weight[i]
        t0, t1 = rep_map.t[:, i]
        n0, n1 = rep_map.n[:, i]

        for j in range(num_obs):
            c2 = rep_obs.color[j]

            if c2 != c1:
                vote_weight[k] = 0
                vote_theta[k] = np.nan
                vote_p[0, k] = np.nan
                vote_p[1, k] = np.nan

            else:
                w2 = rep_obs.weight[j]
                W = w1 * w2

                t_est0, t_est1 = rep_obs.t[:, j]
                n_est0, n_est1 = rep_obs.n[:, j]

                C = n0 * n_est0 + n1 * n_est1
                S = n0 * n_est1 - n1 * n_est0

                xy0 = t0 - C * t_est0 - S * t_est1
                xy1 = t1 + S * t_est0 - C * t_est1

                C = min(C, 1)  # compensate imprecision or acos(C) fails

                theta = -math.acos(C) * np.sign(S)

                vote_theta[k] = theta
                vote_weight[k] = W
                vote_p[0, k] = xy0
                vote_p[1, k] = xy1

            k += 1

    res = PNVotes(p=vote_p, theta=vote_theta, weight=vote_weight)
    return remove_zero_weight(res)


def remove_zero_weight(pnvotes):
    nonzeros = pnvotes.weight > 0

    vote_p = pnvotes.p[:, nonzeros]
    vote_theta = pnvotes.theta[nonzeros]
    vote_weight = pnvotes.weight[nonzeros]

    vote_p.flags.writeable = False
    vote_theta.flags.writeable = False
    vote_weight.flags.writeable = False

    return PNVotes(p=vote_p, theta=vote_theta, weight=vote_weight)
