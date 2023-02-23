import fnmatch
import os
from collections import defaultdict

__all__ = [
    "locate_files",
]


# @contract(returns='list(str)', directory='str',
#           pattern='str', followlinks='bool')
def locate_files(
    directory,
    pattern,
    normalize=True,
    followlinks=True,
    alsodirs=False,
    case_sensitive=True,
):
    # print('locate_files %r %r' % (directory, pattern))
    filenames = []

    def is_a_match(x):
        if not case_sensitive:
            x = x.lower()
        return fnmatch.fnmatch(x, pattern)

    for root, dirs, files in os.walk(directory, followlinks=followlinks):
        if alsodirs:
            for f in dirs:
                if is_a_match(f):
                    filename = os.path.join(root, f)
                    filenames.append(filename)

        for f in files:
            if is_a_match(f):
                filename = os.path.join(root, f)
                filenames.append(filename)

    real2norm = defaultdict(lambda: [])
    for norm in filenames:
        if normalize:
            real = os.path.realpath(norm)
        else:
            real = norm

        if os.path.exists(real):
            real2norm[real].append(norm)
        # print('%s -> %s' % (real, norm))

    for k, v in list(real2norm.items()):
        if len(v) > 1:
            msg = "In directory:\n\t%s\n" % directory
            msg += "I found %d paths that refer to the same file:\n" % len(v)
            for n in v:
                msg += "\n - %s" % n
            msg += "\nrefer to the same file:\n\t%s\n" % k
            msg += "I will silently eliminate redundancies."
            # logger.warning(v)

    return list(real2norm.keys())
