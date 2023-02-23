#!/usr/bin/env python
#
#

import shapely.geometry as geom
import numpy as np
import matplotlib.pyplot as plt


"""
coords = np.loadtxt('filename.txt')

line = geom.LineString(coords)
point = geom.Point(0.0, 0.5)

# Note that "line.distance(point)" would be identical
print(point.distance(line))
"""
# class NearestPoint(object):
#     def __init__(self, line, ax):
#         self.line = line
#         self.ax = ax
#         ax.figure.canvas.mpl_connect('button_press_event', self)

#     def __call__(self, event):
#         x, y = event.xdata, event.ydata
#         point = geom.Point(x, y)
#         distance = self.line.distance(point)
#         self.draw_segment(point)
#         print ('Distance to line:', distance)

#     def draw_segment(self, point):
#         point_on_line = line.interpolate(line.project(point))
#         self.ax.plot([point.x, point_on_line.x], [point.y, point_on_line.y], 
#                      color='red', marker='o', scalex=False, scaley=False)
#         fig.canvas.draw()

# if __name__ == '__main__':
#     coords = np.loadtxt('filename.txt')

#     line = geom.LineString(coords)

#     fig, ax = plt.subplots()
#     ax.plot(*coords.T)
#     ax.axis('equal')
#     NearestPoint(line, ax)
#     plt.show()



from scipy.spatial import distance




def closest_node(node, nodes):
    closest_index = distance.cdist([node], nodes).argmin()
    closest_distance = distance.euclidean([node], nodes[closest_index])
    return closest_distance, closest_index

coords = np.loadtxt('aver_trajectory_with_yaw.txt')

some_pt = (1.5, 2)

close_dis,index  = closest_node(some_pt, coords[:,:2])

print(close_dis,index,coords[index,2])

