#!/usr/bin/env python
import argparse
import json
import random
import os
import gym
import time
import numpy as np
import torch
import rospy
import rospkg
import gym_duckietown
import os

import json
import time
import logging
import copy
from ray.tune.logger import pretty_print
from tud_rl.envs.MountainCar import MountainCar
from tud_rl.envs.Duckie_Gazebo_overtaking import Duckie_Gazebo
from tud_rl.wrappers.MinAtar_wrapper import MinAtar_wrapper
from tud_rl.agents.continuous.DDPG import DDPGAgent
from tud_rl.agents.continuous.TD3 import TD3Agent
from tud_rl.agents.continuous.SAC import SACAgent
from tud_rl.agents.continuous.LSTMDDPG import LSTMDDPGAgent
from tud_rl.agents.continuous.LSTMTD3 import LSTMTD3Agent
from tud_rl.agents.continuous.LSTMSAC import LSTMSACAgent
from tud_rl.agents.continuous.TQC import TQCAgent
from tud_rl.common.logging_plot import plot_from_progress
from tud_rl.configs.continuous_actions import __path__
from gym_duckietown.envs.duckietown_env import DuckietownROSOvertaking, DuckietownROSOvertaking_PID_Baseline
from config.config import find_and_load_config_by_seed, update_config, print_config
from config.paths import ArtifactPaths

from duckietown_world import SE2Transform
from duckietown_world.rules import evaluate_rules
from duckietown_world.rules.rule import EvaluatedMetric, make_timeseries
from duckietown_world.seqs.tsequence import SampledSequence
from duckietown_world.svg_drawing import draw_static
from duckietown_world.world_duckietown.duckiebot import DB18
from duckietown_world.world_duckietown.map_loading import load_map

from duckietown_utils.env import launch_and_wrap_env
from duckietown_utils.trajectory_plot import correct_gym_duckietown_coordinates


SEED = random.randint(0,20000)

logger = logging.getLogger(__name__)
analyse_trajectories = True

def launch_env(maps):
    env = None
    id = None
    if id is None:
        env = DuckietownROSOvertaking_PID_Baseline(
            seed=SEED, # random seed
            map_name=maps,
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



def visualize_policy(env, agent, c):
    
    for _ in range(c["eval_episodes"]):

        # get initial state
        img = env.reset()

        d = False
        eval_epi_steps = 0

        while not d:

            eval_epi_steps += 1
            
            # perform step
            img2, d, _ = env.step(a)
            time.sleep(0.02)
            env.render('top_down')
            env._publish_img(img2)
            env._publish_info()
            # break option
            if eval_epi_steps == c["env"]["max_episode_steps"]:
                break

def test(c, agent_name, actor_weights, critic_weights,maps):
    # init envs
    env = launch_env(maps)

    # wrappers
    for wrapper in c["env"]["wrappers"]:
        wrapper_kwargs = c["env"]["wrapper_kwargs"][wrapper]
        env = eval(wrapper)(env, **wrapper_kwargs)

    # get state_shape
    if c["env"]["state_type"] == "image":
        raise NotImplementedError("Currently, image input is not available for continuous action spaces.")
    
    elif c["env"]["state_type"] == "feature":
        c["state_shape"] = 8

    # mode and action details
    c["mode"] = "test"
    c["num_actions"] = 2
    c["action_high"] = 1
    c["action_low"]  = -1

    # prior weights
    c["actor_weights"]  = actor_weights
    c["critic_weights"] = critic_weights

    # seeding
    env.seed(c["seed"])
    torch.manual_seed(c["seed"])
    np.random.seed(c["seed"])
    random.seed(c["seed"])

    # init agent
    if agent_name[-1].islower():
        agent = eval(agent_name[:-2] + "Agent")(c, agent_name)
    else:
        agent = eval(agent_name + "Agent")(c, agent_name)

    if not analyse_trajectories:
    # visualization   
        visualize_policy(env=env, agent=agent, c=c)

    if analyse_trajectories:
    # Plot trajectories and evaluate performance    
        evaluator = DuckietownWorldEvaluator(env = env, eval_map=maps, max_episode_steps=c["env"]["max_episode_steps"])
        evaluator.evaluate(agent, results_path, episodes=c["eval_episodes"])




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
    def evaluate(self, agent, outdir, episodes):
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
            episode_path, episode_orientations, episode_timestamps = self._collect_trajectory(agent, i)
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
    def _collect_trajectory(self, agent, i):
        episode_path = []
        episode_orientations = []
        episode_timestamps = []
        
        img = self.env.reset()
        done = False
        eval_epi_steps = 0
        while not done:
            eval_epi_steps += 1    
            img2, done, info = self.env.step(self.env.unwrapped)
            self.env.render('top_down')
            self.env._publish_img(img2)
            self.env._publish_info()

            cur_pos = correct_gym_duckietown_coordinates(self.env.unwrapped, self.env.unwrapped.cur_pos)
            episode_path.append(cur_pos)
            episode_orientations.append(np.array(self.env.unwrapped.cur_angle))
            episode_timestamps.append(info['Simulator']['timestamp'])
            if eval_epi_steps == self.max_episode_steps:
                break

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

    

    # get config and name of agent    
    agent_name = "LSTMSAC" 
    actor_weights = os.getcwd() + "/experiments" + "/" + "LSTMSAC_Duckie_Gazebo__2022-08-17_36435/" + agent_name + "_actor_weights.pth"
    critic_weights = os.getcwd() + "/experiments" + "/" + "LSTMSAC_Duckie_Gazebo__2022-08-17_36435/" + agent_name + "_critic_weights.pth"
    # read config file
    with open(current_path + "/src/tud_rl/configs/continuous_actions/duckietown.json") as f:
        c = json.load(f)
        
        
    c["seed"] = SEED
    # convert certain keys in integers
    for key in ["seed", "timesteps", "epoch_length", "eval_episodes", "buffer_length", "act_start_step",\
         "upd_start_step", "upd_every", "batch_size"]:
        c[key] = int(c[key])

    # handle maximum episode steps
    if c["env"]["max_episode_steps"] == -1:
        c["env"]["max_episode_steps"] = np.inf
    else:
        c["env"]["max_episode_steps"] = int(c["env"]["max_episode_steps"])

    # set number of torch threads
    torch.set_num_threads(torch.get_num_threads())


    evaluate_map = ["loop_empty","ETHZ_autolab_technical_track","_plus_floor","LF-norm-zigzag","_huge_V_floor"]


    for i in range(5):
        map_name = evaluate_map[i]
        results_path = "pid_baseline/100_episodes/" + map_name + "_" + str(SEED) + "_evaluate_gym_duckietown_pid_baseline"
        test(c, agent_name, actor_weights, critic_weights,map_name)
