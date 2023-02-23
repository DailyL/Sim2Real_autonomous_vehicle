"""
    The many options to convert JPG into data.
"""

import os
import cv2
import time
# cannot be reliably installed with pip on Linux x86
#import picamera

from duckietown_utils.disk_hierarchy import tmpfile
from duckietown_utils.mkdirs import d8n_make_sure_dir_exists
from duckietown_utils.system_cmd_imp import system_cmd_result
import numpy as np

from .contracts_ import contract
from .deprecation import deprecated
from .file_utils import write_data_to_file
from .logging_logger import logger
from .timeit import timeit_clock


@contract(bgr='array[HxWx3](uint8)')
def jpg_from_bgr(bgr):
    _retval, s = cv2.imencode('.jpg', bgr)
    return s.tostring()


def png_from_bgr(bgr):
    _retval, s = cv2.imencode('.png', bgr)
    return s.tostring()


@deprecated('Use jpg_from_bgr()')
def jpg_from_image_cv(image):
    return jpg_from_bgr(image)


@deprecated('Use bgr_from_jpg()')
def image_cv_from_jpg(data):
    return bgr_from_jpg(data)


@contract(data=str, returns='array[HxWx3](uint8)')
def bgr_from_png(data):
    return _bgr_from_file_data(data)


@contract(data=str, returns='array[HxWx3](uint8)')
def bgr_from_jpg(data):
    return _bgr_from_file_data(data)


@contract(data=str, returns='array[HxWx3](uint8)')
def _bgr_from_file_data(data):
    """ Returns an OpenCV BGR image from a string """
    s = np.fromstring(data, np.uint8)
    bgr = cv2.imdecode(s, cv2.IMREAD_COLOR)
    if bgr is None:
        msg = 'Could not decode image (cv2.imdecode returned None). '
        msg += 'This is usual a sign of data corruption.'
        raise ValueError(msg)
    return bgr


@contract(fn=str, returns='array[HxWx3](uint8)')
def bgr_from_jpg_fn(fn):
    """ Read a JPG BGR from a file """
    if not os.path.exists(fn):
        msg = "File does not exist: %s" % fn
        raise ValueError(msg)
    with open(fn) as f:
        return bgr_from_jpg(f.read())


@deprecated('Use bgr_from_jpg()')
def image_cv_from_jpg_fn(fn):
    return bgr_from_jpg_fn(fn)


@deprecated("Use more precise write_bgr_to_file_as_jpg")
def write_jpg_to_file(image_cv, fn):
    return write_bgr_to_file_as_jpg(image_cv, fn)


def write_bgr_to_file_as_jpg(image_cv, fn):
    """ Assuming image_cv is a BGR image, write to the file fn. """
    data = jpg_from_bgr(image_cv)
    write_data_to_file(data, fn)


def bgr_from_raspistill(frame=None):
    import picamera
    with tmpfile(".jpg") as filename:

        if frame is not None:
            filename = frame
        d8n_make_sure_dir_exists(filename)
        #cmd = ['raspistill', '-o', filename,
        #    '--awb', 'auto',
#       #       '--exposure', 'off',
        #      ]
        #logger.debug('Capturing using command:\n   %s' % " ".join(cmd))
        #cwd = '.'
        #_ = system_cmd_result(cwd, cmd, raise_on_error=True)
        with picamera.PiCamera() as camera:
            #camera.resolution = (1280, 720)   # 720p
            time.sleep(2)
            camera.capture(filename)

        res = bgr_from_jpg_fn(filename)
        return res

# class Storage:
#     dst = None
#
# def image_cv_from_jpg_buf(data):
#     pass
#     """ Returns an OpenCV BGR image from a string """
#     s = np.fromstring(data, np.uint8)
#     if Storage.dst is not None:
#         image_cv = cv2.imdecode(s, cv2.IMREAD_COLOR, dst=Storage.dst)
#     else:
#         image_cv = cv2.imdecode(s, cv2.IMREAD_COLOR)
#     Storage.dst = image_cv
#     return image_cv

# Second option: use PIL


def rgb_from_jpg_by_PIL(data):
    """ Warning: this returns RGB """
    from PIL import ImageFile  # @UnresolvedImport
    parser = ImageFile.Parser()
    parser.feed(data)
    res = parser.close()
    res = np.asarray(res)
    return res

# third option: jpeg library


def rgb_from_jpg_by_JPEG_library(data):
    try:
        import jpeg4py as jpeg
    except ImportError:
        installation = """

Try to install using:

    sudo apt-get install -y libturbojpeg python-cffi
    pip install --user jpeg4py

"""
        logger.error(installation)
        raise

    jpg_data = np.fromstring(data, dtype=np.uint8)
    image_cv = jpeg.JPEG(jpg_data).decode()
    return image_cv


def image_clip_255(image_float):
    """ Clips to 0,255 and converts to uint8 """
    h, w, _ = image_float.shape
    res = np.zeros((h, w, 3), dtype=np.uint8)
    np.clip(image_float, 0, 255, out=res)
    return res

#
# def imgmsg_from_cv2(image_cv):
#     return
#         self.corrected_image = self.bridge.cv2_to_imgmsg(corrected_image_cv2,"bgr8"

# with libjpeg-turbo
# Convert from uncompressed image message
# image_cv = self.bridge.imgmsg_to_cv2(image_msg, "bgr8")
