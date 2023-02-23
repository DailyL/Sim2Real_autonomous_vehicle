from contextlib import contextmanager
import time

from .constants import DuckietownConstants

__all__ = [
    'rospy_timeit_clock',
    'rospy_timeit_wall',
    'timeit_clock',
    'timeit_wall',
]


@contextmanager
def rospy_timeit_clock(s):
    import rospy
    t0 = time.clock()
    yield
    delta = time.clock() - t0
    rospy.loginfo('%10d ms: %s' % (1000 * delta, s))


@contextmanager
def rospy_timeit_wall(s):
    import rospy
    t0 = time.time()
    yield
    delta = time.time() - t0
    rospy.loginfo('%10d ms: %s' % (1000 * delta, s))


class Stack(object):
    stack = []


@contextmanager
def timeit_generic(desc, minimum, time_function):
#     logger.debug('timeit %s ...' % desc)
    Stack.stack.append(desc)
    t0 = time_function()
    yield
    t1 = time_function()
    delta = t1 - t0
    Stack.stack.pop()
    if minimum is not None:
        if delta < minimum:
            return
    if DuckietownConstants.show_timeit_benchmarks or (minimum is not None):
        pre = '   ' * len(Stack.stack)
        msg = 'timeit_clock: %s %6.2f ms  for %s' % (pre, delta * 1000, desc)
#        t0 = time_function()
        print(msg)
#        t1 = time_function()
#        delta = t1 - t0


@contextmanager
def timeit_clock(desc, minimum=None):
    with timeit_generic(desc=desc, minimum=minimum, time_function=time.clock):
        yield


@contextmanager
def timeit_wall(desc, minimum=None):
    with timeit_generic(desc=desc, minimum=minimum, time_function=time.time) as f:
        yield f

