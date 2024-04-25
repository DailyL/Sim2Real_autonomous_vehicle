#!/usr/bin/env python

import argparse
import numpy as np
import math

import gym
import gym_duckietown
from gym import spaces
from gym_duckietown.simulator import LanePosition, NotInLane
from gym_duckietown.envs import DuckietownEnv
from gym_duckietown.wrappers import UndistortWrapper


parser = argparse.ArgumentParser(description='Hyperparameter setting for solving the Duckietown with PPO')
parser.add_argument('--seed', type=int, default=0, metavar='N', help='random seed')
parser.add_argument('--env-name', default='Duckietown')
parser.add_argument('--map-name', default='zigzag_tree')
parser.add_argument('--distortion', default=False, action='store_true')
parser.add_argument('--draw-curve', action='store_true', help='draw the lane following curve')
parser.add_argument('--draw-bbox', action='store_true', help='draw collision detection bounding boxes')
parser.add_argument('--domain-rand', action='store_true', help='enable domain randomization')
parser.add_argument('--frame-skip', default=0, type=int, help='number of frames to skip')
parser.add_argument('--render', action='store_true', help='render the environment')
args ,unknows = parser.parse_known_args()



class MySimulator(DuckietownEnv):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.action_space = spaces.Box(
            low=np.array([-1.0, -1.]),
            high=np.array([1.0, 1.]),
            shape=(2,),
            dtype=np.float32
        )

        self.observation_space = spaces.Box(
            low=0.,
            high=255.,
            shape=(self.camera_height, self.camera_width, 3),
            dtype=np.uint8
        )
        
        self.kp = 5
        self.kd = 2
        

    
    def action_duck(self, pos, angle):

        lp = self.get_lane_pos2(pos, angle)
        angle_nor = (lp.angle_deg + 6.435471) / 90
        dist = lp.dist
        steering = self.kp * angle_nor + self.kd * dist

        action = [0.4, steering]
        action = np.array(action)
        return action
    
    def step_duck(self, action: np.ndarray):
        pos = self.cur_pos
        angle = self.cur_angle
        action = self.action_duck(pos, angle)
        obs, _ , _, _= super().step(action)

        return obs
    
    def reset(self):
        obs = super().reset()
        pos = self.cur_pos
        angle = self.cur_angle

        return pos, angle
    

        
    

        
env = MySimulator(
    seed =  args.seed,
    map_name = args.map_name,
    max_steps= 2000,
    draw_curve = args.draw_curve,
    draw_bbox = args.draw_bbox,
    domain_rand = args.domain_rand,
    distortion = args.distortion,
)



