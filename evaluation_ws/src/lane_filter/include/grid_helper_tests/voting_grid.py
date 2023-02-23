import os

import numpy as np
from numpy.testing.utils import assert_almost_equal, assert_equal

import duckietown_code_utils as dtu
from grid_helper.grid_helper_visualization import (
    grid_helper_annotate_axes,
    grid_helper_mark_point,
    grid_helper_plot,
    grid_helper_plot_field,
)
from grid_helper.voting_grid import GridHelper


@dtu.unit_test
def grid1():
    resolutions = [0.1, 0.2]
    variables = {}
    variables["x"] = dict(
        min=1, max=2, description="X variable", resolution=resolutions[0], units="m", units_display="cm"
    )
    variables["y"] = dict(
        min=3, max=5, description="Y variable", resolution=resolutions[1], units="m", units_display="cm"
    )
    gh = GridHelper(variables)
    shape = gh.get_shape()

    assert_equal(shape, (10, 10))
    i = 5
    j = 7

    for a in [0, 1]:
        delta = gh._centers[a][i, j] - gh._mgrids[a][i, j]
        assert_almost_equal(delta, resolutions[a] / 2)

    # _mgrids_plus is the same as _mgrids except that there is one more row/col
    assert gh._mgrids_plus[0][i, j] == gh._mgrids[0][i, j]
    assert_equal(gh._mgrids_plus[0].shape, (shape[0] + 1, shape[1] + 1))


@dtu.unit_test
def grid_visualization():
    variables = {}
    variables["alpha"] = dict(
        min=-np.pi / 2,
        max=np.pi / 2,
        description="angle",
        resolution=np.deg2rad(10),
        units="rad",
        units_display="deg",
    )
    variables["r"] = dict(min=3, max=5, description="distance", resolution=0.1, units="m", units_display="cm")
    gh = GridHelper(variables)
    val = gh.create_new()
    val.fill(0)
    val += np.random.randn(*val.shape)

    val[1, 2] = 0
    d = grid_helper_plot(gh, val)
    od = dtu.get_output_dir_for_test()
    fn = os.path.join(od, "grid_visualization.jpg")
    dtu.write_data_to_file(d.get_png(), fn)


@dtu.unit_test
def voting_kernel1():
    resolution = 10.0
    variables = {}
    variables["x"] = dict(
        min=100, max=500, description="x", resolution=resolution, units="cm", units_display="cm"
    )
    variables["y"] = dict(
        min=100, max=500, description="y", resolution=resolution, units="cm", units_display="cm"
    )
    gh = GridHelper(variables)
    votes = gh.create_new()
    votes.fill(0)

    points = []
    estimated = []
    estimated_weighted = []

    F = 1

    N = 25
    errors_x = []
    errors_x_w = []
    for i in range(N):
        dx = resolution / N
        Dy = 70
        Dx = 70
        u = i / 5
        v = i % 5

        x = 125 + dx * i + Dx * u
        y = 127 + Dy * v
        p = dict(x=x, y=y)
        points.append(p)
        weight = 1
        gh.add_vote(votes, p, weight=weight, F=F)

        tmp = gh.create_new()
        tmp.fill(0)

        gh.add_vote(tmp, p, weight=weight, F=F)
        assert_almost_equal(tmp.sum(), weight)
        estimate = gh.get_max(tmp)
        estimated.append(estimate)
        estimate_weigthed = gh.get_max_weighted(tmp, F=F)
        estimated_weighted.append(estimate_weigthed)

        errors_x.append(p["x"] - estimate["x"])
        errors_x_w.append(p["x"] - estimate_weigthed["x"])

    errors_x = np.array(errors_x)
    errors_x_w = np.array(errors_x_w)
    dtu.logger.debug(f"errors_x: {errors_x}")
    dtu.logger.debug(f"mean: {np.abs(errors_x).mean()}")
    dtu.logger.debug(f"errors_x_w: {errors_x_w}")
    dtu.logger.debug(f"mean: {np.abs(errors_x_w).mean()}")

    assert errors_x.max() <= +resolution / 2
    assert errors_x.min() >= -resolution / 2
    assert np.abs(errors_x_w).max() <= resolution / 10

    a = dtu.CreateImageFromPylab(dpi=1000)
    with a as pylab:
        grid_helper_plot_field(gh, votes, pylab)
        pylab.axis("equal")
        grid_helper_annotate_axes(gh, pylab)
        for p in points:
            grid_helper_mark_point(gh, pylab, p, color="blue", markersize=4)
        for e in estimated:
            grid_helper_mark_point(gh, pylab, e, color="red", markersize=3)
        for e in estimated_weighted:
            grid_helper_mark_point(gh, pylab, e, color="green", markersize=3)

    b = dtu.CreateImageFromPylab(dpi=1000)
    with b as pylab:
        x = np.array([_["x"] for _ in points])
        xe = np.array([_["x"] for _ in estimated])
        xew = np.array([_["x"] for _ in estimated_weighted])

        xe -= x
        xew -= x
        x = x * 0  # XXX?

        pylab.plot(x, ".", label="x")
        pylab.plot(xe, ".", label="x estimated")
        pylab.plot(xew, ".", label="x estimated weighted")
        pylab.legend()

    od = dtu.get_output_dir_for_test()
    fn = os.path.join(od, "voting_kernel1.jpg")
    dtu.write_data_to_file(a.get_png(), fn)
    fn = os.path.join(od, "errors.jpg")
    dtu.write_data_to_file(b.get_png(), fn)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
