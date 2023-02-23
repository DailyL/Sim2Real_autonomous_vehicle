from duckietown_utils.parameters import Configurable
from line_detector.line_detector_interface import (Detections,
    LineDetectorInterface)
import cv2
import numpy as np


class LineDetectorHSV(Configurable, LineDetectorInterface):
    """ LineDetectorHSV """

    def __init__(self, configuration):
        # Images to be processed
        self.bgr = np.empty(0)
        self.hsv = np.empty(0)
        self.edges = np.empty(0)

        param_names = [
            'hsv_white1',
            'hsv_white2',
            'hsv_yellow1',
            'hsv_yellow2',
            'hsv_red1',
            'hsv_red2',
            'hsv_red3',
            'hsv_red4',
            'dilation_kernel_size',
            'canny_thresholds',
            'hough_threshold',
            'hough_min_line_length',
            'hough_max_line_gap',
        ]

        Configurable.__init__(self, param_names, configuration)

        # Color value range in HSV space: default
#         self.hsv_white1 = np.array([0, 0, 150])
#         self.hsv_white2 = np.array([180, 50, 255])
#         self.hsv_yellow1 = np.array([25, 120, 90])
#         self.hsv_yellow2 = np.array([45, 255, 255])
#         self.hsv_red1 = np.array([0, 140, 100])
#         self.hsv_red2 = np.array([15, 255, 255])
#         self.hsv_red3 = np.array([165, 140, 100])
#         self.hsv_red4 = np.array([180, 255, 255])
#         self.rgb_red = np.array([240, 20, 20])
#         self.rgb_yellow = np.array([240, 240,60])
#         self.rgb_white = np.array([240, 240, 240])
#         self.rgb_road = np.array([60,60,60])
#
#         # Parameters for dilation, Canny, and Hough transform: default
#         self.dilation_kernel_size = 3
#         self.canny_thresholds = [80,200]
#         self.hough_threshold  = 20
#         self.hough_min_line_length = 3
#         self.hough_max_line_gap = 1
#         self.max_color_dist=150
#         self.coeff_yellow=1.25
#         self.coeff_white=0.75

# RGB-based color filter - try after some annotations are available 
#     def __colorFilter2(self, color):
#         bgr_red = np.flipud(self.rgb_red)
#         bgr_yellow = np.flipud(self.rgb_yellow)
#         bgr_white = np.flipud(self.rgb_white)
#         bgr_road = np.flipud(self.rgb_road)
#
#         # threshold colors in HSV space
#         im = np.abs(self.bgr - bgr_white)
#         d_white=(im[:,:,0]+im[:,:,1]+im[:,:,2])/self.coeff_white;
#         im = np.abs(self.bgr - bgr_yellow)
#         d_yellow=(im[:,:,0]+im[:,:,1]+im[:,:,2])/self.coeff_yellow;
#         im = np.abs(self.bgr - bgr_red)
#         d_red=im[:,:,0]+im[:,:,1]+im[:,:,2];
#         im = np.abs(self.bgr - bgr_road)
#         d_road=im[:,:,0]+im[:,:,1]+im[:,:,2];
#         if color == 'white':
#             bw=(d_white<d_red)&(d_white<d_yellow)&(d_white<self.max_color_dist)
#         elif color == 'yellow':
#             # WINDOW_NAME = 'white'
#             # cv2.namedWindow(WINDOW_NAME, cv2.CV_WINDOW_AUTOSIZE)
#             # cv2.startWindowThread()
#
#             # cv2.imshow(WINDOW_NAME,d_yellow/1024.0)
#             # cv2.waitKey(0)
#
#             # cv2.destroyAllWindows()
#             bw=(d_yellow<d_red)&(d_yellow<d_white)&(d_yellow<self.max_color_dist)
#         elif color == 'red':
#             bw=(d_red<d_yellow)&(d_red<d_white)&(d_red<self.max_color_dist)
#         else:
#             raise Exception('Error: Undefined color strings...')
#         # IPython.embed()
#         bw=np.uint8(bw*255)
#
#         # binary dilation
#         kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(self.dilation_kernel_size, self.dilation_kernel_size))
#         bw = cv2.dilate(bw, kernel)
#
#         # refine edge for certain color
#         edge_color = cv2.bitwise_and(bw, self.edges)
#
#         return bw, edge_color

    def _colorFilter(self, color):
        # threshold colors in HSV space
        if color == 'white':
            bw = cv2.inRange(self.hsv, self.hsv_white1, self.hsv_white2)
        elif color == 'yellow':
            bw = cv2.inRange(self.hsv, self.hsv_yellow1, self.hsv_yellow2)
        elif color == 'red':
            bw1 = cv2.inRange(self.hsv, self.hsv_red1, self.hsv_red2)
            bw2 = cv2.inRange(self.hsv, self.hsv_red3, self.hsv_red4)
            bw = cv2.bitwise_or(bw1, bw2)
        else:
            raise Exception('Error: Undefined color strings...')

        # binary dilation
        kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(self.dilation_kernel_size, self.dilation_kernel_size))
        bw = cv2.dilate(bw, kernel)
        
        # refine edge for certain color
        edge_color = cv2.bitwise_and(bw, self.edges)

        return bw, edge_color

    def _findEdge(self, gray):
        edges = cv2.Canny(gray, self.canny_thresholds[0], self.canny_thresholds[1], apertureSize = 3)
        return edges

    def _HoughLine(self, edge):
        lines = cv2.HoughLinesP(edge, 1, np.pi/180, self.hough_threshold, np.empty(1), self.hough_min_line_length, self.hough_max_line_gap)
        if lines is not None:
            lines = np.array(lines[0])
        else:
            lines = []
        return lines
    
    def _checkBounds(self, val, bound):
        val[val<0]=0
        val[val>=bound]=bound-1
        return val

    def _correctPixelOrdering(self, lines, normals):
        flag = ((lines[:,2]-lines[:,0])*normals[:,1] - (lines[:,3]-lines[:,1])*normals[:,0])>0
        for i in range(len(lines)):
            if flag[i]:
                x1,y1,x2,y2 = lines[i, :]
                lines[i, :] = [x2,y2,x1,y1] 
 
    def _findNormal(self, bw, lines):
        normals = []
        centers = []
        if len(lines)>0:
            length = np.sum((lines[:, 0:2] -lines[:, 2:4])**2, axis=1, keepdims=True)**0.5
            dx = 1.* (lines[:,3:4]-lines[:,1:2])/length
            dy = 1.* (lines[:,0:1]-lines[:,2:3])/length

            centers = np.hstack([(lines[:,0:1]+lines[:,2:3])/2, (lines[:,1:2]+lines[:,3:4])/2])
            x3 = (centers[:,0:1] - 3.*dx).astype('int')
            y3 = (centers[:,1:2] - 3.*dy).astype('int')
            x4 = (centers[:,0:1] + 3.*dx).astype('int')
            y4 = (centers[:,1:2] + 3.*dy).astype('int')
            x3 = self._checkBounds(x3, bw.shape[1])
            y3 = self._checkBounds(y3, bw.shape[0])
            x4 = self._checkBounds(x4, bw.shape[1])
            y4 = self._checkBounds(y4, bw.shape[0])
            flag_signs = (np.logical_and(bw[y3,x3]>0, bw[y4,x4]==0)).astype('int')*2-1
            normals = np.hstack([dx, dy]) * flag_signs
 
            """ # Old code with lists and loop, performs 4x slower 
            for cnt,line in enumerate(lines):
                x1,y1,x2,y2 = line
                dx = 1.*(y2-y1)/((x1-x2)**2+(y1-y2)**2)**0.5
                dy = 1.*(x1-x2)/((x1-x2)**2+(y1-y2)**2)**0.5
                x3 = int((x1+x2)/2. - 3.*dx)
                y3 = int((y1+y2)/2. - 3.*dy)
                x4 = int((x1+x2)/2. + 3.*dx)
                y4 = int((y1+y2)/2. + 3.*dy)
                x3 = self._checkBounds(x3, bw.shape[1])
                y3 = self._checkBounds(y3, bw.shape[0])
                x4 = self._checkBounds(x4, bw.shape[1])
                y4 = self._checkBounds(y4, bw.shape[0])
                if bw[y3,x3]>0 and bw[y4,x4]==0:
                    normals[cnt,:] = [dx, dy] 
                else:
                    normals[cnt,:] = [-dx, -dy]
            """
            self._correctPixelOrdering(lines, normals)
        return centers, normals

    def detectLines(self, color):
        bw, edge_color = self._colorFilter(color)
        lines = self._HoughLine(edge_color)
        centers, normals = self._findNormal(bw, lines)
        return Detections(lines=lines, normals=normals, area=bw, centers=centers)

    def setImage(self, bgr):
        self.bgr = np.copy(bgr)
        self.hsv = cv2.cvtColor(bgr, cv2.COLOR_BGR2HSV)
        self.edges = self._findEdge(self.bgr)
  
    def getImage(self):
        return self.bgr

#
#     def drawLines(self, lines, paint):
#         if len(lines)>0:
#             for x1,y1,x2,y2 in lines:
#                 cv2.line(self.bgr, (x1,y1), (x2,y2), paint, 2)
#                 cv2.circle(self.bgr, (x1,y1), 2, (0,255,0))
#                 cv2.circle(self.bgr, (x2,y2), 2, (0,0,255))
#
#     def drawNormals(self, lines, normals):
#         if len(lines)>0:
#             for x1,y1,x2,y2,dx,dy in np.hstack((lines,normals)):
#                 x3 = int((x1+x2)/2. - 4.*dx)
#                 y3 = int((y1+y2)/2. - 4.*dy)
#                 x4 = int((x1+x2)/2. + 4.*dx)
#                 y4 = int((y1+y2)/2. + 4.*dy)
#                 cv2.circle(self.bgr, (x3,y3), 3, (0,255,0))
#                 cv2.circle(self.bgr, (x4,y4), 3, (0,0,255))
#
#
# def _main():
#     detector = LineDetector()
#     # read image from file or camera
#     if len(sys.argv)==2:
#         bgr = cv2.imread(sys.argv[1])
#
#         # crop and resize frame
#         bgr = cv2.resize(bgr, (200, 150))
#         bgr = bgr[bgr.shape[0]/2:, :, :]
#
#         # set the image to be detected
#         detector.setImage(bgr)
#
#         # detect lines and normals
#         lines_white, normals_white, area_white = detector.detectLines('white')
#         lines_yellow, normals_yellow, area_yellow = detector.detectLines('yellow')
#         lines_red, normals_red, area_red = detector.detectLines('red')
#
#         # draw lines
#         detector.drawLines(lines_white, (0,0,0))
#         detector.drawLines(lines_yellow, (255,0,0))
#         detector.drawLines(lines_red, (0,255,0))
#
#         # draw normals
#         detector.drawNormals(lines_yellow, normals_yellow)
#         detector.drawNormals(lines_white, normals_white)
#         detector.drawNormals(lines_red, normals_red)
#
#         cv2.imwrite('lines_with_normal.png', detector.getImage())
#         cv2.imshow('frame', detector.getImage())
#         cv2.imshow('edge', detector.edges)
#         cv2.waitKey(0)
#
#     elif len(sys.argv)==1:
#         cap = cv2.VideoCapture(0)
#         if not cap.isOpened():
#             print 'Error opening camera...'
#             return -1
#
#         while True:
#             ret, bgr = cap.read()
#             if not ret:
#                 print 'No frames grabbed...'
#                 break
#
#             # crop and resize frame
#             bgr = cv2.resize(bgr, (200, 150))
#
#             # set the image to be detected
#             detector.setImage(bgr)
#
#             # detect lines and normals
#             lines_white, normals_white, centers_white, area_white = detector.detectLines('white')
#             lines_yellow, normals_yellow, centers_yellow, area_yellow = detector.detectLines('yellow')
#             lines_red, normals_red, centers_red, area_red = detector.detectLines('red')
#
#             # draw lines
#             detector.drawLines(lines_white, (0,0,0))
#             detector.drawLines(lines_yellow, (255,0,0))
#             detector.drawLines(lines_red, (0,255,0))
#
#             # draw normals
#             detector.drawNormals(lines_yellow, normals_yellow)
#             detector.drawNormals(lines_white, normals_white)
#             detector.drawNormals(lines_red, normals_red)
#
#             # show frame
#             cv2.imshow('Line Detector', detector.getImage())
#             cv2.imshow('Edge', detector.edges)
#             cv2.waitKey(30)
#
#     else:
#         return -1
# if __name__ == '__main__':
#     _main()
