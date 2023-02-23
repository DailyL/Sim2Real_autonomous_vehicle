#!/usr/bin/env python

import os
import numpy as np
from td3_agent import TD3Agent
# from utils_new import plot_learning_curve, make_env
import rospy
from Duckie_Gazebo_follower_lane_following import Env
import time
timestr = time.strftime("%Y%m%d-%H%M%S")

def plot_learning_curve(scores, x, figure_file):
    running_avg = np.zeros(len(scores))
    for i in range(len(running_avg)):
        running_avg[i] = np.mean(scores[max(0, i-100):(i+1)])

    plt.plot(x, running_avg)
    plt.title('Running average of previous 100 scores')
    plt.savefig(figure_file)

if __name__ == '__main__':
    rospy.init_node('td3_lane_following')

    n_games = 10000
    ep_start = 1
    lr = 0.0003
    BATCH_SIZE = 128
    gpu = 0
    load_checkpoints = False
    load__pretrained_checkpoints = True
    path = '/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/model/td3'
    state_dim = 11
    action_dim = 2
    norm_value = 0.25
    max_action = 1.0
    min_action = -1.0
    max_steps = 1000
    BUFFER_SIZE= 20000
    alpha = 0.0001
    beta = 0.0003
    tau = 0.005
    gamma = 0.95
    os.environ['CUDA_DEVICE_ORDER'] = 'PCI_BUS_ID'
    os.environ['CUDA_VISIBLE_DEVICES'] = str(gpu)
    ratio = 0.5
    EXPLORE = 10000.0*10
    env = Env()
    step = 0
    best_score = -np.inf
    filename_epsoideReward = open("/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/reward/follower_lane_following/"+timestr+"_EpsoideReward.txt","w")
    filename_StepAndReward = open("/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/reward/follower_lane_following/"+timestr+"_StepAndReward.txt","w")
    
    agent = TD3Agent(alpha=alpha, beta=beta, input_dims=state_dim, tau=tau, max_action=max_action, \
                        min_action=min_action, gamma=gamma, n_actions=action_dim, batch_size=BATCH_SIZE, buffer_size=BUFFER_SIZE, layer1_size=32, layer2_size=64, \
                        path_dir=path)

    ep = ep_start
    if load_checkpoints:
        agent.load_models(ep)

    score_history = []
    if load__pretrained_checkpoints:
        agent.load_pre_trained_models()
        print("load actor!")
    
    for ep in range(1, n_games):
        done = False
        observation = env.reset()
        
        score = 0

        for j in range(max_steps):
             done = False
             ratio -= 0.5 / EXPLORE # sample ratio for replay buffer
             action = agent.choose_action(observation)
             observation_, reward, done = env.step(action)
             agent.remember(observation, action, reward, observation_, done)
             agent.learn(ratio)
             #agent.learn()
             score += reward
             observation = observation_  
             print("Episode", ep, "Step", step, "Reward", reward, "action",(action[0]+1.0)/2.0)
             filename_StepAndReward.write("%5.2f %5.2f %5.2f\n" %(ep,step,reward))
             step += 1
       
             if done: 
                break
        score_history.append(score)
        avg_score = np.mean(score_history[-100:])        
        if ep % 20 == 0:
            agent.save_models(ep)

        print('Episode', ep, 'score %.1f' % score, 'average score %.1f' % avg_score)
        filename_epsoideReward.write("%5.2f %5.2f %5.2f\n" % (ep, score, avg_score))
    filename_StepAndReward.close()
    filename_epsoideReward.close()
    print("Finish.")
    
        # x = [i+1 for i in range(n_games)]
    # plot_learning_curve(x, score_history, figure_file)
    
    
