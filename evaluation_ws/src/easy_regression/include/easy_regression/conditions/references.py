from datetime import datetime
from typing import Sequence

import yaml

import duckietown_code_utils as dtu
from .eval import Evaluable, EvaluationError
from .interface import RTParseError
from .result_db import ResultDBEntry

__all__ = ["parse_reference"]


def parse_reference(s: str):
    """
    v:analyzer/log/statistic~master@date

    """
    prefix = "v:"

    if s.startswith(prefix):
        s = dtu.remove_prefix(s, prefix)

        T_DATE = "@"
        T_BRANCH = "~"
        T_COMMIT = "?"
        TS = [T_DATE, T_BRANCH, T_COMMIT]

        if (T_COMMIT in s) and (T_DATE in s):
            msg = f"Cannot specify commit and date: {s}"
            raise RTParseError(msg)

        date = None
        commit = None
        branch_spec = None

        def get_last_one(s0):
            for c in s0[::-1]:
                if c in TS:
                    return c

        while True:
            which = get_last_one(s)

            if which is None:
                break
            elif which == T_DATE:
                s, date_spec = dtu.string_split(s, T_DATE)
                if not date_spec:
                    msg = f"Invalid date spec {date_spec!r}."
                    raise RTParseError(msg)
                date = parse_date_spec(date_spec)
            elif which == T_BRANCH:
                s, branch_spec = dtu.string_split(s, T_BRANCH)
                if not branch_spec:
                    msg = f"Invalid branch spec {branch_spec!r}."
                    raise RTParseError(msg)
            elif which == T_COMMIT:
                s, commit = dtu.string_split(s, T_COMMIT)
                if not commit:
                    msg = f"Invalid commit {branch_spec!r}."
                    raise RTParseError(msg)

        tokens = s.split("/")
        if not len(tokens) >= 3:
            msg = 'Expected "analyzer/log/statistic"'
            raise RTParseError(msg)

        analyzer = tokens[0]
        log = tokens[1]
        statistic = tuple(tokens[2:])

        return StatisticReference(
            analyzer=analyzer, log=log, statistic=statistic, branch=branch_spec, date=date, commit=commit
        )

    try:
        c = yaml.load(s, Loader=yaml.UnsafeLoader)
        if isinstance(c, str) and "/" in c:
            msg = 'The syntax is "v:analyzer/log/statistic"'
            msg += f"\nInvalid string: {c!r}"
            raise RTParseError(msg)
        return Constant(c)
    except yaml.YAMLError:
        msg = f"Could not parse reference {s!r}."
        raise RTParseError(msg)


def parse_date_spec(d: str) -> datetime:
    from dateutil.parser import parse

    try:
        return parse(d)
    except ValueError as e:
        msg = f"Cannot parse date {d!r}."
        dtu.raise_wrapped(RTParseError, e, msg, compact=True)


class StatisticReference(Evaluable):
    def __init__(self, analyzer, log, statistic: Sequence[str], branch, date, commit):
        self.analyzer = analyzer
        self.log = log
        self.statistic = statistic
        self.branch = branch
        self.date = date
        self.commit = commit

    def __str__(self):
        return f"StatisticReference({self.analyzer},{self.log},{self.statistic},{self.branch},{self.date})"

    def eval(self, rdb):
        db_entry = rdb.query_results_one(branch=self.branch, date=self.date, commit=self.commit)
        dtu.dt_check_isinstance("db_entry", db_entry, ResultDBEntry)
        #         print('Results= %s' % db_entry.__repr__())
        results = db_entry.results
        dtu.check_is_in("analyzer", self.analyzer, results, EvaluationError)
        logs = results[self.analyzer]
        dtu.check_is_in("log", self.log, logs, EvaluationError)
        forlog = logs[self.log]
        val = eval_name(forlog, self.statistic)
        return val


def eval_name(x, name_tuple: Sequence[str]):
    if not name_tuple:
        return x
    else:
        first = name_tuple[0]
        rest = name_tuple[1:]
        dtu.check_is_in("value", first, x, EvaluationError)
        xx = x[first]
        return eval_name(xx, rest)


class Constant(Evaluable):
    def __init__(self, x):
        self.x = x

    def eval(self, _test_results):
        return self.x

    def __repr__(self):
        return f"Constant({self.x!r})"
