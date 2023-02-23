import copy
from collections import Counter

import torch
import torch.nn as nn
import torch.optim as optim
from tud_rl.agents.discrete.DQN import DQNAgent
from tud_rl.common.buffer import UniformReplayBuffer_BootDQN
from tud_rl.common.logging_func import *
from tud_rl.common.nets import MinAtar_BootDQN


class BootDQNAgent(DQNAgent):
    def __init__(self, c, agent_name, logging=True):
        super().__init__(c, agent_name, logging=False)

        # attributes and hyperparameters
        self.K            = c["agent"][agent_name]["K"]
        self.mask_p       = c["agent"][agent_name]["mask_p"]
        self.grad_rescale = c["agent"][agent_name]["grad_rescale"]
        c["grad_rescale"] = self.grad_rescale   # for correct logging

        # checks
        assert self.state_type == "image", "Currently, BootDQN is only available with 'image' input."
       
        # replay buffer with masks
        if self.mode == "train":
            self.replay_buffer = UniformReplayBuffer_BootDQN(state_type    = self.state_type, 
                                                             state_shape   = self.state_shape,
                                                             buffer_length = self.buffer_length, 
                                                             batch_size    = self.batch_size, 
                                                             device        = self.device,
                                                             K             = self.K, 
                                                             mask_p        = self.mask_p)
        # init BootDQN
        if self.state_type == "image":
            self.DQN = MinAtar_BootDQN(in_channels = self.state_shape[0],
                                       height      = self.state_shape[1], 
                                       width       = self.state_shape[2], 
                                       num_actions = self.num_actions, 
                                       K           = self.K).to(self.device)
        

        # init logger and save config
        if logging:
            self.logger = EpochLogger(alg_str = self.name, env_str = self.env_str, info = self.info)
            self.logger.save_config({"agent_name" : self.name, **c})

            print("--------------------------------------------")
            print(f"n_params: {self._count_params(self.DQN)}")
            print("--------------------------------------------")

        # prior weights
        if self.dqn_weights is not None:
            self.DQN.load_state_dict(torch.load(self.dqn_weights))

        # target net and counter for target update
        self.target_DQN = copy.deepcopy(self.DQN).to(self.device)
        self.tgt_up_cnt = 0
        
        # freeze target nets with respect to optimizers to avoid unnecessary computations
        for p in self.target_DQN.parameters():
            p.requires_grad = False

        # define optimizer
        if self.optimizer == "Adam":
            self.DQN_optimizer = optim.Adam(self.DQN.parameters(), lr=self.lr)
        else:
            self.DQN_optimizer = optim.RMSprop(self.DQN.parameters(), lr=self.lr, alpha=0.95, centered=True, eps=0.01)
        
        # init active head
        self.reset_active_head()


    def reset_active_head(self):
        self.active_head = np.random.choice(self.K)


    @torch.no_grad()
    def select_action(self, s):
        """Greedy action selection for a given state using the active head (train) or majority vote (test).
        s:       np.array with shape (in_channels, height, width)

        returns: int for the action
        """

        # single vote
        if self.mode == "train":
            a = self._greedy_action(s, self.active_head)
        
        # majority vote
        else:
            a = self._greedy_action(s)
        return a


    @torch.no_grad()
    def _greedy_action(self, s, active_head=None, with_Q=False):
        """Selects a greedy action via majority vote of the bootstrap heads or a single bootstrap head.
        Args:
            s:            np.array with shape (in_channels, height, width)
            active_head:  int, bootstrap head to base action selection on. If None: majority vote. 
            with_Q:       bool, whether to return the Q-estimate related to the greedy action (for a single head)
        Returns:
            int for action, float for Q (if with_Q)
        """

        # check
        if active_head == None and with_Q:
            raise Exception("Better not evaluate the Q's for majority votes.")

        # reshape obs (namely, to torch.Size([1, in_channels, height, width]))
        s = torch.tensor(s, dtype=torch.float32).unsqueeze(0).to(self.device)

        if active_head is None:

            # push through all heads (generates list of length K with torch.Size([1, num_actions]))
            q = self.DQN(s)

            # get favoured action of each head
            actions = [torch.argmax(head_q).item() for head_q in q]

            # choose majority vote
            actions = Counter(actions)
            a = actions.most_common(1)[0][0]
   
        else:
            # forward
            q = self.DQN(s, active_head)

            # greedy
            a = torch.argmax(q).item()

            if with_Q:
                return a, q[0][a].item()
        return a


    def train(self):
        """Samples from replay_buffer, updates critic and the target networks."""        
        # sample batch
        batch = self.replay_buffer.sample()
        
        # unpack batch
        s, a, r, s2, d, m = batch

        #-------- train BootDQN --------
        # clear gradients
        self.DQN_optimizer.zero_grad()
        
        # current and next Q-values
        Q_main = self.DQN(s)
        Q_s2_tgt = self.target_DQN(s2)
        Q_s2_main = self.DQN(s2)

        # set up losses
        losses = []

        # calculate loss for each head
        for k in range(self.K):
            
            # gather actions
            Q = torch.gather(input=Q_main[k], dim=1, index=a)

            # targets
            with torch.no_grad():

                a2 = torch.argmax(Q_s2_main[k], dim=1).reshape(self.batch_size, 1)
                Q_next = torch.gather(input=Q_s2_tgt[k], dim=1, index=a2)

                y = r + self.gamma * Q_next * (1 - d)

            # calculate (Q - y)**2
            loss_k = self._compute_loss(Q, y, reduction="none")

            # use only relevant samples for given head
            loss_k = loss_k * m[:, k].unsqueeze(1)

            # append loss
            losses.append(torch.sum(loss_k) / torch.sum(m[:, k]))
       
        # compute gradients
        loss = sum(losses)
        loss.backward()

        # gradient scaling and clipping
        if self.grad_rescale:
            for p in self.DQN.core.parameters():
                p.grad *= 1/float(self.K)
        if self.grad_clip:
            nn.utils.clip_grad_norm_(self.DQN.parameters(), max_norm=10)
        
        # perform optimizing step
        self.DQN_optimizer.step()
        
        # log critic training
        self.logger.store(Loss=loss.detach().cpu().numpy().item())
        self.logger.store(Q_val=Q.detach().mean().cpu().numpy().item())

        #------- Update target networks -------
        self._target_update()
