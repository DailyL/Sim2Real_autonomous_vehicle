import time
import inspect

from .diagnostics import DTROSDiagnostics


class CodeProfiler:

    def __call__(self, block_name):
        return CodeProfilerContext(block_name)


class CodeProfilerContext:

    # how far away from this code is the user's code in the stack
    STACK_DEPTH = 1

    def __init__(self, block_name):
        self._name = block_name
        self._start_time = None
        self._start_line = None
        self._start_filename = None
        self._diagnostics_manager = DTROSDiagnostics.getInstance()

    @property
    def enabled(self):
        return self._diagnostics_manager is not None

    def __enter__(self):
        # make sure we need to record profiling information
        if not self.enabled:
            return
        # ---
        self._start_time = time.time()
        # noinspection PyBroadException
        try:
            current_frame = inspect.currentframe()
            start_frame = inspect.getouterframes(current_frame)[self.STACK_DEPTH]
        except BaseException:
            return
        # ---
        self._start_line = start_frame.lineno
        self._start_filename = start_frame.filename

    def __exit__(self, exc_type, exc_val, exc_tb):
        # if an exception was generated, do not touch anything, just let it through
        if exc_type is not None:
            return False
        # make sure we need to record profiling information
        if not self.enabled:
            return
        # ---
        # compute time
        block_time = time.time() - self._start_time
        # noinspection PyBroadException
        try:
            # get code lines
            current_frame = inspect.currentframe()
            end_frame = inspect.getouterframes(current_frame)[self.STACK_DEPTH]
            end_line = end_frame.lineno
            end_filename = end_frame.filename
            # we don't support start and end on different files
            if self._start_filename != end_filename:
                return
        except BaseException:
            return
        # ---
        i = self._start_line + 1
        f = end_line
        # add findings to diagnostics
        self._diagnostics_manager.register_profiler_reading(
            self._name, block_time, end_filename, (i, f)
        )
