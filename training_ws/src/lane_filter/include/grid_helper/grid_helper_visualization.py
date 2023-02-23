import duckietown_code_utils as dtu
import numpy as np
from reprep.graphics.filter_scale import scale
import numpy.ma as ma

from .voting_grid import GridHelper


def grid_helper_plot(grid_helper, belief, truth=None, estimate=None):
    a = dtu.CreateImageFromPylab(dpi=120)

    with a as pylab:
        grid_helper_plot_field(grid_helper, belief, pylab)
        #         pylab.axis('equal')
        grid_helper_annotate_axes(grid_helper, pylab)
    return a


def grid_helper_plot_field(grid_helper, field, pylab):
    """
    Plots the field

    values

    """
    field = field.copy()
    # note transpose
    zeros = field == 0

    field[zeros] = np.nan

    image = scale(field, min_value=0)
    z = image[:, :, 0]  # just R component
    x = grid_helper._mgrids_plus[0]
    y = grid_helper._mgrids_plus[1]

    s0 = grid_helper._specs[0]
    s1 = grid_helper._specs[1]
    x = convert_unit(x, s0.units, s0.units_display)
    y = convert_unit(y, s1.units, s1.units_display)
    z = ma.masked_array(z, zeros)
    pylab.pcolor(x, y, np.ones(z.shape), cmap="Pastel1")
    pylab.pcolor(x, y, z, cmap="gray")


#         pylab.plot(f_d(d), f_phi(phi), 'go', markersize=20,
#                    markeredgecolor='magenta',
#                    markeredgewidth=3,
#                    markerfacecolor='none')
#
#         pylab.plot(f_d(d), f_phi(phi), 'o', markersize=2,
#                    markeredgecolor='none',
#                    markeredgewidth=0,
#                    markerfacecolor='magenta')
#
#         if phi_true is not None:
#             pylab.plot(f_d(d_true), f_phi(phi_true), 'go', markersize=10,
#                        markeredgecolor='green',
#                        markeredgewidth=3,
#                        markerfacecolor='none')
#
#             pylab.plot(f_d(d_true), f_phi(phi_true), 'o', markersize=2,
#                        markeredgecolor='none',
#                        markeredgewidth=0,
#                        markerfacecolor='green')
#
#         pylab.plot([0, 0], [f_phi(phi_min), f_phi(phi_max)], 'k--')
#
#         s = ''
#         s += "status = %s" % lane_filter.get_status()
#         s += "\nphi = %.1f deg" % f_phi(phi)
#         s += "\nd = %.1f cm" % f_d(d)
#         s += "\nentropy = %.4f" % lane_filter.get_entropy()
#         s += "\nmax = %.4f" % lane_filter.belief.max()
#         s += "\nmin = %.4f" % lane_filter.belief.min()
#         if phi_true is not None:
#             s += "\nphi_true = %.1f deg" % f_phi(phi_true)
#             s += "\nd_true = %.1f cm" % f_d(d_true)
#
#         pylab.annotate(s, xy=(0.7, 0.35), xycoords='figure fraction')
#
#         y = f_phi(phi_max) - 10
#         args = dict( rotation=-90, color='white')
#         pylab.annotate("in middle of right lane", xy=(0,y), **args)
# #         pylab.annotate("on right white tape", xy=(-W,y), **args)
# #         pylab.annotate("on left yellow tape", xy=(+W,y), **args)
# #         pylab.annotate("in other lane", xy=(+W*1.3,y), **args)


def convert_unit(value, unit, to_unit):
    if unit == to_unit:
        return value

    multipliers = {}

    def one_a_is(x, y, v):
        multipliers[(x, y)] = v
        multipliers[(y, x)] = 1.0 / v

    one_a_is("m", "cm", 100)
    one_a_is("deg", "rad", np.deg2rad(1))

    key = (unit, to_unit)
    if not key in multipliers:
        msg = f"Conversion between {unit} and {to_unit}"
        raise NotImplementedError(msg)
    return multipliers[key] * value


def friendly_value(spec, value):
    converted = convert_unit(value, spec.units, spec.units_display)
    return f"{converted:.2f} {spec.units_display}"


def friendly_resolution(spec):
    return friendly_value(spec, spec.resolution)


def grid_helper_display_coords_from_value(grid_helper, point):
    """
    point = dict-like object
    """
    coords = []
    for a in range(2):
        spec = grid_helper._specs[a]
        name = grid_helper._names[a]
        value = point[name]
        conv = convert_unit(value, spec.units, spec.units_display)
        coords.append(conv)
    return coords


def grid_helper_set_axes(grid_helper, pylab):
    vmin = dict([(name, _.min) for name, _ in zip(grid_helper._names, grid_helper._specs)])
    vmax = dict([(name, _.max) for name, _ in zip(grid_helper._names, grid_helper._specs)])
    #     vmax = [_.max for _ in grid_helper._specs]
    cmin = grid_helper_display_coords_from_value(grid_helper, vmin)
    cmax = grid_helper_display_coords_from_value(grid_helper, vmax)

    pylab.axis([cmin[0], cmax[0], cmin[1], cmax[1]])


def grid_helper_mark_point(grid_helper, pylab, point, color, markersize):
    """
    point = dict-like object like dict(phi=..,d=...)
    """
    markersize = float(markersize)

    coords = grid_helper_display_coords_from_value(grid_helper, point)

    pylab.plot(
        coords[0],
        coords[1],
        "o",
        markersize=markersize,
        markeredgecolor=color,
        markeredgewidth=markersize / 4,
        markerfacecolor="none",
    )

    pylab.plot(
        coords[0],
        coords[1],
        "o",
        markeredgecolor="none",
        markersize=markersize / 6,
        markeredgewidth=0,
        markerfacecolor=color,
    )


def grid_helper_annotate_axes(grid_helper: GridHelper, pylab):
    #     pylab.axis([f_d(d_min), f_d(d_max), f_phi(phi_min), f_phi(phi_max)])
    for a in [0, 1]:
        s0 = grid_helper._specs[a]
        n0 = grid_helper._names[a]
        t = f"{n0}: {s0.description} ({s0.units_display}); cell = {friendly_resolution(s0)}"
        if a == 0:
            pylab.xlabel(t)
        else:
            pylab.ylabel(t)
