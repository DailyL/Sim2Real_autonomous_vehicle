import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from tqdm import tqdm
import numpy as np
import math
import sys
import csv
import time
from torch.utils.data import TensorDataset, DataLoader
np.set_printoptions(threshold=sys.maxsize)

 
with open('dataset.csv', newline='') as f:
    leading_position_x = []
    leading_position_y = []
    follow_position_x = []
    follow_position_y = []
    follow_velocity = []
    lane_pose_d = []
    lane_pose_phi = []
    cmd_vel_v = []
    cmd_vel_phi = []
    reader = csv.reader(f)
    for row in reader:
        leading_position_xs = row[0]
        leading_position_ys = row[1]
        follow_position_xs = row[2]
        follow_position_ys = row[3]
        follow_velocitys = row[4]
        lane_pose_ds = row[5]
        lane_pose_phis = row[6]
        cmd_vel_vs = row[7]
        cmd_vel_phis = row[8]
        
        leading_position_x.append(leading_position_xs)
        leading_position_y.append(leading_position_ys)
        follow_position_x.append(follow_position_xs)
        follow_position_y.append(follow_position_ys)
        follow_velocity.append(follow_velocitys)
        lane_pose_d.append(lane_pose_ds)
        lane_pose_phi.append(lane_pose_phis)
        cmd_vel_v.append(cmd_vel_vs)
        cmd_vel_phi.append(cmd_vel_phis)
        
data = np.zeros((9,len(lane_pose_phi)))        


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



        
for i in range(len(lane_pose_phi)):       
    data[0,i] = leading_position_x[i]
    data[1,i] = leading_position_y[i]    
    data[2,i] = follow_position_x[i]
    data[3,i] = follow_position_y[i]
    data[4,i] = follow_velocity[i]
    data[5,i] = lane_pose_d[i]
    data[6,i] = lane_pose_phi[i]
    data[7,i] = cmd_vel_v[i]
    data[8,i] = cmd_vel_phi[i]
    

    
train_input = np.zeros((len(lane_pose_phi),11))
train_output = np.zeros((len(lane_pose_phi),2))
follower_pose_x_pre = np.zeros((len(lane_pose_phi),1))
follower_pose_y_pre = np.zeros((len(lane_pose_phi),1))
cmd_vel_v_pre = np.zeros((len(lane_pose_phi),1))
cmd_vel_phi_pre = np.zeros((len(lane_pose_phi),1))

for i in range (len(lane_pose_phi)-1):

        follower_pose_x_pre[i,0] = follow_position_x[i-1]
        follower_pose_y_pre[i,0] = follow_position_y[i-1]


for i in range (len(lane_pose_phi)-1):

        cmd_vel_v_pre[i,0] = cmd_vel_v[i-1]
        cmd_vel_phi_pre[i,0] = cmd_vel_phi[i-1]


for i in range(len(lane_pose_phi)):
        """
        leading_position_x_noise = np.random.normal(0, 0.01)
        leading_position_y_noise = np.random.normal(0, 0.01)
        follow_position_x_noise = np.random.normal(0, 0.01)
        follow_position_y_noise = np.random.normal(0, 0.01)
        follow_velocity_noise = np.random.normal(0, 0.01)
        lane_pose_d_noise = np.random.normal(0, 0.01)
        lane_pose_phi_noise = np.random.normal(0, 0.01)
        
        
        cmd_vel_v_noise = np.random.normal(0, 0.01)
        cmd_vel_phi_noise = np.random.normal(0, 0.01)  
        """
        leading_position_x_noise = 0
        leading_position_y_noise = 0
        follow_position_x_noise = 0
        follow_position_y_noise = 0
        follow_velocity_noise = 0
        lane_pose_d_noise = 0
        lane_pose_phi_noise = 0
        
        
        cmd_vel_v_noise = 0
        cmd_vel_phi_noise = 0
                  
        train_input[i,0] = (data[5,i]+lane_pose_d_noise)/lanewidth

        train_input[i,1] = (data[6,i]+lane_pose_phi_noise)/1.0
	
        train_input[i,2] = (data[4,i]+follow_velocity_noise)/1.0
        
        train_input[i,3] = ((data[2,i]+follow_position_x_noise)- out_road_x_min)/(out_road_x_max - out_road_x_min)
        
        train_input[i,4] = ((data[3,i]+follow_position_y_noise)- out_road_y_min)/(out_road_y_max - out_road_y_min)
        
        train_input[i,5] = ((follower_pose_x_pre[i,0]+follow_position_x_noise)- out_road_x_min)/(out_road_x_max - out_road_x_min)
        
        train_input[i,6] = ((follower_pose_y_pre[i,0]+follow_position_y_noise)- out_road_y_min)/(out_road_y_max - out_road_y_min)
        
        train_input[i,7] = ((data[0,i]+leading_position_x_noise)- out_road_x_min)/(out_road_x_max - out_road_x_min)
        
        train_input[i,8] = ((data[1,i]+leading_position_y_noise)- out_road_y_min)/(out_road_y_max - out_road_y_min)
        
        train_input[i,9] = cmd_vel_v_pre[i,0]
         
        train_input[i,10] = cmd_vel_phi_pre[i,0]*0.25 
       

        train_output[i,0] = data[7,i] 

        train_output[i,1] = data[8,i]*0.25 


        
     
        
np.save("input_with_noise.npy",train_input) 
np.save("output_with_noise.npy",train_output) 






"""

BATCH_SIZE = 2
velocity_training = velocitys[1:len(velocitys)]
accleration_training = acc 
throttle_training = throttles[1:len(throttles)]
brake_training = brakes[1:len(brakes)]





train_input = np.zeros((len(velocity_training),2))
train_output = np.zeros((len(throttle_training),2))





for i in range(len(velocity_training)):
	train_input[i,0] = velocity_training[i]
	train_input[i,1] = velocity_training[i-1]
	train_output[i,0] = throttle_training[i]
	train_output[i,1] = brake_training[i]






VAL_PCT = 0.1  # lets reserve 10% of our data for validation
val_size = int(len(train_input)*VAL_PCT)

train_X = train_input[:-val_size]
train_y = train_output[:-val_size]

test_X = train_input[-val_size:]
test_y = train_output[-val_size:]


train_tensor_input = torch.Tensor(train_X)
train_tensor_output = torch.Tensor(train_y)

test_tensor_input = torch.Tensor(test_X)
test_tensor_output = torch.Tensor(test_y)






print(train_input)
"""




