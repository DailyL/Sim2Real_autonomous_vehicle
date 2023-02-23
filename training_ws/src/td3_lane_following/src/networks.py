import os
import torch as T
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import numpy as np
import torch 
class CriticNetwork(nn.Module):
    def __init__(self, beta, input_dims, fc1_dims, fc2_dims, n_actions, name, chkpt_dir='model/td3'):
        super(CriticNetwork, self).__init__()
        self.input_dims = input_dims
        self.fc1_dims = fc1_dims
        self.fc2_dims = fc2_dims
        self.fc3_dims = 32
        self.n_actions = n_actions
        self.name = name
        self.checkpoint_dir = chkpt_dir
        self.checkpoint_file = os.path.join(self.checkpoint_dir, name+'_td3')

        self.fc1 = nn.Linear(self.input_dims + n_actions, self.fc1_dims)
        nn.init.xavier_uniform_(self.fc1.weight)
        self.fc1.bias.data.fill_(0.01)
        
        self.fc2 = nn.Linear(self.fc1_dims, self.fc2_dims)
        nn.init.xavier_uniform_(self.fc2.weight)
        self.fc2.bias.data.fill_(0.01)
        
        self.fc3 = nn.Linear(self.fc2_dims, self.fc3_dims)
        nn.init.xavier_uniform_(self.fc3.weight)
        self.fc3.bias.data.fill_(0.01)
        
        self.q1 = nn.Linear(self.fc3_dims, 1)
        nn.init.xavier_uniform_(self.q1.weight)
        self.q1.bias.data.fill_(0.01)

        self.optimizer = optim.Adam(self.parameters(), lr=beta)
        self.device = T.device('cuda:0' if T.cuda.is_available() else 'cpu')
        
        self.to(self.device)

    def forward(self, state, action):
        q1_action_value = self.fc1(T.cat([state, action], dim=1))
        q1_action_value = F.relu(q1_action_value)
        q1_action_value = self.fc2(q1_action_value)
        q1_action_value = F.relu(q1_action_value)
        q1_action_value = self.fc3(q1_action_value)
        q1_action_value = F.relu(q1_action_value)
        q1 = self.q1(q1_action_value)

        return q1

    def save_checkpoint(self, ep):
        print('...saving checkpoint...')
        self.checkpoint_file = os.path.join(self.checkpoint_dir, self.name+'_td3')
        T.save(self.state_dict(), self.checkpoint_file)

    def load_checkpoint(self, ep):
        print('...loading chekpoint')
        self.checkpoint_file = os.path.join(self.checkpoint_dir, self.name+'_td3')
        self.load_state_dict(T.load(self.checkpoint_file))

class ActorNetwork(nn.Module):
    def __init__(self, alpha, input_dims, fc1_dims, fc2_dims, n_actions, name, chkpt_dir='model/td3'):
        super(ActorNetwork, self).__init__()
        self.input_dims = input_dims
        self.fc1_dims = fc1_dims
        self.fc2_dims = fc2_dims
        self.fc3_dims = 32
        self.n_actions = n_actions
        self.name = name
        self.checkpoint_dir = chkpt_dir
        self.checkpoint_file = os.path.join(self.checkpoint_dir, name+'_td3')
        self.checkpoint_pre_trained_file = '/home/dianzhaoli/duckie_catkin_ws/src/td3_lane_following/src/model/td3/pre_trained/actor_td3'
        self.fc1 = nn.Linear(self.input_dims, self.fc1_dims)
        nn.init.xavier_uniform_(self.fc1.weight)
        self.fc1.bias.data.fill_(0.01)
        
        self.fc2 = nn.Linear(self.fc1_dims, self.fc2_dims)
        nn.init.xavier_uniform_(self.fc2.weight)
        self.fc2.bias.data.fill_(0.01)
        
        self.fc3 = nn.Linear(self.fc2_dims, self.fc3_dims)
        nn.init.xavier_uniform_(self.fc3.weight)
        self.fc3.bias.data.fill_(0.01)
        
        self.mu = nn.Linear(self.fc3_dims, self.n_actions)
        nn.init.xavier_uniform_(self.mu.weight)
        self.mu.bias.data.fill_(0.01)

        self.optimizer = optim.Adam(self.parameters(), lr=alpha)
        self.device = T.device('cuda:0' if T.cuda.is_available else 'cpu')

        self.to(self.device)

    def forward(self, state):
        prob = self.fc1(state)
        prob = F.relu(prob)
        prob = self.fc2(prob)
        prob = F.relu(prob)
        prob = self.fc3(prob)
        prob = F.relu(prob)

        prob = T.tanh(self.mu(prob))

        return prob

    def save_checkpoint(self, ep):
        print('...saving checkpoint...')
        self.checkpoint_file = os.path.join(self.checkpoint_dir, self.name+'_td3')
        T.save(self.state_dict(), self.checkpoint_file)

    def load_checkpoint(self, ep):
        print('...loading chekpoint')
        self.checkpoint_file = os.path.join(self.checkpoint_dir, self.name+'_td3')
        self.load_state_dict(T.load(self.checkpoint_file))
        
    def load_pre_trained_checkpoint(self):
        print('...loading pretrained chekpoint')
        self.load_state_dict(T.load(self.checkpoint_pre_trained_file))
        
        
        
        
        
