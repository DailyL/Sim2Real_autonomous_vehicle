import os
import shutil

import rosbag

from .bag_reading import BagReadProxy
from .contracts_ import contract
from .disk_hierarchy import create_tmpdir, mkdirs_thread_safe
from .instantiate_utils import indent
from .logging_logger import logger

__all__ = ['d8n_make_video_from_bag']


@contract(returns='tuple(int, int)')
def count_messages_in_slice(bag_filename, topic, t0, t1, stop_at=None):
    """
        Counts the number of messages in a slice of time.
        Stops at stop_at, if given.

        Returns (count, total, stopped_early), where total is the total number in the log.
    """

    bag0 = rosbag.Bag(bag_filename)
    count = bag0.get_message_count(topic_filters=[topic])

    stopped_early = False
    if t0 is None and t1 is None:
        actual_count = count
    else:
        bag = BagReadProxy(bag0, t0, t1)

        actual_count = 0
        for _ in bag.read_messages(topics=[topic]):
            actual_count += 1

            if stop_at is not None:
                if actual_count >= stop_at:
                    stopped_early = True
                    break

    bag0.close()

    return actual_count, count, stopped_early


class NotEnoughFramesInSlice(Exception):
    pass


def d8n_make_video_from_bag(bag_filename, topic, out, t0=None, t1=None):
    """
       Creates a video out of the topic in the bag.

       topic: the topic name (any image-like topic)
       out: an .mp4 file.

        Returns the name of the created file.

       raises NotEnoughFramesInSlice if there are less than 3 frames in slice


       Note that needs a bunch more dependencies to be installed.

       Until we fix the dependencies:

            sudo pip install SystemCmd==1.2 ros_node_utils==1.0 ConfTools==1.8 QuickApp==1.2.2

            sudo apt-get install -y  mplayer mencoder

            sudo add-apt-repository ppa:mc3man/trusty-media
            sudo apt-get update
            sudo apt-get install -y ffmpeg





    """
    try:
        import procgraph_ros  # @UnusedImport
        from procgraph import pg
    except ImportError:
        raise

    # pg -m procgraph_ros bag2mp4 --bag $bag --topic $topic --out $out

    stop_at = 10
    min_messages = 5

    actual_count, count, stopped_early = \
        count_messages_in_slice(bag_filename, topic, t0, t1, stop_at=stop_at)

    msg = ('Creating video for topic %r, which has %d messages '
           'in the entire log.' % (topic, count))
    logger.info(msg)

    if not stopped_early and (actual_count != count):
        msg = 'However, the actual count in [%s, %s] is %s' % (t0, t1, actual_count)
        logger.info(msg)

    if actual_count < min_messages:
        msg = ('Topic %r has only %d messages in slice (%d total), too few'
               ' to make a video (min: %s).\nFile: %s'
               % (topic, actual_count, count, min_messages, bag_filename))

        msg += '\nt0: %s' % t0
        msg += '\nt1: %s' % t1
        bag = rosbag.Bag(bag_filename)
        msg += '\nstart: %s' % bag.get_start_time()
        msg += '\nend: %s' % bag.get_end_time()
        if actual_count == count:
            msg += '\n' + indent(get_summary_of_bag_messages(bag), '  info: ')
        bag.close()
        raise NotEnoughFramesInSlice(msg)

    model = 'bag2mp4_fixfps_limit'

    tmpdir = create_tmpdir()
    out_tmp = os.path.join(tmpdir, os.path.basename(out))
    try:
        logger.debug('Writing temp file to %s' % out_tmp)
        logger.debug('(You can use mplayer to follow along.)')
        pg(model, config=dict(bag=bag_filename, topic=topic, out=out_tmp, t0=t0, t1=t1))
        md = out_tmp + '.metadata.yaml'
        if os.path.exists(md):
            os.unlink(md)

        dn = os.path.dirname(out)
        if not os.path.exists(dn):
            mkdirs_thread_safe(dn)

        shutil.copyfile(out_tmp, out)
        logger.info('Created: %s' % out)

        info = out_tmp + '.info.yaml'
        if os.path.exists(info):
            os.unlink(info)

        return out
    finally:
        if os.path.exists(out_tmp):
            os.unlink(out_tmp)
        if os.path.exists(tmpdir):
            shutil.rmtree(tmpdir)


def get_summary_of_bag_messages(bag):
    _types, topics = bag.get_type_and_topic_info()
    keys = sorted(topics)
    s = []
    for topic in keys:
        topic_info = topics[topic]

        s.append("%5d  %s" % (topic_info.message_count, topic))
    return "\n".join(s)
