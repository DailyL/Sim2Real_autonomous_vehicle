from dataclasses import replace
from typing import Tuple

import duckietown_code_utils as dtu
from .logs_structure import PhysicalLog

__all__ = [
    "filters_slice",
    "MakeTimeSlice",
]


class MakeTimeSlice(dtu.Spec):
    def __init__(self, spec, t0, t1):
        dtu.Spec.__init__(self, [spec])
        self.t0 = t0
        self.t1 = t1

    def __str__(self):
        s = f"MakeTimeSlice  {{ {self.t0} : {self.t1} }}"
        s += "\n" + dtu.indent(str(self.children[0]), "  ")
        return s

    def match(self, x):
        raise NotImplementedError()

    def match_dict(self, seq):
        results = self.children[0].match_dict(seq)
        matches = {}
        for k, v in list(results.items()):
            k2, v2 = self.transform(k, v)
            matches[k2] = v2
        return matches

    def transform(self, id_log: str, log: PhysicalLog) -> Tuple[str, PhysicalLog]:
        #        if not log.valid:
        #            # Not sure this is the right thing to do
        #            print('log not valid')
        #            return id_log, log
        u0 = log.t0
        u1 = log.t1
        assert (u0 is not None) and (u1 is not None), log
        assert u0 <= u1
        if self.t0 is not None:
            new_start = u0 + self.t0
        else:
            new_start = u0
        if self.t1 is not None:
            new_end = u0 + self.t1
        else:
            new_end = u1
        length = new_end - new_start

        #         A = '%d'%self.t0*100 if self.t0 is not None else "START"
        #         B = '%d'%self.t1*100 if self.t1 is not None else "END"
        #
        #         id_log2 = id_log + '_from%sto%s' % (A,B)
        A = f"{int(new_start * 100)}"
        B = f"{int(new_end * 100)}"

        id_log2 = id_log + f"_from{A}to{B}"
        log2 = replace(log, t0=new_start, t1=new_end, length=length)
        return id_log2, log2


def slice_time(m, spec):
    if m.group("t0") is not None:
        t0 = float(m.group("t0"))
    else:
        t0 = None

    if m.group("t1") is not None:
        t1 = float(m.group("t1"))
    else:
        t1 = None
    return MakeTimeSlice(spec, t0, t1)


# float = "[-+]?[0-9]*\.?[0-9]+"
filters_slice = {
    r"{(?P<t0>[-+]?[0-9]*\.?[0-9]+)?:(?P<t1>[-+]?[0-9]*\.?[0-9]+)?}": slice_time,
}
