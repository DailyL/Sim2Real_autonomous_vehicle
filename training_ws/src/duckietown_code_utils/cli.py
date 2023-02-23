import os
from abc import ABC

from quickapp import QuickApp, QuickAppBase

from .exceptions import DTUserError, wrap_script_entry_point

__all__ = [
    "D8App",
    "D8AppWithJobs",
    "d8app_run",
]


class D8App(QuickAppBase, ABC):
    def get_from_args_or_env(self, argname, envname):
        """Gets either the argumnent or the environment variable."""
        options = [getattr(self.options, argname), os.environ.get(envname, None)]
        options = [_ for _ in options if _ and _.strip()]
        if not options:
            msg = f"Either provide command line argument --{argname} or environment variable {envname}."
            raise DTUserError(msg)
        return options[0]


def d8app_run(App):
    main = App.get_sys_main()
    wrap_script_entry_point(main)


class D8AppWithJobs(D8App, QuickApp, ABC):
    pass
