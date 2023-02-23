

__all__ = [
    'bgr_color_from_string',
    'ColorConstants',
    'matplotlib_01_from_rgb',
]


def rgb_color_from_bgr_color(c):
    B, G, R = 0, 1, 2
    return c[R], c[G], c[B]


class ColorConstants(object):
    STR_WHITE = 'white'
    STR_YELLOW = 'yellow'
    STR_RED = 'red'
    STR_BLACK = 'black'
    STR_GRAY = 'gray'
    STR_GREEN = 'green'
    STR_BLUE = 'blue'

    BLACK = (0, 0, 0)  # XXX
    BGR_RED = (0, 0, 255)
    BGR_GREEN = (0, 255, 0)
    BGR_WHITE = (255, 255, 255)
    BGR_BLACK = (0, 0, 0)
    BGR_GRAY = (128, 128, 128)
    BGR_BLUE = (255, 0, 0)
    BGR_YELLOW = (0, 255, 255)
    BGR_DUCKIETOWN_YELLOW = (0, 204, 255)

    RGB_RED = rgb_color_from_bgr_color(BGR_RED)
    RGB_GREEN = rgb_color_from_bgr_color(BGR_GREEN)
    RGB_WHITE = rgb_color_from_bgr_color(BGR_WHITE)
    RGB_BLACK = rgb_color_from_bgr_color(BGR_BLACK)
    RGB_GRAY = rgb_color_from_bgr_color(BGR_GRAY)
    RGB_BLUE = rgb_color_from_bgr_color(BGR_BLUE)
    RGB_YELLOW = rgb_color_from_bgr_color(BGR_YELLOW)
    RGB_DUCKIETOWN_YELLOW = rgb_color_from_bgr_color(BGR_DUCKIETOWN_YELLOW)


def matplotlib_01_from_rgb(c):
    mcolor = tuple(x / 255.0 for x in c)
    return mcolor


def bgr_color_from_string(s):
    d = {
        ColorConstants.STR_YELLOW: ColorConstants.BGR_YELLOW,
        ColorConstants.STR_WHITE: ColorConstants.BGR_WHITE,
        ColorConstants.STR_BLACK: ColorConstants.BGR_BLACK,
        ColorConstants.STR_BLUE: ColorConstants.BGR_BLUE,
        ColorConstants.STR_RED: ColorConstants.BGR_RED,
        ColorConstants.STR_GRAY: ColorConstants.BGR_GRAY,
        ColorConstants.STR_GREEN: ColorConstants.BGR_GREEN,
    }
    if not s in d:
        msg = 'No color %r found in %s' % (s, list(d))
        raise ValueError(msg)
    return d[s]


def segment_color_constant_from_string():
    pass
