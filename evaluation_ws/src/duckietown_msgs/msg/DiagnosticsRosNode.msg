# Node type (this has to match duckietown.NodeType)
uint8 NODE_TYPE_GENERIC = 0
uint8 NODE_TYPE_DRIVER = 1
uint8 NODE_TYPE_PERCEPTION = 2
uint8 NODE_TYPE_CONTROL = 3
uint8 NODE_TYPE_PLANNING = 4
uint8 NODE_TYPE_LOCALIZATION = 5
uint8 NODE_TYPE_MAPPING = 6
uint8 NODE_TYPE_SWARM = 7
uint8 NODE_TYPE_BEHAVIOR = 8
uint8 NODE_TYPE_VISUALIZATION = 9
uint8 NODE_TYPE_INFRASTRUCTURE = 10
uint8 NODE_TYPE_COMMUNICATION = 11
uint8 NODE_TYPE_DIAGNOSTICS = 12
uint8 NODE_TYPE_DEBUG = 20

# Node health (this has to match duckietown.NodeHealth)
uint8 NODE_HEALTH_UNKNOWN = 0
uint8 NODE_HEALTH_STARTING = 5
uint8 NODE_HEALTH_STARTED = 6
uint8 NODE_HEALTH_HEALTHY = 10
uint8 NODE_HEALTH_WARNING = 20
uint8 NODE_HEALTH_ERROR = 30
uint8 NODE_HEALTH_FATAL = 40

Header header
string name             # Node publishing this message
string help             # Node description
uint8 type              # Node type (see NODE_TYPE_X above)
uint8 health            # Node health (see NODE_HEALTH_X above)
string health_reason    # String describing the reason for this health status (if any)
float32 health_stamp    # Time when the health status changed into the current
bool enabled            # Status of the switch
string uri              # RPC URI of the node
string machine          # Machine hostname or IP where this node is running
string module_type      # Module containing this node
string module_instance  # ID of the instance of the module running this node
