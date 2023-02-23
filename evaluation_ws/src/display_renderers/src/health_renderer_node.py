#!/usr/bin/env python3

import os
import rospy
import requests
from typing import Union
from duckietown_msgs.msg import DisplayFragment as DisplayFragmentMsg

from PIL import Image, ImageOps

from display_renderer.text import monospace_screen
from display_renderer import \
    REGION_HEADER, \
    REGION_BODY, \
    DisplayROI, \
    TextFragmentRenderer, \
    AbsDisplayFragmentRenderer, \
    Z_SYSTEM, \
    ALL_PAGES, \
    PAGE_HOME

from duckietown.dtros import DTROS, NodeType, TopicType
from duckietown.utils.image.pil import pil_to_np


class HealthDisplayRendererNode(DTROS):

    def __init__(self):
        super(HealthDisplayRendererNode, self).__init__(
            node_name='health_renderer_node',
            node_type=NodeType.VISUALIZATION
        )
        # get parameters
        self._veh = rospy.get_param('~veh')
        self._assets_dir = rospy.get_param('~assets_dir')
        self._frequency = rospy.get_param('~frequency')
        # create publisher
        self._pub = rospy.Publisher(
            "~fragments",
            DisplayFragmentMsg,
            queue_size=1,
            dt_topic_type=TopicType.VISUALIZATION,
            dt_help="Fragments to display on the display"
        )
        # create renderers
        self._battery_indicator = BatteryIndicatorFragmentRenderer(self._assets_dir)
        self._usage_renderer = UsageStatsFragmentRenderer()
        self._renderers = [
            self._battery_indicator,
            self._usage_renderer
        ]
        # create loop
        self._timer = rospy.Timer(rospy.Duration.from_sec(1.0 / self._frequency), self._beat)

    def _beat(self, _):
        self._fetch()
        self._publish()

    def _fetch(self):
        health_api_url = f"http://{self._veh}.local/health/"
        # noinspection PyBroadException
        try:
            health_data = requests.get(health_api_url).json()
        except BaseException:
            return
        self._usage_renderer.set(
            ctmp=health_data['temperature'],
            pcpu=health_data['cpu']['percentage'],
            pmem=health_data['memory']['percentage'],
            pdsk=health_data['disk']['percentage'],
        )
        self._battery_indicator.update(
            present=health_data['battery']['present'],
            # TODO: The device-health API now provides the field "charging:bool"
            charging=health_data['battery']['input_voltage'] > 3.0,
            percentage=health_data['battery']['percentage']
        )

    def _publish(self):
        for renderer in self._renderers:
            self._pub.publish(renderer.as_msg())


class BatteryIndicatorFragmentRenderer(AbsDisplayFragmentRenderer):

    def __init__(self, assets_dir: str):
        super(BatteryIndicatorFragmentRenderer, self).__init__(
            '__battery_indicator__',
            page=ALL_PAGES,
            region=REGION_HEADER,
            roi=DisplayROI(90, 0, 38, 16),
            z=Z_SYSTEM
        )
        self._assets_dir = assets_dir
        self._percentage = 0
        self._charging = False
        self._present = False
        # load assets
        _asset_path = lambda a: os.path.join(self._assets_dir, 'icons', f'{a}.png')
        self._assets = {
            asset: pil_to_np(ImageOps.grayscale(Image.open(_asset_path(asset))))
            for asset in [
                'battery_not_found',
                'battery_charging',
                'battery_0',
                'battery_1',
                'battery_2',
                'battery_3',
                'battery_4',
                'battery_5',
                'battery_6',
                'battery_7',
                'battery_8',
                'battery_9',
                'battery_10',
            ]
        }

    def update(self, present: bool = None, charging: bool = None, percentage: int = None):
        if present is not None:
            self._present = present
        if charging is not None:
            self._charging = charging
        if percentage is not None:
            self._percentage = percentage

    def _render(self):
        def _indicator(icon: str, text: str):
            indicator_icon = self._assets[icon]
            ico_h, ico_w = indicator_icon.shape
            ico_space = 2
            # draw icon
            self._buffer[0:ico_h, 0:ico_w] = indicator_icon
            # draw text
            vshift_px = 2
            text_h, text_w = 14, self._roi.w - ico_w - ico_space
            text_buf = monospace_screen((text_h, text_w), text, scale='fill')
            self._buffer[vshift_px:vshift_px + text_h, ico_w + ico_space:] = text_buf

        # battery not found
        if not self._present:
            _indicator('battery_not_found', 'NoBT')
            return
        # battery charging
        if self._charging:
            _icon = 'battery_charging'
        else:
            dec = '%d' % (self._percentage / 10)
            _icon = f'battery_{dec}'
        # battery discharging
        _indicator(_icon, '%d%%' % self._percentage)


class UsageStatsFragmentRenderer(TextFragmentRenderer):
    BAR_LEN = 14
    CANVAS = """\
TEMP |{ctmp_bar}| {ctmp}
CPU  |{pcpu_bar}| {pcpu}
RAM  |{pmem_bar}| {pmem}
DISK |{pdsk_bar}| {pdsk}
"""

    def __init__(self):
        super(UsageStatsFragmentRenderer, self).__init__(
            '__usage_stats__',
            page=PAGE_HOME,
            region=REGION_BODY,
            roi=DisplayROI(0, 0, REGION_BODY.width, REGION_BODY.height),
            scale='fill'
        )
        self._min_ctmp = 20
        self._max_ctmp = 60

    def set(self, ctmp: Union[str, int, float], pcpu: Union[str, int], pmem: Union[str, int],
            pdsk: Union[str, int]):
        ptmp = int(100 * (max(0, ctmp - self._min_ctmp) / (self._max_ctmp - self._min_ctmp))) \
            if isinstance(ctmp, (int, float)) else 0
        text = self.CANVAS.format(**{
            'ctmp': self._fmt(ctmp, 'C'),
            'pcpu': self._fmt(pcpu, '%'),
            'pmem': self._fmt(pmem, '%'),
            'pdsk': self._fmt(pdsk, '%'),
            'ctmp_bar': self._bar(ptmp),
            'pcpu_bar': self._bar(pcpu),
            'pmem_bar': self._bar(pmem),
            'pdsk_bar': self._bar(pdsk)
        })
        self.update(text)

    @staticmethod
    def _fmt(value: Union[str, int], suffix: str):
        if isinstance(value, str):
            return f"ERR"
        return f"{int(value)}{suffix}"

    @classmethod
    def _bar(cls, value: Union[str, int], scale: int = 100):
        if isinstance(value, str):
            return f"ERR"
        value /= scale
        full = int(cls.BAR_LEN * value)
        return "|" * full + " " * (cls.BAR_LEN - full)


if __name__ == '__main__':
    node = HealthDisplayRendererNode()
    rospy.spin()
