#!/usr/bin/env python
import rospy
import numpy as np
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist, Point, Pose
from std_srvs.srv import Empty
import copy
import math
from sensor_msgs.msg import LaserScan
import torch as T
import random

class Env():
    def __init__(self, env_name="hummingbird", state_dim=24, action_dim=2, norm_value=0.25, max_steps=500):
        self.observation_space = np.zeros(shape=(state_dim,))
        self.action = np.zeros(shape=(action_dim,))
        self.env_name = env_name
        self.norm_value = norm_value
        self.last_distance = np.inf

        self.sub_odom = rospy.Subscriber('/'+env_name+'/ground_truth/odometry', Odometry, self.get_odometry)
        self.reset_proxy = rospy.ServiceProxy('gazebo/reset_world', Empty)
        self.pub_cmd_vel = rospy.Publisher('/'+env_name+'/cmd_vel', Twist, queue_size=5)

        self.goal_x = -2.0
        self.goal_y = -2.0
        self.arriving_distance = 0.25
        self.min_range = 0.6
        self.goal_distance = 0.0

        self.position = Pose()
        self.past_position = Pose()

        self.heading = 0.0
        self.n_steps = 0
        self.max_steps = max_steps

        self.get_goalbox = False

    def get_goal_distance(self):
        goal_distance = math.sqrt((self.goal_x - self.position.x)**2 + (self.goal_y - self.position.y)**2)

        return goal_distance

    def get_odometry(self, odom):
        self.past_position = copy.deepcopy(self.position)
        self.position = odom.pose.pose.position
        orientation = odom.pose.pose.orientation
        orientation_list = [orientation.x, orientation.y, orientation.z, orientation.w]
        _, _, yaw = euler_from_quaternion(orientation_list)

        goal_angle = math.atan2(self.goal_y - self.position.y, self.goal_x - self.position.x)

        heading = goal_angle - yaw

        if heading > math.pi:
            heading -= 2 * math.pi
        elif heading < -math.pi:
            heading += 2 * math.pi

        self.heading = round(heading, 3)

    def get_state(self, scan, past_action):
        heading = self.heading
        current_distance = self.get_goal_distance()
        scan_range = []

        done = False

        for i in range(len(scan.ranges)):
            if scan.ranges[i] == float('Inf'):
                scan_range.append(20.0)
            elif np.isnan(scan.ranges[i]):
                scan_range.append(0)
            else:
                scan_range.append(scan.ranges[i])

        # print(min(scan_range))

        if self.min_range > min(scan_range) or self.position.z < -1.2 or self.position.z > 4.8:
            done = True

        for pa in past_action:
            scan_range.append(pa)

        self.observation_space[:self.observation_space.shape[0]-2] = np.asarray(scan_range, dtype=np.float32)
        self.observation_space[-2] = heading
        self.observation_space[-1] = current_distance

        if current_distance < self.arriving_distance:
            self.get_goalbox = True
            done = True

        return done

    def set_reward(self, done):
        reward = 0

        if done and not self.get_goalbox:
            rospy.loginfo("Collision!!")
            reward = -10.
            self.pub_cmd_vel.publish(Twist())
        elif done and self.get_goalbox:
            rospy.loginfo("Goal!!")
            reward = 100.
            self.pub_cmd_vel.publish(Twist())
            self.get_goalbox = False
            self.reset()
        # else:
        #     reward = -abs(past_action[1])/10.0
        #     print(past_action)
        # if self.last_distance < self.get_goal_distance() and not done and not self.get_goalbox:
        #     reward = -0.1

        # self.last_distance = self.get_goal_distance()

        return reward

    def step(self, action):
        # actions = T.tensor(action, dtype=T.float)
        # linear_vel_x = ((T.tanh(actions[0]) + 1.0)/2.0)*self.norm_value
        # angular_vel_z = T.tanh(actions[1])*self.norm_value

        linear_vel_x = ((action[0] + 1.0)/2.0)*self.norm_value
        angular_vel_z = action[1]*self.norm_value

        vel_cmd = Twist()
        vel_cmd.linear.x = linear_vel_x
        # vel_cmd.linear.y = linear_vel_y
        vel_cmd.angular.z = angular_vel_z

        self.pub_cmd_vel.publish(vel_cmd)
        # print(vel_cmd)

        data = None
        while data is None:
            try:
                data = rospy.wait_for_message('/'+self.env_name+'/scan', LaserScan, timeout=5)
            except:
                pass

        done = self.get_state(data, action)
        reward = self.set_reward(done)

        self.n_steps += 1

        if self.n_steps < self.max_steps:
            return self.observation_space, reward, done
        else:
            return self.observation_space, 0.0, True

    def reset(self):
        rospy.wait_for_service('gazebo/reset_simulation')

        try:
            self.reset_proxy()
        except (rospy.ServiceException) as e:
            print("gazebo/reset_simulation service call failed")

        data = None
        while data is None:
            try:
                data = rospy.wait_for_message('/'+self.env_name+'/scan', LaserScan, timeout=5)
            except:
                pass

        self.goal_x = float(random.randint(-450, 450))/100
        self.goal_y = float(random.randint(-450, 450))/100

        self.goal_distance = self.get_goal_distance()

        self.n_steps = 0

        _ = self.get_state(data, np.zeros(shape=(2,)))

        return self.observation_space
