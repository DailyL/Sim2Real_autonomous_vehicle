import time

__all__ = [
    'format_time_as_YYYY_MM_DD',
    'format_datetime_as_YYYY_MM_DD',
    'format_time_as_YYYYMMDDHHMMSS',

]


def format_time_as_YYYY_MM_DD(t):
    return time.strftime('%Y-%m-%d', time.gmtime(t))


def format_time_as_YYYYMMDDHHMMSS(t):
    return time.strftime('%Y%m%d%H%M%S', time.gmtime(t))


def format_datetime_as_YYYY_MM_DD(d):
    return d.strftime('%Y-%m-%d')
