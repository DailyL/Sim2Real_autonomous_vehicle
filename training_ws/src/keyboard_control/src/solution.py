#!/usr/bin/env python
import gym
# noinspection PyUnresolvedReferences
import gym_duckietown_agent  # DO NOT CHANGE THIS IMPORT (the environments are defined here)
import numpy as np
from duckietown_challenges import wrap_solution, ChallengeSolution, ChallengeInterfaceSolution, InvalidSubmission

# ROS imports
import os
import rospy
import roslaunch
from rosagent import ROSAgent
import subprocess
import time


def solve(gym_environment, cis):
    # python has dynamic typing, the line below can help IDEs with autocompletion
    assert isinstance(cis, ChallengeInterfaceSolution)
    # after this cis. will provide you with some autocompletion in some IDEs (e.g.: pycharm)
    cis.info('Creating model.')
    # you can have logging capabilties through the solution interface (cis).
    # the info you log can be retrieved from your submission files.
    # We get environment from the Evaluation Engine
    cis.info('Making environment')
    env = gym.make(gym_environment)
    # Then we make sure we have a connection with the environment and it is ready to go
    cis.info('TEST1')
    cis.info('Reset environment - TEST A')
    cis.info('TEST2')
    observation = env.reset()
    # While there are no signal of completion (simulation done)
    # we run the predictions for a number of episodes, don't worry, we have the control on this part

    # We need to launch the ROS stuff in the background
    # ROSLaunch API doesn't play well with our environment setup, so we use subprocess
    cis.info('lf_slim starting')
    import subprocess
    subprocess.Popen(["roslaunch lf_slim.launch"], shell=True)
    cis.info('lf_slim up')
    # Start the ROSAgent, which handles publishing images and subscribing to action
    agent = ROSAgent()
    cis.info('Initialized agent')
    r = rospy.Rate(15)

    while not rospy.is_shutdown():
        # we passe the observation to our model, and we get an action in return
        # we tell the environment to perform this action and we get some info back in OpenAI Gym style

        # To trigger the lane following pipeline, we publish the image
        # and camera_infos to the correct topics defined in rosagent
        agent._publish_img(observation)
        agent._publish_info()

        # The action is updated inside of agent by other nodes asynchronously
        action = agent.action
        # Edge case - if the nodes aren't ready yet
        if np.array_equal(action, np.array([0, 0])):
            continue

        observation, reward, done, info = env.step(action)
        # here you may want to compute some stats, like how much reward are you getting
        # notice, this reward may no be associated with the challenge score.

        # it is important to check for this flag, the Evalution Engine will let us know when should we finish
        # if we are not careful with this the Evaluation Engine will kill our container and we will get no score
        # from this submission
        if 'simulation_done' in info:
            break
        if done:
            env.reset()

        # Run the main loop at 15Hz
        r.sleep()


class Submission(ChallengeSolution):
    def run(self, cis):
        # Now, initialize the ROS stuff here:
        assert isinstance(cis, ChallengeInterfaceSolution)  # this is a hack that would help with autocompletion

        # get the configuration parameters for this challenge
        params = cis.get_challenge_parameters()
        cis.info('Parameters: %s' % params)

        gym_environment = params['env']

        try:
            cis.info('Starting.')
            solve(gym_environment, cis)  # let's try to solve the challenge, exciting ah?
        except BaseException as e:
            raise InvalidSubmission(str(e))

        cis.set_solution_output_dict({})
        cis.info('Finished.')


if __name__ == '__main__':
    print('Starting submission')
    wrap_solution(Submission())
