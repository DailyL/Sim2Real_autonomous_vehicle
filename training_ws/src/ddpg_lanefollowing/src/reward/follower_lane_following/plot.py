import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
from scipy.ndimage.filters import uniform_filter1d


data = np.loadtxt("20220428-192832_EpsoideReward.txt",delimiter=" ")

reward = data[:,1]

reward = uniform_filter1d(reward, size = 500)

epoch = range(len(data[:,1]))
sns.set(style="whitegrid",font_scale = 1.5)

sns.tsplot(time = epoch , data = reward , color ="r", condition = "DPPG with demo")

plt.ylabel("Episode Reward")
plt.xlabel("Episode")

plt.show()









