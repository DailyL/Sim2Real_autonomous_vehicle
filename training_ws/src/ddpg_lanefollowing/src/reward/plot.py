import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
data = np.loadtxt("20220419-191730_EpsoideReward.txt",delimiter=" ")

reward = data[:,1]
epoch = range(5836)
sns.set_theme(style="darkgrid",font_scale = 1.5)
sns.lineplot(x = epoch , y = reward , color ="r")

plt.ylabel("Episode Reward")
plt.xlabel("Episode")

plt.show()
