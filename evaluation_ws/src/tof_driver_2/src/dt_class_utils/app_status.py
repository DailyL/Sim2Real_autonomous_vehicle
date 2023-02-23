from enum import Enum


class AppStatus(Enum):
    INITIALIZING = 10
    RUNNING = 20
    TERMINATING = 30
    KILLING = 40
    DONE = 100
