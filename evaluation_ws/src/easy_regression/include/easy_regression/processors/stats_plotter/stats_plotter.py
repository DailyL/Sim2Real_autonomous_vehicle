from collections import defaultdict, namedtuple

import numpy as np

import duckietown_code_utils as dtu
import duckietown_rosdata_utils as dru
import rospy
from easy_regression.cli.processing import interpret_ros
from easy_regression.processor_interface import ProcessorInterface
from grid_helper.grid_helper_visualization import convert_unit

PlotSignalSpec = namedtuple("PlotSignalSpec", "topic units units_display label color min max")


def PlotSignalSpec_from_yaml(x):
    return PlotSignalSpec(**x)


def StatsPlotterFromYaml(signals, **kwargs):
    signals = list(map(PlotSignalSpec_from_yaml, signals))
    return StatsPlotter(signals=signals, **kwargs)


class StatsPlotter(ProcessorInterface):
    @dtu.contract(signals="list($PlotSignalSpec)")
    def __init__(self, signals, plot_name):
        self.signals = signals
        self.plot_name = plot_name

    def process_log(self, bag_in, prefix_in, bag_out, prefix_out, utils):
        #         log_name = utils.get_log().log_name

        do_plot(bag_in, prefix_in, bag_out, prefix_out, self.signals, self.plot_name)


def do_plot(bag_in, prefix_in, bag_out, prefix_out, signals, plot_name):
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

    for signal_spec in signals:

        topic_fqn = prefix_in + signal_spec.topic
        if not topic_fqn in topic2messages:
            msg = f"Could not found any value for topic {topic_fqn!r}."
            raise ValueError(msg)

    bgcolor = dtu.ColorConstants.RGB_DUCKIETOWN_YELLOW
    dpi = 100
    figure_args = dict(facecolor=dtu.matplotlib_01_from_rgb(bgcolor))
    a = dtu.CreateImageFromPylab(dpi=dpi, figure_args=figure_args)

    use_legend = len(signals) >= 3
    # todo: check same units

    with a as pylab:
        axes = []
        _fig, ax0 = pylab.subplots()
        ax0.set_xlabel("time (s)")
        axes.append(ax0)
        if use_legend:
            for i in range(len(signals) - 1):
                axes.append(ax0)
        else:
            for i in range(len(signals) - 1):
                axes.append(ax0.twinx())

        for i, signal_spec in enumerate(signals):
            ax = axes[i]

            topic_fqn = prefix_in + signal_spec.topic
            recorded = topic2messages[topic_fqn]
            data = np.array(recorded["data"])
            t = np.array(recorded["timestamp"])

            color = signal_spec.color
            markersize = 5

            data_converted = convert_unit(data, signal_spec.units, signal_spec.units_display)

            ax.plot(
                t,
                data_converted,
                "o",
                color=color,
                label=signal_spec.label,
                markersize=markersize,
                clip_on=False,
            )

            if not use_legend:
                label = f"{signal_spec.label} [{signal_spec.units_display}]"
                ax.set_ylabel(label, color=signal_spec.color)
                ax.tick_params("y", colors=color)

            ax.set_ylim(signal_spec.min, signal_spec.max)

            outward_offset = 20
            ax.xaxis.set_tick_params(direction="out")
            ax.yaxis.set_tick_params(direction="out")
            ax.spines["left"].set_position(("outward", outward_offset))
            ax.spines["top"].set_color("none")  # don't draw spine
            ax.spines["bottom"].set_position(("outward", outward_offset))
            ax.spines["right"].set_position(("outward", outward_offset))

            pos = {0: "left", 1: "right", 2: "right"}[i]
            ax.spines[pos].set_color(color)

            ax.xaxis.set_ticks_position("bottom")

        if use_legend:
            label = f"[{signal_spec.units_display}]"
            ax.set_ylabel(label)

            pylab.legend()

    bgr = a.get_bgr()
    plot_name = plot_name.replace("/", "")
    # output_filename = os.path.join('tmp', plot_name +'.png')
    # dtu.write_bgr_as_jpg(bgr, output_filename)

    t_inf = rospy.Time.from_sec(bag_in.get_end_time())
    omsg = dru.d8_compressed_image_from_cv_image(bgr, timestamp=t_inf)
    otopic = prefix_out + "/" + plot_name
    bag_out.write(otopic, omsg, t=t_inf)
