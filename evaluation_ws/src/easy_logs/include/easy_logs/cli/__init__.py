from duckietown_code_utils.cli import d8app_run


def main_details():
    from .details import Details

    d8app_run(Details)


def main_download():
    from .download import Download

    d8app_run(Download)


def main_find():
    from .find import Find

    d8app_run(Find)


def main_copy():
    from .copy import Copy

    d8app_run(Copy)


def main_gallery():
    from .gallery import Gallery

    d8app_run(Gallery)


def main_ipfs_pack():
    from .pack import Pack

    d8app_run(Pack)


def main_summary():
    from .summary import Summary

    d8app_run(Summary)


def main_thumbnails():
    from .thumbnails import MakeThumbnails

    d8app_run(MakeThumbnails)


def main_videos():
    from .videos import MakeVideos

    d8app_run(MakeVideos)
