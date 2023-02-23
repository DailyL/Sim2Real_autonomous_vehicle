import os

import numpy as np
import rosbag

from .bag_info import get_image_topic
from .bag_reading import BagReadProxy
from .expand_variables import expand_environment
from .image_conversions import rgb_from_ros, numpy_from_ros_compressed
from .logging_logger import logger

__all__ = [
    'd8n_read_images_interval',
    'd8n_read_all_images',
    'd8n_read_all_images_from_bag',
]


def d8n_read_images_interval(filename, t0, t1):
    """
        Reads all the RGB data from the bag,
        in the interval [t0, t1], where t0 = 0 indicates
        the first image.

    """
    data = d8n_read_all_images(filename, t0, t1)
    logger.info('Read %d images from %s.' % (len(data), filename))
    timestamps = data['timestamp']
    # normalize timestamps
    first = data['timestamp'][0]
    timestamps -= first
    logger.info('Sequence has length %.2f seconds.' % timestamps[-1])
    return data


def d8n_read_all_images(filename, t0=None, t1=None):
    """
        Raises a ValueError if no data could be read.

        Returns a numpy array.


        Usage:

            data = d8n_read_all_images(bag)

            print data.shape # (928,)
            print data.dtype # [('timestamp', '<f8'), ('rgb', 'u1', (480, 640, 3))]

    """

    filename = expand_environment(filename)
    if not os.path.exists(filename):
        msg = 'File does not exist: %r' % filename
        raise ValueError(msg)
    bag = rosbag.Bag(filename)
    topic = get_image_topic(bag)
    bag_proxy = BagReadProxy(bag, t0, t1)
    # FIXME: this is wrong
    res = d8n_read_all_images_from_bag(bag_proxy, topic, t0=t0, t1=t1)
    bag_proxy.close()
    return res


def d8n_read_all_images_from_bag(bag, topic0, max_images=None, use_relative_time=False):
    nfound = bag.get_message_count(topic_filters=topic0)
    logger.info('Found %d images for %s' % (nfound, topic0))

    data = []
    first_timestamp = None

    if max_images is None:
        interval = None
    else:
        interval = int(np.ceil(nfound / max_images))
        if interval == 0:
            interval = 1
        logger.info('There are nfound = %d images total and I want max_images = %s' % (nfound, max_images))
        logger.info('Therefore I will use interval = %d' % (interval))

    for j, (topic, msg, t) in enumerate(bag.read_messages(topics=[topic0])):

        float_time = t.to_sec()

        if use_relative_time:
            float_time = float_time - bag.get_start_time()
        if first_timestamp is None:
            first_timestamp = float_time

        if interval is not None:
            add = (j % interval == 0)
            if not add:
                continue

        rgb = rgb_from_ros(msg)

        data.append({'timestamp': float_time, 'rgb': rgb})

        # stop if we have enough images
        if max_images is not None and (len(data) >= max_images):
            break

        if j % 10 == 0:
            logger.debug('Read %d images from topic %s' % (j, topic))

    logger.info('Returned %d images' % len(data))
    if not data:
        msg = 'No data found for topic %s' % topic0
        raise ValueError(msg)

    H, W, _ = rgb.shape  # (480, 640, 3)
    logger.info('Detected image shape: %s x %s' % (W, H))
    n = len(data)

    dtype = [
        ('timestamp', 'float'),
        ('rgb', 'uint8', (H, W, 3)),
    ]

    x = np.zeros((n,), dtype=dtype)

    for i, v in enumerate(data):
        x[i]['timestamp'] = v['timestamp']
        x[i]['rgb'][:] = v['rgb']

    return x
