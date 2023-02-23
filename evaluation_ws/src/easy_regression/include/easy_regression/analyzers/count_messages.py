from easy_regression.analyzer_interface import AnalyzerInterface


class CountMessages(AnalyzerInterface):
    def analyze_log(self, bag_in, dict_out):
        n = 0
        for _ in bag_in.read_messages(raw=True):
            n += 1

        dict_out["num_messages"] = n
        dict_out["num_logs"] = 1
        dict_out["average_num_messages"] = 1

    def reduce(self, a, b, a_plus_b):
        a_plus_b["num_messages"] = a["num_messages"] + b["num_messages"]
        a_plus_b["num_logs"] = a["num_logs"] + b["num_logs"]
        a_plus_b["average_num_messages"] = a_plus_b["num_messages"] / a_plus_b["num_logs"]

    def summarize_as_text(self, res):
        """Returns a dictionary label -> value that can be displayed as a table."""
        return {"Total number of messages: ": res["count"]}

    def summarize_as_image(self):
        raise NotImplementedError()
