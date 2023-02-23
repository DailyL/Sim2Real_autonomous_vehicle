import numpy as np
import duckietown_code_utils as dtu
from numpy.testing.utils import assert_almost_equal
from lane_filter_generic.lane_filter_more_generic import get_estimate


@dtu.unit_test
def test_relation1():
    t = np.array([10, 0, 0])
    n = np.array([-1, 0, 0])

    t_est = t
    n_est = n

    xy, theta = get_estimate(t, n, t_est, n_est)

    assert_almost_equal(xy, [0, 0])
    assert_almost_equal(theta, 0)


@dtu.unit_test
def test_relation2():
    t = np.array([10, 0, 0])
    n = np.array([-1, 0, 0])

    # I see it at 3
    t_est = np.array([3, 0, 0])
    n_est = n

    xy, theta = get_estimate(t, n, t_est, n_est)

    assert_almost_equal(xy, [7, 0])
    assert_almost_equal(theta, 0)


@dtu.unit_test
def test_relation3():
    #               observer
    #                 v
    #
    #    *          <-|

    t = np.array([10, 0, 0])
    n = np.array([-1, 0, 0])

    # I see it at 3, pointing to my right (negative y)
    t_est = np.array([3, 0, 0])
    n_est = np.array([0, -1, 0])

    xy, theta = get_estimate(t, n, t_est, n_est)

    assert_almost_equal(xy, [10, 3])
    assert_almost_equal(theta, -np.pi / 2)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
