def parse_float(a):
    """Converts to a float value; raise TypeError."""
    try:
        res = float(a)
        return res
    except:
        msg = f"Cannot convert value to a float.\nValue: {a!r}"
        raise TypeError(msg)
