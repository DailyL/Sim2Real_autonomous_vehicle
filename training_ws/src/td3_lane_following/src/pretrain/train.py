import os
import torch as T
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import numpy as np
import torch 
import torch.optim as optim
from tqdm import tqdm
import numpy as np
import math
import sys
import csv
import time
from torch.utils.data import TensorDataset, DataLoader

np.set_printoptions(threshold=sys.maxsize)
MODEL_NAME = f'model-{int(time.time())}'
REBUILD_DATA = True
 
train_input=np.load("input_with_noise.npy")
train_output=np.load("output_with_noise.npy")


#class create_datasets():
BATCH_SIZE = 128


VAL_PCT = 0.01  # lets reserve 10% of our data for validation
val_size = int(len(train_input)*VAL_PCT)

train_X = train_input[:-val_size]
train_y = train_output[:-val_size]

test_X = train_input[-val_size:]
test_y = train_output[-val_size:]

train_tensor_input = torch.Tensor(train_X)
train_tensor_output = torch.Tensor(train_y)

test_tensor_input = torch.Tensor(test_X)
test_tensor_output = torch.Tensor(test_y)

my_train_dataset = TensorDataset(train_tensor_input,train_tensor_output)
train_dataloader = DataLoader(my_train_dataset,batch_size=BATCH_SIZE,shuffle=True)

my_test_dataset = TensorDataset(test_tensor_input,test_tensor_output)
test_dataloader = DataLoader(my_test_dataset,batch_size=BATCH_SIZE,shuffle=True)
     

     

LR = 1e-3

use_cuda = torch.cuda.is_available()
device = torch.device("cuda:0" if use_cuda else "cpu")




class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.input_dims = 11
        self.fc1_dims = 32
        self.fc2_dims = 64
        self.fc3_dims = 32
        self.n_actions = 2
        self.name = "td3"


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

        self.optimizer = optim.Adam(self.parameters(), lr=0.001)
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


net = Net().to(device)



optimizer = optim.Adam(net.parameters(), lr=LR)
loss_function = nn.MSELoss()


def train(net):
    EPOCHS = 20
    with open("model_no_noise.log","a") as f:
        for epoch in range(EPOCHS):
            for train_batch, train_labels in train_dataloader:
                train_batch, train_labels = train_batch.to(device), train_labels.to(device)
                net.zero_grad()
                output = net(train_batch)
                loss = loss_function(output,train_labels)
                loss.backward()
                optimizer.step()
                unacc = abs((train_labels-output)/train_labels)
                f.write(f"{MODEL_NAME}, {float(loss)}\n") 
            print(f"Epoch: {epoch}. Loss: {unacc}")
        
        

def test(net):
    with torch.set_grad_enabled(False):
        for test_batch, test_labels in test_dataloader:
            test_batch, test_labels = test_batch.to(device), test_labels.to(device)
            output = net(test_batch)
            loss = loss_function(output,test_labels)
    print(f"Loss: {loss}")

train(net)
test(net)

path = "network_no_noise"
torch.save(net.state_dict(), path)

for param in net.parameters():
    print(param.data)





    
