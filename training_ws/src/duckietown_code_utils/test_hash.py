import hashlib
import os
import urllib.error
import urllib.parse
import urllib.parse
import urllib.request
from collections import namedtuple

from .caching import get_cached
from .logging_logger import logger
from .timeit import timeit_wall

__all__ = [
    "get_md5",
    "sha1_for_file",
    "create_hash_url",
    "parse_hash_url",
    "sha1_for_file_cached",
]


def get_md5(contents):
    m = hashlib.md5()
    m.update(contents)
    s = m.hexdigest()
    return s


def sha1_for_file(path, block_size=256 * 128):
    """
    Block size directly depends on the block size of your filesystem
    to avoid performances issues.
    """
    logger.debug("sha1 for %s" % path)
    h = hashlib.sha1()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(block_size), b""):
            h.update(chunk)
    return h.hexdigest()


def sha1_for_file_cached(filename):
    def f():
        return sha1_for_file(filename)

    basename = os.path.basename(filename)
    cache_name = "sha1_for_file/" + basename
    return get_cached(cache_name, f, quiet=True)


def create_hash_url(fn):
    # scheme://netloc/path;parameters?query#fragment
    scheme = "hash"
    netloc = "sha1"
    with timeit_wall("hashing %s" % fn, minimum=500):
        path = sha1_for_file_cached(fn)
    parameters = None
    name = os.path.basename(fn)
    size = os.path.getsize(fn)
    qs = [("size", size), ("name", name)]
    query = urllib.parse.urlencode(qs)
    fragment = None

    url = urllib.parse.urlunparse((scheme, netloc, path, parameters, query, fragment))
    return url


HashUrl = namedtuple("HashUrl", "size name sha1")


def parse_hash_url(url):
    parsed = (
        scheme,
        netloc,
        path,
        _parameters,
        query_string,
        _fragment,
    ) = urllib.parse.urlparse(url)
    #    print (scheme, netloc, path, parameters, query_string, fragment)
    assert scheme == "hash", parsed
    assert netloc == "sha1", parsed

    query = urllib.parse.parse_qs(query_string)
    sha1 = path.replace("/", "")

    size = query.get("size", None)  # this returns lists for some reason

    if size:
        size = int(size[0])

    name = query.get("name", None)

    if name:
        name = name[0]

    return HashUrl(name=name, size=size, sha1=sha1)
