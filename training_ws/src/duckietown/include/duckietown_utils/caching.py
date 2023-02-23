import os

from .friendly_path_imp import friendly_path
from .logging_logger import logger
from .paths import get_duckietown_cache_dir
from .safe_pickling import safe_pickle_dump, safe_pickle_load

__all__ = [
    "get_cached",
]


def get_cached(cache_name, f, quiet="not-given", just_delete=False):
    """
    Caches the result of f() in a file called
        ${DUCKIETOWN_ROOT}/caches/![cache_name].cache.pickle
    """

    cache_dir = get_duckietown_cache_dir()
    cache = os.path.join(cache_dir, f"{cache_name}.cache.pickle")

    if just_delete:
        if os.path.exists(cache):
            logger.info(f"Removing {cache}")
            os.unlink(cache)
            return
        else:
            return

    if quiet == "not-given":
        should_be_quiet = False
    else:
        should_be_quiet = quiet

    if os.path.exists(cache):

        if not should_be_quiet:
            logger.info(f"Using cache {friendly_path(cache)}")

        try:
            return safe_pickle_load(cache)
        except:
            msg = f"Removing cache that I cannot read: {friendly_path(cache)}"
            logger.error(msg)
            os.unlink(cache)

    ob = f()
    if not should_be_quiet:
        logger.info(f"Writing to cache {friendly_path(cache)}")
    try:
        os.makedirs(os.path.dirname(cache))
    except:
        pass

    safe_pickle_dump(ob, cache)

    #         with open(cache, 'w') as f:
    #             cPickle.dump(ob, f)
    #
    #
    return ob
