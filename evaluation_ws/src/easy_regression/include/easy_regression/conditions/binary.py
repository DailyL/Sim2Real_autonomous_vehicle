from contracts.utils import check_isinstance

import duckietown_code_utils as dtu
from easy_regression.conditions.eval import EvaluationError, ResultWithDescription
from easy_regression.conditions.interface import RTParseError

from .values import parse_float


def parse_binary(s):
    """
    Syntax:

        ==
        >=
        >
        <=
        <

        ==[10%]
        !=

        contains

    Returns an object that can be called with two arguments
    and returns True or False, or TypeError.

    Raise RTParseError on error.
    """

    if s in Cmp.known:
        return Cmp(s)
    #
    try:
        inside = dtu.remove_prefix_suffix(s, "==[", "]")
    except ValueError:
        pass
    else:
        if inside.endswith("%"):
            val = dtu.remove_suffix(inside, "%")
            percentage = parse_float(val)
            if percentage < 0:
                msg = f"Invalid percentage {percentage}"
                raise RTParseError(msg)
            ratio = percentage / 100.0
            return CompareApproxRelative(ratio)
        else:
            msg = f'Cannot parse "{s}": expected "%" in "{inside}".'
            raise RTParseError(msg)

    msg = f'Cannot parse string "{s}".'
    raise RTParseError(msg)


def gt(a, b):
    return a > b


def lt(a, b):
    return a < b


def leq(a, b):
    return a <= b


def geq(a, b):
    return a >= b


def eq(a, b):
    return a == b


def neq(a, b):
    return a != b


class Cmp:
    known = {
        ">": gt,
        ">=": geq,
        "<=": leq,
        "<": lt,
        "==": eq,
        "!=": neq,
    }

    def __init__(self, which):
        assert which in Cmp.known
        self.which = which
        self.f = Cmp.known[which]

    def __call__(self, a, b):
        try:
            expect_float(a)
            expect_float(b)
            val = self.f(a, b)
            desc = f"{a} {self.which} {b}"
            return ResultWithDescription(val, desc)
        except EvaluationError as e:
            msg = f"While evaluating {self.f.__name__}({a}, {b})"
            dtu.raise_wrapped(EvaluationError, e, msg, compact=True)

    def __repr__(self):
        return self.which


#
# def contains(a, b):
#     return b in a
def expect_float(x):
    if not isinstance(x, (float, int)):
        msg = f"Expected a number, got {x.__repr__()}."
        raise EvaluationError(msg)


class CompareApproxRelative:
    def __init__(self, rel_error):
        check_isinstance(rel_error, float)
        self.rel_error = rel_error

    def __call__(self, a, b):
        delta = self.rel_error * a
        lb = a - delta
        ub = a + delta
        res = lb <= b <= ub
        desc = f"Condition checked:\n   {lb} <= {b} <= {ub}."
        return ResultWithDescription(res, desc)

    def __str__(self):
        return f"EqualUpTo({100 * self.rel_error:g}%)"
