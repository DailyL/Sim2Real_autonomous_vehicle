import duckietown_code_utils as dtu
from easy_logs import get_local_bag_file, NotAvailableLocally
from easy_logs.cli.generic import GenericLogDisplay


class Find(GenericLogDisplay):
    """Prints the filename for the specified log."""

    cmd = "dt-logs-find"

    def show_info(self, logs):
        for id_log, log in list(logs.items()):
            try:
                filename = get_local_bag_file(log)
                print(filename)
            except NotAvailableLocally:
                dtu.logger.error(f"No local file for {id_log}")
