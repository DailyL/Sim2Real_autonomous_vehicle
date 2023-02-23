from abc import ABCMeta, abstractmethod

__all__ = ["AnalyzerInterface"]


class AnalyzerInterface(metaclass=ABCMeta):
    @abstractmethod
    def analyze_log(self, bag_in, dict_out):
        """
        bag_in:
        dict_out: a dict-like structure where you can store stuff.
        """

    @abstractmethod
    def reduce(self, dict_one, dict_two, result):
        """"""

    def summarize_as_text(self, res):
        """Returns a dictionary label -> value that can be displayed as a table."""
        raise NotImplementedError()

    def summarize_as_image(self):
        raise NotImplementedError()
