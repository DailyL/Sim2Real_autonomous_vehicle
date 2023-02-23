import os

from quickapp import QuickApp, QuickAppBase

from .exceptions import DTUserError, wrap_script_entry_point

__all__ = [
    'D8App',
    'D8AppWithJobs',
    'd8app_run',
]


class D8App(QuickAppBase):

    def get_from_args_or_env(self, argname, envname):
        """ Gets either the argumnent or the environment variable."""
        options = [getattr(self.options, argname), os.environ.get(envname, None)]
        options = [_ for _ in options if _ and _.strip()]
        if not options:
            msg = ('Either provide command line argument --%s or environment variable %s.' %
                    (argname, envname))
            raise DTUserError(msg)
        return options[0]


def d8app_run(App):
    main = App.get_sys_main()
    wrap_script_entry_point(main)


class D8AppWithJobs(D8App, QuickApp):
    pass
