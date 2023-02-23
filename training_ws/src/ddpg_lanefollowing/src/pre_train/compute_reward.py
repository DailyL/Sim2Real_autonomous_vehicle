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
from scipy.spatial import distance
train_input = load("input_with_noise.npy") 
train_output = load("output_with_noise.npy") 
train_input_for_NN = load("input_with_noise_NN.npy") 

coords = np.loadtxt('aver_trajectory_with_yaw.txt')
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
pi = 3.141592653589793

x_infi = 1 
k = 0.5 

buffer = deque()

def closest_node(node, nodes):
    closest_index = distance.cdist([node], nodes).argmin()
    closest_distance = distance.euclidean([node], nodes[closest_index])
    return closest_distance, closest_index
    
    
lane_pose_d = np.zeros((1,train_input.shape[0])) 
lane_pose_phi = np.zeros((1,train_input.shape[0])) 

follow_velocity = np.zeros((1,train_input.shape[0])) 
follow_position_x = np.zeros((1,train_input.shape[0])) 
follow_position_y = np.zeros((1,train_input.shape[0])) 

follow_position_x_pre = np.zeros((1,train_input.shape[0])) 
follow_position_y_pre = np.zeros((1,train_input.shape[0])) 

cmd_vel_v_pre = np.zeros((1,train_input.shape[0])) 
cmd_vel_phi_pre = np.zeros((1,train_input.shape[0])) 

leading_position_x = np.zeros((1,train_input.shape[0])) 
leading_position_y= np.zeros((1,train_input.shape[0])) 

cmd_vel_v = np.zeros((1,train_input.shape[0])) 
cmd_vel_phi = np.zeros((1,train_input.shape[0])) 

yaw = np.zeros((1,train_input.shape[0])) 

abs_e_y = np.zeros((1,train_input.shape[0]))

r_yaw = np.zeros((1,train_input.shape[0]))

for i in range(train_input.shape[0]):

        lane_pose_d[0,i] = train_input[i,0]
        lane_pose_phi[0,i] = train_input[i,1]
        
        follow_velocity[0,i] = train_input[i,2]
        
        follow_position_x[0,i] = train_input[i,3]*(out_road_x_max - out_road_x_min) + out_road_x_min
        follow_position_y[0,i] = train_input[i,4]*(out_road_y_max - out_road_y_min) + out_road_y_min
        
        yaw[0,i] = train_input[i,7]
        
        abs_e_y[0,i] = train_input[i,8]
        
        r_yaw [0,i] = train_input[i,12]
        
        leading_position_y[0,i] = train_input[i,9]
        
        cmd_vel_v_pre[0,i] = train_input[i,10]
        cmd_vel_phi_pre[0,i] = train_input[i,11]
         

        cmd_vel_v[0,i] = train_output[i,0]
        cmd_vel_phi[0,i] = train_output[i,1]

        
      

rewards = np.zeros((train_input.shape[0]))
dones = np.zeros((train_input.shape[0]), dtype=np.bool)
actions = np.zeros((train_input.shape[0],2))

current_a = np.zeros((train_input.shape[0],2)) # should be the accleration of one timestep before

actions_rewards_dones = np.zeros((train_input.shape[0],3))
states = np.zeros((train_input.shape[0],8))
next_states = np.zeros((train_input.shape[0],8))


for i in range(train_input.shape[0]):
    dones[i] = False
    actions[i,0] = cmd_vel_v[0,i]
    actions[i,1] = cmd_vel_phi[0,i] 
    
    states[i,0] = lane_pose_d[0,i]
    states[i,1] = lane_pose_phi[0,i]
    states[i,2] = follow_velocity[0,i]
    states[i,3] = r_yaw[0,i]
    states[i,4] = abs_e_y[0,i]
    
    states[i,5] = leading_position_y[0,i]    
    states[i,6] = cmd_vel_v_pre[0,i]
    states[i,7] = cmd_vel_phi_pre[0,i]   
    
    
for i in range(train_input.shape[0]-1):

    next_states[i,0] = lane_pose_d[0,i+1]
    next_states[i,1] = lane_pose_phi[0,i+1]
    next_states[i,2] = follow_velocity[0,i+1]
    next_states[i,3] = r_yaw[0,i+1]
    next_states[i,4] = abs_e_y[0,i+1]
    next_states[i,5] = leading_position_y[0,i+1]    
    next_states[i,6] = cmd_vel_v_pre[0,i+1]
    next_states[i,7] = cmd_vel_phi_pre[0,i+1]
    
   

        




  

if compute:
    for i in range(train_input.shape[0]): 
        if abs(train_output[i,1]) >= 4.0:
            r_cmd_phi = - (abs(train_output[i,1])-4)
        else:
            r_cmd_phi = 0 
               
        r_d, closest_index = closest_node((follow_position_x[0,i],follow_position_y[0,i]), coords[:,:2])    
        yaw_offset = (abs(yaw[0,i]*(2*pi) - pi - coords[closest_index,2]))

        x_path = coords[closest_index,2]
         #rewards[i] = (0.15 + 0.4*((follow_velocity[0,i]-v_desired) / v_desired))
        

        
        e_y = math.sin(x_path-math.atan((follow_position_y[0,i]-coords[closest_index,1])/(follow_position_x[0,i]-coords[closest_index,0])))*r_d
        x_d = x_infi * math.atan(k*e_y) + x_path
        r_yaw = states[i,3]*7.0

        rewards[i] = np.clip(0.5*math.pow(0.01,(abs(e_y)*0.6))+0.2*((follow_velocity[0,i]-v_desired) / v_desired)-0.1*r_yaw,-1,1)
 #       rewards[i] = 0.2*( follow_velocity[0,i]*(math.cos(lane_pose_phi[0,i])-lane_pose_d[0,i]) + r_cmd_phi + (follow_velocity[0,i]-v_desired) / v_desired )
 #+ (follow_velocity[0,i]-v_desired) / v_desired 

plt.hist(rewards,bins=500)  # density=False would make counts
plt.ylabel('Probability')
plt.xlabel('Data');
plt.show()


for i in range(len(dones)):
    if np.mod(i, 1000) == 0:
        dones[i] = True


  
for i in range(len(actions)): 
    experience = (states[i], actions[i], rewards[i], next_states[i], dones[i])
    buffer.append(experience)
  




pickle.dump(buffer, open('buffer.pkl', 'wb'))



    
"""


my_buffer_2 = pickle.load(open('buffer.pkl', 'rb'))


sample_buffer = random.sample(my_buffer_2, 2)


print(sample_buffer)
"""
