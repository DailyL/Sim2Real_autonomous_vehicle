

from gym_duckietown.envs import DuckietownEnv
from simulation.pid_env import env
import cv2
import os
import csv


image_dir = './autoencoder/dataset/train/5maps_new/'
filename = './autoencoder/dataset/train/label_train_new.csv'
pos, angle = env.reset()

csvfile = open(filename, 'a', newline = '')#
csvwriter = csv.writer(csvfile)
#csvwriter.writerow(['Image_name', 'Angle', 'Dist', 'Speed', 'Error'])#



for i in range(5000):

    a = env.action_duck(pos, angle)
    obs = env.step_duck(a)
    pos , angle = env.update_physics(a)
    lane_pose = env.get_lane_pos2(env.cur_pos, env.cur_angle)
    angle_deg = lane_pose.angle_deg
    dist = lane_pose.dist
    speed = env.speed
    error = 0 - angle_deg
    

    #env.render()

    print(f'angle_deg: {angle_deg} dist: {dist} speed:{speed} error:{error} ')
    #csvwriter.writerow([i, angle_deg, dist, speed, error])#



    image = obs
    img_path = os.path.join(image_dir, f'{i+15000}.png')#
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    cv2.imwrite(img_path, image)

csvfile.close()



