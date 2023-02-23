# Package `image_processing`

This package contains image processing nodes.

## Nodes

### Decoder Node

This node takes in a `sensor_msgs/CompressedImage` message and a 
parameter `publish_freq`, and publishes out a message of type 
`sensor_msgs/Image` with a frequency capped at `publish_freq`.
