import copy
from collections import namedtuple
from typing import List, Optional, TypedDict

from contracts.utils import check_isinstance

import duckietown_code_utils as dtu
from easy_regression.conditions.interface import RTCheck, RTParseError

__all__ = [
    "RegressionTest",
    "ChecksWithComment",
]


class CheckDescription(TypedDict):
    desc: Optional[str]
    cond: str


ChecksWithComment = namedtuple("ChecksWithComment", ["checks", "comment"])

ProcessorEntry = namedtuple("ProcessorEntry", ["processor", "prefix_in", "prefix_out"])


class RegressionTest:
    processors: List[ProcessorEntry]

    def __init__(
        self,
        logs,
        processors: Optional[List[object]] = None,
        analyzers: Optional[List[str]] = None,
        checks: Optional[List[str]] = None,
        topic_videos: Optional[List[str]] = None,
        topic_images: Optional[List[str]] = None,
    ):
        processors = processors or []
        analyzers = analyzers or []
        checks = checks or []
        topic_videos = topic_videos or []
        topic_images = topic_images or []

        self.logs = logs

        self.processors = []
        for p in processors:
            p = copy.deepcopy(p)
            processor = p.pop("processor")
            prefix_in = p.pop("prefix_in", "")
            prefix_out = p.pop("prefix_out", "")
            if p:
                msg = f"Extra keys: {p}"
                raise ValueError(msg)
            p2 = ProcessorEntry(prefix_in=prefix_in, processor=processor, prefix_out=prefix_out)
            self.processors.append(p2)

        self.analyzers = analyzers
        self.topic_videos = topic_videos
        self.topic_images = topic_images

        check_isinstance(checks, list)

        try:
            self.cwcs = parse_list_of_checks(checks)
        except RTParseError as e:
            msg = "Cannot parse list of checks."
            msg += "\n" + dtu.indent(dtu.yaml_dump_pretty(checks), "", "parsing: ")
            dtu.raise_wrapped(RTParseError, e, msg, compact=True)

    def get_processors(self) -> List[ProcessorEntry]:
        return self.processors

    def get_analyzers(self) -> List[str]:
        return self.analyzers

    def get_logs(self, algo_db):
        logs = {}
        for s in self.logs:
            for k, log in list(algo_db.query(s).items()):
                if k in logs:
                    msg = f"Repeated log id {k!r}"
                    msg += f"\n query: {self.logs}"
                    raise ValueError(msg)
                logs[k] = log
        return logs

    def get_topic_videos(self):
        return self.topic_videos

    def get_topic_images(self):
        return self.topic_images

    def get_checks(self):
        return self.cwcs


def parse_list_of_checks(checks: List[CheckDescription]) -> List[ChecksWithComment]:
    checks = copy.deepcopy(checks)
    cwcs = []
    for c in checks:
        c2 = dict(c)
        desc = c2.pop("desc", None)
        cond = c2.pop("cond")
        if c2:
            msg = f"Spurious fields: {list(c)}"
            raise ValueError(msg)
        lines = [_.strip() for _ in cond.strip().split("\n") if _.strip()]
        # remove comments
        decommented = []
        for l in lines:
            if "#" in l:
                l = l[: l.index("#")]
            if l.strip():
                decommented.append(l)
        cwc_checks = [RTCheck.from_string(_) for _ in decommented]
        cwc = ChecksWithComment(checks=cwc_checks, comment=desc)
        cwcs.append(cwc)
    return cwcs
