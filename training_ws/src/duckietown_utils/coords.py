import numpy as np
from .contracts_ import contract

__all__ = [
    'norm_angle',
    'norm_angle_v',
    'm_from_in',
]

# meters from inches
m_from_in = lambda x: x * 0.0254


def norm_angle(theta):
    if np.isinf(theta) or np.isnan(theta):
        msg = 'Invalid value for theta: %s' % theta
        raise ValueError(msg)

    while theta < -np.pi:
        theta += np.pi * 2

    while theta > +np.pi:
        theta -= np.pi * 2

    assert -np.pi <= theta <= +np.pi

    return theta


@contract(theta='array[N]', returns='array[N]')
def norm_angle_v(theta):
    """ Normalizes a vector of thetas such that all entries are in [-pi,pi] """
    pi = np.pi
    closest = np.round(theta / (2 * pi))
    theta2 = theta - closest * 2 * pi

    if False:
        for t in theta2:
            assert -pi <= t <= +pi

    return theta

