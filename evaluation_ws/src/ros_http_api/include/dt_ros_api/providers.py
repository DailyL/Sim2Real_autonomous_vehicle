import rospy
import rosgraph

from duckietown.dtros import TopicDirection
from duckietown.dtros.dtsubscriber import DTSubscriber

from .knowledge_base import KnowledgeBase
from .constants import DataProvider, default_node_info, default_topic_info, default_service_info, is_infra_topic, is_infra_node
from socket import error


class TimedDataProvider(DataProvider):

    def __init__(self, *args, **kwargs):
        # call super constructor
        super(TimedDataProvider, self).__init__()
        # read the timeout parameter
        if 'dt_timeout' not in kwargs:
            raise ValueError("TimedDataProvider.__init__ expected the parameter 'dt_timeout'")
        self._timeout = int(kwargs['dt_timeout'])
        # keep track of the last interest
        self._last_interest_time = rospy.get_time()

    def is_time(self):
        return self._timeout < 0 or (rospy.get_time() - self._last_interest_time <= self._timeout)

    def renew_interest(self):
        # keep track of the last interest
        self._last_interest_time = rospy.get_time()


class SubscriberProvider(TimedDataProvider, DTSubscriber):

    def __init__(self, *args, **kwargs):
        # call super constructors
        TimedDataProvider.__init__(self, *args, **kwargs)
        DTSubscriber.__init__(self, *args, **kwargs)
        # subscriber monitor timer
        self._subscriber_monitor_timer = rospy.Timer(
            period=rospy.Duration.from_sec(5),
            callback=self._timer_monitor_cb,
            oneshot=False
        )

    def _timer_monitor_cb(self, _):
        # enabled -> disabled
        if self.active and (not self.is_time()):
            # disable subscriber
            self.switch_off()
        # disabled -> enabled
        if (not self.active) and self.is_time():
            # enable subscriber
            self.switch_on()


class RosGraphProvider(DataProvider):

    def __init__(self):
        # call super constructor
        super(RosGraphProvider, self).__init__()
        # create master handler
        self._master = rosgraph.Master(rospy.get_name())
        # subscriber monitor timer
        self._heart_beat = rospy.Timer(
            period=rospy.Duration.from_sec(30),
            callback=self._fetch_system_status,
            oneshot=False
        )
        # fetch graph right away
        self._fetch_system_status(None)

    def _fetch_system_status(self, _):
        topic_key = lambda x, t: '/topic/%s%s' % (x, t)
        service_key = lambda x, s: '/service/%s%s' % (x, s)
        node_key = lambda x, n: '/node/%s%s' % (x, n)
        try:
            pubs, subs, srvs = self._master.getSystemState()
        except (rosgraph.masterapi.Error, rosgraph.masterapi.Failure, Exception, error):
            return
        # create a node -> topics mapping
        node_to_topic = {}
        node_to_service = {}
        topics = {}
        services = {}
        all_nodes = set()
        all_topics = set()
        all_services = set()

        # process publishers
        for topic, publishers in pubs:
            if is_infra_topic(topic):
                continue
            # ---
            KnowledgeBase.set(topic_key('publishers', topic), publishers)
            # populate node -> topics map
            for pub in publishers:
                if is_infra_node(pub):
                    continue
                # ---
                if pub not in node_to_topic:
                    node_to_topic[pub] = {}
                node_to_topic[pub][topic] = default_topic_info(topic, TopicDirection.OUTBOUND)
                # populate node/list
                all_nodes.add(pub)
            # add topic to list of topics (if not present)
            if not KnowledgeBase.has(topic_key('info', topic)):
                topics[topic] = default_topic_info(topic, None, node_agnostic=True)
            # populate topic/list
            all_topics.add(topic)

        # process subscribers
        for topic, subscribers in subs:
            if is_infra_topic(topic):
                continue
            # ---
            KnowledgeBase.set(topic_key('subscribers', topic), subscribers)
            # populate node -> topics map
            for sub in subscribers:
                if is_infra_node(sub):
                    continue
                # ---
                if sub not in node_to_topic:
                    node_to_topic[sub] = {}
                node_to_topic[sub][topic] = default_topic_info(topic, TopicDirection.INBOUND)
                # populate node/list
                all_nodes.add(sub)
            # add topic to list of topics (if not present)
            if not KnowledgeBase.has(topic_key('info', topic)):
                topics[topic] = default_topic_info(topic, None, node_agnostic=True)
            # populate topic/list
            all_topics.add(topic)

        # process services
        for service, providers in srvs:
            KnowledgeBase.set(service_key('providers', service), providers)
            # populate node -> service map
            for prov in providers:
                if is_infra_node(prov):
                    continue
                # ---
                if prov not in node_to_service:
                    node_to_service[prov] = []
                node_to_service[prov].append(service)
                # populate node/list
                all_nodes.add(prov)
            # add service to list of services (if not present)
            if not KnowledgeBase.has(service_key('info', service)):
                services[service] = default_service_info()
            # create topic/list
            all_services.add(service)

        # store /node/list
        KnowledgeBase.set(node_key('list', ''), all_nodes)
        # store /topic/list
        KnowledgeBase.set(topic_key('list', ''), all_topics)
        # store /topic/list
        KnowledgeBase.set(service_key('list', ''), all_services)

        # store /node/info
        for node in all_nodes:
            if not KnowledgeBase.has(node_key('info', node)):
                KnowledgeBase.set(node_key('info', node), default_node_info())

        # store /topic/info
        for topic, topic_info in topics.items():
            KnowledgeBase.set(topic_key('info', topic), topic_info)

        # store /service/info
        for service, service_info in services.items():
            KnowledgeBase.set(service_key('info', service), service_info)

        # # update node/topics info
        node_topics = {
            node: KnowledgeBase.get(node_key('topics', node), {}) for node in node_to_topic
        }
        node_services = {
            node: KnowledgeBase.get(node_key('services', node), []) for node in node_to_service
        }
        # merge rosgraph data with what is already in the KB
        # - /node/topics
        for node, topics in node_to_topic.items():
            for topic, topic_info in topics.items():
                # use this information only if the topic is not there yet (preserve Diagnostics)
                if topic in node_topics[node]:
                    continue
                node_topics[node][topic] = topic_info
            KnowledgeBase.set(node_key('topics', node), node_topics[node])
        # - /node/services
        for node, services in node_to_service.items():
            srvs = list(set(services + node_services[node]))
            KnowledgeBase.set(node_key('services', node), srvs)

