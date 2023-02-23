# Sensor Suite

### Purpose

Duckiebot V2 adds support for various sensors, including, but not limited to, the following:

 - Inertial Measurement Unit (IMU)
 - Wheel encoder
 - Line following sensors (Detect brightness of lines on the floor)
 - Time of Flight (ToF) distance sensors

### Usage

There are individual launchfiles for each sensor. However, to launch the drivers for all sensors at once, run:

```
roslaunch sensor_suite all_sensors.launch veh:=$VEHICLE_NAME
```

This will start all sensor nodes. Each node will attempt to communicate with its sensor. If it fails, the node
will shut down gracefully. This means that users can plug in any subset of sensors to the Duckiebot, start the
sensor suite drivers, and end up with only the necessary drivers running.

TODO: The encoder node currently has no good way to detect the presence/absence of the wheel encoder. Investigate this.

After starting the nodes, you can use `rostopic list` to view the relevant ROS topics.

### Adding new sensors

To add new sensors, perform the following steps:

 - Add the driver to `include/sensor_suite/` (If necessary)
 - Add a config file to `config/<name of your node>/default.yaml` (If necessary)
 - Add the node to `src/`
   - Your node should work similarly to the existing sensor nodes: If it does not detect your sensor, it should
     gracefully shut down.
 - Add a launch file to `launch/`
 - Add a reference to your new launch file in `launch/all_sensors.launch`
 - If you want to make this sensor available for others to use: Submit a PR to this repository

### Authors

The drivers in this package were originally written by @DurrerMarina and @hosnerm, in the following places:

 - https://github.com/DurrerMarina/tof_driver
 - https://github.com/DurrerMarina/imu_driver
 - https://github.com/DurrerMarina/sensor_suite
 - https://github.com/hosnerm/Software/tree/devel-dbv2-LQRI-encoder-18/catkin_ws/src/50-misc-additional-functionality/sensor_suite (Encoder node)
 
These drivers were moved to this repository by @ItsTimmy.