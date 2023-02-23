class Detections:
    """
    This is a data class that can be used to store the results of the line detection procedure performed
    by :py:class:`LineDetector`.
    """

    def __init__(self, lines, normals, centers, map):
        self.lines = lines  #: An ``Nx4`` array with every row representing a line ``[x1, y1, x2, y2]``
        self.normals = normals  #: An ``Nx2`` array with every row representing the normal of a line ``[nx,
        # ny]``

        self.centers = centers  #: An ``Nx2`` array with every row representing the center of a line ``[cx,
        # cy]``

        self.map = map  #: A binary map of the area from which the line segments were extracted
