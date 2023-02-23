#!/usr/bin/env python

import sys
import rospy
import numpy as np

from std_msgs.msg import Header
from sensor_msgs.msg import Range
from gazebo_msgs.msg import ContactsState, ModelStates
from tf import TransformListener
from duckietown_msgs.msg import  Twist2DStamped, LanePose

from scipy.stats import norm
from gazebo_msgs.srv import SpawnModel, DeleteModel
from std_srvs.srv import Empty
from geometry_msgs.msg import Twist
from shapely.geometry import Point
from shapely.geometry.polygon import asPolygon
from scipy.spatial import distance
import math
import shapely.geometry as geom

range = 0.1

df=open('tof_{range}.txt','w')

class SaveToF(object):
	"""docstring for SaveToF"""
	def __init__(self):
		self._range = Range()
		self.d = 0
		self.lst=[]
		self.scan_data = np.array([])
		self.sub_distance = rospy.Subscriber("/david/front_center_tof_driver_node/range", Range, self.tof_callback, queue_size = 1)
		

	def tof_callback(self, msg):

	    d = msg.range
	    self.scan_data= np.array(d)
		self.save_scan = np.append(self.save_scan, self.scan_data)
		np.save("~/record/scan", self.save_scan)

	def write_to_file(self):
		self.lst.append(self.d)
		print(self.lst)

if __name__ == "__main__":
	rospy.init_node("Read_tof_Value")
	save_tof_value = SaveToF()
	rospy.spin()







