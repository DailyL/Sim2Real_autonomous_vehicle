from .interface import AntiInstagramInterface

__all__ = ["DummyAntiInstagram"]


class DummyAntiInstagram(AntiInstagramInterface):
    def calculateTransform(self, bgr):
        pass

    def applyTransform(self, bgr):
        return bgr.copy()

    def calculateHealth(self):
        return 1.0  # unsure of this
