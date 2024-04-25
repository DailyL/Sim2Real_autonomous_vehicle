#!/usr/bin/env python

import numpy as np
import gym
import cv2
from gym import spaces
from gym_duckietown.envs.duckietown_env import DuckietownEnv
from gym_duckietown.simulator import NotInLane
from gym_duckietown import simulator
import math
from scipy.spatial import distance
simulator.REWARD_INVALID_POSE = 0
import rospy

#ROS import

from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped, LanePose, VehicleCorners
import cv2
from cv_bridge import CvBridge, CvBridgeError



class DuckietownROSLanefollowing(DuckietownEnv):

    """
    Environment for the Duckietown overtaking task with ROS
    """

    def __init__(self, **kwargs):
        DuckietownEnv.__init__(self, **kwargs)
        # Get the vehicle name, which comes in as HOSTNAME
        self.vehicle = 'david'

        # Subscribes to the lane pose from lane pose node
        self.lane_pose_sub = rospy.Subscriber("/david/lane_filter_node/lane_pose", LanePose, self.lane_pose_callback, queue_size=1)

        # Publishes onto the corrected image topic 
        # since image out of simulator is currently rectified
        self.cam_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/image/raw/compressed", CompressedImage, queue_size=10)
        
        # Publisher for camera info - needed for the ground_projection
        self.cam_info_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/camera_info", CameraInfo, queue_size=10)

        # Publisher for real lane pose
        self.real_pose_pub = rospy.Publisher("/" + self.vehicle + "/real_lane_pose", LanePose, queue_size=1)

        self.lanePose_d = 0       
        self.lanePose_phi = 0

        self.lane_pose_d = 0
        self.lane_pose_phi = 0

        self.camera_width = 640
        self.camera_height = 480   

        # K - Intrinsic camera matrix for the raw (distorted) images.
        self.camera_matrix = [
            305.5718893575089,
            0,
            303.0797142544728,
            0,
            308.8338858195428,
            231.8845403702499,
            0,
            0,
            1,
        ]
        # D Intrinsic camera matrix for the raw (distorted) images.
        self.distortion_coefs = [-0.2, 0.0305, 0.0005859930422629722, -0.0006697840226199427, 0.0]

        # P Projection/camera matrix

        self.projection = [
            220.2460277141687, 0.0, 301.8668918355899, 0.0,
            0.0, 238.6758484095299, 227.0880056118307, 0.0,
            0.0, 0.0, 1.0, 0.0]




        self.bridge = CvBridge()

        self.lanewidth = 0.23

        self.pi = math.pi
        
        self.x_infi = 1
        self.k_ey = 0.5
        self.v = 0
        self.phi = 0
        self.ratio = 0.5
        self._in_overtaking = 0
        self.v_des = 0.75
        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(10)        
    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            pass

    def cmd_callback(self, msg):
        self.v = msg.v 
        self.phi = msg.omega

    
    def _publish_info(self):
        """
        Publishes a default CameraInfo - TODO: Fix after distortion applied in simulator
        """

        cam_info = CameraInfo()
        time = rospy.get_rostime()
        cam_info.header.stamp.secs = time.secs
        cam_info.header.stamp.nsecs = time.nsecs
        cam_info.height = self.camera_height
        cam_info.width = self.camera_width
        cam_info.distortion_model = "plumb_bob"
        cam_info.D = self.distortion_coefs
        cam_info.K = self.camera_matrix
        cam_info.R = [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
        cam_info.P = self.projection
        cam_info.binning_x = 0 
        cam_info.binning_y = 0
        cam_info.roi.x_offset = 0
        cam_info.roi.y_offset = 0
        cam_info.roi.height = 0
        cam_info.roi.width = 0
        cam_info.roi.do_rectify = False


        self.cam_info_pub.publish(cam_info)      

    def _publish_img(self, obs):
        """
        Publishes the image to the compressed_image topic, which triggers the lane following loop
        """
        img_msg = CompressedImage()

        time = rospy.get_rostime()
        img_msg.header.stamp.secs = time.secs
        img_msg.header.stamp.nsecs = time.nsecs

        img_msg.format = "jpeg"

        contig = cv2.cvtColor(np.ascontiguousarray(obs), cv2.COLOR_BGR2RGB)

        
        img_msg.data = np.array(cv2.imencode('.jpg', contig)[1]).tostring()

        self.cam_pub.publish(img_msg)

    def step(self, action):
        """
        custom our step function

        we add feature as our input states, and reserve image output from original step function to produce 
        camera image for our image perception part (next time step)

        """

        
        v = action[0]
        phi = action[1]

        action[0]= ((action[0]+1)/2)*0.75
        action[1]= action[1]*self.pi

        obs, reward, done, info = DuckietownEnv.step(self, action)

        try:

            x_path = 0


        
            e_y = self.lanePose_d
            

            x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
        
            r_yaw = abs(abs(self.lanePose_phi) + x_d)

            d_v = 0

            """
            # distance to the closest point (optimal)
            r_d = distance.euclidean(info["Simulator"]['lane_position']['closest_point'], info["Simulator"]['cur_pos'])

            # desired heading

            x_path = (math.acos(info["Simulator"]['lane_position']['desired_heading'][0]))*self.pi/180


            
            e_y = math.sin(x_path-math.atan((info["Simulator"]['cur_pos'][-1]-info["Simulator"]['lane_position']['closest_point'][-1])/(info["Simulator"]['cur_pos'][0]-info["Simulator"]['lane_position']['closest_point'][0])))*r_d
                

            x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
            
            r_yaw = abs(abs(info["Simulator"]['cur_angle']) + x_d)
       

            d_v = 0
            """
            

            status1 = self.lanePose_d/self.lanewidth
            status2 = self.lanePose_phi/self.pi
            status3 = info["Simulator"]['robot_speed']/self.ratio
            status4 = r_yaw/(2*self.pi)
            status5 = abs(e_y)/2.0
            status6 = d_v/5
            status7 = v
            status8 = phi
                    
            state = [status1,status2,status3,status4,status5,status6,status7,status8]

            reward = self.compute_rew(info, done)

        except KeyError:
            state, obs = self.reset()
            reward = 0
            done = False

        return state, obs, reward, done, info

    def compute_rew(self, info, done):
        # distance to the closest point (optimal)
        r_d = distance.euclidean(info["Simulator"]['lane_position']['closest_point'], info["Simulator"]['cur_pos'])
        x_path = (math.acos(info["Simulator"]['lane_position']['desired_heading'][0]))*self.pi/180
        e_y = math.sin(x_path-math.atan((info["Simulator"]['cur_pos'][-1]-info["Simulator"]['lane_position']['closest_point'][-1])/(info["Simulator"]['cur_pos'][0]-info["Simulator"]['lane_position']['closest_point'][0])))*r_d
            

        x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
        
        r_yaw = abs(abs(info["Simulator"]['lane_position']['angle_rad']) + x_d)

        r_v = (info["Simulator"]['robot_speed']-self.v_des)/self.v_des

        if done:
            reward = -1 
        else:
            reward = np.clip((0.3*math.pow(0.001,(abs(e_y)*0.6)) + 0.6*r_v - 0.1*r_yaw),-1,1)

        return reward
    
    def reset(self):

        obs = DuckietownEnv.reset(self)

        status1 = 0
        status2 = 0
        status3 = 0
        status4 = 0
        status5 = 0
        status6 = 0
        status7 = 0
        status8 = 0
        

        state = [status1,status2,status3,status4,status5,status6,status7,status8]

        return state, obs






    def spin(self):
        """
        Main loop
        Steps the sim with the last action at rate of 10Hz
        """
        while not rospy.is_shutdown():
            img, r , d, _ = self.env.step(self.action)
            self.env.render()
            if d:
                self.env.reset()
            self._publish_img(img)
            self._publish_info()
            self.r.sleep()




class PositiveVelEnv(DuckietownEnv):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.action_space = spaces.Box(
                low=-1,
                high=1,
                shape=(2,),
                dtype=np.float32
        )
        self.observation_space = spaces.Box(
            low=0.,
            high=1.,
            shape=(3, self.camera_height, self.camera_width),
            dtype=np.float32
        )
        self.prev_pos = None
        self.total_dist = 0
        self.pi = math.pi
        self.x_infi = 1
        self.k_ey = 0.5
        self.v_des = 0.6

    def reset(self):
        self.speeds = []
        self.right_dists = []
        self.right_angle = []
        return super().reset()

    def step(self, action):

        action[0]= ((action[0]+1)/2) * 0.4
        action[1]= action[1]*np.pi


        obs, rew, done, info = super().step(action)

        """
        cv2.imshow("CarBoxGym",
                       cv2.cvtColor(obs.transpose(1, 2, 0),
                                    cv2.COLOR_BGR2RGB))
        if cv2.waitKey(1) == ord('q'):
            # press q to terminate the loop
            cv2.destroyAllWindows()
        """
        self.speeds.append(self.speed)
        try:
            right_dist = self.get_lane_pos2(self.cur_pos, self.cur_angle).dist
        except NotInLane:
            right_dist = 2.
        self.right_dists.append(right_dist)

        try:
            right_angle = self.get_lane_pos2(self.cur_pos, self.cur_angle).angle_deg
        except NotInLane:
            right_angle = 0.
        self.right_angle.append(right_angle)
        info['sp'] = np.mean(self.speeds)
        info['rd'] = np.mean(self.right_dists)
        info['ra'] = np.mean(self.right_angle)
        #super().render()
        rew = self.compute_rew(info, done)
        return obs, rew, done, info

    def render_obs(self):
        img = super().render_obs()
        return img.transpose(2, 0, 1).astype(np.float32) / 255.

    def compute_reward(self, pos, angle, speed):
        # Get the position relative to the right lane tangent
        try:
            right_dist = self.get_lane_pos2(pos, angle).dist
        except NotInLane:
            right_dist = 2.

        # speed reward
        speed_rew = min(self.speed, self.robot_speed) / self.robot_speed

        # lane position reward
        lane_rew = np.exp(-np.abs(5 * right_dist))

        if self.prev_pos is not None:
            diff = pos - self.prev_pos
            dist = np.linalg.norm(diff)
            try:
                lp = self.get_lane_pos2(pos, angle)
            except NotInLane:
                lp = None
            if lp is not None and lp.dist > -0.05 and np.dot(lp.tangent, diff) >= 0:
                self.total_dist += dist

        dist_rew = 50 * self.total_dist

        # reward = 2 * speed_rew + lane_rew
        reward = speed_rew + lane_rew + dist_rew
        return reward

    def compute_rew(self, info, done):
        # distance to the closest point (optimal)
        r_d = distance.euclidean(info["Simulator"]['lane_position']['closest_point'], info["Simulator"]['cur_pos'])
        x_path = (math.acos(info["Simulator"]['lane_position']['desired_heading'][0]))*self.pi/180
        e_y = math.sin(x_path-math.atan((info["Simulator"]['cur_pos'][-1]-info["Simulator"]['lane_position']['closest_point'][-1])/(info["Simulator"]['cur_pos'][0]-info["Simulator"]['lane_position']['closest_point'][0])))*r_d
            

        x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
        
        r_yaw = abs(abs(info["Simulator"]['lane_position']['angle_rad']) + x_d)

        r_v = (info["Simulator"]['robot_speed']-self.v_des)/self.v_des

        if done:
            reward = -1 
        else:
            reward = np.clip((0.3*math.pow(0.001,(abs(e_y)*0.6)) + 0.6*r_v - 0.1*r_yaw),-1,1)

        return reward


def get_env(map_name):
    return DuckietownROSLanefollowing(
        seed=42,
        map_name = map_name,
        domain_rand=False,
        camera_width=640,
        camera_height=480,
        max_steps=2000,
        robot_speed=1.2,
        accept_start_angle_deg=4,
        full_transparency=True,
        distortion=False
    )


if __name__ == '__main__':
    env = get_env()

    for _ in range(1000):
        # env.render()
        # tl = env.objects[0].pos
        # env.cur_pos = tl - np.array([-.0, 0, -1.3])
        # env.cur_angle = 1.56

        act = env.action_space.sample()

        s, r, d, _ = env.step(act)
        env.render()
        env.render('top_down')

        # _update_pos(env.cur_pos,
        #             env.cur_angle,
        #             env.wheel_dist,
        #             wheelVels=env.wheelVels,
        #             deltaTime=env.delta_time)
        # render input
        cv2.imshow("CarBoxGym", s)
        if cv2.waitKey(1) == ord('q'):
            # press q to terminate the loop
            cv2.destroyAllWindows()
            exit()

        if d:
            env.reset()
