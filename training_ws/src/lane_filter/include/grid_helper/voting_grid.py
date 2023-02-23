import itertools
from dataclasses import dataclass, replace
from typing import Dict, List, Tuple

import numpy as np

import duckietown_code_utils as dtu

__all__ = [
    "GridHelper",
    "VotingGridVarSpec",
    "array_as_string",
    "array_as_string_sign",
]


@dataclass
class VotingGridVarSpec:  # XXX: need to add types
    min: float
    max: float
    resolution: float
    description: object
    units: object
    units_display: object


class GridHelper:
    """
    This class abstracts the task of creating a grid that
    is used for voting.
    """

    _names: List[str]
    _specs: List[VotingGridVarSpec]
    _mgrids_plus: List

    def __init__(self, variables: Dict[str, Dict], precision="float32"):
        self.precision = precision
        dtu.check_isinstance(variables, dict)
        if len(variables) != 2:
            msg = f"I can only deal with 2 variables, obtained {variables}"
            raise ValueError(msg)

        self._names = list(variables)
        self._specs = [spec_from_yaml(variables[_]) for _ in self._names]

        s0 = self._specs[0]
        s1 = self._specs[1]
        self._mgrids = list(np.mgrid[s0.min : s0.max : s0.resolution, s1.min : s1.max : s1.resolution])

        for a in [0, 1]:
            new_max = self._specs[a].min + self._mgrids[a].shape[a] * self._specs[a].resolution
            self._specs[a] = replace(self._specs[a], max=new_max)

        H, W = self.shape = self._mgrids[0].shape
        self._centers = [np.zeros(shape=(H, W)), np.zeros(shape=(H, W))]

        for i, j in itertools.product(list(range(H)), list(range(W))):
            self._centers[0][i, j] = s0.min + (i + 0.5) * s0.resolution
            self._centers[1][i, j] = s1.min + (j + 0.5) * s1.resolution

        # these are the bounds you would give to pcolor
        # there is one row and one column more
        # self.d, self.phi are the lower corners

        # Each cell captures this area:
        #         (X[i,   j],   Y[i,   j]),
        #         (X[i,   j+1], Y[i,   j+1]),
        #         (X[i+1, j],   Y[i+1, j]),
        #         (X[i+1, j+1], Y[i+1, j+1])
        self._mgrids_plus = list(
            np.mgrid[
                s0.min : s0.max + s0.resolution : s0.resolution,
                s1.min : s1.max + s1.resolution : s1.resolution,
            ]
        )

        k0_o_sigma = 1.0 / self._specs[0].resolution

        def K0(x):
            d = x * k0_o_sigma
            d2 = d * d
            return np.exp(-d2)

        k1_o_sigma = 1.0 / self._specs[1].resolution

        def K1(x):
            d = x * k1_o_sigma
            d2 = d * d
            return np.exp(-d2)

        self.K0 = K0
        self.K1 = K1
        # self.K0 = lambda x: gaussian_kernel(x, self._specs[0].resolution)

    #         self.K1 = lambda x: gaussian_kernel(x, self._specs[1].resolution)

    #         self.K0 = lambda x: x*0 + 2.0
    #         self.K1 = lambda x: x*0 + 2.0

    def get_shape(self) -> Tuple[int, int]:
        """Returns the shape of the grid"""
        return self.shape

    def create_new(self, dtype="float64") -> np.ndarray:
        """Creates a new numpy array of compatible dimensions, set to NaN"""
        res = np.zeros(shape=self.shape, dtype=dtype)
        res.fill(np.nan)
        return res

    @dtu.contract(target="array", value="dict")
    def add_vote(self, target: np.ndarray, value, weight, F, counts=None):
        """Returns 1 if hit, otherwise 0.

        value = dict(phi=2,d=3)
        weight = 1
        hit = x.add_vote(grid, value, weight)
        """

        values = [value[_] for _ in self._names]

        coords = [None, None]  # i, j
        for a in range(2):
            spec = self._specs[a]

            x = (values[a] - spec.min) / spec.resolution
            coords[a] = int(np.floor(x))

        H, W = self.shape

        i, j = coords

        targets = []
        weights = []
        for di, dj in itertools.product(list(range(-F, F + 1)), list(range(-F, F + 1))):
            u = i + di
            v = j + dj

            v0_cell = self._specs[0].min + (u + 0.5) * self._specs[0].resolution
            v1_cell = self._specs[1].min + (v + 0.5) * self._specs[1].resolution
            v0_delta = values[0] - v0_cell
            v1_delta = values[1] - v1_cell

            k = self.K0(v0_delta) * self.K1(v1_delta)

            weight_k = weight * k

            if (0 <= u < H) and (0 <= v < W):
                targets.append((u, v))

            weights.append(weight_k)

        if weights:
            total_weight = sum(weights)

            for (u, v), weight in zip(targets, weights):
                weight_k = weight / total_weight
                target[u, v] += weight_k
                if counts is not None:
                    counts[u, v] += 1

        return len(targets)

    def multiply(self, values, weights, F):
        N = values.shape[1]

        factor = {0: 1, 1: 9, 2: 25}[F]
        M = N * factor
        values2 = np.empty(shape=(2, M), dtype=self.precision)
        weights2 = np.empty(shape=M, dtype=self.precision)
        values_ref2 = np.empty(shape=(2, M), dtype=self.precision)
        group = np.empty(shape=M, dtype="int16")

        cell_size_0 = self._specs[0].resolution
        cell_size_1 = self._specs[1].resolution

        nd = 0

        for k, (di, dj) in enumerate(itertools.product(list(range(-F, F + 1)), list(range(-F, F + 1)))):
            off = N * k
            # same value ref
            values_ref2[:, off : off + N] = values
            weights2[off : off + N] = weights
            values2[:, off : off + N] = values
            values2[0, off : off + N] += di * cell_size_0
            values2[1, off : off + N] += dj * cell_size_1

            #             print('di %s %s  diffco \n%s\n%s' %(di, dj,
            #                                                 values2[0, off:off+N] - values_ref2[0,
            #                                                 off:off+N],
            #                                                 values2[1, off:off+N] - values_ref2[1,
            #                                                 off:off+N]  ))
            group[off : off + N] = np.array(list(range(N)))
            nd += 1

        assert nd == factor
        return factor, values_ref2, values2, weights2, group

    @dtu.contract(target="array", values="array[2xN]", weights="array[N]")
    def add_vote_faster(self, target, values, weights, F=1, counts=None):

        with dtu.timeit_clock(f"adding additional votes (orig: {values.shape[1]})"):
            _factor, values_ref, values, weights, group = self.multiply(values, weights, F)

        #         cells_in_group = np.zeros(len(group))
        #         for i in range(len(group)):
        #             cells_in_group[group[i]] += 1
        #         print('cells_in_group: %s' % cells_in_group)

        #         diff = values - values_ref
        #         for a in [0,1]:
        #             print('diff %s min %s max %s res %s' % (a, np.min(diff[a,:]), np.max(diff[a,:]),
        #                                                     self._specs[a].resolution))

        with dtu.timeit_clock(f"computing coordinates (nvalid = {values.shape[1]})"):

            nvalid = values.shape[1]

            coords = np.zeros((2, nvalid), dtype="int32")
            K = [self.K0, self.K1]

            for a in range(2):
                spec = self._specs[a]
                inv_resolution = 1.0 / spec.resolution
                x = (values[a, :] - spec.min) * inv_resolution

                #             print('values[%d] = %s' % (a, values[a, :]))
                #             print('x = %s' % x)
                coords[a, :] = np.floor(x)
                #             print('coords[%d] = %s' % (a, coords[a, :]))
                xr = (values_ref[a, :] - spec.min) * inv_resolution

                dc = xr - (coords[a, :] + 0.5)

                #             print('dc[%d] = %s' % (a, dc))
                dr = dc * spec.resolution

                k = 1
                k = K[a](dr)

                weights *= k

        if nvalid == 0:
            return 0

        with dtu.timeit_clock("normalizing weights"):

            ngroups = np.max(group) + 1

            weight_group = np.zeros(ngroups)
            if False:
                for i in range(len(weights)):
                    weight_group[group[i]] += weights[i]
            else:
                np.add.at(weight_group, group, weights)

            assert len(weights) == nvalid
            weights_normalized = weights / weight_group[group]

        with dtu.timeit_clock(f"selecting valid (using {values.shape[1]})"):
            AND = np.logical_and
            inside0 = AND(self._specs[0].min <= values[0, :], values[0, :] <= self._specs[0].max)
            inside1 = AND(self._specs[1].min <= values[1, :], values[1, :] <= self._specs[1].max)
            inside = AND(inside0, inside1)
            #         hits = np.sum(inside)
            #         misses = len(inside) - hits
            #         print('num hit: %s (eq %d)  misses %s (eq %d) ' % (hits, hits/_factor, misses,
            #         misses/_factor))

            # only consider inside
            values = values[:, inside]
            values_ref = values_ref[:, inside]
            weights = weights[inside]
            weights_normalized = weights_normalized[inside]
            group = group[inside]

            coords = coords[:, inside]

        with dtu.timeit_clock("using numpy.at"):
            np.add.at(target, tuple(coords), weights_normalized)

        if counts is not None:
            with dtu.timeit_clock("update counts"):
                for i in range(nvalid):
                    counts[coords[0, i], coords[1, i]] += 1

        return nvalid

    def get_max(self, target):
        """Returns a dictionary"""
        assert self.shape == target.shape
        amax = target.argmax()
        check_no_nans(target)
        maxids = np.unravel_index(amax, target.shape)
        i, j = maxids
        d = {}
        d[self._names[0]] = self._centers[0][i, j]
        d[self._names[1]] = self._centers[1][i, j]
        return d

    def get_max_weighted(self, target, F=1):
        assert self.shape == target.shape
        check_no_nans(target)
        amax = target.argmax()
        maxids = np.unravel_index(amax, target.shape)
        i, j = maxids
        H, W = self.shape
        v0 = []
        v1 = []
        weights = []

        for di, dj in itertools.product(list(range(-F, F + 1)), list(range(-F, F + 1))):
            u = i + di
            v = j + dj

            if not ((0 <= u < H) and (0 <= v < W)):
                continue

            v0.append(self._centers[0][u, v])
            v1.append(self._centers[1][u, v])
            weights.append(target[u, v])

        v0 = np.array(v0)
        v1 = np.array(v1)
        s = np.sum(weights)
        mean0 = np.sum(v0 * weights) / s
        mean1 = np.sum(v1 * weights) / s

        d = {}
        d[self._names[0]] = mean0
        d[self._names[1]] = mean1
        return d


def gaussian_kernel(x, sigma):
    d = x / sigma
    return np.exp(-np.power(d, 2))


def spec_from_yaml(spec):
    vmin = spec["min"]
    vmax = spec["max"]
    resolution = spec["resolution"]
    description = spec["description"]
    units = spec["units"]
    units_display = spec.get("units_display", units)

    return VotingGridVarSpec(
        min=vmin,
        max=vmax,
        resolution=resolution,
        description=description,
        units=units,
        units_display=units_display,
    )


def check_no_nans(target):
    if np.any(np.isnan(target)):
        msg = "I found some NaNs"
        msg += "\n" + str(target)
        raise ValueError(msg)


def array_as_string(a, v2s):
    s = ""
    for i in range(a.shape[0]):
        s += "["
        for j in range(a.shape[1]):
            c = v2s(a[i, j])
            s += c
        s += "]\n"
    return s


def array_as_string_sign(a):
    def w(x):
        if x > 0:
            return "+"
        elif x < 0:
            return "-"
        else:
            return " "

    return array_as_string(a, w)
