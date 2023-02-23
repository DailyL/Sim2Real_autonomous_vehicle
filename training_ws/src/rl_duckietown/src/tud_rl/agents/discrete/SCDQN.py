import torch
from tud_rl.agents.discrete.DQN import DQNAgent
from tud_rl.common.logging_func import *


class SCDQNAgent(DQNAgent):
    def __init__(self, c, agent_name):
        super().__init__(c, agent_name, logging=True)

        # attributes and hyperparameters
        self.sc_beta = c["agent"][agent_name]["sc_beta"]


    def _compute_target(self, r, s2, d):
        with torch.no_grad():
            tgt_s2 = self.target_DQN(s2)

            target_Q_beta = (1 - self.sc_beta) * tgt_s2 + self.sc_beta * self.DQN(s2)
            a2 = torch.argmax(target_Q_beta, dim=1).reshape(self.batch_size, 1)
            
            Q_next = torch.gather(input=tgt_s2, dim=1, index=a2)
            y = r + self.gamma * Q_next * (1 - d)

        return y
