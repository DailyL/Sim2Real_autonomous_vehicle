from abc import ABCMeta, abstractmethod
from collections import namedtuple

Detections = namedtuple('Detections', 'lines normals area centers')

class LineDetectorInterface():
    __metaclass__ = ABCMeta


    @abstractmethod
    def setImage(self, bgr):
        pass

    @abstractmethod
    def detectLines(self, color):
        """ Returns a tuple of class Detections """


