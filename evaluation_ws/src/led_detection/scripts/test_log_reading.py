#!/usr/bin/env python3

import duckietown_rosbag_utils as dbu

print("This simple test reads all images in a log and computes some stats.")
import sys

args = sys.argv[1:]

if len(args) != 1:
    print("Usage: \n\n\t\t rosrun led_detection test_log_reading <bag>")
    sys.exit(1)

filename = sys.argv[1]

print(f"filename: {filename}")

data = dbu.d8n_read_all_images(filename)


print(data.shape)  # (928,)
print(data.dtype)  # [('timestamp', '<f8'), ('rgb', 'u1', (480, 640, 3))]

num_images = data.shape[0]
for k in range(num_images):
    timestamp = data[k]["timestamp"]
    rgb = data[k]["rgb"]
    assert len(rgb.shape) == 3, rgb.shape
    assert rgb.shape[2] == 3, rgb.shape


timestamps = data[:]["timestamp"]
period = (timestamps[-1] - timestamps[0]) / num_images
fps = 1.0 / period

print(f"fps: {fps:.2f}")
