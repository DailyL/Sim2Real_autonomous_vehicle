#!/usr/bin/env python
from cv_bridge import CvBridge, CvBridgeError
from duckietown_msgs.msg import BoolStamped, Segment, SegmentList, Vector2D, AntiInstagramTransform
from geometry_msgs.msg import Point
from line_detector.LineDetector2 import *
from line_detector.LineDetectorPlot import *
from anti_instagram.AntiInstagram import *
from sensor_msgs.msg import CompressedImage, Image
from visualization_msgs.msg import Marker
import cv2
import numpy as np
import rospy
import threading
from duckietown_utils.jpg import image_cv_from_jpg
from line_detector.timekeeper import TimeKeeper

class LineDetectorNode2(object):
    def __init__(self):
        self.node_name = "Line Detector2"

        # Thread lock 
        self.thread_lock = threading.Lock()
       
        # Constructor of line detector 
        self.bridge = CvBridge()
        self.detector = LineDetector2()
       
        # Parameters
        self.active = True

        self.intermittent_interval = 100
        self.intermittent_counter = 0

        self.updateParams(None)

        # color correction
        self.ai = AntiInstagram()

        # Publishers
        self.pub_lines = rospy.Publisher("~segment_list", SegmentList, queue_size=1)
        self.pub_image = rospy.Publisher("~image_with_lines", Image, queue_size=1)
       

        # Verbose option 
        if self.verbose:
            self.pub_edge = rospy.Publisher("~edge", Image, queue_size=1)
            self.pub_colorSegment = rospy.Publisher("~segment", Image, queue_size=1)

        # Subscribers
        self.sub_image = rospy.Subscriber("~image", CompressedImage, self.cbImage, queue_size=1)
        self.sub_transform = rospy.Subscriber("~transform", AntiInstagramTransform, self.cbTransform, queue_size=1)
        self.sub_switch = rospy.Subscriber("~switch", BoolStamped, self.cbSwitch, queue_size=1)
        rospy.loginfo("[%s] Initialized." %(self.node_name))

        self.timer = rospy.Timer(rospy.Duration.from_sec(1.0), self.updateParams)
        
    def updateParams(self, event):
        self.verbose = rospy.get_param('~verbose',True)

        self.image_size = rospy.get_param('~img_size')
        self.top_cutoff = rospy.get_param('~top_cutoff')
  
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
        self.detector.sobel_threshold = rospy.get_param('~sobel_threshold')

    def cbSwitch(self, switch_msg):
        self.active = switch_msg.data

    def cbImage(self, image_msg):
        if not self.active:
            return 
        # Start a daemon thread to process the image
        thread = threading.Thread(target=self.processImage,args=(image_msg,))
        thread.setDaemon(True)
        thread.start()
        # Returns rightaway

    def cbTransform(self, transform_msg):
        self.ai.shift = transform_msg.s[0:3]
        self.ai.scale = transform_msg.s[3:6]

    def intermittent_log(self, s):
        if self.intermittent_counter % self.intermittent_interval != 1:
            return
        n = self.node_name
        rospy.loginfo('[%s]%3d:%s' % (n, self.intermittent_counter, s))

    def processImage(self, image_msg):
        if not self.thread_lock.acquire(False):
            # Return immediately if the thread is locked
            return

        tk = TimeKeeper(image_msg)
           
        self.intermittent_counter += 1
        
        # Decode from compressed image with OpenCV
        image_cv = image_cv_from_jpg(image_msg.data)

        tk.completed('decoded')
        
        # Resize and crop image
        hei_original, wid_original = image_cv.shape[0:2]

        if self.image_size[0] != hei_original or self.image_size[1] != wid_original:
            # image_cv = cv2.GaussianBlur(image_cv, (5,5), 2)
            image_cv = cv2.resize(image_cv, (self.image_size[1], self.image_size[0]),
                                   interpolation=cv2.INTER_NEAREST)
        image_cv = image_cv[self.top_cutoff:,:,:]

        tk.completed('resized')

        # apply color correction: AntiInstagram
        image_cv_corr = self.ai.applyTransform(image_cv)
        image_cv_corr = cv2.convertScaleAbs(image_cv_corr)

        tk.completed('corrected')
        
        # Set the image to be detected
        self.detector.setImage(image_cv_corr)

        # Detect lines and normals
        lines_white, normals_white, centers_white, area_white = self.detector.detectLines2('white')
        lines_yellow, normals_yellow, centers_yellow, area_yellow = self.detector.detectLines2('yellow')
        lines_red, normals_red, centers_red, area_red = self.detector.detectLines2('red')

        tk.completed('detected')
        
        
        # SegmentList constructor
        segmentList = SegmentList()
        segmentList.header.stamp = image_msg.header.stamp
        
        # Convert to normalized pixel coordinates, and add segments to segmentList
        arr_cutoff = np.array((0, self.top_cutoff, 0, self.top_cutoff))
        arr_ratio = np.array((1./self.image_size[1], 1./self.image_size[0], 1./self.image_size[1], 1./self.image_size[0]))
        if len(lines_white)>0:
            lines_normalized_white = ((lines_white + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_white, normals_white, Segment.WHITE))
        if len(lines_yellow)>0:
            lines_normalized_yellow = ((lines_yellow + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_yellow, normals_yellow, Segment.YELLOW))
        if len(lines_red)>0:
            lines_normalized_red = ((lines_red + arr_cutoff) * arr_ratio)
            segmentList.segments.extend(self.toSegmentMsg(lines_normalized_red, normals_red, Segment.RED))
        
        self.intermittent_log('# segments: white %3d yellow %3d red %3d' % (len(lines_white),
                len(lines_yellow), len(lines_red)))
        
        tk.completed('prepared')

        # Publish segmentList
        self.pub_lines.publish(segmentList)
        tk.completed('pub_lines')

        # VISUALIZATION only below

        # Publish the frame with lines

        # Draw lines and normals
        image_with_lines = np.copy(image_cv_corr)
        drawLines(image_with_lines, lines_white, (0,0,0))
        drawLines(image_with_lines, lines_yellow, (255,0,0))
        drawLines(image_with_lines, lines_red, (0,255,0))
        #drawNormals2(image_with_lines, centers_white, normals_white, (0,0,0))
        #drawNormals2(image_with_lines, centers_yellow, normals_yellow, (255,0,0))
        #drawNormals2(image_with_lines, centers_red, normals_red, (0,255,0))

        tk.completed('drawn')


        image_msg_out = self.bridge.cv2_to_imgmsg(image_with_lines, "bgr8")
        image_msg_out.header.stamp = image_msg.header.stamp
        self.pub_image.publish(image_msg_out)

        tk.completed('pub_image')

        # Verbose
        if self.verbose:

            color_segment = self.detector.color_segment(area_white, area_red, area_yellow) 
            
            edge_msg_out = self.bridge.cv2_to_imgmsg(self.detector.edges, "mono8")
            colorSegment_msg_out = self.bridge.cv2_to_imgmsg(color_segment, "bgr8")
            self.pub_edge.publish(edge_msg_out)
            self.pub_colorSegment.publish(colorSegment_msg_out)

        tk.completed('pub_edge')

        self.intermittent_log(tk.getall())

        # Release the thread lock
        self.thread_lock.release()

    def onShutdown(self):
        rospy.loginfo("[LineDetectorNode2] Shutdown.")
            
    def toSegmentMsg(self,  lines, normals, color):
        
        segmentMsgList = []
        #segmentMsgList = [Segment() for i in range(lines.shape[0])]
        #k = 0
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
            #segmentMsgList[k] = segment
            #k += 1
        return segmentMsgList

if __name__ == '__main__': 
    rospy.init_node('line_detector2',anonymous=False)
    line_detector_node = LineDetectorNode()
    rospy.on_shutdown(line_detector_node.onShutdown)
    rospy.spin()
