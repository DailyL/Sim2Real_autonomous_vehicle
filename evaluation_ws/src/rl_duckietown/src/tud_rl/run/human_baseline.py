#!/usr/bin/env python

"""
Record and evaluate how a human can control a simulated Duckiebot.
A simulator windows should appear soon after starting the script, where you can control the robot using the arrow keys.
After the termination of an episode the recorded trajectory will be analysed (you might need to wait a few seconds for
this), then the next episode will start.
"""

import random
import numpy as np
import logging
import math
from gym_duckietown.simulator import Simulator, ROBOT_LENGTH, ROBOT_WIDTH, WHEEL_DIST
from duckietown_utils.duckietown_world_evaluator_new import DuckietownWorldEvaluator
from duckietown_utils.trajectory_plot import correct_gym_duckietown_coordinates
from duckietown_utils.utils import seed
from config.config import load_config
import pyglet
from pyglet.window import key
from gym_duckietown.envs.duckietown_env import DuckietownEnv
import argparse
from colorama import Fore, Back, Style
logger = logging.getLogger()
logger.setLevel(logging.INFO)



msg = """
Reading from the keyboard  and Publishing to control the vehicle!
---------------------------
        up arrow
left arrow     right arrow
       down arrow

q/z : increase/decrease max speeds by 10%
CTRL-C to quit
"""





def launch_env(id=None):
    env = None
    if id is None:
        env = Simulator(
            seed=SEED, # random seed
            map_name=evaluate_map,
            max_steps=1801, # we don't want the gym to reset itself
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

class DuckietownWorldEvaluatorHumanBaseline(DuckietownWorldEvaluator):
    def __init__(self, env, eval_map, max_episode_steps):
        super(DuckietownWorldEvaluatorHumanBaseline, self).__init__(env, eval_map, max_episode_steps)
        self.episode_path = []
        self.episode_orientations = []
        self.episode_timestamps = []
        self.env.reset()
        self.env.render()
        # Register a keyboard handler
        self.key_handler = key.KeyStateHandler()
        self.env.unwrapped.window.push_handlers(self.key_handler)
        pyglet.clock.schedule_interval(self.update, 1.0 / self.env.unwrapped.frame_rate)
        self.joystick = None
        self.x_speed = 0.5 
        self.y_speed = 0.5
        self.speed_up = 1.1
        self.speed_down = 0.9
        joysticks = pyglet.input.get_joysticks()
        if joysticks:
            self.joystick = joysticks[0]
            self.joystick.open()

    def _collect_trajectory(self, agent, i):
        self.episode_path = []
        self.episode_orientations = []
        self.episode_timestamps = []
        if self.map_name in self.start_poses.keys():
            self.env.unwrapped.user_tile_start = [0, 0]
            self.env.unwrapped.start_pose = self.start_poses[self.map_name][i % len(self.start_poses[self.map_name])]
        self.env.reset()
        self.env.render()
        # Enter main event loop
        pyglet.app.run()

        return self.episode_path, self.episode_orientations, self.episode_timestamps

    def update(self, dt):
        """
        This function is called at every frame to handle
        movement/stepping and redrawing
        """
        action = np.array([0.0, 0.0])
        if self.key_handler[key.Q]:
            self.x_speed = self.x_speed * self.speed_up
            self.y_speed = self.y_speed * self.speed_up
        if self.key_handler[key.Z]:
            self.x_speed = self.x_speed * self.speed_down
            self.y_speed = self.y_speed * self.speed_down
        if self.key_handler[key.UP]:
            action = np.array([self.x_speed, self.y_speed])
        if self.key_handler[key.DOWN]:
            action = np.array([-0.5, -0.5])
        if self.key_handler[key.LEFT]:
            action = np.array([0, 0.4])
        if self.key_handler[key.RIGHT]:
            action = np.array([0.4, 0.])
        if self.key_handler[key.SPACE]:
            action = np.array([0, 0])

        if self.joystick is not None:
            # action = np.array([self.joystick.z, self.joystick.rz])
            steering = self.joystick.rx
            action = np.clip(np.array([1 + steering, 1 - steering]), 0., 1.) * np.clip(self.joystick.z, 0, 1)

        obs, reward, done, info = self.env.step(action)
        cur_pos = correct_gym_duckietown_coordinates(self.env.unwrapped, self.env.unwrapped.cur_pos)
        self.episode_path.append(cur_pos)
        self.episode_orientations.append(np.array(self.env.unwrapped.cur_angle))
        self.episode_timestamps.append(info['Simulator']['timestamp'])
        if done:
            pyglet.app.exit()

        self.env.render()


if __name__ == "__main__":

    # get config 
    parser = argparse.ArgumentParser()
    parser.add_argument("-p", "--player_name", help="Input the player name for the leaderboard.", type=str, default="anonymous")
    parser.add_argument("-m", "--map", help="Name of the maps.", type=int, default=1)
    parser.add_argument("-t", "--test", help="If test or not", type=str, default="yes")    
    args = parser.parse_args()
    maps = ["loop_empty", "ETHZ_autolab_technical_track", "_plus_floor", "LF-norm-zigzag", "_huge_V_floor"]

    evaluate_map = maps[args.map - 1]
    SEED = random.randint(0,20000)
    name = args.player_name
    if args.test == "yes":
        test = True
        results_path = "human_baseline/test/"+ name + "/" + evaluate_map + "_" + str(SEED) + "_evaluate_gym_duckietown"
        run_episodes = 10000000
    else:
        test = False
        results_path = "human_baseline/real/"+ name + "/" + evaluate_map + "_" + str(SEED) + "_evaluate_gym_duckietown"
        run_episodes = 10
    

    env = launch_env()
    ###########################################################
    # Plot trajectories and evaluate performance
    print(Fore.RED + msg)
    evaluator = DuckietownWorldEvaluatorHumanBaseline(env = env, eval_map=evaluate_map, max_episode_steps=1801)
    evaluator.evaluate(None, results_path, test, episodes=run_episodes)
