import numpy as np
from .contracts_ import contract


class ImageConversions(object):
    # We only instantiate the bridge once
    bridge = None


def get_cv_bridge():
    if ImageConversions.bridge is None:
        from cv_bridge import CvBridge
        ImageConversions.bridge = CvBridge()
    return ImageConversions.bridge


@contract(returns='array[HxWx3]')
def rgb_from_imgmsg(msg):
    bridge = get_cv_bridge()
    return bridge.imgmsg_to_cv2(msg, "rgb8")


def bgr_from_imgmsg(msg):
    bridge = get_cv_bridge()
    return bridge.imgmsg_to_cv2(msg, "bgr8")


def d8n_image_msg_from_cv_image(cv_image, image_format, same_timestamp_as=None):
    """
        Makes an Image message from a CV image.

        if same_timestamp_as is not None, we copy the timestamp
        from that image.

        image_format: 'bgr8' or 'mono' or similar
    """
    bridge = get_cv_bridge()
    image_msg_out = bridge.cv2_to_imgmsg(cv_image, image_format)
    if same_timestamp_as is not None:
        image_msg_out.header.stamp = same_timestamp_as.header.stamp
    return image_msg_out

#
# def CompressedImage_from_bgr(image_np):
#     return d8_compressed_image_from_cv_image(image_np)
#     msg = CompressedImage()
#     msg.header.stamp = rospy.Time.now()
#     msg.format = "jpeg"
#     msg.data = np.array(cv2.imencode('.jpg', image_np)[1]).tostring()
#     return msg


def pil_from_CompressedImage(msg):
    from PIL import ImageFile  # @UnresolvedImport
    parser = ImageFile.Parser()
    parser.feed(msg.data)
    res = parser.close()
    return res


@contract(returns='array[HxWx3]')
def rgb_from_pil(im):
    im = np.asarray(im).astype(np.uint8)
    if len(im.shape) == 2:
        H, W = im.shape[:2]
        res = np.zeros(dtype='uint8', shape=(H, W, 3))
        res[:, :, 0] = im
        res[:, :, 1] = im
        res[:, :, 2] = im
        return res
    else:
        return im


@contract(returns='array[HxWx3]')
def rgb_from_ros(msg):
    if 'CompressedImage' in msg.__class__.__name__:
        return rgb_from_pil(pil_from_CompressedImage(msg))
    else:
        return rgb_from_imgmsg(msg)


numpy_from_ros_compressed = rgb_from_ros
