import os
from collections import OrderedDict

from .friendly_path_imp import friendly_path
from .locate_files_impl import locate_files
from .logging_logger import logger
from .memoization import memoize_simple
from .mkdirs import d8n_make_sure_dir_exists
from .path_utils import get_ros_package_path
from .paths import get_duckietown_cache_dir
from .test_hash import get_md5, parse_hash_url
from .yaml_pretty import yaml_load_plain


@memoize_simple
def get_dropbox_urls():
    logger.info('Getting urls...')
    sources = []
    # from .paths import get_duckiefleet_root, get_duckietown_root, \
    #    get_duckietown_data_dirs
    #    sources.append(get_duckiefleet_root())
    #    sources.append(get_duckietown_root())
    #    sources.extend(get_duckietown_data_dirs())

    import imp
    dirname = imp.find_module('easy_logs')[1]
    sources.append(dirname)

    try:
        sources.append(get_ros_package_path('easy_logs'))
    except:
        pass  # XXX

    sources = set(sources)

    found = []
    urls = OrderedDict()
    for s in sources:
        pattern = '*.urls.yaml'

        filenames = locate_files(s, pattern, case_sensitive=False)
        for f in filenames:
            found.append(f)
            logger.debug('loading %s' % f)
            data = open(f).read()
            f_urls = yaml_load_plain(data)
            for k, v in list(f_urls.items()):
                urls[k] = v

    msg = 'Found %d urls in %s files:\n' % (len(urls), len(found))
    msg += '\n'.join(found)
    logger.info(msg)

    def sanitize(url):
        if url.endswith(b'?dl=0'):
            url = url.replace(b'?dl=0', b'?dl=1')
        return url

    return dict([(k, sanitize(url)) for k, url in list(urls.items())])


def download_if_not_exist(url, filename):
    if not os.path.exists(filename):
        logger.info('Path does not exist: %s' % filename)
        download_url_to_file(url, filename)
        if not os.path.exists(filename):
            msg = 'I expected download_url_to_file() to raise an error if failed.'
            msg += '\n url: %s' % url
            msg += '\n filename: %s' % filename
            raise AssertionError(msg)
    return filename


import sys
import time
import urllib.request, urllib.parse, urllib.error


def reporthook(count, block_size, total_size):
    now = time.time()
    global start_time
    global last_time
    if count == 0:
        start_time = now
        last_time = start_time - 10
        return
    interval = now - last_time

    def in_MB(x):
        return x / (1024.0 * 1024.0)

    duration = now - start_time
    progress_size = int(count * block_size)
    speed = (progress_size / (1024 * 1024 * duration))
    percent = (count * block_size * 100 / total_size)

    if percent != 100 and interval < 5:
        return

    sys.stderr.write("downloaded %.2f MB of %.1fMB (%.1f%%) at %.2f MB/s in %1.f s\n" %
                     (in_MB(progress_size), in_MB(total_size), percent, speed, duration))

    # sys.stdout.write("\r...%d%%, %d MB, %d KB/s, %d seconds passed" %
    #                  (percent, progress_size / (1024 * 1024), speed, duration))
    sys.stdout.flush()

    last_time = now


def download_url_to_file(url, filename):
    logger.info('Download from %s' % url)
    tmp = filename + '.tmp_download_file'
    urllib.request.urlretrieve(url, tmp, reporthook)
    if not os.path.exists(filename):
        os.rename(tmp, filename)

    logger.info('-> %s' % friendly_path(filename))


#
# def download_url_to_file_old(url, filename):
#     logger.info('Download from %s' % (url))
#     tmp = filename + '.tmp_download_file'
#     cmd = [
#         'wget',
#         '-O',
#         tmp,
#         url
#     ]
#     d8n_make_sure_dir_exists(tmp)
#     res = system_cmd_result(cwd='.',
#                             cmd=cmd,
#                             display_stdout=False,
#                             display_stderr=False,
#                             raise_on_error=True,
#                             write_stdin='',
#                             capture_keyboard_interrupt=False,
#                             env=None)
#
#     if not os.path.exists(tmp) and not os.path.exists(filename):
#         msg = 'Downloaded file does not exist but wget did not give any error.'
#         msg += '\n url: %s' % url
#         msg += '\n downloaded to: %s' % tmp
#         msg += '\n' + indent(str(res), ' | ')
#         d = os.path.dirname(tmp)
#         r = system_cmd_result(d, ['ls', '-l'], display_stdout=False,
#                               display_stderr=False,
#                               raise_on_error=True)
#         msg += '\n Contents of the directory:'
#         msg += '\n' + indent(str(r.stdout), ' | ')
#         raise Exception(msg)
#
#     if not os.path.exists(filename):
#         os.rename(tmp, filename)
#
#     logger.info('-> %s' % friendly_path(filename))


def get_file_from_url(url):
    """
        Returns a local filename corresponding to the contents of the URL.
        The data is cached in caches/downloads/
    """
    basename = get_md5(url)
    if 'jpg' in url:
        basename += '.jpg'

    cachedir = get_duckietown_cache_dir()
    filename = os.path.join(cachedir, basename)
    download_if_not_exist(url, filename)
    return filename


@memoize_simple
def get_sha12url():
    sha12url = {}
    urls = get_dropbox_urls()
    for u, v in list(urls.items()):
        u = str(u)  # .encode('utf-8')
        if u.startswith('hash:'):
            parsed = parse_hash_url(u)
            sha12url[parsed.sha1] = v
    return sha12url


def require_resource(basename, destination=None):
    """ Basename: a file name how it is in urls.yaml

        It returns the URL.
    """
    urls = get_dropbox_urls()
    if not basename in urls:
        msg = 'No URL found for %r.' % basename
        raise Exception(msg)
    else:
        url = urls[basename]
        if destination is None:
            dirname = get_duckietown_cache_dir()
            destination = os.path.join(dirname, basename)
        d8n_make_sure_dir_exists(destination)
        download_if_not_exist(url, destination)
        return destination
