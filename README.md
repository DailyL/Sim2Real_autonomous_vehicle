# *Robust Sim2Real transfer with deep reinforcement learning for Autonomous vehicles*

## About the work

Deep Reinforcement Learning (DRL) has provided inspiring solutions to various complex tasks in different research fields, but the application of DRL agents to the real world is still a challenge due to the established discrepancies between the simulation and the real world. In this work, we propose a robust DRL framework that uses task-relevant information from the platform-dependent perception module and trains a lane following and overtaking agent in the simulation. Afterward, the DRL agent can be transferred to another simulated environment as well as the real-world environment effectively with minimal effort. For evaluation, different driving scenarios in the evaluation simulator and real-world environment are designed to assess the lane following and overtaking capabilities of the DRL agent. Furthermore, the proposed agent is compared with human players and the PID baseline in the simulation. With the proposed framework, the gaps between different platforms as well as the sim2real gap are narrowed, thus, the trained agent can drive the vehicle with similar performance in simulation and its real counterpart.

<p align = "center">
<img src="/assets/overall_system_hor.jpg" width="600">
</p>

## System Requirments

* Operating System: Ubuntu 20.04
* Programming Language: Python 3.8
* [Software Dependencies](/requirements.txt)


## Hardware
For real world application, we use the DB21 Duckiebot from [Duckietown](https://www.duckietown.org/)

With advanced function, we update this Duckiebot with Lidar (RPLIDAR A1). If you are also interested in update your duckiebot withe Lidar, please check this [Blog](https://www.hackster.io/shahizat005/building-a-map-using-lidar-with-ros-melodic-on-jetson-nano-2f92dd).

## Results
How the LSTM-SAC agent trained in the simulation -> [Video](https://youtu.be/Ypl9kf5JDdM)

How it looks like in real world application -> [Video](https://youtu.be/GUzUrxf70FM)
