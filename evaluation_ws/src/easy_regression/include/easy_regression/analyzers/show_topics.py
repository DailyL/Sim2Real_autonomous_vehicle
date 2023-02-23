from easy_regression.analyzer_interface import AnalyzerInterface


class ShowTopics(AnalyzerInterface):
    def analyze_log(self, bag_in, dict_out):
        _types, topics = bag_in.get_type_and_topic_info()

        keys = sorted(topics)
        for topic in keys:
            dict_out[topic] = topics[topic].message_count

    def reduce(self, a, b, a_plus_b):
        for k in a:
            a_plus_b[k] = a[k] + b[k]

    def summarize_as_text(self, res):
        raise NotImplementedError()

    def summarize_as_image(self):
        raise NotImplementedError()
