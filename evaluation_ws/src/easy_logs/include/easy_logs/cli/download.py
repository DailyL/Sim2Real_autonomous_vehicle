import duckietown_code_utils as dtu
from easy_logs.app_with_logs import D8AppWithLogs, download_if_necessary
from quickapp import QuickAppBase

__all__ = [
    "Download",
]


class Download(D8AppWithLogs, QuickAppBase):
    """
    Downloads logs if necessary.
    """

    cmd = "dt-logs-download"

    def define_program_options(self, params):
        self._define_my_options(params)
        params.accept_extra()

    def go(self):
        extra = self.options.get_extra()
        if not extra:
            msg = "Please specify a log."
            raise dtu.DTUserError(msg)
        else:
            query = extra

        db_cloud = self.get_easy_logs_db()

        try:
            logs = db_cloud.query(query)
        except dtu.DTNoMatches as e:
            msg = "Could not find the logs matching the query."
            raise dtu.DTUserError(msg) from e

        for id_log, log in list(logs.items()):
            download_if_necessary(log)
