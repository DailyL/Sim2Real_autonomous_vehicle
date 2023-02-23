import numpy as np
import cv2
import sys

class LaneFilter(object):
	pass

"""
def _main():
	if len(sys.argv)!=2:
		print 'Error reading filename...'
		return -1

	cap = cv2.VideoCapture(sys.argv[1])
	if not cap.isOpened():
		print 'Error opening file...'
		return -1	
	
	while True:
		ret, bgr = cap.read()
		print ret
		if bgr.empty():
			break

		gray = cv2.cvtColor(bgr, cv2.COLOR_BGR2GRAY)
		cv2.imshow('bgr',gray)
		cv2.waitKey(30)
		
		lineDetector(bgr)
		cv2.imshow('Lane Detector', bgr)
		cv2.waitKey(30)

if __name__ == '__main__':
	_main()	
"""
