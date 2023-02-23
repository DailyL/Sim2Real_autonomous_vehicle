import os
import torch as T
import torch.nn.functional as F
import numpy as np
from ReplayBuffer import ReplayBuffer

from ReplayBuffer_from_demostrations import ReplayBuffer_demo



from networks import ActorNetwork, CriticNetwork
from noise import OUActionNoise

class TD3Agent():
    def __init__(self, alpha, beta, input_dims, tau, max_action, min_action, gamma,\
                    n_actions, batch_size, buffer_size, layer1_size, layer2_size, path_dir):
        self.gamma = gamma
        self.tau = tau
        self.max_action = max_action
        self.min_action = min_action
        
        self.batch_size = batch_size
        self.learn_step_cntr = 0
        self.time_step = 0
        self.warmup = 100
        self.n_actions = n_actions
        self.update_actor_iter = 2
        self.train_with_demo = True
        self.noise_OU = OUActionNoise(mu=np.zeros(n_actions))

        self.actor = ActorNetwork(alpha, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='actor', chkpt_dir=path_dir)
        self.critic_1 = CriticNetwork(beta, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='critic_1', chkpt_dir=path_dir)
        self.critic_2 = CriticNetwork(beta, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='critic_2', chkpt_dir=path_dir)

        self.target_actor = ActorNetwork(alpha, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='target_actor', chkpt_dir=path_dir)
        self.target_critic_1 = CriticNetwork(beta, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='target_critic_1', chkpt_dir=path_dir)
        self.target_critic_2 = CriticNetwork(beta, input_dims, layer1_size, layer2_size, n_actions=n_actions, name='target_critic_2', chkpt_dir=path_dir)

        self.update_network_parameters(tau=1)
        if self.train_with_demo:
            self.memory = ReplayBuffer_demo(buffer_size,input_dims,n_actions)
        else:
            self.memory = ReplayBuffer(buffer_size,input_dims,n_actions)
            
            
    def choose_action(self, observation):
        if self.time_step < self.warmup:
            # mu = T.tensor(np.random.normal(scale=self.noise, size=(self.n_actions,))).to(self.actor.device)
            mu = T.tensor(self.noise_OU(), dtype=T.float).to(self.actor.device)
        else:
            state = T.tensor(observation, dtype=T.float).to(self.actor.device)
            mu = self.actor.forward(state).to(self.actor.device)

        # mu_prime = mu + T.tensor(np.random.normal(scale=self.noise), dtype=T.float).to(self.actor.device)
        mu_prime = mu + T.tensor(self.noise_OU(), dtype=T.float).to(self.actor.device)
        mu_prime = T.clamp(mu_prime, self.min_action, self.max_action)
        # mu__ = mu_prime.detach().clone()
        # mu_prime[0] = T.clamp(mu__[0], 0.0, 0.25)
        # mu_prime[1] = T.clamp(mu__[1], -0.25, 0.25)
        # print(mu_prime)

        self.time_step += 1
        return mu_prime.cpu().detach().numpy()

    def remember(self, state, action, reward, new_state, done):
        self.memory.add(state, action, reward, new_state, done)

    def learn(self, ratio):
        if self.memory.mem_cntr < self.batch_size:
            return
        
        # T.autograd.set_detect_anomaly(True)
        #batch,num = self.memory.getBatch(self.batch_size,ratio)
        
        state, action, reward, new_state, done = self.memory.getBatch(self.batch_size, ratio)
      
        reward = T.tensor(reward, dtype=T.float).to(self.critic_1.device)
        done = T.tensor(done).to(self.critic_1.device)
        
        state_ = T.tensor(new_state, dtype=T.float).to(self.critic_1.device)
        state = T.tensor(state, dtype=T.float).to(self.critic_1.device)
        action = T.tensor(action, dtype=T.float).to(self.critic_1.device)

        target_actions = self.target_actor.forward(state_)
        # target_actions = target_actions + T.clamp(T.tensor(np.random.normal(scale=0.2)), -0.5, 0.5)
        target_actions = target_actions + T.tensor(self.noise_OU(), dtype=T.float).to(self.target_actor.device)

        target_actions = T.clamp(target_actions, self.min_action, self.max_action)
        # t_a = target_actions.detach().clone()
        # target_actions[:,0] = T.clamp(t_a[:,0], 0.1, 0.5)
        # target_actions[:,1] = T.clamp(t_a[:,1], -0.25, 0.25)
        # for i in range(0, target_actions.shape[0]):
        #     target_actions[i][0] = T.clamp(target_actions[i][0], self.min_action[0], self.max_action[0])
        #     target_actions[i][1] = T.clamp(target_actions[i][1], self.min_action[1], self.max_action[1])

        q1_ = self.target_critic_1.forward(state_, target_actions)
        q2_ = self.target_critic_2.forward(state_, target_actions)

        q1 = self.critic_1.forward(state, action)
        q2 = self.critic_2.forward(state, action)

        q1_[done] = 0.0
        q2_[done] = 0.0

        q1_ = q1_.view(-1)
        q2_ = q2_.view(-1)

        critic_value_ = T.min(q1_, q2_)

        target = reward + self.gamma*critic_value_
        target = target.view(self.batch_size, 1)

        self.critic_1.optimizer.zero_grad()
        self.critic_2.optimizer.zero_grad()

        q1_loss = F.mse_loss(target, q1)
        q2_loss = F.mse_loss(target, q2)
        critic_loss = q1_loss + q2_loss
        critic_loss.backward()

        self.critic_1.optimizer.step()
        self.critic_2.optimizer.step()

        self.learn_step_cntr += 1

        if self.learn_step_cntr % self.update_actor_iter != 0:
            return

        self.actor.optimizer.zero_grad()
        actor_q1_loss = self.critic_1.forward(state, self.actor.forward(state))

        actor_loss = -T.mean(actor_q1_loss)
        actor_loss.backward(retain_graph=True)
        self.actor.optimizer.step()

        self.update_network_parameters()

    def update_network_parameters(self, tau=None):
        if tau is None:
            tau = self.tau

        actor_params = self.actor.named_parameters()
        critic_1_params = self.critic_1.named_parameters()
        critic_2_params = self.critic_2.named_parameters()
        target_actor_params = self.target_actor.named_parameters()
        target_critic_1_params = self.target_critic_1.named_parameters()
        target_critic_2_params = self.target_critic_2.named_parameters()

        critic_1_state_dict = dict(critic_1_params)
        critic_2_state_dict = dict(critic_2_params)
        actor_state_dict = dict(actor_params)
        target_actor_state_dict = dict(target_actor_params)
        target_critic_1_state_dict = dict(target_critic_1_params)
        target_critic_2_state_dict = dict(target_critic_2_params)

        for name in critic_1_state_dict:
            critic_1_state_dict[name] = tau*critic_1_state_dict[name].clone() + (1-tau)*target_critic_1_state_dict[name].clone()

        for name in critic_2_state_dict:
            critic_2_state_dict[name] = tau*critic_2_state_dict[name].clone() + (1-tau)*target_critic_2_state_dict[name].clone()

        for name in actor_state_dict:
            actor_state_dict[name] = tau*actor_state_dict[name].clone() + (1-tau)*actor_state_dict[name].clone()

        self.target_critic_1.load_state_dict(critic_1_state_dict)
        self.target_critic_2.load_state_dict(critic_2_state_dict)
        self.target_actor.load_state_dict(actor_state_dict)

    def save_models(self, episode):
        self.actor.save_checkpoint(episode)
        self.target_actor.save_checkpoint(episode)
        self.critic_1.save_checkpoint(episode)
        self.critic_2.save_checkpoint(episode)
        self.target_critic_1.save_checkpoint(episode)
        self.target_critic_2.save_checkpoint(episode)

    def load_models(self, episode):
        self.actor.load_checkpoint(episode)
        self.target_actor.load_checkpoint(episode)
        self.critic_1.load_checkpoint(episode)
        self.critic_2.load_checkpoint(episode)
        self.target_critic_1.load_checkpoint(episode)
        self.target_critic_2.load_checkpoint(episode)
        
    def load_pre_trained_models(self):
        self.actor.load_pre_trained_checkpoint()
        self.target_actor.load_pre_trained_checkpoint()
  
        
        
     
