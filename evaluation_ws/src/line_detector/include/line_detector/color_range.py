import numpy as np
import cv2


class ColorRange:
    """
    The Color Range class holds one or multiple color ranges. It can easily be generated with
    the :py:meth:`fromDict` class method and extends the `OpenCV's inRange <https://docs.opencv.org/3.4/d2/de8/group__core__array.html#ga48af0ab51e36436c5d04340e036ce981>`_
    method to work with multiple color ranges.

    All colours must be given in ``HSV`` space.

    Args:
        low (:obj:`numpy array`): An ``Nx3`` array with the low ends of ``N`` colour ranges.
        high (:obj:`numpy array`): An ``Nx3`` array with the high ends of ``N`` colour ranges.
    """

    def __init__(self, low, high):
        self.low = low
        self.high = high

    @classmethod
    def fromDict(cls, dictionary):
        """

        Generates a :py:class:`ColorRange` object from a dictionary. Expects the colors to be given in ``HSV`` space.
        If multi-entry ranges are provided (e.g. if you are interested in yellow and white), then each should have
        keys ``high_X`` and ``low_X``, see example bellow:

        Examples:

            Single-entry color range::

                { 'low': [0,0,150], 'high': [180,60,255] }

            Multi-entry color range::

                { 'low_1': [0,0,150], 'high_1': [180,60,255], 'low_2': [165,140,100], 'high_2': [180,255,255] }


        Args:
            dictionary (:obj:`dict`): The yaml dictionary describing the color ranges.

        Returns:
            :obj:`ColorRange`: the generated ColorRange object
        """

        # if only two entries: single-entry, if more: multi-entry
        if len(dictionary) == 2:
            assert "low" in dictionary, "Key 'low' must be in dictionary"
            assert "high" in dictionary, "Key 'high' must be in dictionary"
            low = np.array(dictionary["low"]).reshape((1, 3))
            high = np.array(dictionary["high"]).reshape((1, 3))

        elif len(dictionary) % 2 == 0:

            # make the keys tuples with `low` or `high` and the id of the entry
            dictionary = {tuple(k.split("_")): v for k, v in list(dictionary.items())}
            entry_indices = set([k[1] for k, _ in list(dictionary.items())])

            assert len(entry_indices) == len(dictionary) / 2, (
                "The multi-entry definition doesn't " "follow the requirements"
            )

            # build an array for the low and an array for the high range bounds
            low = np.zeros((len(entry_indices), 3))
            high = np.zeros((len(entry_indices), 3))
            for idx, entry in enumerate(entry_indices):
                low[idx] = dictionary[("low", entry)]
                high[idx] = dictionary[("high", entry)]

        else:
            raise ValueError(
                "The input dictionary has two have an even number of "
                "entries: a low and high value for each color range."
            )

        return cls(low=low, high=high)

    def inRange(self, image):
        """
        Applies the `OpenCV inRange <https://docs.opencv.org/3.4/d2/de8/group__core__array.html#ga48af0ab51e36436c5d04340e036ce981>`_
        method to every color range entry. Returns the bitwise OR of the results.
        In other words, returns a binary map with 1 for the pixels of the input image that fall in at least one of
        the color ranges.

        Args:
            image (:obj:`numpy array`): an ``HSV`` image

        Returns:
            :obj:`numpy array`: a two-dimensional binary map
        """

        selection = cv2.inRange(image, self.low[0], self.high[0])
        for i in range(1, len(self.low)):
            current = cv2.inRange(image, self.low[i], self.high[i])
            selection = cv2.bitwise_or(current, selection)

        return selection

    @property
    def representative(self):
        """
        Provides an representative color for this color range. This is the average color of the first range (if more
        than one ranges are set).

        Returns:
            :obj:`list`: a list with 3 entries representing an HSV color
        """

        return list(0.5 * (self.high[0] + self.low[0]).astype(int))
