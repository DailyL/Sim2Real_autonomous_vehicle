from easy_logs.cli.generic import GenericLogDisplay
from easy_logs.easy_logs_summary_imp import format_logs


class Summary(GenericLogDisplay):
    """Shows a table summary for the logs."""

    cmd = "dt-logs-summary"

    def show_info(self, logs):
        s = format_logs(logs)
        print(s)
