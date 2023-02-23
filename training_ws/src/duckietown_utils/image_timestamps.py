import cv2

import numpy as np

from .image_composition import make_images_grid
from .color_constants import ColorConstants
from .deprecation import deprecated


__all__ = [
    'add_duckietown_header',
    'add_header_to_image',
    'add_header_to_rgb',
    'add_header_to_bgr',
]

def add_duckietown_header(img, log_name, time, frame):
    s = 'Duckietown %4d  %6.2f   %s' % (frame, time, log_name)
    return add_header_to_image(img, s)

default_header_proportion = 0.05 
default_max_height = None
default_min_height = 20

def add_header_to_rgb(img, s, proportion=default_header_proportion, 
                      max_height=default_max_height, min_height=default_min_height, 
                      bgcolor=ColorConstants.RGB_DUCKIETOWN_YELLOW, 
                      color=ColorConstants.RGB_BLACK): 
    
    return _add_header(img, s, proportion=proportion, 
                               max_height=max_height, 
                               min_height=min_height, 
                               bgcolor=bgcolor, color=color)

def add_header_to_bgr(img, s, proportion=default_header_proportion, 
                      max_height=default_max_height, min_height=default_min_height, 
                      bgcolor=ColorConstants.BGR_DUCKIETOWN_YELLOW, 
                      color=ColorConstants.BGR_BLACK): 
    
    return _add_header(img, s, proportion=proportion, 
                               max_height=max_height, 
                               min_height=min_height, 
                               bgcolor=bgcolor, color=color)
    

@deprecated('use add_header_to_bgr()')
def add_header_to_image(*args, **kwargs):
    return add_header_to_bgr(*args, **kwargs)

def _add_header(img, s, proportion=default_header_proportion, 
                max_height=default_max_height, min_height=default_min_height, 
                        bgcolor=(0,0,0), color=(255,255,255), width=1):
    
    font_height = proportion * img.shape[1]
    if max_height is not None:
        font_height = min(max_height, font_height)
    if min_height is not None:
        font_height = max(min_height, font_height)
        
    ratio = 1.3*font_height/35
    H, W = int(35*ratio), img.shape[1]
    
    black = np.zeros((H, W, 3), 'uint8')
    for a in (0,1,2): black[:,:,a].fill(bgcolor[a])
    
    font = cv2.FONT_HERSHEY_SIMPLEX
    
    dim = (0.75*ratio)
    
    cv2.putText(black, s, (10, int(25*ratio)), font, 
                dim, color, width, cv2.LINE_AA)  # @UndefinedVariable
    res = make_images_grid([black, img], cols=1)
    return res
