import numpy as np 
from scipy.stats import norm
import math
import random
import pickle
np.set_printoptions(threshold=100000)
from collections import deque
from numpy import load
import matplotlib.pyplot as plt
import math
import shapely.geometry as geom
import torch


train_input = load("input_with_noise.npy") 
train_output = load("output_with_noise.npy") 

coords = np.loadtxt('aver_trajectory.txt')
line = geom.LineString(coords)

# define parameters

lanewidth = 0.23
v_desired = 0.5
        
out_road_x_max = 7.15
out_road_y_max = 5.575
out_road_x_min = 0
out_road_y_min = 0
in_road_x_max = 5.1
in_road_y_max = 3.51
in_road_x_min = 2.07
in_road_y_min = 2.07 
v_desired = 0.5
compute = True

buffer = deque()


lane_pose_d = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
lane_pose_phi = np.zeros((1,train_input.shape[0]), dtype=np.float16) 

follow_velocity = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
follow_position_x = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
follow_position_y = np.zeros((1,train_input.shape[0]), dtype=np.float16) 

follow_position_x_pre = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
follow_position_y_pre = np.zeros((1,train_input.shape[0]), dtype=np.float16) 

cmd_vel_v_pre = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
cmd_vel_phi_pre = np.zeros((1,train_input.shape[0]), dtype=np.float16) 

leading_position_x = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
leading_position_y= np.zeros((1,train_input.shape[0]), dtype=np.float16) 

cmd_vel_v = np.zeros((1,train_input.shape[0]), dtype=np.float16) 
cmd_vel_phi = np.zeros((1,train_input.shape[0]), dtype=np.float16) 



for i in range(train_input.shape[0]):

        lane_pose_d[0,i] = train_input[i,0]
        lane_pose_phi[0,i] = train_input[i,1]
        follow_velocity[0,i] = train_input[i,2]
        follow_position_x[0,i] = train_input[i,3]
        follow_position_y[0,i] = train_input[i,4]
        follow_position_x_pre[0,i] = train_input[i,5]
        follow_position_y_pre[0,i] = train_input[i,6]
 
        leading_position_x[0,i] = train_input[i,7]
        leading_position_y[0,i] = train_input[i,8]
        
        cmd_vel_v_pre[0,i] = train_input[i,9]
        cmd_vel_phi_pre[0,i] = train_input[i,10]
        
        
       
        

        cmd_vel_v[0,i] = train_output[i,0]
        cmd_vel_phi[0,i] = train_output[i,1]


      

rewards = np.zeros((train_input.shape[0],1), dtype=np.float16)
dones = np.zeros((train_input.shape[0],1), dtype=np.float16)
actions = np.zeros((train_input.shape[0],2), dtype=np.float16)

current_a = np.zeros((train_input.shape[0],2), dtype=np.float16) # should be the accleration of one timestep before

actions_rewards_dones = np.zeros((train_input.shape[0],3), dtype=np.float16)
states = np.zeros((train_input.shape[0],11), dtype=np.float16)
next_states = np.zeros((train_input.shape[0],11), dtype=np.float16)


for i in range(train_input.shape[0]):
    dones[i] = False
    actions[i,0] = cmd_vel_v[0,i]
    actions[i,1] = cmd_vel_phi[0,i] 
    
    states[i,0] = lane_pose_d[0,i]
    states[i,1] = lane_pose_phi[0,i]
    states[i,2] = follow_velocity[0,i]
    states[i,3] = follow_position_x[0,i]
    states[i,4] = follow_position_y[0,i]
    states[i,5] = follow_position_x_pre[0,i]
    states[i,6] = follow_position_y_pre[0,i]
    states[i,7] = leading_position_x[0,i]
    states[i,8] = leading_position_y[0,i]    
    states[i,9] = cmd_vel_v_pre[0,i]
    states[i,10] = cmd_vel_phi_pre[0,i]   
    
    
for i in range(train_input.shape[0]-1):

    next_states[i,0] = lane_pose_d[0,i+1]
    next_states[i,1] = lane_pose_phi[0,i+1]
    next_states[i,2] = follow_velocity[0,i+1]
    next_states[i,3] = follow_position_x[0,i+1]
    next_states[i,4] = follow_position_y[0,i+1]
    next_states[i,5] = follow_position_x_pre[0,i+1]
    next_states[i,6] = follow_position_y_pre[0,i+1]
    
    next_states[i,7] = leading_position_x[0,i+1]
    next_states[i,8] = leading_position_y[0,i+1]    
    next_states[i,9] = cmd_vel_v_pre[0,i+1]
    next_states[i,10] = cmd_vel_phi_pre[0,i+1]
    
   
     


  

if compute:
    for i in range(train_input.shape[0]): 
        if abs(train_output[i,1]) >= 2.0:
            r_cmd_phi = - (abs(train_output[i,1])-2)
        else:
            r_cmd_phi = 0 
               
            
        point = geom.Point(follow_position_x[0,i], follow_position_y[0,i])
        r_d = point.distance(line)
        
        rewards[i] = 0.5*( follow_velocity[0,i]*(math.cos(lane_pose_phi[0,i])-lane_pose_d[0,i])+(follow_velocity[0,i]-v_desired) / v_desired)
        
        
 #       rewards[i] = 0.2*( follow_velocity[0,i]*(math.cos(lane_pose_phi[0,i])-lane_pose_d[0,i]) + r_cmd_phi + (follow_velocity[0,i]-v_desired) / v_desired )
 #+ (follow_velocity[0,i]-v_desired) / v_desired 

plt.hist(rewards,bins=500)  # density=False would make counts
plt.ylabel('Probability')
plt.xlabel('Data');
plt.show()


for i in range(len(dones)):
    if np.mod(i, 1000) == 0:
        dones[i] = True





states=np.asarray(states)
actions=np.asarray(actions)
rewards=np.asarray(rewards)
next_states=np.asarray(next_states)
dones=np.asarray(dones)




states = torch.from_numpy(states).type(torch.float16)
actions = torch.from_numpy(actions).type(torch.float16)
rewards = torch.from_numpy(rewards).type(torch.float16)
next_states = torch.from_numpy(next_states).type(torch.float16)
dones = torch.from_numpy(dones).type(torch.float16)

  
for i in range(len(actions)): 
    experience = (states[i], actions[i], rewards[i], next_states[i], dones[i])
    buffer.append(experience)
  

#pickle.dump(buffer, open('buffer.pkl', 'wb'))
torch.save(buffer,"buffer.pt")


print(states.dtype)
    
"""


my_buffer_2 = torch.load("buffer.pt")


sample_buffer = random.sample(my_buffer_2, 2)

print(sample_buffer)
"""
