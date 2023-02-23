
import tempfile

from .jpg import bgr_from_png

__all__ = ['CreateImageFromPylab']


class CreateImageFromPylab(object):

    def __init__(self, dpi=75, figure_args={}):
        self.dpi = dpi
        suffix = '.png'
        self.temp_file = tempfile.NamedTemporaryFile(suffix=suffix)

        # avoid loading if not necessary
        from matplotlib import pylab

        self.pylab = pylab

        self.figure = self.pylab.figure(**figure_args)

    def __enter__(self):
        return self.pylab

    def __exit__(self, exc_type, exc_value, traceback):  # @UnusedVariable
        if exc_type is not None:
            # an error occurred. Close the figure and return false.
            self.pylab.close()
            return False

        if not self.figure.axes:
#            raise Exception('You did not draw anything in the image.')
            pass

        savefig_params = dict(dpi=self.dpi, bbox_inches='tight', pad_inches=0.01,
                              transparent=True, facecolor=self.figure.get_facecolor())
        self.pylab.savefig(self.temp_file.name, **savefig_params)

        with open(self.temp_file.name) as f:
            self.png_data = f.read()

        self.temp_file.close()

        self.bgr = bgr_from_png(self.png_data)

        self.pylab.close()

    def get_png(self):
        return self.png_data

    def get_bgr(self):
        return self.bgr
