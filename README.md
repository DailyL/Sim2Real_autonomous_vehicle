# **Robust Sim2Real transfer with deep reinforcement learning for Autonomous vehicles**

## About the work

Deep Reinforcement Learning (DRL) has shown remarkable success in solving complex tasks across various research fields. However, transferring DRL agents to the real world is still challenging due to the significant discrepancies between simulation and reality. To address this issue, we propose a robust DRL framework that leverages platform-dependent perception modules to extract task-relevant information and train a lane-following and overtaking agent in simulation. This framework facilitates the seamless transfer of the DRL agent to new simulated environments and the real world with minimal effort. We evaluate the performance of the agent in various driving scenarios in both simulation and the real world, and compare it to human players and the PID baseline in simulation. Our proposed framework significantly reduces the gaps between different platforms and the Sim2Real gap, enabling the trained agent to achieve similar performance in both simulation and the real world, driving the vehicle effectively.

<p align = "center">
<img src="/assets/overall_system_hor.jpg" width="600">
</p>


[Project website](https://dailyl.github.io/sim2realVehicle.github.io/)   
[Paper](https://arxiv.org/abs/2304.08235)

## Table of Contents



1. [Introduction](#About-the-work)
2. [Prerequisites](#Prerequisites)
3. [Installation](#Installation)
4. [Training](#Train-the-lane-following-and-overtaking-agent)
	1. [Workspace setup](#Workspace-for-ROS-package)
	2. [Train](#Training)
		1. [Configuration files](#Configuration-files)
		2. [Start training](#Start-training)
	3. [Evaluation](#Evaluation)
		1. [Evaluation in Gym environment](#Evaluation-in-gym-environment)
		2. [Evaluation in real-world environment](#Evaluation-in-real-world-environment)
5. [Results](#Results)
6. [Hardware](#Hardware)
7. [Copyright](#Copyright)


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
The recored results are in `human_baseline/final/`


#### Evaluation in real-world environment

Evaluation in the real world requires [Hardware](#Hardware) and prior knowledge of [running ROS across multiple machines](http://wiki.ros.org/ROS/Tutorials/MultipleMachines).

First, set up the IP address of your local machine and vehicle, you can check the set up in `.bashrc`:

```bash
export ROS_HOSTNAME = 192.168.0.1
export ROS_MASTER_URI = http://192.168.0.2:11311
```
`192.168.0.1` is the IP address of your LOCAL machine (laptop), and `192.168.0.2` is the IP address of vehicle.

Then, open a terminal on your laptop and run `rostopic`  to check if you can access to  the topic published by the vehicle.

Additional, if you also use RPlidar, you need to set up the [rplidar ros package](https://github.com/Slamtec/rplidar_ros) and [laser filters](https://github.com/ros-perception/laser_filters) to read the lidar info from rplidar.

If you succeefully seen the topic `/scan`, you can start to evaluate the trained DRL agent with real-world vehicle with:

```bash
$ roslaunch rl_duckietown overtaking_test.launch
```




## Results

The results (videos and tables) for evluation in simulation and real world is on the [website](https://dailyl.github.io/sim2realVehicle.github.io/).

## Hardware
For real world application, we use the DB21 Duckiebot from [Duckietown](https://www.duckietown.org/)

With advanced function, we update this Duckiebot with Lidar (RPLIDAR A1). If you are also interested in update your duckiebot withe Lidar, please check this [Blog](https://www.hackster.io/shahizat005/building-a-map-using-lidar-with-ros-melodic-on-jetson-nano-2f92dd).



## Copyright

DRL package from [TUD_RL](https://github.com/DailyL/TUD_RL) and evaluation environment from [Duckietown project](https://github.com/duckietown/gym-duckietown/tree/master).
