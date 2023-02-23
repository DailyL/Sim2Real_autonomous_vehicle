# import numpy as np
#
# def fancy_visualization(image_cv):
#
#     # BGR
# #     BLACK = (0,0,0)
#     BGR_RED = (0,0,255)
# #     BGR_GREEN = (0,255,0)
#     BGR_WHITE = (255,255,255)
#     BGR_YELLOW = (0, 255,255)
#
#     img_white = np.copy(image_cv)
#     img_white.fill(0)
#     drawLines(img_white, white.lines, BGR_WHITE, p1_color=None, p2_color=None)
#
#     img_yellow = np.copy(image_cv)
#     img_yellow.fill(0)
#     drawLines(img_yellow, yellow.lines, BGR_YELLOW, p1_color=None, p2_color=None)
#
#     img_red = np.copy(image_cv)
#     img_red.fill(0)
#     drawLines(img_red, red.lines, BGR_RED, p1_color=None, p2_color=None)
#
#
#     asgrid = make_images_grid([image_cv, img_white, img_yellow, img_red],
#                            cols=2, pad=10, bgcolor=[1, 1, 1])
#
# #             image_with_lines = np.copy(image_cv)
# #             drawLines(image_with_lines, white.lines, (0, 0, 0))
# #             drawLines(image_with_lines, yellow.lines, (255, 0, 0))
# #             drawLines(image_with_lines, red.lines, (0, 255, 0))
#
#     # Create output image message
#     R = 4
#     image_with_lines_upsample = cv2.resize(asgrid, (W*R, H*R), interpolation=cv2.INTER_NEAREST)
#
