
from .constants import DuckietownConstants
from .detect_environment import on_duckiebot
from .logging_logger import logger

__all__ = [
    'contract',
    'all_disabled',
]

show_info = DuckietownConstants.debug_show_package_import_info

if on_duckiebot():
    using_fake_contracts = True
    if show_info:
        logger.warning('Contracts are disabled becaused we are on Duckiebot.')
else:
    try:
        # use PyContracts if installed
        from contracts import contract, all_disabled  # @UnusedImport
        if all_disabled():
            if show_info:
                logger.warning('Using PyContracts, but it was disabled by the user.')
        else:
            if show_info:
                logger.warning('Using PyContracts.')
        using_fake_contracts = False
    except ImportError:
        if show_info:
            logger.warning('Contracts are disabled becaused PyContracts not found.')
        using_fake_contracts = True

if using_fake_contracts:

    def all_disabled():
        return True

    def contract(**kwargs):  # @UnusedVariable

        def phi(f):
            return f

        return phi
