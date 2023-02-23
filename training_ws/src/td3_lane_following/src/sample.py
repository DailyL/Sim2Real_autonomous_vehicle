#!/usr/bin/env python
from collections import deque
import random
import numpy as np
import torch
import pickle


demonstrations_buffer = pickle.load(open('/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/buffer.pkl', 'rb'))
ratio = 0.45
batch_size = 128        
buffer_size = 2000
input_shape = 11  
n_actions =2
duckie_buffer = deque()
mem_cntr = 2000
state_memory = np.zeros((buffer_size, input_shape))
new_state_memory = np.zeros((buffer_size, input_shape))
action_memory = np.zeros((buffer_size, n_actions))
reward_memory = np.zeros(buffer_size)
terminal_memory = np.zeros(buffer_size, dtype=np.bool)
      
if int(ratio*batch_size) > 0 :
    num = int(ratio*batch_size)
else:
    num = 0
        
max_mem = min(mem_cntr, buffer_size)
demonstrations = random.sample(demonstrations_buffer, num)

batch = np.random.choice(max_mem, (batch_size-num))
        
states_d = np.asarray([e[0] for e in demonstrations])
actions_d = np.asarray([e[1] for e in demonstrations])
rewards_d = np.asarray([e[2] for e in demonstrations])
new_states_d = np.asarray([e[3] for e in demonstrations])
dones_d = np.asarray([e[4] for e in demonstrations])
        
batch = np.random.choice(max_mem, (batch_size-num))
states = state_memory[batch]
actions = action_memory[batch]
rewards = reward_memory[batch]
states_ = new_state_memory[batch]
dones = terminal_memory[batch]

print(rewards.shape)


np.concatenate((states,states_d), axis=0) 
np.concatenate((actions,actions_d), axis=0)
np.concatenate((rewards,rewards_d), axis=0) 
np.concatenate((states_,new_states_d), axis=0)
print((np.concatenate((dones,dones_d), axis=0)))


    
