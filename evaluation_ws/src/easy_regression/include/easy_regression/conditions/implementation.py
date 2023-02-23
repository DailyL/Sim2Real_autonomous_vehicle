import duckietown_code_utils as dtu
from easy_regression.conditions.binary import parse_binary
from easy_regression.conditions.eval import BinaryEval, Wrapper
from easy_regression.conditions.interface import RTParseError
from easy_regression.conditions.references import parse_reference


def _parse_regression_test_check(line: str) -> Wrapper:
    line = line.strip()
    delim = " "
    tokens = line.split(delim)

    if len(tokens) != 3:
        msg = f'I expect exactly 3 tokens with delimiter {delim}.\nLine: "{line}"\nTokens: {tokens}'
        raise dtu.DTConfigException(msg)

    try:
        ref1 = parse_reference(tokens[0])
        binary = parse_binary(tokens[1])
        ref2 = parse_reference(tokens[2])
        evaluable = BinaryEval(ref1, binary, ref2)
    except RTParseError as e:
        msg = f'Cannot parse string "{line}".'
        dtu.raise_wrapped(RTParseError, e, msg, compact=True)
        raise
    return Wrapper(evaluable)
