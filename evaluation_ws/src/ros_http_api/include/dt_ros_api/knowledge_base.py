import rospy
from threading import Semaphore
from collections import defaultdict

from .constants import DataProvider


class KnowledgeBase:

    _KNOWNLEDGE_BASE = dict()
    _kb_lock = Semaphore(1)
    _providers = defaultdict(list)
    _providers_lock = Semaphore(1)

    @classmethod
    def has(cls, key):
        cls._providers_lock.acquire()
        try:
            # renew interest in all the providers providing this data
            for provided_resource, providers in cls._providers.items():
                if key.startswith(provided_resource):
                    for provider in providers:
                        provider.renew_interest()
                    break
        finally:
            cls._providers_lock.release()
        # ---
        return key in cls._KNOWNLEDGE_BASE

    @classmethod
    def get(cls, key, default=None, get_time=False):
        cls._kb_lock.acquire()
        try:
            if cls.has(key):
                time, value = cls._KNOWNLEDGE_BASE[key]
                secs_since_update = 0
                if time > 0:
                    secs_since_update = rospy.get_time() - time
                data = (secs_since_update, value)
            else:
                data = (-1, default)
        finally:
            cls._kb_lock.release()
        return data if get_time else data[1]

    @classmethod
    def set(cls, key, value, value_time=None):
        if value_time is None:
            value_time = rospy.get_time()
        cls._kb_lock.acquire()
        try:
            cls._KNOWNLEDGE_BASE[key] = (value_time, value)
        finally:
            cls._kb_lock.release()

    @classmethod
    def register_provider(cls, key, provider):
        if not isinstance(provider, DataProvider):
            raise ValueError(
                "Parameter 'provider' must be of type DataProvider. Got '%s' instead" % (
                    str(type(provider))
                )
            )
        # ---
        cls._providers_lock.acquire()
        try:
            cls._providers[key].append(provider)
        finally:
            cls._providers_lock.release()

