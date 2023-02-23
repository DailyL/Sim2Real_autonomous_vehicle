import itertools
from collections import defaultdict
from typing import List

import numpy as np

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
import rospy
from easy_regression.cli.processing import interpret_ros
from easy_regression.processor_interface import ProcessorInterface
from easy_regression.processors.stats_plotter.stats_plotter import PlotSignalSpec, PlotSignalSpec_from_yaml
from grid_helper.grid_helper_visualization import convert_unit


class Comparer(ProcessorInterface):
    signals: List[PlotSignalSpec]
    plot_name: str

    @staticmethod
    def from_yaml(signals, **kwargs):
        signals = list(map(PlotSignalSpec_from_yaml, signals))
        return Comparer(signals=signals, **kwargs)

    def __init__(self, signals: List[PlotSignalSpec], plot_name: str):
        self.signals = signals
        self.plot_name = plot_name

    def process_log(self, bag_in, prefix_in, bag_out, prefix_out, _utils):
        do_comparer_plot(bag_in, prefix_in, bag_out, prefix_out, self.signals, self.plot_name)


def read_data_for_signals(bag_in, prefix_in, signals):
    topic2messages = defaultdict(lambda: dict(timestamp=[], data=[]))
    topics = []
    for signal_spec in signals:
        dtu.check_isinstance(signal_spec, PlotSignalSpec)
        topic_fqn = prefix_in + signal_spec.topic
        topics.append(topic_fqn)

    for _j, mp in enumerate(bag_in.read_messages_plus(topics=topics)):
        data = interpret_ros(mp.msg)
        topic2messages[mp.topic]["data"].append(data)
        topic2messages[mp.topic]["timestamp"].append(mp.time_from_physical_log_start)

    for v in list(topic2messages.values()):
        v["data"] = np.array(v["data"])
        v["timestamp"] = np.array(v["timestamp"])

    for signal_spec in signals:
        topic_fqn = prefix_in + signal_spec.topic
        if not topic_fqn in topic2messages:
            msg = f"Could not found any value for topic {topic_fqn!r}."
            raise ValueError(msg)

    return topic2messages


def do_comparer_plot(bag_in, prefix_in, bag_out, prefix_out, signals, plot_name):
    topic2messages = read_data_for_signals(bag_in, prefix_in, signals)

    n = len(topic2messages)

    if n < 2:
        msg = "Not enough topics"
        raise ValueError(msg)

    for i, j in itertools.product(list(range(n)), list(range(n))):
        if i == j:
            continue
        s1 = signals[i]
        d1 = topic2messages[prefix_in + s1.topic]
        s2 = signals[j]
        d2 = topic2messages[prefix_in + s2.topic]

        bgr = _do_plot(s1, d1, s2, d2)

        t_inf = rospy.Time.from_sec(bag_in.get_end_time())
        omsg = dru.d8_compressed_image_from_cv_image(bgr, timestamp=t_inf)
        otopic = prefix_out + "/" + plot_name + "_%s_%s" % (i, j)
        bag_out.write(otopic, omsg, t=t_inf)


def _do_plot(s1, d1, s2, d2):
    bgcolor = dtu.ColorConstants.RGB_DUCKIETOWN_YELLOW
    dpi = 100
    figure_args = dict(facecolor=dtu.matplotlib_01_from_rgb(bgcolor))
    a = dtu.CreateImageFromPylab(dpi=dpi, figure_args=figure_args)

    with a as pylab:
        data_x = convert_unit(d1["data"], s1.units, s1.units_display)
        data_y = convert_unit(d2["data"], s2.units, s2.units_display)

        pylab.plot(data_x, data_y, ".")

        ylabel = f"{s2.label} [{s2.units_display}]"
        pylab.ylabel(ylabel, color=s2.color)
        xlabel = f"{s1.label} [{s1.units_display}]"
        pylab.xlabel(xlabel, color=s1.color)
        pylab.tick_params("y", colors=s2.color)
        pylab.ylim(s2.min, s2.max)
        pylab.xlim(s1.min, s1.max)

    bgr = a.get_bgr()
    return bgr
