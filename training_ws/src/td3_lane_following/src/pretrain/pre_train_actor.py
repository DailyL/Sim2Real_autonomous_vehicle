#!/usr/bin/env python


from keras.models import model_from_json, Model
from keras.models import Sequential
from keras.layers import Dense, Flatten, Input, merge, Lambda, Activation
from tensorflow.keras.optimizers import Adam 
import tensorflow.compat.v1 as tf
from tensorflow.keras import layers, models
import json
from tensorflow import keras
import time
from keras import backend as K
import rospy
import time
from numpy import load
from keras.layers import Concatenate
import os
import torch as T
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import numpy as np
import torch 
train_input = load("input_with_noise.npy") 
train_output = load("output_with_noise.npy") 





def train(train_indicator=1):    #1 means Train, 0 means simply Run
    LRA = 0.0003    #Learning rate for Actor

    action_dim = 2  #num of action dim 1:velocity 2: steer angle 
    state_dim = 11  #num of features in state

    episode_count = 1000
    indicator = 0
    BATCH_SIZE = 128
    #Tensorflow GPU optimization
    config = tf.ConfigProto()
    config.gpu_options.allow_growth = True
    sess = tf.Session(config=config)
    K.set_session(sess)
    actor = create_actor_network(state_dim,action_dim)
    
    actor.compile(optimizer=tf.keras.optimizers.Adam(learning_rate=LRA),
                  loss='categorical_crossentropy',
                  metrics=['accuracy'])
                  
    actor.fit(train_input,train_output,
                    epochs = 20,
                    batch_size = 128)

    actor.save('actormodel.h5')
    
    
def create_actor_network(state_size,action_dim):
        print("Now we build the Actor model")
        S = Input(shape=[state_size])         
        h0 = Dense(32, activation='relu',kernel_initializer="glorot_uniform",bias_initializer="zeros")(S)
        h1 = Dense(64, activation='relu',kernel_initializer="glorot_uniform", bias_initializer="zeros")(h0)
        h2 = Dense(32, activation='relu',kernel_initializer="glorot_uniform", bias_initializer="zeros")(h1)
        vel = Dense(1,activation='sigmoid',kernel_initializer="glorot_uniform", bias_initializer="zeros")(h2)
        phi = Dense(1,activation='tanh',kernel_initializer="glorot_uniform", bias_initializer="zeros")(h2)
        output = Concatenate()([vel, phi])
        model = Model(inputs=S,outputs=output)
        return model

if __name__ == "__main__":

    train()
