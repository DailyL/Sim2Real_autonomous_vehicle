import time
from collections import defaultdict
from contextlib import contextmanager

import duckietown_code_utils as dtu

__all__ = [
    "ProcessingTimingStats",
]


class ProcessingTimingStats:
    """
    This is the model:

        One message is received at a certain time.
        The "acquisition time" is the time inside the message.

        If asynchronous processing, then it might be that
        processing is skipped.

        Then there are many "phases".

    We keep track of:

        Statistics of message reception:
            min, max, avg period:
                interval-stats(previous)
            min, max, avg latency_from_aquisition (time received - time acquired)

        Statistics of processing:
            nskipped
            nreceived

        For each phase:
            min, max, avg duration
            min, max, avg latency_from_aquisition (phase finished - time acquired)


    Accodingly, we expect to be called as follows:

    - x.reset()
    - for n iterations:
        x.received_message(msg)

        [x.decided_to_skip()]
        [x.decided_to_process()]

        with x.phase(phase-name):
            ...

    A call to reset() resets all counters.
    """

    def __init__(self):
        self.num_resets = 0
        self.reset()

    def reset(self):
        self.events = []
        self.last_msg_received = None
        self.last_msg_being_processed = None
        self.stats = defaultdict(lambda: SingleStat())
        self.phase_names = []

    def received_message(self, msg=None):
        """
        Declares that we are processing the ROS message msg.
        We take the timestamp from its header.

        If msg is None, then we use the current time for the timestamp.
        """
        self.stats["received"].sample()
        if msg is not None:
            self.last_msg_received = msg.header.stamp.to_sec()
        else:
            self.last_msg_received = time.time()

    def decided_to_process(self, msg=None):
        if msg is None:
            self.last_msg_being_processed = self.last_msg_received
        else:
            self.last_msg_being_processed = msg.header.stamp.to_sec()
        self.stats["processed"].sample()

    def decided_to_skip(self):
        self.stats["skipped"].sample()

    @contextmanager
    def phase(self, phase_name):
        with dtu.timeit_clock(phase_name):
            if not phase_name in self.phase_names:
                self.phase_names.append(phase_name)
            if self.last_msg_being_processed is None:
                msg = "Did not call decided_to_process() before?"
                raise ValueError(msg)

            #         t1 = rospy.get_time()
            t1 = time.time()
            c1 = time.process_time()

            try:
                yield
            finally:
                c2 = time.process_time()
                #             t2 = rospy.get_time()
                t2 = time.time()
                delta_clock = c2 - c1
                delta_wall = t2 - t1
                latency_from_acquisition = t2 - self.last_msg_being_processed

            self.stats[(phase_name, "clock")].sample(delta_clock)
            self.stats[(phase_name, "wall")].sample(delta_wall)
            self.stats[(phase_name, "latency")].sample(latency_from_acquisition)

    def get_stats(self):
        s = ""
        stats = self.stats
        # In the last 3.3 s: received 0 (0.0 fps) processed 100 (30.0 fps) skipped 0 (0.0 fps) (0%)
        skipped_percentage = get_percentage(stats["skipped"].num(), stats["received"].num())

        s += "In the last %.1f s: received %d (%s) processed %s (%s) skipped %s (%s) (%s)" % (
            self.stats["received"].duration(),
            self.stats["received"].num(),
            self.stats["received"].fps(),
            self.stats["processed"].num(),
            self.stats["processed"].fps(),
            self.stats["skipped"].num(),
            self.stats["skipped"].fps(),
            skipped_percentage,
        )

        l = max(len(_) for _ in self.phase_names)
        for phase_name in self.phase_names:
            stats_clock = self.stats[(phase_name, "clock")]
            stats_wall = self.stats[(phase_name, "wall")]
            stats_latency = self.stats[(phase_name, "latency")]

            total_latency = dtu.seconds_as_ms(stats_latency.last_value())
            delta_wall = dtu.seconds_as_ms(stats_wall.last_value())
            delta_clock = dtu.seconds_as_ms(stats_clock.last_value())
            msg = (
                f"{phase_name.ljust(l)} | total latency {total_latency:>10} | delta wall {delta_wall:>10} "
                f"| delta clock {delta_clock:>10}"
            )
            s += "\n" + msg
        return s


#                 acquired | total latency 49737091899.9ms | delta wall     None clock     None
#                 decoded | total latency 49737091904.6ms | delta wall    4.7ms clock    4.8ms
#                 resized | total latency 49737091904.9ms | delta wall    0.3ms clock    0.3ms
#               corrected | total latency 49737091905.2ms | delta wall    0.3ms clock    0.3ms
#                detected | total latency 49737091907.3ms | delta wall    2.2ms clock    2.3ms
#                prepared | total latency 49737091908.9ms | delta wall    1.5ms clock    1.6ms
#           --pub_lines-- | total latency 49737091909.1ms | delta wall    0.2ms clock    0.2ms
#                   drawn | total latency 49737091909.6ms | delta wall    0.6ms clock    0.6ms
#               pub_image | total latency 49737091909.8ms | delta wall    0.1ms clock    0.1ms
#    pub_edge/pub_segment | total latency 49737091910.8ms | delta wall    1.1ms clock    1.1ms


class SingleStat:
    def __init__(self):
        self.times = []
        self.values = []

    def sample(self, v=None):
        #         t = rospy.get_time()
        t = time.time()
        self.times.append(t)
        self.values.append(v)

    def last_value(self):
        if self.values:
            return self.values[-1]
        else:
            return None

    def num(self):
        """Returns the number of samples."""
        return len(self.times)

    def fps(self):
        """Returns the frames per second as a string."""
        n = self.num()
        if n == 0:
            return "0 fps"
        else:
            duration = self.duration()
            f = n / duration
            return f"{f:.1f} fps"

    def duration(self):
        delta = time.time()
        return delta - self.times[0]


def get_percentage(i, n):
    if n == 0:
        return "0 %"
    else:
        v = 100 * (1.0 * i / n)
        return f"{v:.1f} %"


class FakeContext:
    def __init__(self):
        pass

    @contextmanager
    def phase(self, name):
        yield

    def get_stats(self):
        pass
