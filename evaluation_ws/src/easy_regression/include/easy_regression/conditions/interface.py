from abc import abstractmethod, ABCMeta
from collections import namedtuple

import duckietown_code_utils as dtu
from .result_db import ResultDB


class RTParseError(dtu.DTConfigException):
    """Cannot parse condition"""


CheckResult0 = namedtuple(
    "CheckResult0",
    [
        "status",  # One of the above in CHECK_RESULTS
        "summary",  # A short string
        "details",  # A long description
    ],
)


class CheckResult(CheckResult0):
    def __str__(self):
        s = "CheckResult:"
        s += "\n" + dtu.indent(self.status, "   status: ")
        s += "\n" + dtu.indent(self.summary, "  summary: ")
        s += "\n" + dtu.indent(self.details, "", "  details: ")
        return s


class RTCheck(metaclass=ABCMeta):
    FAIL = "fail"
    OK = "ok"
    NODATA = "nodata"  # the historical data is not there yet
    ABNORMAL = "abnormal"  # Other error in the evaluation

    CHECK_RESULTS = [OK, FAIL, NODATA, ABNORMAL]

    @abstractmethod
    @dtu.contract(returns=CheckResult, result_db=ResultDB)
    def check(self, result_db):
        """
        Returns a CheckResult.
        """

    @staticmethod
    def from_string(line):
        """
        Returns a RTCheck object.

        Syntaxes allowed:

        Simple checks:

            v:analyzer/log/statistics == value
            v:analyzer/log/statistics >= value
            v:analyzer/log/statistics <= value
            v:analyzer/log/statistics < value
            v:analyzer/log/statistics > value

        Check that it is in 10% of the value:

            v:analyzer/log/statistics ==[10%] value

        Use `@date` to reference the last value:

            v:analyzer/log/statistics ==[10%] v:analyzer/log/statistic@date

        Use `~branch@date` to reference the value of a branch at a certain date

            v:analyzer/log/statistics ==[10%] v:analyzer/log/statistic~branch@date

        Use `?commit` to reference the value of a branch at a specific commit:

            v:analyzer/log/statistics ==[10%] v:analyzer/log/statistic?commit

        Other checks:

            v:analyzer/log/statistics contains ![log name]

        Raises DTConfigException if the syntax is not valid.

        """
        from .implementation import _parse_regression_test_check

        return _parse_regression_test_check(line)
