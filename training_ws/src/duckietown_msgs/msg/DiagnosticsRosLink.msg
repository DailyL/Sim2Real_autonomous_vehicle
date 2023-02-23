# Link direction
uint8 LINK_DIRECTION_INBOUND = 0
uint8 LINK_DIRECTION_OUTBOUND = 1

string node         # Node publishing this message
string topic        # Topic transferred over the link
string remote       # Remote end of this link
uint8 direction     # Link direction
bool connected      # Status of the link
string transport    # Type of transport used for this link
uint64 messages     # Number of messages transferred over this link
uint64 dropped      # Number of messages dropped over this link
float32 bytes       # Volume of data transferred over this link
float32 frequency   # Link frequency (Hz)
float32 bandwidth   # Link bandwidth (byte/s)
