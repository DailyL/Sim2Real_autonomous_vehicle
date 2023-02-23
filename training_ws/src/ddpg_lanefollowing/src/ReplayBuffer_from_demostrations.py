#!/usr/bin/env python
from collections import deque
import random
import numpy as np
import pickle


class ReplayBuffer(object):

    def __init__(self, buffer_size):
        self.buffer_size = buffer_size 
        self.num_experiences = 0      
        self.demonstrations_buffer = pickle.load(open('/home/dianzhaoli/duckie_catkin_ws/src/ddpg_lanefollowing/src/buffer.pkl', 'rb'))
        self.duckie_buffer = deque()
    def getBatch(self, batch_size,ratio):
        # Randomly sample batch_size examples
        
        if int(ratio*batch_size) > 0 :
        
            num = int(ratio*batch_size)
        else:
            num = 0
          
        demonstrations = random.sample(self.demonstrations_buffer, num)
        
        if self.num_experiences < (batch_size-num):
            duckie = random.sample(self.duckie_buffer, self.num_experiences)
        else:
            duckie = random.sample(self.duckie_buffer, (batch_size-num))
            
        demonstrations += duckie    
        return demonstrations, num

    def size(self):
        return self.buffer_size
        
    def add(self, state, action, reward, new_state, done):
        experience = (state, action, reward, new_state, done)
        if self.num_experiences < self.buffer_size:
            self.duckie_buffer.append(experience)
            self.num_experiences += 1
        else:
            self.duckie_buffer.popleft()
            self.duckie_buffer.append(experience)
   

    def erase(self):
        self.duckie_buffer = deque()
        self.num_experiences = 0

    def count(self):
        # if buffer is full, return buffer size
        # otherwise, return experience counter
        return self.num_experiences
        
