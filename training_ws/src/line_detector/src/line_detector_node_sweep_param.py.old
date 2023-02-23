#!/usr/bin/env python
import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import CompressedImage, Image
from duckietown_msgs.msg import Segment, SegmentList, Vector2D
from line_detector.LineDetector import *
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
import numpy as np

class LineDetectorNode(object):
    def __init__(self):
        self.node_name = "Line Detector"
 
        self.image_size = rospy.get_param('~img_size')
        self.top_cutoff = rospy.get_param('~top_cutoff')
        
        self.bridge = CvBridge()
        self.detector = LineDetector()

        self.detector.hsv_white1 = np.array(rospy.get_param('~hsv_white1'))
        self.detector.hsv_white2 = np.array(rospy.get_param('~hsv_white2'))
        self.detector.hsv_yellow1 = np.array(rospy.get_param('~hsv_yellow1'))
        self.detector.hsv_yellow2 = np.array(rospy.get_param('~hsv_yellow2'))
        self.detector.hsv_red1 = np.array(rospy.get_param('~hsv_red1'))
        self.detector.hsv_red2 = np.array(rospy.get_param('~hsv_red2'))
        self.detector.hsv_red3 = np.array(rospy.get_param('~hsv_red3'))
        self.detector.hsv_red4 = np.array(rospy.get_param('~hsv_red4'))

        self.detector.dilation_kernel_size = rospy.get_param('~dilation_kernel_size')
        self.detector.canny_thresholds = rospy.get_param('~canny_thresholds')
        self.detector.hough_min_line_length = rospy.get_param('~hough_min_line_length')
        self.detector.hough_max_line_gap    = rospy.get_param('~hough_max_line_gap')
        self.detector.hough_threshold = rospy.get_param('~hough_threshold')
       
        self.sub_image = rospy.Subscriber("~image", CompressedImage, self.processImage)
        self.pub_lines = rospy.Publisher("~segment_list", SegmentList, queue_size=1)
        self.pub_image = rospy.Publisher("~image_with_lines", Image, queue_size=1)
        
        self.timer_param = rospy.Timer(rospy.Duration.from_sec(3.0),self.cbParamUpdate)

    def cbParamUpdate(self,event):
        print '====Parameters Updated====' 
        
 
        """ 
        # S of white
        self.detector.hsv_white2 = (self.detector.hsv_white2)%256 + np.array([0, 5, 0])
        print 'HSV_white1: ' + str(self.detector.hsv_white1)
        print 'HSV_white2: ' + str(self.detector.hsv_white2)
        
        # V of white
        self.detector.hsv_white1 = (self.detector.hsv_white1)%256 - np.array([0, 0, 10])
        print 'HSV_white1: ' + str(self.detector.hsv_white1)
        print 'HSV_white2: ' + str(self.detector.hsv_white2)
 
        # H of yellow
        self.detector.hsv_yellow1 = (self.detector.hsv_yellow1)%256 + np.array([1, 0, 0])
        print 'HSV_yellow1: ' + str(self.detector.hsv_yellow1)
        print 'HSV_yellow2: ' + str(self.detector.hsv_yellow2)

        self.detector.hsv_yellow2 = (self.detector.hsv_yellow2)%256 - np.array([1, 0, 0])
        print 'HSV_yellow1: ' + str(self.detector.hsv_yellow1)
        print 'HSV_yellow2: ' + str(self.detector.hsv_yellow2)
 
        # S of yellow
        self.detector.hsv_yellow1 = (self.detector.hsv_yellow1)%256 + np.array([0, 5, 0])
        print 'HSV_yellow1: ' + str(self.detector.hsv_yellow1)
        print 'HSV_yellow2: ' + str(self.detector.hsv_yellow2)
 
        # V of yellow
        self.detector.hsv_yellow1 = (self.detector.hsv_yellow1)%256 + np.array([0, 0, 5])
        print 'HSV_yellow1: ' + str(self.detector.hsv_yellow1)
        print 'HSV_yellow2: ' + str(self.detector.hsv_yellow2)
        
        # Lower threshold of Canny edge
        self.detector.canny_thresholds = np.array(self.detector.canny_thresholds)%256 + np.array([5, 0])
        print 'Canny_thresholds: ' + str(self.detector.canny_thresholds)

        # Higher threshold of Canny edge
        self.detector.canny_thresholds = np.array(self.detector.canny_thresholds)%256 + np.array([0, 5])
        print 'Canny_thresholds: ' + str(self.detector.canny_thresholds)

        # Minimum line length
        self.detector.hough_min_line_length = self.detector.hough_min_line_length%10 + 1  
        print 'Minimum_line_length: ' + str(self.detector.hough_min_line_length)
        
        # Maximum line gap
        self.detector.hough_max_line_gap = self.detector.detector.hough_max_line_gap%10 + 1  
        print 'Maximum_line_gap: ' + str(self.detector.detector.hough_max_line_gap)
        
        # Threshold of Hough transform
        self.detector.hough_threshold = (self.detector.hough_threshold)%50 + 5
        print 'Hough_threshold: ' + str(self.detector.hough_threshold)
        """

    def processImage(self,image_msg):
        image_cv = cv2.imdecode(np.fromstring(image_msg.data, np.uint8), cv2.CV_LOAD_IMAGE_COLOR)
        #image_cv = self.bridge.imgmsg_to_cv2(image_msg, "bgr8")
        
        # Resize and crop image
        hei_original = image_cv.shape[0]
        wid_original = image_cv.shape[1]
        if self.image_size[0]!=hei_original or self.image_size[1]!=wid_original:
            image_cv = cv2.resize(image_cv, (self.image_size[1], self.image_size[0]))
        image_cv = image_cv[self.top_cutoff:,:,:]

        # Set the image to be detected
        self.detector.setImage(image_cv)
	
        # Detect lines and normals
        lines_white, normals_white = self.detector.detectLines('white')
        lines_yellow, normals_yellow = self.detector.detectLines('yellow')
        lines_red, normals_red = self.detector.detectLines('red')

        # Draw lines and normals
        self.detector.drawLines(lines_white, (0,0,0))
        self.detector.drawLines(lines_yellow, (255,0,0))
        self.detector.drawLines(lines_red, (0,255,0))
        #self.detector.drawNormals(lines_white, normals_white)
        #self.detector.drawNormals(lines_yellow, normals_yellow)
        #self.detector.drawNormals(lines_red, normals_red)

        # Convert to normalized pixel coordinates, and add segments to segmentList
        segmentList = SegmentList()
        arr_cutoff = np.array((0, self.top_cutoff, 0, self.top_cutoff))
        arr_ratio = np.array((1./self.image_size[1], 1./self.image_size[0], 1./self.image_size[1], 1./self.image_size[0]))
  
        if len(lines_white)>0:
            #rospy.loginfo("[LineDetectorNode] number of white lines = %s" %(len(lines_white)))
            lines_normalized_white = ((lines_white + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_white, normals_white, Segment.WHITE))
        if len(lines_yellow)>0:
            #rospy.loginfo("[LineDetectorNode] number of yellow lines = %s" %(len(lines_yellow)))
            lines_normalized_yellow = ((lines_yellow + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_yellow, normals_yellow, Segment.YELLOW))
        if len(lines_red)>0:
            #rospy.loginfo("[LineDetectorNode] number of red lines = %s" %(len(lines_red)))
            lines_normalized_red = ((lines_red + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_red, normals_red, Segment.RED))
        
        # Publish segmentList
        self.pub_lines.publish(segmentList)
         
        # Publish the frame with lines
        image_msg = self.bridge.cv2_to_imgmsg(self.detector.getImage(), "bgr8")
        self.pub_image.publish(image_msg)

    def onShutdown(self):
            rospy.loginfo("[LineDetectorNode] Shutdown.")
            
    def toSegmentMsg(self,  lines, normals, color):
        
        segmentMsgList = []
        for x1,y1,x2,y2,norm_x,norm_y in np.hstack((lines,normals)):
            segment = Segment()
            segment.color = color
            segment.pixels_normalized[0].x = x1
            segment.pixels_normalized[0].y = y1
            segment.pixels_normalized[1].x = x2
            segment.pixels_normalized[1].y = y2
            segment.normal.x = norm_x
            segment.normal.y = norm_y
             
            segmentMsgList.append(segment)
        return segmentMsgList

if __name__ == '__main__': 
    rospy.init_node('line_detector',anonymous=False)
    line_detector_node = LineDetectorNode()
    rospy.on_shutdown(line_detector_node.onShutdown)
    rospy.spin()

