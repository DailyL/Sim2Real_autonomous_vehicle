# *Robust Sim2Real transfer with deep reinforcement learning for Autonomous vehicles*

## About the work

Deep Reinforcement Learning (DRL) has provided inspiring solutions to various complex tasks in different research fields, but the application of DRL agents to the real world is still a challenge due to the established discrepancies between the simulation and the real world. In this work, we propose a robust DRL framework that uses task-relevant information from the platform-dependent perception module and trains a lane following and overtaking agent in the simulation. Afterward, the DRL agent can be transferred to another simulated environment as well as the real-world environment effectively with minimal effort. For evaluation, different driving scenarios in the evaluation simulator and real-world environment are designed to assess the lane following and overtaking capabilities of the DRL agent. Furthermore, the proposed agent is compared with human players and the PID baseline in the simulation. With the proposed framework, the gaps between different platforms as well as the sim2real gap are narrowed, thus, the trained agent can drive the vehicle with similar performance in simulation and its real counterpart.

<p align = "center">
<img src="/assets/overall_system_hor.jpg" width="600">
</p>

## Prerequisites

* Operating System: Ubuntu 20.04
* Programming Language: Python 3.8+
* [Software Dependencies](/requirements.txt)
* [ROS (Noetic)](http://wiki.ros.org/noetic/Installation/Ubuntu) with Gazebo
* [Singularity](https://docs.sylabs.io/guides/3.5/user-guide/introduction.html#) for training agents with container, you can also check the instruction from [ZIH TU Dresden](https://doc.zih.tu-dresden.de/software/containers/) 


## Installation

To run the training process or evaluation process, following set up should be installed:


```bash
$ git clone https://github.com/DailyL/Sim2Real_autonomous_vehicle.git
```

Install gym-duckietown:
```bash
$ cd gym-duckietown/
$ pip install -e .
```
Install RL package:
```bash
$ cd training_ws/src/rl_duckietown/src/
$ pip install -e .
```
or 
```bash
$ cd evaluation_ws/src/rl_duckietown/src/
$ pip install -e .
```


## Train the lane following and overtaking agent

### Workspace for ROS package

First set up the [catkin work space](https://wiki.ros.org/catkin#Installing_catkin) for ROS package (training_ws)

```bash
$ cd ~/training_ws/
$ catkin_make
```

source your new setup.sh file:

```bash
$ source devel/setup.bash
```

Make sure ROS_PACKAGE_PATH environment variable includes the directory you're in.


```bash
$ echo $ROS_PACKAGE_PATH
/home/youruser/training_ws/src:/opt/ros/noetic/share
```

Alternatively, set your workspace permanently, open your .bashrc file in a text editor, for example `gedit ~/.bashrc` and add

```bash
export ROS_PACKAGE_PATH=/your/path/to/workspace:$ROS_PACKAGE_PATH
```

### Training 

#### Configuration files

You can specify your training configuration .yaml file and place it in one of the two folders in `training_ws/src/rl_duckietown/src/tud_rl/configs/` depending on the type of action space (discrete, continuous).

In this work,  `duckietown.json` is used as configuration file

#### Start training 

**1. Training locally**

```bash
roslaunch rl_duckietown overtaking.launch 
```

**2. Training with Singularity container**

First build the container

```bash
$ sudo singularity build container.sif container.def
```

And run the training process with container

```bash
$ singularity run container.sif
```

### Evaluation

Change the catkin workspace to `~/evaluation_ws/`

#### Evaluation in gym environment

1. For DRL agent, with the weights in `/evaluation_ws/src/rl_duckietown/src/tud_rl/weights/`

```bash
$ roalaunch rl_duckietown overtaking_in_gym_testing.launch
```

2. For PID baseline

```bash
$ roalaunch rl_duckietown overtaking_in_gym_testing_pid_baseline.launch
```

3. For Human baseline run `python human_baseline.py` with following flags:

##### -p [--playername]
##### -m [--map number]
There are 5 different maps (1-5)
##### -t [--test]
Test mode or record mode, if `yes`, enter traning mode without recording results; if `no`, enter recording mode.

#### Example:

```bash
$ python human_baseline.py -p Dave -m 2 -t yes
```
#### Evaluation in real-world environment

Evaluation in real world requires [Hardware](#Hardware)

## Hardware
For real world application, we use the DB21 Duckiebot from [Duckietown](https://www.duckietown.org/)

With advanced function, we update this Duckiebot with Lidar (RPLIDAR A1). If you are also interested in update your duckiebot withe Lidar, please check this [Blog](https://www.hackster.io/shahizat005/building-a-map-using-lidar-with-ros-melodic-on-jetson-nano-2f92dd).

## Results
How the LSTM-SAC agent trained in the simulation -> [Video](https://youtu.be/Ypl9kf5JDdM)

How it looks like in real world application -> [Video](https://youtu.be/GUzUrxf70FM)

## Copyright

DRL package from [TUD_RL](https://github.com/DailyL/TUD_RL) and evaluation environment from [Duckietown project](https://github.com/duckietown/gym-duckietown/tree/master).
