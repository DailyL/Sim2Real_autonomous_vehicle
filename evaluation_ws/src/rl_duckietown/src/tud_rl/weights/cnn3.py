import torch
import torch.nn as nn
import os
import rospkg


device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')

class CNN(nn.Module):
    def __init__(self):
        super(CNN, self).__init__()
        rospack = rospkg.RosPack()
        current_path = rospack.get_path('rl_duckietown')
        self.model_file = (current_path + '/src/tud_rl/weights/cnn_model3.pth')

        self.cnn_layer1 = nn.Sequential(
            nn.Conv2d(3 ,64, kernel_size = 3 , stride = 2, padding = 1), #40,80
            nn.LeakyReLU()
        )

        self.cnn_layer2 = nn.Sequential(
            nn.Conv2d(64, 64, kernel_size = 3 , stride = 2, padding = 1), #20,40
            nn.BatchNorm2d(64),
            nn.LeakyReLU(),
            nn.Dropout(p=0.3)
        )

        self.cnn_layer3 = nn.Sequential(
            nn.Conv2d(64, 64, kernel_size = 3 , stride = 2, padding = 1), #10,20
            nn.BatchNorm2d(64),
            nn.LeakyReLU(),
            nn.Dropout(p=0.3)
        )

        self.cnn_layer4 = nn.Sequential(
            nn.Conv2d(64, 64, kernel_size = 3 , stride = 2, padding = 1), #5,10
            nn.BatchNorm2d(64),
            nn.LeakyReLU(),
        )

        self.cnn_linear = nn.Sequential(
            nn.Linear(64*5*10, 256),
            nn.LeakyReLU(),
            nn.Linear(256, 2),
        )




    def forward(self, x):
        x = x.to(device)

        x = self.cnn_layer1(x)
        x = self.cnn_layer2(x)
        x = self.cnn_layer3(x)
        x = self.cnn_layer4(x)
        x = torch.flatten(x, start_dim=1)
        
        x = self.cnn_linear(x)

        return x
    
    def save(self):
        torch.save(self.state_dict(), self.model_file)

    def load(self):
        self.load_state_dict(torch.load(self.model_file, map_location = 'cuda'))
