import cv2
import duckietown_code_utils as dtu

import numpy as np

# candidates to be part of "duckietown_utils"


def L2_image_distance(a, b):
    return np.mean(np.square(a * 1.0 - b * 1.0))


def L1_image_distance(a, b):
    return np.max(np.abs(a * 1.0 - b * 1.0))


def random_image(h, w):
    return np.array(np.random.random((h, w, 3)) * 255, dtype=np.uint8)


def load_image(f):
    return read_file(f)


def read_file(filename):  # FIXME: Duplicate
    filename = dtu.expand_environment(filename)
    img = cv2.imread(filename)
    if img is None:
        msg = f"Cannot read filename {filename!r}."
        raise ValueError(msg)
    return img


def wrap_test_main(f):
    import traceback, sys

    try:
        f()
    except (AssertionError, Exception) as e:
        dtu.logger.error(traceback.format_exc())
        dtu.logger.error("Exiting with error code 1")
        sys.exit(1)
    except:  # another weird exception
        dtu.logger.error("Exiting with error code 2")
        sys.exit(2)
    else:
        dtu.logger.info("Success.")
        sys.exit(0)


def get_rospkg_root(package_name):
    import rospkg

    rospack = rospkg.RosPack()
    package_root = rospack.get_path(package_name)
    return package_root
