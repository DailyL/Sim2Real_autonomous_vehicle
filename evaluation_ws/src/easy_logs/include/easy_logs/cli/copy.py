import shutil

import duckietown_code_utils as dtu
from easy_logs import get_local_bag_file, NotAvailableLocally, D8AppWithLogs

import os

from easy_logs.app_with_logs import download_if_necessary


class Copy(D8AppWithLogs):
    """Downloads the bag files for the logs"""

    cmd = "dt-logs-copy"

    def define_options(self, params):
        params.add_string("outdir", help="Output directory", default=None)
        params.accept_extra()

    def go(self):
        extra = self.options.get_extra()
        if not extra:
            query = "*"
        else:
            if len(extra) > 1:
                msg = "Expected only one extra argument."
                raise dtu.DTUserError(msg)
            query = extra[0]

        db = self.get_easy_logs_db()
        logs = db.query(query)

        self.info(f"Found {len(logs)} logs.")
        outdir = self.options["outdir"]

        if outdir is None:
            outdir = "."
            msg = 'Option "--outdir" not passed. Will copy to current directory.'
            self.warn(msg)

        if not os.path.exists(outdir):
            dtu.mkdirs_thread_safe(outdir)

        for id_log, log in list(logs.items()):
            log = download_if_necessary(log)
            out = os.path.join(outdir, id_log + ".bag")
            if os.path.exists(out):
                print(out)
                continue

            try:
                filename = get_local_bag_file(log)
                shutil.copy(filename, out)
                print(out)
            except NotAvailableLocally:
                dtu.logger.error(f"No local file for {id_log}")
