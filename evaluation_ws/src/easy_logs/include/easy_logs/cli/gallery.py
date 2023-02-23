import os
import random
from collections import namedtuple

from bs4.element import Tag

import duckietown_code_utils as dtu
from easy_logs.app_with_logs import D8AppWithLogs
from easy_logs.easy_logs_summary_imp import format_logs
from easy_logs.resource_desc import DTR

__all__ = [
    "Gallery",
    "get_gallery_style",
    "get_report",
]


def show_url(x):
    return x.startswith("http")


class Gallery(D8AppWithLogs):
    """
    Creates the gallery for the logs.

    """

    cmd = "dt-logs-gallery"

    deploy_ipfs = False

    def define_options(self, params):
        params.add_string("destination", help="Destination directory")
        params.add_flag("ipfs", help="Deploy on IPFS")
        params.accept_extra()

    def go(self):
        extra = self.options.get_extra()

        Gallery.deploy_ipfs = self.options["ipfs"]

        if not extra:
            query = "*"
        else:
            query = extra

        db = self.get_easy_logs_db()
        logs = db.query(query)

        logs_valid = {}
        ninvalid = 0
        length_invalid = 0.0
        for log_name, log in list(logs.items()):
            if log.valid:
                logs_valid[log_name] = log
            else:
                ninvalid += 1
                if log.length is not None:
                    length_invalid += log.length
        logs = logs_valid

        self.info(f"Found {len(logs)} valid logs.")

        s = format_logs(logs)
        self.info(s)

        res = get_report(logs)

        out = self.options["destination"]
        fn_html = os.path.join(out, "index.html")

        dtu.write_str_to_file(res, fn_html)


def get_report(logs, url_to_resource, initial_screens: bool = True) -> str:
    length = 0
    vehicles = set()
    for _, log in list(logs.items()):
        length += log.length
        vehicles.add(log.vehicle)

    html = Tag(name="html")
    body = Tag(name="body")

    head = Tag(name="head")
    link = Tag(name="link")
    link.attrs["type"] = "text/css"
    link.attrs["rel"] = "stylesheet"
    link.attrs["href"] = "style.css"
    title = Tag(name="title")
    title.append("Duckietown Logs Database")
    head.append(link)
    html.append(head)
    html.append(body)

    h = Tag(name="h1")
    h.append("Duckietown Logs Database")
    body.append(h)

    c = (
        f"Showing {len(logs)} logs from {len(vehicles)} different Duckiebots, for a total length of "
        f"{length / 3600.0:.1f} hours."
    )

    p = Tag(name="p")
    p.append(c)
    body.append(p)

    if initial_screens:
        t = summary_table(logs, url_to_resource)
        body.append(t)

    body.append(html_table_from_table(logs, url_to_resource))

    make_sections(body, logs, url_to_resource)

    s = str(html)
    return s


def summary_table(logs, url_to_resource):
    d = Tag(name="div")
    d.attrs["id"] = "panvision"
    seq = list(logs)
    random.shuffle(seq)
    for id_log in seq:
        log = logs[id_log]
        rel = get_small_video2(log, url_to_resource)
        if rel:
            video = video_for_source(rel)
            a = Tag(name="a")
            a.attrs["href"] = f"#{id_log}"
            a.attrs["class"] = "smallicon"
            a.append(video)
            d.append(a)
            d.append("\n")
    return d


def html_table_from_table(logs, url_to_resource):
    res = Tag(name="table")
    tbody = Tag(name="tbody")
    thead = Tag(name="thead")
    res.append(thead)
    res.append(tbody)
    for i, (_, log) in enumerate(logs.items()):
        trh, tr = get_row(i, log, url_to_resource)
        tbody.append(tr)
        tbody.append("\n")
    thead.append(trh)  # FIXME
    return res


def make_sections(body, logs, url_to_resource):
    for i, (id_log, log) in enumerate(logs.items()):
        section = make_section(i, id_log, log, url_to_resource)

        body.append(section)


def make_section(_i, id_log, log, url_to_resource):
    #    id_log = id_log.decode('utf-8', 'ignore')

    d = Tag(name="div")
    classes = ["log-details"]

    h = Tag(name="h2")
    h.append(id_log)
    d.append(h)
    d.attrs["id"] = id_log

    rel = get_small_video2(log, url_to_resource)
    if rel:
        video = video_for_source(rel)
        d.append(video)
    else:
        pass

    c = Tag(name="pre")

    s = [f"Vehicle: {log.vehicle}", f"Date: {log.date}", f"Length: {log.length:.1f} s"]

    c.append("\n".join(s))
    d.append(c)

    rel = get_large_video2(log, url_to_resource)
    if rel:
        a = Tag(name="a")
        a.attrs["href"] = rel
        a.append("Watch video")
        p = Tag(name="p")
        p.append(a)

        d.append(a)
    else:
        msg = "No video found for this log."
        p = Tag(name="p")
        p.append(msg)
        d.append(p)

    p = Tag(name="p")

    n = append_urls(id_log, log, p, url_to_resource)

    if n == 0:
        msg = "No URL found for this log."
        p = Tag(name="p")
        p.append(msg)

    d.append(p)

    rel = get_thumbnails(log, url_to_resource)
    if rel:
        img = Tag(name="img")
        img.attrs["class"] = "thumbnail"
        img.attrs["src"] = rel
        d.append(img)
    else:
        msg = "No thumbnail found for this log."
        p = Tag(name="p")
        p.append(msg)
        d.append(p)

    if not log.valid:
        classes.append("invalid")
    else:
        classes.append("valid")

    d.attrs["class"] = " ".join(classes)

    return d


def get_row(i, log, url_to_resource):
    trh = Tag(name="tr")
    tr = Tag(name="tr")

    def td(x):

        t = Tag(name="td")
        if x is not None:
            t.append(x)
        return t

    trh.append(td("index"))
    tr.append(td(str(i)))

    trh.append(td(""))
    rel = get_small_video2(log, url_to_resource)
    if rel:
        video = video_for_source(rel)
        tr.append(td(video))
    else:
        tr.append(td("-"))

    #    tr.append(td(log.log_name))

    #    trh.append(td('video'))

    f = Tag(name="td")

    rel = get_large_video2(log, url_to_resource)
    if rel:
        a = Tag(name="a")
        a.attrs["href"] = rel
        a.append("video")

        f.append(a)

    rel = get_thumbnails2(log, url_to_resource)
    if rel:
        #        f.append(Tag(name='br'))
        f.append(" ")

        a = Tag(name="a")
        a.attrs["href"] = rel
        a.append("thumbnails")
        f.append(a)

    #    n = append_urls(log, f)

    #    urls = [x for x in log.resources['bag']['urls'] if show_url(x)]
    #    for url in urls:
    #        f.append(' ')
    #        a = Tag(name='a')
    #        a.attrs['href'] = url
    #        a.append('bag')
    #        f.append(a)

    trh.append(td("misc"))
    tr.append(f)

    #
    #        tr.append(td(a))
    #    else:
    #        tr.append(td(''))

    trh.append(td("date"))
    tr.append(td(log.date))

    if log.length is not None:
        l = f"{log.length:5.1f} s"
    else:
        l = "(none)"
    trh.append(td("length"))
    tr.append(td(l))

    trh.append(td("vehicle"))
    tr.append(td(log.vehicle))

    if False:
        if log.valid:
            sr = "Yes."
        else:
            sr = log.error_if_invalid

        trh.append(td("valid"))
        tr.append(td(sr))

    trh.append(td("ID"))

    a = Tag(name="a")
    a.append(log.log_name)
    a.attrs["href"] = f"#{log.log_name}"

    tr.append(td(a))

    if not log.valid:
        tr.attrs["class"] = ["invalid"]
    else:
        tr.attrs["class"] = ["valid"]

    return trh, tr


def video_for_source_2(rel):
    video = Tag(name="video")
    video.attrs["width"] = 64
    video.attrs["height"] = 48
    video.attrs["loop"] = 1
    video.attrs["autoplay"] = 1
    source = Tag(name="source")
    source.attrs["src"] = rel
    source.attrs["type"] = "video/mp4"
    video.append(source)
    return video


def video_for_source(rel):
    video = Tag(name="img")
    video.attrs["width"] = 64
    video.attrs["height"] = 48
    video.attrs["src"] = rel
    return video


def choose_url(urls):
    for url in urls:
        if url.startswith("http"):
            return url
    return None


def get_resource_url(log, rname):
    if rname in log.resources:
        if Gallery.deploy_ipfs:
            ipfs = log.resources[rname]["hash"]["ipfs"]
            return f"/ipfs/{ipfs}"
        else:
            url = choose_url(log.resources[rname]["urls"])
            return url
    else:
        return None


def get_small_video2(log, url_to_resource):
    return url_to_resource(log, "video_small.gif")


def get_thumbnails(log, url_to_resource):
    return url_to_resource(log, "thumbnails.jpg")


def get_large_video2(log, url_to_resource):
    return url_to_resource(log, "video.mp4")


def get_thumbnails2(log, url_to_resource):
    return url_to_resource(log, "thumbnails.jpg")


GalleryEntry = namedtuple("GalleryEntry", "log_name thumbnail video url")


def append_urls(id_log, log, where, url_to_resource):
    n = 0
    for rname in log.resources:

        dtr = DTR.from_yaml(log.resources[rname])
        size_mb = f"{dtr.size / (1000 * 1000.0):.1f} MB"
        s = f"{rname} ({size_mb}) "
        where.append(s)

        urls = [url_to_resource(log, rname)]
        #        if Gallery.deploy_ipfs:
        #            ipfs = log.resources[rname]['hash']['ipfs']
        #            urls = ['/ipfs/%s' % ipfs]
        #        else:
        #            urls = [x for x in dtr.urls if show_url(x)]

        for i, url in enumerate(urls):
            where.append(" ")
            a = Tag(name="a")
            a.attrs["download"] = f"{id_log}.{rname}"
            a.attrs["href"] = url
            a.append(f"link {i}")
            where.append(a)
            n += 1
        where.append(Tag(name="br"))
    return n


def get_gallery_style():
    return """
@import url('https://fonts.googleapis.com/css?family=VT323');

* {
    font-family: 'VT323', monospace;
}
body {
    background-color: rgb(255, 204, 0);
}

tr.invalid {
    background-color: #fdd;
}

img.gif {
    width: 50px;
}
div.log-details.invalid {
    background-color: #fdd;
}

td { padding-left: 1em;

    vertical-align:top;
}

tr.nth-child(3) { color: white; }
img.thumbnail {
    width: 100%;
    max-width: 80em;
}

#panvision {
    margin-bottom: 50px;
    white-space-collapse: discard;
    font-size: 0;
}

a.smallicon {
    border: 0;
}


"""
