from abc import ABCMeta, abstractmethod

from typing import Optional

__all__ = [
    "ProcessorInterface",
    "ProcessorUtilsInterface",
]


class ProcessorUtilsInterface(metaclass=ABCMeta):
    @abstractmethod
    def write_stat(self, name: str, value, t: Optional[float] = None, prefix=()):
        pass

    @abstractmethod
    def get_log(self):
        pass


class ProcessorInterface(metaclass=ABCMeta):
    FAMILY = "processor"

    @abstractmethod
    def process_log(self, bag_in, prefix: str, bag_out, prefix_out: str, utils: ProcessorUtilsInterface):
        ...
