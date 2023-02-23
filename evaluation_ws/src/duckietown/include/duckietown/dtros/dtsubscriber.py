import time
import rospy
from rospy.impl.tcpros import DEFAULT_BUFF_SIZE
from rospy.impl.registration import get_topic_manager

import humanfriendly

from .constants import TopicDirection
from .diagnostics import DTROSDiagnostics
from .dttopic import DTTopic
from .singleton import get_instance


class DTSubscriber(DTTopic, rospy.__Subscriber__):
    """ A wrapper around ``rospy.Subscriber``.

    This class is exactly the same as the standard
    `rospy.Subscriber <http://docs.ros.org/api/rospy/html/rospy.topics.Subscriber-class.html>`_
    with the only difference of an :py:attr:`active` attribute being added. Whenever the :py:meth:`publish` method is used,
    an actual message will be send only if :py:attr:`active` is set to ``True``.

    Args:
       name (:obj:`str`): resource name of topic, e.g. 'laser'
       data_class (:obj:`ROS Message class`): message class for serialization
       subscriber_listener (:obj:`SubscribeListener`): listener for subscription events. May be `None`
       tcp_nodelay (:obj:`bool`): If ``True``, sets ``TCP_NODELAY`` on publisher's socket (disables Nagle algorithm).
          This results in lower latency publishing at the cost of efficiency.
       latch (:obj:`bool`) - If ``True``, the last message published is 'latched', meaning that any future subscribers
          will be sent that message immediately upon connection.
       headers (:obj:`dict`) - If not ``None``, a dictionary with additional header key-values being
          used for future connections.
       queue_size (:obj:`int`) - The queue size used for asynchronously publishing messages from different
          threads. A size of zero means an infinite queue, which can be dangerous. When the keyword is not
          being used or when ``None`` is passed all publishing will happen synchronously and a warning message
          will be printed.

    Attributes:
       All standard rospy.Publisher attributes
       active (:obj:`bool`): A flag that if set to ``True`` will allow publishing. If set to ``False``, any calls
          to `publish` will not result in a message being sent. Can be directly assigned.

    Raises:
       ROSException: if parameters are invalid

    """

    def __init__(self,
                 # ROS arguments
                 name, data_class, callback=None, callback_args=None, queue_size=None,
                 buff_size=DEFAULT_BUFF_SIZE, tcp_nodelay=False,
                 # Duckietown specific arguments
                 **kwargs):

        # store the user callback, a decorated one will be used instead
        self._user_callback = callback
        # parse buff_size if necessary
        if isinstance(buff_size, str):
            buff_size = humanfriendly.parse_size(buff_size)
        # call super constructor
        DTTopic.__init__(self)
        rospy.__Subscriber__.__init__(
            self,
            name,
            data_class,
            callback=self._monitored_callback,
            callback_args=callback_args,
            queue_size=queue_size,
            buff_size=buff_size,
            tcp_nodelay=tcp_nodelay
        )
        # dt parameters
        self._active = True

        # parse dt arguments
        self._parse_dt_args(kwargs)
        # register dt topic
        if not self._dt_is_ghost:
            self._register_dt_topic(TopicDirection.INBOUND)
        # register subscriber
        if get_instance() is not None:
            get_instance()._register_subscriber(self)
        # store attributes
        self._attributes_keeper = {
            'name': name,
            'data_class': data_class,
            'callback': self._monitored_callback,
            'callback_args': callback_args,
            'queue_size': queue_size,
            'buff_size': buff_size,
            'tcp_nodelay': tcp_nodelay,
            'resolved_name': self.resolved_name
        }

    @property  #: Read-only property for the private attributes
    def active(self):
        return self._active

    @active.setter  #: Setter for the read-only property for the private attributes
    def active(self, new_status):
        if self._active == new_status:
            # Don't do anything if the status doesn't change
            pass
        elif not self._active and new_status:
            # Reactive the subscription
            self._reregister()
        else:
            # Unsubscribe
            self.unregister()
        self._active = new_status
        # update diagnostics
        if DTROSDiagnostics.enabled():
            DTROSDiagnostics.getInstance().set_topic_switch(self.resolved_name, new_status)

    def switch_off(self):
        self.active = False

    def switch_on(self):
        self.active = True

    def anybody_publishing(self):
        return self.get_num_connections() > 0

    def _monitored_callback(self, *args, **kwargs):
        # if the topic was deactivated, do nothing
        if not self.active:
            return None
        # run the user's callback
        out = None
        if self._user_callback:
            with get_instance().profiler(f'/auto/topic/callback{self.resolved_name}'):
                out = self._user_callback(*args, **kwargs)
        # tick for frequency update
        self._tick_frequency()
        # return callback output (usually None)
        return out

    def _reregister(self):
        """
        Resets some of the attributes in order to restore the state of the object before
        the ``unregister`` method was called

        Reversing the ``Topic.unregister()`` and ``Subscriber.unregister()`` methods from
        `here <http://docs.ros.org/api/rospy/html/rospy.topics-pysrc.html>`_.

        """
        # Restore what was removed by the Topic.unregister() method
        self.impl = get_topic_manager().acquire_impl(
            self.reg_type,
            self._attributes_keeper['resolved_name'],
            self._attributes_keeper['data_class']
        )
        self.resolved_name = self._attributes_keeper['resolved_name']
        self.data_class = self._attributes_keeper['data_class']
        self.type = self.data_class._type
        self.md5sum = self.data_class._md5sum

        # Restore what was removed by the Subscriber.unregister() method
        if self._attributes_keeper['queue_size'] is not None:
            self.impl.set_queue_size(self._attributes_keeper['queue_size'])
        if self._attributes_keeper['buff_size'] != DEFAULT_BUFF_SIZE:
            self.impl.set_buff_size(self._attributes_keeper['buff_size'])
        if self._attributes_keeper['callback'] is not None:
            self.impl.add_callback(
                self._attributes_keeper['callback'],
                self._attributes_keeper['callback_args']
            )
            self.callback = self._attributes_keeper['callback']
            self.callback_args = self._attributes_keeper['callback_args']
        else:
            self.callback = self.callback_args = None
        if self._attributes_keeper['tcp_nodelay']:
            self.impl.set_tcp_nodelay(self._attributes_keeper['tcp_nodelay'])
