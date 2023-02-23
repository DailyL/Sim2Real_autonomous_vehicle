import time

import rospy


def asms(s):
    if s is None:
        return "n/a"
    return f"{s * 1000:.1f} ms"


class TimeKeeper:
    def __init__(self, image_msg):
        self.t_acquisition = image_msg.header.stamp.to_sec()
        self.t_started = time.time()

        self.latencies = []

        self.completed("acquired")

    def completed(self, phase):
        t = rospy.get_time()
        c = time.process_time()
        latency = t - self.t_acquisition
        latency_ms = asms(latency)

        if self.latencies:
            last_t = self.latencies[-1][1]["t"]
            delta_wall_ms = asms(t - last_t)

            last_c = self.latencies[-1][1]["c"]
            delta_clock_ms = asms(c - last_c)
        else:
            delta_wall_ms = None
            delta_clock_ms = None

        self.latencies.append(
            (
                phase,
                dict(
                    t=t,
                    c=c,
                    delta_wall_ms=delta_wall_ms,
                    delta_clock_ms=delta_clock_ms,
                    latency_ms=latency_ms,
                ),
            )
        )

    def getall(self):
        s = "\nLatencies:\n"

        for phase, data in self.latencies:
            s += (
                f" {phase:>22} | total latency {data['latency_ms']:>10} | delta wall "
                f"{data['delta_wall_ms']:>8} clock {data['delta_clock_ms']:>8}\n"
            )

        return s
