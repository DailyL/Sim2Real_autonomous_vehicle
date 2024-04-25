#!/usr/bin/env python
# coding=utf-8
import numpy as np
from gym import spaces
from gym_duckietown.simulator import Simulator, NotInLane
from gym_duckietown.simulator_overtaking import Simulator_overtaking
from gym_duckietown.simulator_car_following import Simulator_CarFollowing
from gym_duckietown import logger
import math
import rospy
from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped, LanePose, VehicleCorners
import os
import cv2
from cv_bridge import CvBridge, CvBridgeError
from scipy.spatial import distance
from gym_duckietown.recorder import Recorder
from tud_rl.weights.cnn3 import CNN
import torch
from gym_duckietown.envs.duckietown_env import DuckietownEnv



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
        self.ratio = 0.45
        self._in_overtaking = 0
        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(10)
        self.recorder = Recorder(self.map_name)
        

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

        """
        v = action[0]
        phi = action[1]

        action[0]= ((action[0]+1)/2)
        action[1]= action[1]*self.pi

        obs, reward, done, info = DuckietownEnv.step(self, action)

        # distance to the closest point (optimal)
        r_d = distance.euclidean(info["Simulator"]['lane_position']['closest_point'], info["Simulator"]['cur_pos'])

        # desired heading

        x_path = (math.acos(info["Simulator"]['lane_position']['desired_heading'][0]))*self.pi/180


        
        e_y = math.sin(x_path-math.atan((info["Simulator"]['cur_pos'][-1]-info["Simulator"]['lane_position']['closest_point'][-1])/(info["Simulator"]['cur_pos'][0]-info["Simulator"]['lane_position']['closest_point'][0])))*r_d
            

        x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
        
        r_yaw = abs(abs(info["Simulator"]['cur_angle']) + x_d)
        """

        v = action[0]
        phi = action[1]

        action[0]= ((action[0]+1)/2) * self.ratio
        action[1]= action[1]*np.pi*0.5

        obs, reward, done, info = DuckietownEnv.step(self, action)

        vec = self.render_observation(obs)
        self.lane_pose_d = vec[2]
        speed = vec[1]

        #self.recorder.record(obs, info, self.lanePose_d, self.lanePose_phi, action[0], action[1], done)
        # pub real lane pose info
        """
        time = rospy.get_rostime()
        if info["Simulator"]['lane_position']['dist'] is not None:
            self.lane_pose_d = info["Simulator"]['lane_position']['dist']
            self.lane_pose_phi = info["Simulator"]['lane_position']['angle_rad']
            lane_pose_msg = LanePose()

            lane_pose_msg.header.stamp.secs = time.secs
            lane_pose_msg.header.stamp.nsecs = time.nsecs
            lane_pose_msg.d = self.lane_pose_d
            lane_pose_msg.phi = self.lane_pose_phi
            self.real_pose_pub.publish(lane_pose_msg)
        else:
            pass
        """


        # distance to the closest point (optimal)
        """
        if info["Simulator"]['lane_position'] not None:
            r_d = distance.euclidean(info["Simulator"]['lane_position']['closest_point'], info["Simulator"]['cur_pos'])
        else:
            r_d = 0    
        """
        # desired heading

        x_path = 0


        
        e_y = self.lanePose_d
            

        x_d = self.x_infi * math.atan(self.k_ey*e_y) + x_path
        
        r_yaw = abs(abs(self.lanePose_phi) + x_d)

        d_v = 0
        
        

        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/self.pi
        status3 = speed/self.ratio
        status4 = r_yaw/(2*self.pi)
        status5 = abs(e_y)/2.0
        status6 = d_v/5
        status7 = v
        status8 = phi
                 
        state = [status1,status2,status3,status4,status5,status6,status7,status8]

        return state, obs, reward, done, info

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
    

    def render_observation(self, img):
        '''
        height = img.shape[0]
        height_cropped = height // 3

        image = img[height_cropped:, : ]
        image_resized = cv2.resize(image, (80, 160), interpolation = cv2.INTER_AREA)
        image_grey = cv2.cvtColor(image_resized , cv2.COLOR_RGB2GRAY)
        
        image_grey = torch.tensor(image_grey, dtype=torch.float).to(device)
        image_grey = image_grey.unsqueeze(0)
        image_grey = image_grey.unsqueeze(0)
        image_grey = image_grey.repeat(1,3,1,1)
        '''
        height = img.shape[0]
        height_cropped = height // 3
        img = img[height_cropped:, : ]
        image_resized = cv2.resize(img, (80, 160), interpolation = cv2.INTER_AREA)


        device = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')   
        image_resized = torch.tensor(image_resized, dtype=torch.float).to(device)
        

        image_resized = image_resized.unsqueeze(0)
        image_resized = image_resized.permute(0,3,1,2)

        #img = img.unsqueeze(0)
        #img = img.repeat(1,3,1,1) 

        cnn = CNN()
        cnn.load()
        cnn.to(device)
        vector = cnn(image_resized).cpu().detach().numpy()

        try:
            dist = vector[0][1]
        except NotInLane:
            dist = -0.5

        try:
            scaled_angle = vector[0][0] 
        except NotInLane:
            scaled_angle = 0

        obs = np.array([scaled_angle, self.speed, dist]).astype(np.float32)

        return obs





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