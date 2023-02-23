import yaml

from easy_logs.cli.generic import GenericLogDisplay


class Details(GenericLogDisplay):
    """Shows detailed information for the logs."""

    cmd = "dt-logs-details"

    def show_info(self, logs):
        for log in list(logs.values()):
            s = yaml.dump(log._asdict())
            print(s)
