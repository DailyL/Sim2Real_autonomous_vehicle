#!/usr/bin/env python
from collections import deque
import random
import numpy as np
import torch
import pickle

class ReplayBuffer_demo(object):

    def __init__(self, buffer_size,input_shape,n_actions):
        self.buffer_size = buffer_size 
        self.num_experiences = 0      
        self.demonstrations_buffer = pickle.load(open('/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/buffer.pkl', 'rb'))
        #self.demonstrations_buffer = torch.load("/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/buffer.pt")
        self.duckie_buffer = deque()
        self.mem_cntr = 0
        self.state_memory = np.zeros((self.buffer_size, input_shape))
        self.new_state_memory = np.zeros((self.buffer_size, input_shape))
        self.action_memory = np.zeros((self.buffer_size, n_actions))
        self.reward_memory = np.zeros(self.buffer_size)
        self.terminal_memory = np.zeros(self.buffer_size, dtype=np.bool)

        
        
    def getBatch(self, batch_size, ratio):
        # Randomly sample batch_size examples
        if int(ratio*batch_size) > 0 :
        
            num = int(ratio*batch_size)
        else:
            num = 0
        
        max_mem = min(self.mem_cntr, self.buffer_size)
        demonstrations = random.sample(self.demonstrations_buffer, num)
        
        states_d = np.asarray([e[0] for e in demonstrations])
        actions_d = np.asarray([e[1] for e in demonstrations])
        rewards_d = np.asarray([e[2] for e in demonstrations])
        new_states_d = np.asarray([e[3] for e in demonstrations])
        dones_d = np.asarray([e[4] for e in demonstrations])
        
        batch = np.random.choice(max_mem, (batch_size-num))
        states = self.state_memory[batch]
        actions = self.action_memory[batch]
        rewards = self.reward_memory[batch]
        states_ = self.new_state_memory[batch]
        dones = self.terminal_memory[batch]
        return np.concatenate((states,states_d), axis=0), np.concatenate((actions,actions_d), axis=0), np.concatenate((rewards,rewards_d), axis=0), np.concatenate((states_,new_states_d), axis=0), np.concatenate((dones,dones_d), axis=0)


    def add(self, state, action, reward, new_state, done):
        index = self.mem_cntr % self.buffer_size
        self.state_memory[index] = state
        self.action_memory[index] = action
        self.reward_memory[index] = reward
        self.new_state_memory[index] = new_state
        self.terminal_memory[index] = done

        self.mem_cntr += 1      
        
