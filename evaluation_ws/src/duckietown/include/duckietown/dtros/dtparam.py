import json
import rospy

from . import get_instance
from .constants import ParamType
from .diagnostics import DTROSDiagnostics

MIN_MAX_SUPPORTED_TYPES = [ParamType.INT, ParamType.FLOAT]


class DTParam:

    def __init__(self, name, default=None, help=None, param_type=ParamType.UNKNOWN,
                 min_value=None, max_value=None, __editable__=True):
        self._name = rospy.names.resolve_name(name)
        self._help = help
        self._editable = __editable__
        if not isinstance(param_type, ParamType):
            raise ValueError(
                "Parameter 'param_type' must be an instance of duckietown.ParamType. "
                'Got %s instead.' % str(type(param_type))
            )
        self._type = param_type
        self._update_listeners = []
        # parse optional args
        # - min value
        if min_value is not None and param_type not in MIN_MAX_SUPPORTED_TYPES:
            raise ValueError(
                "Parameter 'min_value' not supported for parameter of type '%s'." % param_type.name
            )
        self._min_value = ParamType.parse(param_type, min_value)
        # - max value
        if max_value is not None and param_type not in MIN_MAX_SUPPORTED_TYPES:
            raise ValueError(
                "Parameter 'max_value' not supported for parameter of type '%s'." % param_type.name
            )
        self._max_value = ParamType.parse(param_type, max_value)
        # - default value
        self._default_value = ParamType.parse(param_type, default)
        if self._default_value is not None:
            # verify lower-bound
            if self._min_value is not None and self._default_value < self._min_value:
                raise ValueError(
                    "Given default value %s is below the min_value %s for parameter '%s'" % (
                        str(self._default_value), str(self._min_value), name
                    )
                )
            # verify upper-bound
            if self._max_value is not None and self._default_value > self._max_value:
                raise ValueError(
                    "Given default value %s is above the max_value %s for parameter '%s'" % (
                        str(self._default_value), str(self._max_value), name
                    )
                )
        # - help string
        if help is not None and not isinstance(help, str):
            raise ValueError(
                "Parameter 'help' in DTParam expects a value of type 'str', got '%s' instead." % (
                    str(type(help))
                )
            )
        # ---
        node = get_instance()
        if node is None:
            raise ValueError(
                'You cannot create a DTParam object before initializing a DTROS object'
            )
        # get parameter value
        if rospy.has_param(self._name):
            self._value = rospy.__get_param__(self._name)
        else:
            if default is None:
                raise KeyError(f"Parameter `{self._name}` not found.")
            self._value = self._default_value
            rospy.set_param(self._name, self._default_value)
        # add param to current node
        node._add_param(self)
        # register for changes (only for editable parameters)
        if self._editable:
            rospy.get_master().target.subscribeParam(
                rospy.names.get_caller_id(),
                rospy.core.get_node_uri(),
                self._name
            )
            rospy.logdebug('Parameter "%s" was registered for updates' % self._name)
        # register node against diagnostics
        if DTROSDiagnostics.enabled():
            DTROSDiagnostics.getInstance().register_param(
                self._name,
                self._help,
                self._type,
                self._min_value,
                self._max_value,
                self._editable
            )

    def set_value(self, value):
        self._value = value
        # notify listeners
        for cb in self._update_listeners:
            try:
                cb()
            except Exception as e:
                rospy.logerr(
                    "Parameter update callback %s resulted in error: %s" % (cb.__name__, str(e))
                )

    def force_update(self):
        # get parameter value
        self._value = rospy.__get_param__(self._name, self._default_value)

    def options(self):
        options = {}
        # min value
        if self.min_value is not None:
            options['min_value'] = self.min_value
        # max value
        if self.max_value is not None:
            options['max_value'] = self.max_value
        # ---
        return options

    def register_update_callback(self, cb):
        """
        Registers a callback that will be called any time the parameter's value has changed.
        Multiple callbacks can registered against the same parameter.

        Args:
            cb: A function, to be called when the parameter's value has changed.
        """
        if cb is not None and callable(cb):
            self._update_listeners.append(cb)
        else:
            rospy.logerr('Callback for parameter %s not registered because it is None or not callable!' % self._name)

    def unregister_update_callback(self, cb):
        """
        Unregisters a previously registered callback.

        Args:
            cb: The callback function to unregister.
        """
        if cb in self._update_listeners:
            self._update_listeners.remove(cb)

    @property
    def name(self):
        return self._name

    @property
    def help(self):
        return self._help

    @property
    def value(self):
        return self._value

    @property
    def default(self):
        return self._default_value

    @property
    def min_value(self):
        return self._min_value

    @property
    def max_value(self):
        return self._max_value

    @property
    def type(self):
        return self._type

    def __str__(self):
        return json.dumps({
            "name": self.name,
            "help": self.help,
            "value": self.value,
            "default": self.default,
            "min_value": self.min_value,
            "max_value": self.max_value,
            "type": self.type.name,
            "_editable": self._editable,
        }, sort_keys=True, indent=4)
