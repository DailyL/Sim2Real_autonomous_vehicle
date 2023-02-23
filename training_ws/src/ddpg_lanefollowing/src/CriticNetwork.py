#!/usr/bin/env python
import numpy as np
import math
from keras.initializers import normal, identity,uniform
from keras.models import model_from_json
from tensorflow.keras import layers, models
from keras.models import Sequential
from keras.layers import Dense, Flatten, Input, merge, Lambda, Activation
from keras.models import Sequential, Model
from tensorflow.keras.optimizers import Adam # - Works
from tensorflow.python.framework.ops import disable_eager_execution
import keras.backend as K
import tensorflow.compat.v1 as tf
from keras.layers import Concatenate
HIDDEN1_UNITS = 100
HIDDEN2_UNITS = 100

class CriticNetwork(object):
    def __init__(self, sess, state_size, action_size, BATCH_SIZE, TAU, LEARNING_RATE):
        self.sess = sess
        self.BATCH_SIZE = BATCH_SIZE
        self.TAU = TAU
        self.LEARNING_RATE = LEARNING_RATE
        self.action_size = action_size
        disable_eager_execution()        
        K.set_session(sess)

        #Now create the model
        self.model, self.action, self.state = self.create_critic_network(state_size, action_size)  
        self.target_model, self.target_action, self.target_state = self.create_critic_network(state_size, action_size)  
        self.action_grads = tf.gradients(self.model.output, self.action)  #GRADIENTS for policy update
        self.sess.run(tf.global_variables_initializer())

    def gradients(self, states, actions):
        return self.sess.run(self.action_grads, feed_dict={
            self.state: states,
            self.action: actions
        })[0]

    def target_train(self):
        critic_weights = self.model.get_weights()
        critic_target_weights = self.target_model.get_weights()
        for i in range(len(critic_weights)):
            critic_target_weights[i] = self.TAU * critic_weights[i] + (1 - self.TAU)* critic_target_weights[i]
        self.target_model.set_weights(critic_target_weights)

    def create_critic_network(self, state_size,action_dim):
        print("Now we build the Critic model")
        S = Input(shape=[state_size])  
        A = Input(shape=[action_dim])
        h = Concatenate()([S,A])
        h1 = Dense(128, activation='relu')(h)            
        h2 = Dense(64, activation='relu')(h1)
        V = Dense(1,activation='linear')(h2)   
        model = Model(inputs=[S,A],outputs=V)
        adam = Adam(learning_rate=self.LEARNING_RATE)
        model.compile(loss='mse', optimizer=adam)
        return model, A, S 
