import os

import numpy as np
from quickapp import QuickApp

import duckietown_code_utils as dtu
import duckietown_rosbag_utils as dbu
import rosbag
from easy_logs import get_local_bag_file
from easy_logs.app_with_logs import D8AppWithLogs, download_if_necessary
from easy_logs.easy_logs_summary_imp import format_logs

__all__ = ["MakeThumbnails"]


class MakeThumbnails(D8AppWithLogs, QuickApp):
    """
    Creates thumbnails for the image topics in a log.
    """

    cmd = "dt-logs-thumbnails"

    usage = """

Use like this:

    $ %(prog)s --max_images=[num] [logs]


"""

    def define_options(self, params):
        params.add_int("max_images", default=20, help="Max images to extract")
        params.add_flag("write_frames", help="Also write each frame in a separate file")
        params.add_flag("all_topics", help="If set, plots all topics, in addition to the camera.")
        params.add_string("outdir", help="Output directory", default=None)
        params.accept_extra()

        params.add_flag("compmake", help="Activate compmake caching")

    def go(self):
        options = self.get_options()
        if not options.compmake:
            self.debug("Because --compmake not given, simulating --reset.")
            options.reset = True

        super(MakeThumbnails, self).go()

    def define_jobs_context(self, context):
        outdir = self.options["outdir"]
        if outdir is None:
            outdir = "."
            msg = 'Option "--outdir" not passed. Will copy to current directory.'
            self.warn(msg)

        max_images = self.options["max_images"]
        only_camera = not self.options["all_topics"]
        write_frames = self.options["write_frames"]
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

        if not logs_valid:
            msg = "None of the logs were valid."
            raise dtu.DTUserError(msg)

        s = format_logs(logs_valid)
        self.info(s)

        od = self.options["output"]

        for log_name, log in list(logs_valid.items()):
            out = os.path.join(od, log_name)

            log_downloaded = download_if_necessary(log)

            context.comp(
                work,
                log_downloaded,
                out,
                max_images,
                only_camera=only_camera,
                write_frames=write_frames,
                job_id=log_name,
            )


def work(log, outd, max_images, only_camera, write_frames):
    filename = get_local_bag_file(log)
    t0 = log.t0
    t1 = log.t1

    MIN_HEIGHT = 480

    # noinspection PyUnboundLocalVariable
    bag = rosbag.Bag(filename)

    main = dbu.get_image_topic(bag)

    topics = [_ for _, __ in dbu.d8n_get_all_images_topic_bag(bag)]
    bag.close()
    dtu.logger.debug(f"{filename} - topics: {topics}")
    for topic in topics:

        if only_camera and topic != main:
            continue

        try:
            bag = rosbag.Bag(filename)
        except:
            msg = f"Cannot read Bag file {filename}"
            dtu.logger.error(msg)
            raise
        bag_proxy = dbu.BagReadProxy(bag, t0, t1)
        res = dbu.d8n_read_all_images_from_bag(
            bag_proxy, topic, max_images=max_images, use_relative_time=True
        )
        bag.close()

        d = topic.replace("/", "_")
        if d.startswith("_"):
            d = d[1:]

        d0 = os.path.join(outd, d)

        images_with_label = []
        for i in range(len(res)):
            rgb = res[i]["rgb"]

            H, _W = rgb.shape[:2]
            if H < MIN_HEIGHT:
                zoom = int(np.ceil(MIN_HEIGHT / H))
                rgb = dtu.zoom_image(rgb, zoom)

            timestamp = res[i]["timestamp"]
            s = f"t = {timestamp - t0:.2f}"
            with_label = dtu.add_header_to_rgb(rgb, s)
            images_with_label.append(with_label)

        if write_frames:
            for i, rgb in enumerate(images_with_label):
                rgb = res[i]["rgb"]
                fn = os.path.join(d0, f"image-{i:05d}" + ".jpg")
                dtu.write_bgr_as_jpg(dtu.bgr_from_rgb(rgb), fn)

        grid = dtu.make_images_grid(
            images_with_label, pad=4, bgcolor=dtu.ColorConstants.RGB_DUCKIETOWN_YELLOW
        )
        s = log.log_name
        grid = dtu.add_header_to_rgb(grid, s, max_height=32)

        if (topic != main) or len(topics) > 1:
            fn = d0 + ".jpg"
            dtu.write_rgb_as_jpg(grid, fn)

        if topic == main:
            fn = outd + ".thumbnails.jpg"
            dtu.write_rgb_as_jpg(grid, fn)
