#!/usr/bin/env python
from collections import deque
import random
import numpy as np
class ReplayBuffer(object):

    def __init__(self, buffer_size,input_shape,n_actions):
        self.buffer_size = buffer_size
        self.num_experiences = 0
        self.buffer = deque()
        self.mem_cntr = 0
        
        self.state_memory = np.zeros((self.buffer_size, input_shape))
        self.new_state_memory = np.zeros((self.buffer_size, input_shape))
        self.action_memory = np.zeros((self.buffer_size, n_actions))
        self.reward_memory = np.zeros(self.buffer_size)
        self.terminal_memory = np.zeros(self.buffer_size, dtype=np.bool)
        
        
        
    def getBatch(self, batch_size,ratio):
        # Randomly sample batch_size examples    
        max_mem = min(self.mem_cntr, self.buffer_size)

        batch = np.random.choice(max_mem, batch_size)

        states = self.state_memory[batch]
        actions = self.action_memory[batch]
        rewards = self.reward_memory[batch]
        states_ = self.new_state_memory[batch]
        dones = self.terminal_memory[batch]

        return states, actions, rewards, states_, dones


    def add(self, state, action, reward, new_state, done):
        index = self.mem_cntr % self.buffer_size
        self.state_memory[index] = state
        self.action_memory[index] = action
        self.reward_memory[index] = reward
        self.new_state_memory[index] = new_state
        self.terminal_memory[index] = done

        self.mem_cntr += 1  
    

        
        

