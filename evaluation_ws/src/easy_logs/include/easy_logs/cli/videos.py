import os

from quickapp import QuickApp

import duckietown_rosbag_utils as dbu
import rosbag
from easy_logs import get_local_bag_file
from easy_logs.app_with_logs import D8AppWithLogs, download_if_necessary
from easy_logs.easy_logs_summary_imp import format_logs

__all__ = [
    "MakeVideos",
]


class MakeVideos(D8AppWithLogs, QuickApp):
    """
    Creates videos for the image topics in a log.
    """

    cmd = "dt-logs-videos"

    usage = """

Usage:

    $ %(prog)s [options]  "log query"

For example:

    $ %(prog)s --cloud vehicle:shamrock

"""

    def define_options(self, params):
        params.add_flag("all_topics", help="If set, plots all topics, in addition to the camera.")
        params.add_string("outdir", help="Output directory", default=None)
        params.accept_extra()

        params.add_flag("compmake", help="Activate compmake caching")

    def go(self):
        options = self.get_options()
        if not options.compmake:
            self.debug("Because --compmake not given, simulating --reset.")
            options.reset = True

        super(MakeVideos, self).go()

    def define_jobs_context(self, context):
        outdir = self.options["outdir"]
        if outdir is None:
            outdir = "."
            msg = 'Option "--outdir" not passed. Will copy to current directory.'
            self.warn(msg)

        only_camera = not self.options["all_topics"]

        extra = self.options.get_extra()

        if not extra:
            query = "*"
        else:
            query = extra

        db = self.get_easy_logs_db()
        logs = db.query(query)

        self.info(f"Found {len(logs)} logs.")
        logs_valid = {}
        for log_name, log in list(logs.items()):
            if log.valid:
                logs_valid[log_name] = log

        s = format_logs(logs_valid)
        self.info(s)

        for log_name, log in list(logs_valid.items()):
            out = os.path.join(outdir, log_name)

            job_id = f"download-{log.log_name}"
            log_downloaded = context.comp(download_if_necessary, log, job_id=job_id)

            job_id = f"setup-{log_name}"
            context.comp_dynamic(jobs_videos, log_downloaded, log_name, out, only_camera, job_id=job_id)


def jobs_videos(context, log, name, outd, only_camera):
    filename = get_local_bag_file(log)

    bag = rosbag.Bag(filename)
    main_camera_topic = dbu.get_image_topic(bag)
    min_messages = 5  # need at least 5 frames to make a video

    topics = [_ for _, __ in dbu.d8n_get_all_images_topic_bag(bag, min_messages=min_messages)]
    bag.close()

    only_camera_fn = outd + "-video.mp4"

    for topic in topics:
        stop_at = min_messages + 2
        actual_count, count, _stopped_early = dbu.count_messages_in_slice(
            filename, topic, log.t0, log.t1, stop_at=stop_at
        )

        assert count >= min_messages
        if actual_count < min_messages:
            msg = f"There are only {actual_count} (out of {count}) in the slice [{log.t0}, {log.t1}]"
            msg += f"\n topic: {topic}"
            continue

        d = topic.replace("/", "_")
        if d.startswith("_"):
            d = d[1:]

        if only_camera:
            if topic != main_camera_topic:
                continue
            out = only_camera_fn
            j = context.comp(
                dbu.d8n_make_video_from_bag,
                filename,
                topic,
                out,
                t0=log.t0,
                t1=log.t1,
                job_id=f"{name}-{topic}",
            )

        else:
            out = os.path.join(outd, name + "-" + d + ".mp4")
            j = context.comp(dbu.d8n_make_video_from_bag, filename, topic, out, job_id=f"{name}-{topic}")

            # create link
            if topic == main_camera_topic:
                context.comp(link, j, out, only_camera_fn)


def link(_, src, dst):
    assert os.path.exists(src), dst

    if os.path.exists(dst):
        os.unlink(dst)
    os.symlink(src, dst)
