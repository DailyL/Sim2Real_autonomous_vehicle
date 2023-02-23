import rospy
import dataclasses
import numpy as np

from typing import Callable

from sensor_msgs.msg import \
    Image as ImageMsg, \
    CompressedImage as CompressedImageMsg

from .jpeg import rgb_to_jpeg, jpeg_to_rgb
from .pil import pil_to_np, np_to_pil


@dataclasses.dataclass
class ImageEncoding:
    pil_encoding: str
    num_channels: int
    channel_size_bits: int = 8
    order: Callable = lambda i: i
    unpack: Callable = lambda i: i
    pack: Callable = lambda i: i


_supported_encodings = {
    "rgb8": ImageEncoding("RGB",
                          num_channels=3),
    "rgba8": ImageEncoding("RGBA",
                           num_channels=4),
    "bgr8": ImageEncoding("RGB",
                          num_channels=3,
                          order=lambda i: np.transpose(i, (2, 1, 0))),
    "bgra8": ImageEncoding("RGBA",
                           num_channels=4,
                           order=lambda i: np.transpose(i, (2, 1, 0, 3))),
    "mono1": ImageEncoding("L",
                           num_channels=1,
                           channel_size_bits=1,
                           unpack=lambda i: np.unpackbits(i).astype(np.uint8),
                           pack=lambda b: np.packbits(b)),
    "mono8": ImageEncoding("L",
                           num_channels=1)
}


def _np_to_imgmsg(im: np.ndarray, encoding: str) -> ImageMsg:
    assert encoding in _supported_encodings
    encoder = _supported_encodings[encoding]
    h, w, c, *_ = im.shape + (1,)
    msg = ImageMsg()
    msg.header.stamp = rospy.Time.now()
    msg.height = h
    msg.width = w
    msg.encoding = encoding
    msg.is_bigendian = 0
    msg.step = w * c * encoder.channel_size_bits
    msg.data = encoder.pack(im).tobytes()
    # ---
    return msg


def rgb_to_compressed_imgmsg(im: np.ndarray, encoding: str) -> CompressedImageMsg:
    msg = CompressedImageMsg()
    msg.header.stamp = rospy.Time.now()
    msg.format = encoding
    msg.data = rgb_to_jpeg(im)
    # ---
    return msg


def rgb_to_imgmsg(im: np.ndarray) -> ImageMsg:
    # validate image shape and number of channels
    assert len(im.shape) == 3 and im.shape[2] == 3
    # ---
    return _np_to_imgmsg(im, "rgb8")


def rgba_to_imgmsg(im: np.ndarray) -> ImageMsg:
    # validate image shape and number of channels
    assert len(im.shape) == 3 and im.shape[2] == 4
    # ---
    return _np_to_imgmsg(im, "rgba8")


def mono8_to_imgmsg(im: np.ndarray) -> ImageMsg:
    # validate image shape
    assert len(im.shape) == 2
    # ---
    return _np_to_imgmsg(im, "mono8")


def mono1_to_imgmsg(im: np.ndarray) -> ImageMsg:
    # validate image shape
    assert len(im.shape) == 2
    # convert mono8 to mono1
    im = (im > 125).astype(np.uint8)
    # ---
    return _np_to_imgmsg(im, "mono1")


def _imgmsg_to_np(msg: ImageMsg) -> np.ndarray:
    # get image encoder
    if msg.encoding not in _supported_encodings:
        raise ValueError(f"Image encoding '{msg.encoding}' not supported.")
    encoder = _supported_encodings[msg.encoding]
    # get image shape
    if msg.encoding == "mono1":
        w, h, c = (msg.width, msg.height, 1)
    else:
        w, h, c = (msg.width, msg.height, int(msg.step / (msg.width * encoder.channel_size_bits)))
    # validate number of channel
    assert c == encoder.num_channels
    # turn bytes into array
    im = np.frombuffer(msg.data, dtype=np.uint8)
    # unpack data
    im = encoder.unpack(im)
    # shape array
    im = im.reshape((h, w, c)) if c > 1 else im.reshape((h, w))
    # reorder channels
    im = encoder.order(im)
    # color space conversion
    im = np_to_pil(im, mode=encoder.pil_encoding)
    # go back to numpy
    im = pil_to_np(im)
    # ---
    return im


def imgmsg_to_rgb(msg: ImageMsg) -> np.ndarray:
    # validate encoding
    assert msg.encoding == "rgb8"
    # ---
    return _imgmsg_to_np(msg)


def imgmsg_to_rgba(msg: ImageMsg) -> np.ndarray:
    # validate encoding
    assert msg.encoding == "rgba8"
    # ---
    return _imgmsg_to_np(msg)


def imgmsg_to_mono8(msg: ImageMsg) -> np.ndarray:
    # validate encoding
    assert msg.encoding in ["mono1", "mono8"]
    # get np array
    im = _imgmsg_to_np(msg)
    # turn mono1 into mono8
    if msg.encoding == "mono1":
        im *= 255
    # ---
    return im


def imgmsg_to_mono1(msg: ImageMsg) -> np.ndarray:
    # validate encoding
    assert msg.encoding == "mono1"
    # convert mono8 to mono1
    im = _imgmsg_to_np(msg)
    im = pil_to_np(np_to_pil(im).convert("1"))
    # ---
    return im


def _compressed_imgmsg_to_np(msg: CompressedImageMsg) -> np.ndarray:
    assert msg.format == "jpeg"
    return jpeg_to_rgb(msg.data)


def compressed_imgmsg_to_rgb(msg: CompressedImageMsg) -> np.ndarray:
    im = _compressed_imgmsg_to_np(msg)
    _, _, c, *_ = im.shape + (1,)
    assert c == 3
    return im


def compressed_imgmsg_to_mono8(msg: CompressedImageMsg) -> np.ndarray:
    im = _compressed_imgmsg_to_np(msg)
    h, w, c, *_ = im.shape + (1,)
    assert c == 1
    return im.reshape((h, w))
