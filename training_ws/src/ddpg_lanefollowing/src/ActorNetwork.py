#!/usr/bin/env python
import numpy as np
import math
from keras.initializers import normal, identity, uniform
from keras.models import model_from_json
from keras.models import Sequential, Model
from tensorflow.keras import layers, models
from keras.layers import Dense, Flatten, Input, merge, Lambda, Activation
from tensorflow.keras.optimizers import Adam # - Works
from tensorflow.python.framework.ops import disable_eager_execution
import tensorflow.compat.v1 as tf
import keras.backend as K
from keras.layers import Concatenate
class ActorNetwork(object):
    def __init__(self, sess, state_size, action_size, BATCH_SIZE, TAU, LEARNING_RATE):
        self.sess = sess
        self.BATCH_SIZE = BATCH_SIZE
        self.TAU = TAU
        self.LEARNING_RATE = LEARNING_RATE
        disable_eager_execution()
        K.set_session(sess)

        #Now create the model
        self.model , self.weights, self.state = self.create_actor_network(state_size, action_size)   
        self.target_model, self.target_weights, self.target_state = self.create_actor_network(state_size, action_size) 
        
        self.action_gradient = tf.placeholder(tf.float32,[None, action_size])
        self.params_grad = tf.gradients(self.model.output, self.weights, -self.action_gradient)
        grads = zip(self.params_grad, self.weights)
        self.optimize = tf.train.AdamOptimizer(LEARNING_RATE).apply_gradients(grads)
        self.sess.run(tf.global_variables_initializer())

    def train(self, states, action_grads):
        self.sess.run(self.optimize, feed_dict={
            self.state: states,
            self.action_gradient: action_grads
        })

    def target_train(self):
        actor_weights = self.model.get_weights()
        actor_target_weights = self.target_model.get_weights()
        for i in range(len(actor_weights)):
            actor_target_weights[i] = self.TAU * actor_weights[i] + (1 - self.TAU)* actor_target_weights[i]
        self.target_model.set_weights(actor_target_weights)

    def create_actor_network(self, state_size,action_dim):
        print("Now we build the Actor model")
        S = Input(shape=[state_size])         
        h0 = Dense(128, activation='relu')(S)
        h1 = Dense(64, activation='relu')(h0)        
        vel = Dense(1,activation='sigmoid')(h1)
        phi = Dense(1,activation='tanh')(h1)
        output = Concatenate()([vel, phi])
        model = Model(inputs=S,outputs=output)
        return model, model.trainable_weights, S
