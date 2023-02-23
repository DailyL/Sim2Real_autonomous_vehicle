#!/usr/bin/env python
# coding=utf-8
import numpy as np
from gym import spaces
from ..simulator import Simulator
from ..simulator_overtaking import Simulator_overtaking
from .. import logger
import math
import rospy
from sensor_msgs.msg import CompressedImage, CameraInfo
from duckietown_msgs.msg import Twist2DStamped, WheelsCmdStamped, LanePose, VehicleCorners
import os
import cv2
from cv_bridge import CvBridge, CvBridgeError
from scipy.spatial import distance



class DuckietownEnv(Simulator):
    """
    Wrapper to control the simulator using velocity and steering angle
    instead of differential drive motor velocities
    """

    def __init__(
        self,
        gain = 1.0,
        trim = 0.0,
        radius = 0.0318,
        k = 27.0,
        limit = 1.0,
        distortion=True,
        **kwargs
    ):
        Simulator.__init__(self, **kwargs)
        logger.info('using DuckietownEnv')

        self.action_space = spaces.Box(
            low=np.array([-1,-1]),
            high=np.array([1,1]),
            dtype=np.float32
        )

        # Should be adjusted so that the effective speed of the robot is 0.2 m/s
        self.gain = gain

        # Directional trim adjustment
        self.trim = trim

        # Wheel radius
        self.radius = radius

        # Motor constant
        self.k = k

        # Wheel velocity limit
        self.limit = limit

    def step(self, action):
        vel, angle = action

        # Distance between the wheels
        baseline = self.unwrapped.wheel_dist

        # assuming same motor constants k for both motors
        k_r = self.k
        k_l = self.k

        # adjusting k by gain and trim
        k_r_inv = (self.gain + self.trim) / k_r
        k_l_inv = (self.gain - self.trim) / k_l

        omega_r = (vel + 0.5 * angle * baseline) / self.radius
        omega_l = (vel - 0.5 * angle * baseline) / self.radius

        # conversion from motor rotation rate to duty cycle
        u_r = omega_r * k_r_inv
        u_l = omega_l * k_l_inv

        # limiting output to limit, which is 1.0 for the duckiebot
        u_r_limited = max(min(u_r, self.limit), -self.limit)
        u_l_limited = max(min(u_l, self.limit), -self.limit)

        vels = np.array([u_l_limited, u_r_limited])

        obs, reward, done, info = Simulator.step(self, vels)
        mine = {}
        mine['k'] = self.k
        mine['gain'] = self.gain
        mine['train'] = self.trim
        mine['radius'] = self.radius
        mine['omega_r'] = omega_r
        mine['omega_l'] = omega_l
        info['DuckietownEnv'] = mine
        return obs, reward, done, info


class DuckietownLF(DuckietownEnv):
    """
    Environment for the Duckietown lane following task with
    and without obstacles (LF and LFV tasks)
    """

    def __init__(self, **kwargs):
        DuckietownEnv.__init__(self, **kwargs)

    def step(self, action):
        obs, reward, done, info = DuckietownEnv.step(self, action)
        return obs, reward, done, info


class DuckietownNav(DuckietownEnv):
    """
    Environment for the Duckietown navigation task (NAV)
    """

    def __init__(self, **kwargs):
        self.goal_tile = None
        DuckietownEnv.__init__(self, **kwargs)

    def reset(self):
        DuckietownNav.reset(self)

        # Find the tile the agent starts on
        start_tile_pos = self.get_grid_coords(self.cur_pos)
        start_tile = self._get_tile(*start_tile_pos)

        # Select a random goal tile to navigate to
        assert len(self.drivable_tiles) > 1
        while True:
            tile_idx = self.np_random.randint(0, len(self.drivable_tiles))
            self.goal_tile = self.drivable_tiles[tile_idx]
            if self.goal_tile is not start_tile:
                break

    def step(self, action):
        obs, reward, done, info = DuckietownNav.step(self, action)

        info['goal_tile'] = self.goal_tile

        # TODO: add term to reward based on distance to goal?

        cur_tile_coords = self.get_grid_coords(self.cur_pos)
        cur_tile = self._get_tile(self.cur_tile_coords)

        if cur_tile is self.goal_tile:
            done = True
            reward = 1000

        return obs, reward, done, info





class DuckietownROS(DuckietownEnv):

    """
    Environment for the Duckietown overtaking task with ROS
    """

    def __init__(self, **kwargs):
        DuckietownEnv.__init__(self, **kwargs)
        # Get the vehicle name, which comes in as HOSTNAME
        self.vehicle = 'david'

        # Subscribes to the lane pose from lane pose node
        self.lane_pose_sub = rospy.Subscriber("~lane_pose", LanePose, self.lane_pose_callback, queue_size=10)

        # Subscribes to the vehicle decection from detection node
        self.vehicle_detection_sub = rospy.Subscriber("~centers", VehicleCorners, self.cb_process_centers, queue_size=10)

        # Publishes onto the corrected image topic 
        # since image out of simulator is currently rectified
        self.cam_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/image/raw/compressed", CompressedImage, queue_size=10)
        
        # Publisher for camera info - needed for the ground_projection
        self.cam_info_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/camera_info", CameraInfo, queue_size=10)

        self.lanePose_d = 0       
        self.lanePose_phi = 0

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
        self.distortion_coefs = [-0.2944667743901807, 0.0701431287084318, 0.0005859930422629722, -0.0006697840226199427, 0.0]

        # P Projection/camera matrix

        self.projection = [
            220.2460277141687, 0.0, 301.8668918355899, 0.0,
            0.0, 238.6758484095299, 227.0880056118307, 0.0,
            0.0, 0.0, 1.0, 0.0]




        self.bridge = CvBridge()

        self.pattern = np.zeros((21,2))

        self.lanewidth = 0.23

        self.pi = math.pi
        

        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(10)



    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            pass



    def cb_process_centers(self, vehicle_centers_msg):
        """
        Callback that processes a back pattern detection. If no detection was made, publishes a dummy stop
        line message.

        Args:
            vehicle_centers_msg (:obj:`duckietown_msgs.msg.VehicleCorners`): Detected pattern (if any)

        """

        # check if there actually was a detection
        i = 0 
        detection = vehicle_centers_msg.detection.data
        if detection:
            for point in vehicle_centers_msg.corners:

                self.pattern[i, 0] = point.x
                self.pattern[i, 1]= point.y
                i += 1

        else:
            self.pattern = np.zeros((21,2))
    
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

        action[0]= ((action[0]+1)/2)*0.5
        action[1]= action[1]*self.pi*2

        obs, reward, done, info = DuckietownEnv.step(self, action)

        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/self.pi
        status3 = info["Simulator"]['lane_position']['dist']/self.lanewidth
        status4 = info["Simulator"]['lane_position']['angle_rad']/self.pi
        status5 = info["Simulator"]['robot_speed']
        status6 = action[0]
        status7 = action[1]

        status8 = self.pattern[0, 0]
        status9 = self.pattern[0, 1]
        status10 = self.pattern[6, 0]
        status11 = self.pattern[6, 1]

        status12 = self.pattern[14, 0]
        status13 = self.pattern[14, 1]
        status14 = self.pattern[20, 0]
        status15 = self.pattern[20, 1]



                 
        state = [status1,status2,status3,status4,status5,status6,status7,status8,status9,status10,status11,status12,status13,status14,status15]

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
        status9 = 0

        status10 = 0
        status11 = 0
        status12 = 0
        status13 = 0
        status14 = 0
        status15 = 0
        

        state = [status1,status2,status3,status4,status5,status6,status7,status8,status9,status10,status11,status12,status13,status14,status15]

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




class DuckietownROSOvertaking(DuckietownEnv):

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
        self.ratio = 0.3
        self._in_overtaking = 0
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
        action[1]= action[1]*np.pi*0.4

        obs, reward, done, info = DuckietownEnv.step(self, action)

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

        distance_to_other = 1.0
        # distance to other vehicle
        
        distance_to_other = distance.euclidean(info["Simulator"]['cur_pos'], info["Simulator"]['Other_vehicle'])
        
        
        if (distance_to_other - 0.18) <= 0.5:
            print(distance_to_other)

            d_v = (distance_to_other - 0.18)/(info["Simulator"]['robot_speed'])
        else:
            d_v = 0

        if d_v < 0:
            d_v = 0


        status1 = self.lanePose_d/self.lanewidth
        status2 = self.lanePose_phi/self.pi
        status3 = info["Simulator"]['robot_speed']/self.ratio
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
        action[1]= action[1]*np.pi*0.75

        obs, reward, done, info = DuckietownEnv.step(self, action)

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
        status3 = info["Simulator"]['robot_speed']/self.ratio
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


class DuckietownROSOvertaking_PID_Baseline(DuckietownEnv):

    """
    Environment for the Duckietown overtaking task with ROS
    """

    def __init__(self, **kwargs):
        DuckietownEnv.__init__(self, **kwargs)
        # Get the vehicle name, which comes in as HOSTNAME
        self.vehicle = 'david'

        # Subscribes to the lane pose from lane pose node
        self.lane_pose_sub = rospy.Subscriber("/david/lane_filter_node/lane_pose", LanePose, self.lane_pose_callback, queue_size=10)

        # Publishes onto the corrected image topic 
        # since image out of simulator is currently rectified
        self.cam_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/image/compressed", CompressedImage, queue_size=10)
        
        # Publisher for camera info - needed for the ground_projection
        self.cam_info_pub = rospy.Publisher("/" + self.vehicle + "/camera_node/camera_info", CameraInfo, queue_size=10)


        # Publisher for real lane pose
        self.real_pose_pub = rospy.Publisher("/" + self.vehicle + "/real_lane_pose", LanePose, queue_size=10)

        # Publisher for fake lane pose
        self.estimate_pose_pub = rospy.Publisher("/" + self.vehicle + "/estimate_lane_pose", LanePose, queue_size=10)



        #subscribe to line controller 
        self.lane_control_sub = rospy.Subscriber("~car_cmd", Twist2DStamped, self.lane_control_callback, queue_size=10)

        self.lanePose_d = 0       
        self.lanePose_phi = 0

        self.estimate_lanePose_d = 0       
        self.estimate_lanePose_phi = 0

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
        self.v = 0 
        self.phi = 0
        self.lane_pose_d = 0
        self.lane_pose_phi = 0
        self.follow_dist = 0.15
        self.max_iterations = 1801
        self.prev_e = 0
        self.P = 2
        self.D = 5
        # 10Hz ROS Cycle - TODO: What is this number?
        self.r = rospy.Rate(10)
        self.velocity = 0.2
        self.gain = 2
    def lane_control_callback(self, msg):
        self.v = msg.v 
        self.phi = msg.omega



    def lane_pose_callback(self, msg):
        if msg.d != None:
            self.lanePose_d = msg.d       #lateral offset
            self.lanePose_phi = msg.phi   #heading error
        else:
            pass

    
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

    def step(self, simulator: Simulator):
        """
        PID controller in duckietown community

        """
        """
        Take a step, implemented as a PID controller
        """

        # Find the curve point closest to the agent, and the tangent at that point
        closest_point, closest_tangent = simulator.closest_curve_point(simulator.cur_pos, simulator.cur_angle)
        iterations = 0
        lookup_distance = self.follow_dist

        curve_point = None
        while iterations < self.max_iterations:
            # Project a point ahead along the curve tangent,
            # then find the closest point to to that
            follow_point = closest_point + closest_tangent * lookup_distance
            curve_point, curve_tangent = simulator.closest_curve_point(follow_point, simulator.cur_angle)

            # If we have a valid point on the curve, stop
            if curve_point is not None:
                break

            iterations += 1
            lookup_distance *= 0.5

        # Compute a normalized vector to the curve point
        point_vec = curve_point - simulator.cur_pos
        point_vec /= np.linalg.norm(point_vec)

        e = np.dot(self.get_right_vec(simulator.cur_angle), point_vec)

        
        de = e - self.prev_e
        self.prev_e = e
        steering = self.P * -e + self.D * de

        action = [self.velocity, steering]

        obs, reward, done, info = DuckietownEnv.step(self, action)

        self.estimate_lanePose_d = self.lanePose_d
        self.estimate_lanePose_phi = self.lanePose_phi
        eatimate_lane_pose_msg = LanePose()

        time = rospy.get_rostime()
        eatimate_lane_pose_msg.header.stamp.secs = time.secs
        eatimate_lane_pose_msg.header.stamp.nsecs = time.nsecs
        eatimate_lane_pose_msg.d = self.estimate_lanePose_d
        eatimate_lane_pose_msg.phi = self.estimate_lanePose_phi
        self.estimate_pose_pub.publish(eatimate_lane_pose_msg)




        self.lane_pose_d = info["Simulator"]['lane_position']['dist']
        self.lane_pose_phi = info["Simulator"]['lane_position']['angle_rad']
        lane_pose_msg = LanePose()

        lane_pose_msg.header.stamp.secs = time.secs
        lane_pose_msg.header.stamp.nsecs = time.nsecs
        lane_pose_msg.d = self.lane_pose_d
        lane_pose_msg.phi = self.lane_pose_phi
        self.real_pose_pub.publish(lane_pose_msg)

        """
        action = [self.v, self.phi]

        obs, reward, done, info = DuckietownEnv.step(self, action)

        self.lane_pose_d = info["Simulator"]['lane_position']['dist']
        self.lane_pose_phi = info["Simulator"]['lane_position']['angle_rad']

        lane_pose_msg = LanePose()

        time = rospy.get_rostime()
        lane_pose_msg.header.stamp.secs = time.secs
        lane_pose_msg.header.stamp.nsecs = time.nsecs
        lane_pose_msg.d = self.lane_pose_d
        lane_pose_msg.phi = self.lane_pose_phi
        self.real_pose_pub.publish(lane_pose_msg)
        print(info)
        """
        return obs, done, info
    @staticmethod
    def get_right_vec(angle):
        x = math.sin(angle)
        z = math.cos(angle)
        return np.array([x, 0, z])


    def reset(self):

        obs = DuckietownEnv.reset(self)

        

        return obs