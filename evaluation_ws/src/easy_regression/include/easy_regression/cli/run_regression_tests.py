import os
import shutil
import time

from bs4.element import Tag
from quickapp import QuickApp

import duckietown_code_utils as dtu
import duckietown_rosbag_utils as dbu
import rosbag
from easy_algo import get_easy_algo_db
from easy_logs.app_with_logs import D8AppWithLogs, get_log_if_not_exists
from easy_regression.cli.analysis_and_stat import job_analyze, job_merge, print_results
from easy_regression.cli.checking import (
    compute_check_results,
    display_check_results,
    fail_if_not_expected,
    write_to_db,
)
from easy_regression.cli.processing import process_one_dynamic
from easy_regression.conditions.interface import RTCheck
from easy_regression.regression_test import RegressionTest

logger = dtu.logger

ALL_LOGS = "all"


class RunRegressionTest(D8AppWithLogs, QuickApp):
    """Run regression tests."""

    cmd = "rosrun easy_regression run"

    def define_options(self, params):
        g = "Running regressions tests"
        params.add_string("tests", help="Query for tests instances.", group=g)
        params.add_flag("write", help="Stores the current results in the DB", group=g)

        s = ", ".join(RTCheck.CHECK_RESULTS)
        h = f"Expected status code for this regression test; one of: {s}"
        default = RTCheck.OK
        params.add_string("expect", help=h, group=g, default=default)

        params.add_flag("debug_no_delete", help="Do not delete temporary files.")

    def define_jobs_context(self, context):
        easy_algo_db = get_easy_algo_db()

        expect = self.options["expect"]
        write_to_db = self.options["write"]

        delete = not self.options["debug_no_delete"]

        if not expect in RTCheck.CHECK_RESULTS:
            msg = f"Invalid expect status {expect}; must be one of {RTCheck.CHECK_RESULTS}."
            raise dtu.DTUserError(msg)

        query = self.options["tests"]
        regression_tests = easy_algo_db.query("regression_test", query, raise_if_no_matches=True)

        for rt_name in regression_tests:
            rt = easy_algo_db.create_instance("regression_test", rt_name)

            easy_logs_db = self.get_easy_logs_db()
            c = context.child(rt_name)

            outd = os.path.join(self.options["output"], "regression_tests", rt_name)
            jobs_rt(c, rt_name, rt, easy_logs_db, outd, expect, write_data_to_db=write_to_db, delete=delete)


def jobs_rt(context, rt_name: str, rt: RegressionTest, easy_logs_db, out, expect, write_data_to_db, delete):
    logs = rt.get_logs(easy_logs_db)

    processors = rt.get_processors()

    analyzers = rt.get_analyzers()

    logger.info(f"logs: {list(logs)}")
    logger.info(f"processors: {processors}")
    logger.info(f"analyzers: {analyzers}")

    # results_all['analyzer'][log_name]
    results_all = {}
    for a in analyzers:
        results_all[a] = {}

    date = dtu.format_time_as_YYYY_MM_DD(time.time())
    prefix = f"run_regression_test-{rt_name}-{date}-"
    tmpdir = dtu.create_tmpdir(prefix=prefix)
    do_before_deleting_tmp_dir = []
    for log_name, log in list(logs.items()):
        c = context.child(log_name)
        # process one
        log_out = os.path.join(tmpdir, "logs", log_name + "/" + "out.bag")

        bag_filename = c.comp(get_log_if_not_exists, log, resource_name="bag")
        t0 = log.t0
        t1 = log.t1

        log_out_ = c.comp_dynamic(
            process_one_dynamic,
            bag_filename,
            t0,
            t1,
            processors,
            log_out,
            log,
            delete=delete,
            tmpdir=os.path.join(tmpdir, log_name),
            job_id="process_one_dynamic",
        )

        for a in analyzers:
            r = results_all[a][log_name] = c.comp(job_analyze, log_out_, a, job_id=f"analyze-{a}")
            do_before_deleting_tmp_dir.append(r)

        def sanitize_topic(x):
            if x.startswith("/"):
                x = x[1:]
            x = x.replace("/", "-")
            return x

        report_filenames = []
        log_out_dir = os.path.join(out, "logs", log_name)
        for topic in rt.get_topic_videos():
            mp4 = os.path.join(log_out_dir, "videos", log_name + "-" + sanitize_topic(topic) + ".mp4")
            job_id = f"make_video-{sanitize_topic(topic)}"
            v = c.comp(dbu.d8n_make_video_from_bag, log_out_, topic, mp4, job_id=job_id)
            report_filenames.append(v)
            do_before_deleting_tmp_dir.append(v)

        for topic in rt.get_topic_images():
            basename = os.path.join(log_out_dir, "images", log_name + "-" + sanitize_topic(topic))
            job_id = f"write_image-{sanitize_topic(topic)}"
            v = c.comp(write_images, log_out_, topic, basename, job_id=job_id)
            report_filenames.append(v)
            do_before_deleting_tmp_dir.append(v)

        index = os.path.join(log_out_dir, "index.html")
        v = c.comp(create_report_html, log_name, report_filenames, index)
        do_before_deleting_tmp_dir.append(v)

    for a in analyzers:
        v = results_all[a][ALL_LOGS] = context.comp(job_merge, results_all[a], a, job_id=f"merge-{a}")
    #         do_before_deleting_tmp_dir.append(v)

    context.comp(print_results, analyzers, results_all, out)

    check_results = context.comp(compute_check_results, rt_name, rt, results_all)
    context.comp(display_check_results, check_results, out)

    context.comp(fail_if_not_expected, check_results, expect)
    if write_data_to_db:
        context.comp(write_to_db, rt_name, results_all, out)

    if delete:
        done = context.comp(delete_tmp_dir, tmpdir, do_before_deleting_tmp_dir)
        return done
    else:
        return None


def create_report_html(log_name, filenames, out):
    html = Tag(name="html")
    body = Tag(name="body")

    head = Tag(name="head")
    link = Tag(name="link")
    link.attrs["type"] = "text/css"
    link.attrs["rel"] = "stylesheet"
    link.attrs["href"] = "style.css"
    title = Tag(name="title")
    title.append("Report")
    head.append(link)
    html.append(head)

    h = Tag(name="h1")
    h.append(f"Report for {log_name}")
    body.append(h)

    for f in filenames:
        f = os.path.realpath(f)
        out = os.path.realpath(out)
        d = os.path.dirname(out)
        rel = os.path.relpath(f, d)

        p = Tag(name="p")
        if ".jpg" in f or ".png" in f:
            img = Tag(name="img")
            img.attrs["src"] = rel
            p.append(img)

        if ".mp4" in f:
            v = video_for_source(rel)
            p.append(v)
        body.append(p)

    html.append(body)
    s = str(html)
    dtu.write_str_to_file(s, out)


def video_for_source(rel, width="100%"):
    video = Tag(name="video")
    video.attrs["width"] = width
    #    video.attrs['height'] = height
    video.attrs["loop"] = 1
    video.attrs["autoplay"] = 1
    source = Tag(name="source")
    source.attrs["src"] = rel
    source.attrs["type"] = "video/mp4"
    video.append(source)
    return video


def write_images(bag_filename, topic, basename):
    """Returns the name of the first created file"""
    dtu.logger.info(f"reading topic {topic!r} from {bag_filename!r}")
    bag = rosbag.Bag(bag_filename)
    nfound = bag.get_message_count(topic)
    if nfound == 0:
        msg = f"Found 0 messages for topic {topic}"
        msg += "\n\n" + dtu.indent(dbu.get_summary_of_bag_messages(bag), "  ")
        raise ValueError(msg)

    res = dbu.d8n_read_all_images_from_bag(bag, topic)
    n = len(res)
    filenames = []
    for i in range(n):
        rgb = res[i]["rgb"]
        data: bytes = dtu.png_from_bgr(dtu.bgr_from_rgb(rgb))
        if n == 1:
            fn = basename + ".png"
        else:
            fn = basename + f"-{i:02d}.png"

        filenames.append(fn)
        dtu.write_data_to_file(data, fn)

    bag.close()

    return filenames[0]


def delete_tmp_dir(tmpdir, _dependencies):
    dtu.logger.warning(f"deleting tmpdir {tmpdir}")
    shutil.rmtree(tmpdir)
