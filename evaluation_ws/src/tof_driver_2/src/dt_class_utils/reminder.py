import time


class DTReminder:

    def __init__(self, period=None, frequency=None):
        self._period = _get_period(period, frequency)
        self._last_execution = time.time()

    def reset(self):
        self._last_execution = time.time()

    def is_time(self, period=None, frequency=None, dry_run=False):
        _period = self._period
        # use provided period/frequency (if any)
        if period is not None or frequency is not None:
            _period = _get_period(period, frequency)
        # ---
        _is_time = (time.time() - self._last_execution) >= _period
        if _is_time and not dry_run:
            self.reset()
        return _is_time


def _get_period(period=None, frequency=None):
    # period or frequency has to be given
    if period is None and frequency is None:
        raise ValueError('When you construct an object of type DTReminder you need '
                         'to provide either a `period` or a `frequency`.')
    # period and frequency cannot be set at the same time
    if period is not None and frequency is not None:
        raise ValueError('When you construct an object of type DTReminder you need '
                         'to provide either a `period` or a `frequency`, not both.')
    # get period
    _period = 0
    if period is not None:
        if not isinstance(period, (int, float)):
            raise ValueError('Parameter `period` must be a number, got {:s} instead'.format(
                str(type(period))
            ))
        _period = period
    if frequency is not None:
        if not isinstance(frequency, (int, float)):
            raise ValueError('Parameter `frequency` must be a number, got {:s} instead'.format(
                str(type(frequency))
            ))
        _period = 1.0 / frequency
    # ---
    return _period
