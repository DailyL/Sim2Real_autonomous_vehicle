#!/usr/bin/env python
import argparse
import json
import pickle
import random
import time
import rospy
import os
import numpy as np
import matplotlib.pyplot as plt
import torch
from tud_rl.envs.MountainCar import MountainCar
import rospkg
import gym
import gym_duckietown
from gym_duckietown.envs.duckietown_env import DuckietownROSOvertaking, DuckietownROSOvertaking_PID_Baseline, DuckietownROSCarfollowing_SB
import logging
from ray.tune.logger import pretty_print
import copy
from config.config import find_and_load_config_by_seed, update_config, print_config
from config.paths import ArtifactPaths

from stable_baselines3 import PPO
from stable_baselines3.common.env_util import make_vec_env
from stable_baselines3.ppo.policies import MlpPolicy
from stable_baselines3.common.evaluation import evaluate_policy
from stable_baselines3.common.env_checker import check_env
from stable_baselines3.common.policies import ActorCriticPolicy
from stable_baselines3.common.callbacks import BaseCallback
from torch import nn
from stable_baselines3.common.monitor import Monitor
from stable_baselines3.common.results_plotter import load_results, ts2xy

from duckietown_world import SE2Transform
from duckietown_world.rules import evaluate_rules
from duckietown_world.rules.rule import EvaluatedMetric, make_timeseries
from duckietown_world.seqs.tsequence import SampledSequence
from duckietown_world.svg_drawing import draw_static
from duckietown_world.world_duckietown.duckiebot import DB18
from duckietown_world.world_duckietown.map_loading import load_map

from duckietown_utils.env import launch_and_wrap_env
from duckietown_utils.trajectory_plot import correct_gym_duckietown_coordinates


evaluate_map = "large_loop_cf"
logger = logging.getLogger(__name__)
import pandas as pd

class TensorboardCallback(BaseCallback):
    """
    Custom callback for plotting additional values in tensorboard.
    """

    def __init__(self, verbose=0):
        super().__init__(verbose)

    def _on_step(self) -> bool:
        # Log scalar value (here a random variable)
        value = np.random.random()
        self.logger.record("Num timesteps", self.num_timesteps)
        return True



class SaveOnBestTrainingRewardCallback(BaseCallback):
    """
    Callback for saving a model (the check is done every ``check_freq`` steps)
    based on the training reward (in practice, we recommend using ``EvalCallback``).

    :param check_freq: (int)
    :param log_dir: (str) Path to the folder where the model will be saved.
      It must contains the file created by the ``Monitor`` wrapper.
    :param verbose: (int)
    """

    def __init__(self, check_freq: int, log_dir: str, verbose=1):
        super().__init__(verbose)
        self.check_freq = check_freq
        self.log_dir = log_dir
        self.save_path = os.path.join(log_dir, "best_model")
        self.best_mean_reward = -np.inf

    def _init_callback(self) -> None:
        # Create folder if needed
        if self.save_path is not None:
            os.makedirs(self.save_path, exist_ok=True)

    def _on_step(self) -> bool:
        if self.n_calls % self.check_freq == 0:

            # Retrieve training reward
            x, y = ts2xy(load_results(self.log_dir), "timesteps")
            if len(x) > 0:
                # Mean training reward over the last 100 episodes
                mean_reward = np.mean(y[-100:])
                if self.verbose > 0:
                    print(f"Num timesteps: {self.num_timesteps}")
                    print(
                        f"Best mean reward: {self.best_mean_reward:.2f} - Last mean reward per episode: {mean_reward:.2f}"
                    )

                # New best model, you could save the agent here
                if mean_reward > self.best_mean_reward:
                    self.best_mean_reward = mean_reward
                    # Example for saving best model
                    if self.verbose > 0:
                        print(f"Saving new best model to {self.save_path}.zip")
                    self.model.save(self.save_path)

        return True




def launch_env(map, id=None):
    env = None
    if id is None:
        env = DuckietownROSCarfollowing_SB(
            seed=SEED, # random seed
            map_name=map,
            max_steps=2001, # we don't want the gym to reset itself
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


def evaluate(model, env, num_episodes):
    """
    Evaluate a RL agent
    :param model: (BaseRLModel object) the RL Agent
    :param num_episodes: (int) number of episodes to evaluate it
    :return: (float) Mean reward for the last num_episodes
    """
    # This function will only work for a single Environment
    all_episode_rewards = []

    for i in range(num_episodes):
        episode_rewards = []
        done = False
        obs = env.reset()
        eval_epi_steps = 0
        ego_speed_list = []
        ego_pos_list = []
        ego_dist_list = []
        ego_angle_dist_list = []
        leader_speed_list = []
        leader_pos_list = []
        while not done:
            eval_epi_steps += 1
            # _states are only useful when using LSTM policies
            action, _states = model.predict(obs)
            # here, action, rewards and dones are arrays
            # because we are using vectorized env
            obs, reward, done, info = env.step(action)
            ego_speed_list.append(info["Simulator"]['robot_speed'])
            ego_pos_list.append(info["Simulator"]['cur_pos'])
            ego_dist_list.append(info["Simulator"]['lane_position']['dist'])
            ego_angle_dist_list.append(info["Simulator"]['lane_position']['angle_rad'])
            leader_speed_list.append(info["Simulator"]['Other_vehicle_speed'])
            leader_pos_list.append(info["Simulator"]['Other_vehicle_pos'])
            env.render('top_down')
            episode_rewards.append(reward)
            # break option
            if eval_epi_steps == 2001:
                break
        df = pd.DataFrame({
            'ego_speed': ego_speed_list,
            'ego_pos': ego_pos_list,
            'ego_dist': ego_dist_list,
            'ego_angle_dist': ego_angle_dist_list,
            'leader_speed': leader_speed_list,
            'leader_pos': leader_pos_list
        })
        df.to_csv(f"{results_path}test_{i + 1}.csv", index=False)
        all_episode_rewards.append(sum(episode_rewards))

    mean_episode_reward = np.mean(all_episode_rewards)
    print("Mean reward:", mean_episode_reward, "Num episodes:", num_episodes)

    return mean_episode_reward



class DuckietownWorldEvaluator:
    """
    Evaluates a RLlib agent using the same evaluator which is used in DTS evaluate.
    To adapt for a different agent implementation than RLlib, __init__ and _compute_action,
    (_collect_trajectory) should be modified.
    """
    # These start poses are exactly the same as used by dts evaluate
    # Pose description [[x, 0, z], rot].
    # x, z are measured in meters (x: horizontal, z: vertical, [0,0,0]: top left corner), rot is measured in radians
    start_poses = {'ETHZ_autolab_technical_track': [[[0.7019999027252197, 0, 0.41029359288296474], -0.2687807048071267],
                                                    [[0.44714101540138385, 0, 2.2230001401901243], 1.31423292675173],
                                                    [[1.5552862449923595, 0, 1.0529999446868894], 1.4503686084072878],
                                                    [[1.6380000114440918, 0, 3.0929162652880935], -3.0264009229581674],
                                                    [[0.3978251477698904, 0, 2.8080000591278074], 1.2426744274199626],
                                                    # [[0.2, 0, 2.8], np.pi/2*1.1],  # For testing lane-correction
                                                    # [[0.585, 0, 5.75*0.585], np.pi],  # For testing lane-correction
                                                    ],
                   '_myTestA': [[[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2],
                                [[0.585 / 4, 0, 0.585], -np.pi / 2]
                                ]
                   }

    def __init__(self, env, eval_map,max_episode_steps):
        
        # Make testing env
        self.env = env

        # Set up evaluator
        # Creates an object 'duckiebot'
        self.ego_name = 'duckiebot'
        self.db = DB18()  # class that gives the appearance
        # load one of the maps
        self.dw = load_map(eval_map)
        self.map_name = eval_map
        self.max_episode_steps = max_episode_steps
    def evaluate(self, model, outdir, episodes):
        """
        Evaluates the agent on the map inicialised in __init__
        :param agent: Agent to be evaluated, passed to self._collect_trajectory(agent,...)
        :param outdir: Directory for logged outputs (trajectory plots + numeric data)
        :param episodes: Number of evaluation episodes, if None, it is determined based on self.start_poses
        """
        if not os.path.exists(outdir):
            os.makedirs(outdir)
        if episodes is None:
            episodes = len(self.start_poses.get(DEFAULT_EVALUATION_MAP, []))
        totals = {}
        for i in range(episodes):
            episode_path, episode_orientations, episode_timestamps = self._collect_trajectory(model,i)
            logger.info("Episode {}/{} sampling completed".format(i+1, episodes))
            if len(episode_timestamps) <= 1:
                continue
            episode_path = np.stack(episode_path)
            episode_orientations = np.stack(episode_orientations)
            # Convert them to SampledSequences
            transforms_sequence = []
            for j in range(len(episode_path)):
                transforms_sequence.append(SE2Transform(episode_path[j], episode_orientations[j]))
            transforms_sequence = SampledSequence.from_iterator(enumerate(transforms_sequence))
            transforms_sequence.timestamps = episode_timestamps

            _outdir = outdir
            if outdir is not None and episodes > 1:
                _outdir = os.path.join(outdir, "Trajectory_{}".format(i+1))
            evaluated = self._eval_poses_sequence(transforms_sequence, outdir=_outdir)
            logger.info("Episode {}/{} plotting completed".format(i+1, episodes))
            totals = self._extract_total_episode_eval_metrics(evaluated, totals, display_outputs=True)
        # Calculate the median total metrics
        median_totals = {}
        mean_totals = {}
        stdev_totals = {}
        for key, value in totals.items():
            median_totals[key] = np.median(value)
            mean_totals[key] = np.mean(value)
            stdev_totals[key] = np.std(value)
        # Save results to file
        with open(os.path.join(outdir, "total_metrics.json"), "w") as json_file:
            json.dump({'median_totals': median_totals,
                       'mean_totals': mean_totals,
                       'stdev_totals': stdev_totals,
                       'episode_totals': totals}, json_file, indent=2)

        logger.info("\nMedian total metrics: \n {}".format(pretty_print(median_totals)))
        logger.info("\nMean total metrics: \n {}".format(pretty_print(mean_totals)))
        logger.info("\nStandard deviation of total metrics: \n {}".format(pretty_print(stdev_totals)))
    def _collect_trajectory(self, model, i):
        episode_path = []
        episode_orientations = []
        episode_timestamps = []
        episode_rewards = []
        done = False
        obs = self.env.reset()
        eval_epi_steps = 0
        ego_speed_list = []
        ego_pos_list = []
        ego_dist_list = []
        ego_angle_dist_list = []
        leader_speed_list = []
        leader_pos_list = []
        while not done:
            eval_epi_steps += 1

            action, _states = model.predict(obs)
            # here, action, rewards and dones are arrays
            # because we are using vectorized env
            obs, reward, done, info = self.env.step(action)
            ego_speed_list.append(info["Simulator"]['robot_speed'])
            ego_pos_list.append(info["Simulator"]['cur_pos'])
            ego_dist_list.append(info["Simulator"]['lane_position']['dist'])
            ego_angle_dist_list.append(info["Simulator"]['lane_position']['angle_rad'])
            leader_speed_list.append(info["Simulator"]['Other_vehicle_speed'])
            leader_pos_list.append(info["Simulator"]['Other_vehicle_pos'])
            self.env.render('top_down')
            episode_rewards.append(reward)

            cur_pos = correct_gym_duckietown_coordinates(self.env.unwrapped, self.env.unwrapped.cur_pos)
            episode_path.append(cur_pos)
            episode_orientations.append(np.array(self.env.unwrapped.cur_angle))
            episode_timestamps.append(info['Simulator']['timestamp'])
            if eval_epi_steps == self.max_episode_steps:
                break
        df = pd.DataFrame({
            'ego_speed': ego_speed_list,
            'ego_pos': ego_pos_list,
            'ego_dist': ego_dist_list,
            'ego_angle_dist': ego_angle_dist_list,
            'leader_speed': leader_speed_list,
            'leader_pos': leader_pos_list
        })
        df.to_csv(f"{results_path}test_{i + 1}.csv", index=False)
        self.env.unwrapped.start_pose = None
        self.user_tile_start = None
        return episode_path, episode_orientations, episode_timestamps

    def _eval_poses_sequence(self, poses_sequence, outdir=None):
        """
        :param poses_sequence:
        :param outdir: If None evaluation outputs plots won't be saved
        :return:
        """
        # puts the object in the world with a certain "ground_truth" constraint
        self.dw.set_object(self.ego_name, self.db, ground_truth=poses_sequence)
        # Rule evaluation (do not touch)
        interval = SampledSequence.from_iterator(enumerate(poses_sequence.timestamps))
        evaluated = evaluate_rules(poses_sequence=poses_sequence,
                                   interval=interval, world=self.dw, ego_name=self.ego_name)
        if outdir is not None:
            timeseries = make_timeseries(evaluated)
            draw_static(self.dw, outdir, timeseries=timeseries)
        print(self.dw.get_drawing_children())
        self.dw.remove_object(self.ego_name)
        return evaluated

    @staticmethod
    def _extract_total_episode_eval_metrics(evaluated, totals, display_outputs=False):
        episode_totals = {}
        for k, rer in evaluated.items():
            from duckietown_world.rules import RuleEvaluationResult
            assert isinstance(rer, RuleEvaluationResult)
            for km, evaluated_metric in rer.metrics.items():
                assert isinstance(evaluated_metric, EvaluatedMetric)
                episode_totals[k] = evaluated_metric.total
                if not (k in totals):
                    totals[k] = [evaluated_metric.total]
                else:
                    totals[k].append(evaluated_metric.total)
        if display_outputs:
            logger.info("\nEpisode total metrics: \n {}".format(pretty_print(episode_totals)))

        return totals





if __name__ == "__main__":
    rospy.init_node('ROSAgent')
    rospack = rospkg.RosPack()
    current_path = rospack.get_path('rl_duckietown')
    SEED = random.randint(0,20000)
    max_episodes = 10
    max_episode_steps = 2001
    analyse_trajectories = False
    model_weights_path = os.path.expanduser('~') + "/backup_training/ppo/fully_vision/ou_0_0.4_1mill_good/"
    model_seeds = ["14096_tmp","421_tmp","5090_tmp","7460_tmp","15576_tmp", "18278_tmp", "8300_tmp"]
    evaluate_maps = ["large_loop_cf","loop_empty_two_bots","ETHZ_autolab_technical_track_cf"]


    for i in range(len(model_seeds)):
        model_path = model_weights_path + str(i+1) + "/" + model_seeds[i] + "/best_model.zip"
        model = PPO.load(model_path)
        for j in range(len(evaluate_maps)):
            map_name = evaluate_maps[j]
            results_path = "Final_results/car_following/ppo/" + str(SEED) + "/" + map_name + "/" + model_seeds[i] + "/"
            # Parallel environments
            env = launch_env(map_name)
            if not os.path.exists(results_path):
                os.makedirs(results_path)
            
            if not analyse_trajectories:
            # visualization   
                mean_reward = evaluate(model, env, num_episodes = max_episodes)

            if analyse_trajectories:
            # Plot trajectories and evaluate performance    
                evaluator = DuckietownWorldEvaluator(env = env, eval_map = map_name, max_episode_steps=max_episode_steps)
                evaluator.evaluate(model, results_path, episodes = max_episodes)


    
