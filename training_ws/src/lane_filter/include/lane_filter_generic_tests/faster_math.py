import numpy as np
from numpy.testing.utils import assert_almost_equal

import duckietown_code_utils as dtu
from lane_filter_generic.lane_filter_more_generic import get_estimate, get_estimate_2


@dtu.unit_test
def test_faster_math():
    for _ in range(10):
        alpha1 = np.random.randn()
        alpha2 = np.random.randn()
        t = np.random.rand(3)
        t_est = np.random.rand(3)

        n = np.array([np.cos(alpha1), np.sin(alpha1)])
        n_est = np.array([np.cos(alpha2), np.sin(alpha2)])

        xy1, theta1 = get_estimate(t, n, t_est, n_est)
        xy2, theta2 = get_estimate_2(t, n, t_est, n_est)

        assert_almost_equal(xy1, xy2)
        assert_almost_equal(theta1, theta2)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
