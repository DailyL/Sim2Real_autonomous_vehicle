#!/usr/bin/env python
import gym
import gym_duckietown
from gym_duckietown.envs.duckietown_env import DuckietownROS, DuckietownEnv
def launch_env(id=None):
    env = None
    if id is None:
        env = DuckietownEnv(
            seed=123, # random seed
            map_name="small_loop_cw",
            max_steps=5000000001, # we don't want the gym to reset itself
            domain_rand=0,
            camera_width=640,
            camera_height=480,
            accept_start_angle_deg=4, # start close to straight
            full_transparency=True,
            distortion=False,
        )
    else:
        env = gym.make(id)

    return env