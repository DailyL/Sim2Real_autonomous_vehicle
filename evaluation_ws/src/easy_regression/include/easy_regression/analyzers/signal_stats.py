from collections import defaultdict

import numpy as np

import duckietown_code_utils as dtu
from easy_regression.analyzer_interface import AnalyzerInterface
from easy_regression.cli.processing import interpret_ros

__all__ = ["SignalStats"]


class SignalStats(AnalyzerInterface):
    def analyze_log(self, bag_in, dict_out):
        topic2type = look_for_topics(bag_in)

        topic2data = defaultdict(lambda: [])
        topic2timestamp = defaultdict(lambda: [])

        for topic, msg, t in bag_in.read_messages(topics=list(topic2type)):
            data = interpret_ros(msg)
            timestamp = t.to_sec()
            topic2data[topic].append(data)
            topic2timestamp[topic].append(timestamp)

        for topic in topic2data:
            value = np.array(topic2data[topic])
            timestamp = np.array(topic2timestamp[topic])
            # print topic, value.dtype, value.shape

            sane = self.name_from_topic(topic)
            dict_out[sane] = compute_stats(timestamp, value)

    def name_from_topic(self, topic):
        """Sanitize the topic:

        /a/b/c -> a_b_c
        """
        tokens = topic.split("/")
        tokens = [t for t in tokens if t]
        sane = "_".join(tokens)
        return sane

    def reduce(self, a, b, a_plus_b):
        topics = set(a)  # (a) + list(b))
        for topic in topics:
            a_plus_b[topic] = {}
            print((topic + " ----------- "))
            reduce_stats(a[topic], b[topic], a_plus_b[topic])

    def summarize_as_text(self, res):
        raise NotImplementedError()

    #         """ Returns a dictionary label -> value that can be displayed as a table. """
    #         return{'Total number of messages: ': res['count'] }

    def summarize_as_image(self):
        raise NotImplementedError()


def compute_stats(timestamps, values):
    res = {}
    res["num_log_segments"] = 1
    res["length"] = float(timestamps[-1] - timestamps[0])
    res["nsamples"] = len(timestamps)
    res["mean"] = float(np.mean(values))
    res["min"] = float(np.min(values))
    res["max"] = float(np.max(values))
    res["median"] = float(np.max(values))
    return res


def reduce_stats(a, b, a_plus_b):
    a_plus_b["num_log_segments"] = a["num_log_segments"] + b["num_log_segments"]
    a_plus_b["length"] = a["length"] + b["length"]
    a_plus_b["nsamples"] = a["nsamples"] + b["nsamples"]
    a_plus_b["mean"] = (a["mean"] * a["nsamples"] + b["mean"] * b["nsamples"]) / a_plus_b["nsamples"]
    a_plus_b["min"] = min(a["min"], b["min"])
    a_plus_b["max"] = max(a["max"], b["max"])
    # Note: it is not possible to compute the median in an efficient manner
    a_plus_b["median"] = (a["median"] + b["median"]) / 2.0
    print((dtu.indent(a, "a: ")))
    print((dtu.indent(b, "b: ")))
    print((dtu.indent(a_plus_b, "a_plus_b: ")))


def look_for_topics(bag):
    stat = bag.get_type_and_topic_info()
    #     ok = ['std_msgs/Float64', 'std_msgs/Float64MultiArray']
    ok = ["std_msgs/Float64"]

    found = {}
    for t, v in list(stat.topics.items()):
        if v.message_count == 0:
            #             print('skipping %s because no count' % t)
            continue
        msg_type = v.msg_type
        if msg_type in ok:
            found[t] = msg_type
        else:
            pass
    #             print('skipping %s: %r' %(t, msg_type))

    return found
