# Topic direction (this has to match duckietown.TopicDirection)
uint8 TOPIC_DIRECTION_INBOUND = 0
uint8 TOPIC_DIRECTION_OUTBOUND = 1

# Topic type (this has to match duckietown.TopicType)
uint8 TOPIC_TYPE_GENERIC = 0
uint8 TOPIC_TYPE_DRIVER = 1
uint8 TOPIC_TYPE_PERCEPTION = 2
uint8 TOPIC_TYPE_CONTROL = 3
uint8 TOPIC_TYPE_PLANNING = 4
uint8 TOPIC_TYPE_LOCALIZATION = 5
uint8 TOPIC_TYPE_MAPPING = 6
uint8 TOPIC_TYPE_SWARM = 7
uint8 TOPIC_TYPE_BEHAVIOR = 8
uint8 TOPIC_TYPE_VISUALIZATION = 9
uint8 TOPIC_TYPE_INFRASTRUCTURE = 10
uint8 TOPIC_TYPE_COMMUNICATION = 11
uint8 TOPIC_TYPE_DIAGNOSTICS = 12
uint8 TOPIC_TYPE_DEBUG = 20

string node                     # Node publishing this message
string name                     # Topic object of the diagnostics
string help                     # Topic description
uint8 type                      # Topic type
uint8 direction                 # Topic direction
float32 frequency               # Topic frequency (Hz)
float32 effective_frequency     # Topic (effective) frequency (Hz)
float32 healthy_frequency       # Frequency at which this topic can be considered healthy
float32 bandwidth               # Topic bandwidth (byte/s)
bool enabled                    # Topic switch
