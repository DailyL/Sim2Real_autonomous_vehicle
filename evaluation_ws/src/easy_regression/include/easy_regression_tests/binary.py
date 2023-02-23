import duckietown_code_utils as dtu
from easy_regression.conditions.binary import parse_binary
from easy_regression.conditions.interface import RTParseError


@dtu.unit_test
def parse_binary_check_good():
    good = ["==", ">=", "<", "<=", ">", "==[10%]"]

    for g in good:
        f = parse_binary(g)
        f(10, 20)


@dtu.unit_test
def parse_binary_check_bad():
    bad = ["=", "!", "==[10%", "==[10]", "=[10%]", "=[%]", "==[-10%]"]
    for b in bad:
        try:
            res = parse_binary(b)
        except RTParseError:
            pass
        else:
            msg = "Expected DTParseError."
            msg += f"\nString: {b!r}"
            msg += f"\nReturns: {res}"
            raise Exception(msg)


if __name__ == "__main__":
    dtu.run_tests_for_this_module()
