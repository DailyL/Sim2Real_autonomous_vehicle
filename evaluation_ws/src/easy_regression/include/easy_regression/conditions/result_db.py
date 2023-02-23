from collections import namedtuple
from typing import Sequence

import duckietown_code_utils as dtu

ResultDBEntry0 = namedtuple(
    "ResultDBEntry0", ["regression_test_name", "date", "host", "cpu", "user", "results", "branch", "commit"]
)


class ResultDBEntry(ResultDBEntry0):
    def __str__(self):
        s = "ResultDBEntry"
        s += "\n regression_test_name: " + self.regression_test_name
        s += "\n   date: " + self.date.__repr__()
        s += "\n   host: " + self.host.__repr__()
        s += "\n    cpu: " + self.cpu.__repr__()
        s += "\n   user: " + self.user.__repr__()
        s += "\n branch: " + self.branch.__repr__()
        s += "\n commit: " + self.commit.__repr__()
        return s


class AmbiguousQuery(Exception):
    pass


class ResultDB:
    def __init__(self, current: ResultDBEntry, entries: Sequence[ResultDBEntry]):
        for e in entries:
            dtu.check_isinstance(e, ResultDBEntry)
        self.entries = entries
        self.current = current
        dtu.check_isinstance(current, ResultDBEntry)

    def query_results(self, branch, date, commit):
        """
        Raises DataNotFound if not found, or
        QueryAmbiguous if there are multiple matches.
        """
        if branch is None and date is None and commit is None:
            return [self.current]

        possible = []
        for e in self.entries:
            ok1 = (branch is None) or (branch == e.branch)
            ok2 = (commit is None) or (e.commit is not None and e.commit.endswith(commit))
            ok3 = (date is None) or (date == e.date)
            ok = ok1 and ok2 and ok3
            if ok:
                possible.append(e)
        return possible

    def query_results_one(self, branch, date, commit):
        possible = self.query_results(branch, date, commit)
        from easy_regression.conditions.eval import DataNotFound

        if len(possible) == 0:
            msg = "Could not find any match for the query."
            msg += f"\n branch: {branch}"
            msg += f"\n   date: {date}"
            msg += f"\n commit: {commit}"
            raise DataNotFound(msg)

        if len(possible) > 1:
            n = len(possible)
            msg = f"Found {n} matches for this query."
            msg += f"\n   branch: {branch}"
            msg += f"\n     date: {date}"
            msg += f"\n   commit: {commit}"
            msg += "\nThese are the matches:"
            for i, p in enumerate(possible):
                dtu.check_isinstance(p, ResultDBEntry)
                msg += "\n" + dtu.indent(str(p), f" {i + 1:2d} of {n}: ")
            raise AmbiguousQuery(msg)

        return possible[0]

    def __str__(self):
        n = len(self.entries)
        s = f"ResultsDB with {n} entries"
        s += "\n" + dtu.indent(str(self.current), "", "  current: ")
        for i, p in enumerate(self.entries):
            dtu.check_isinstance(p, ResultDBEntry)
            s += "\n" + dtu.indent(str(p), "", f" {i + 1:2d} of {n}: ")
        return s
