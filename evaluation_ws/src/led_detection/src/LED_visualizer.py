#!/usr/bin/env python3
import sys
import time
from math import ceil, floor

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.backends.backend_qt4agg import (
    FigureCanvasQTAgg as FigureCanvas,
    NavigationToolbar2QT as NavigationToolbar,
)
from PyQt4.QtCore import *
from PyQt4.QtGui import *

import rospy
from duckietown_msgs.msg import LEDDetectionArray, LEDDetectionDebugInfo
from duckietown_rosdata_utils import numpy_from_ros_compressed
from sensor_msgs.msg import CompressedImage
from std_msgs.msg import Byte

## Aux
gray_color_table = [qRgb(i, i, i) for i in range(256)]


def toQImage(im, copy=False):
    if im is None:
        return QImage()

    if im.dtype == np.uint8:
        if len(im.shape) == 2:
            qim = QImage(im.data, im.shape[1], im.shape[0], im.strides[0], QImage.Format_Indexed8)
            qim.setColorTable(gray_color_table)
            return qim.copy() if copy else qim

        elif len(im.shape) == 3:
            if im.shape[2] == 3:
                qim = QImage(im.data, im.shape[1], im.shape[0], im.strides[0], QImage.Format_RGB888)
                return qim.copy() if copy else qim
            elif im.shape[2] == 4:
                qim = QImage(im.data, im.shape[1], im.shape[0], im.strides[0], QImage.Format_ARGB32)
                return qim.copy() if copy else qim

    raise NotImplementedError()


# For multithread-safe
QCoreApplication.setAttribute(Qt.AA_X11InitThreads)


class plotWin(QDialog):
    def __init__(self, parent=None):
        super(plotWin, self).__init__(parent)
        self.figure = plt.figure()
        self.canvas = FigureCanvas(self.figure)  # set the layout
        self.toolbar = NavigationToolbar(self.canvas, self)

        layout = QVBoxLayout()
        layout.addWidget(self.toolbar)
        layout.addWidget(self.canvas)
        self.setLayout(layout)


class LEDWindow(QWidget):
    progress = pyqtSignal(bool, float)

    def __init__(self, parent=None):
        super(LEDWindow, self).__init__(parent)
        self.createLayout()
        self.camera_image = None
        self.variance_map = None
        self.unfiltered_leds = None
        self.filtered_leds = None
        self.cell_size = None
        self.crop_rect_norm = None
        self.progress.connect(self.updateBar)
        self.figDialogs = []
        self.plotCamImage = True
        self.imagescale = 0.0
        self.camtl = [0, 50]  # top left

    def set_trigger_pub(self, trig):
        self.pub_trigger = trig

    def updateState(self, msg, alive):
        if len(msg.variance_map.data):
            self.variance_map = toQImage(numpy_from_ros_compressed(msg.variance_map))

        if not alive:
            self.stateLabel.setText("Waiting for node heartbeat...")
            self.triggerBtn.setEnabled(False)
            return
        else:
            self.triggerBtn.setEnabled(True)

        self.progress.emit(msg.state == 1, msg.capture_progress)
        if len(msg.led_all_unfiltered.detections):
            self.unfiltered_leds = msg.led_all_unfiltered
            self.cell_size = msg.cell_size
            self.crop_rect_norm = msg.crop_rect_norm

        if msg.state == 1:
            self.triggerBtn.setVisible(False)
            self.stateLabel.setText("Capture: ")
            # self.unfiltered_leds = None
        elif msg.state == 2:
            self.triggerBtn.setVisible(False)
            self.stateLabel.setText("Processing...")
        elif msg.state == 0:
            self.triggerBtn.setVisible(True)
            if not len(msg.led_all_unfiltered.detections):
                self.unfiltered_leds = None
            if self.unfiltered_leds is not None:
                self.stateLabel.setText(
                    "Click on the squares for details or on image to toggle camera/variance map..."
                )
            else:
                self.stateLabel.setText("No detections, press Detect to start.")

    def updateBar(self, active, progr):
        self.progressBar.setVisible(active)
        self.progressBar.setValue(progr)

    def updateResults(self, msg):
        self.filtered_leds = msg

    def createLayout(self):
        self.setWindowTitle("LED Detector Visualizer")

        self.stateLabel = QLabel("Initializing...")
        self.progressBar = QProgressBar()
        self.progressBar.setVisible(False)
        self.triggerBtn = QPushButton("Detect")
        self.triggerBtn.setEnabled(False)
        self.triggerBtn.clicked.connect(self.sendTrigger)

        self.canvas = QWidget()
        addressEdit = QTextEdit()

        # Put the widgets in a layout (now they start to appear):
        layout = QGridLayout()
        layout.addWidget(self.stateLabel, 0, 0)
        layout.addWidget(self.progressBar, 0, 1)
        layout.addWidget(self.triggerBtn, 0, 1)
        layout.addWidget(self.canvas, 1, 0)

        layout.setRowStretch(2, 1)
        self.setLayout(layout)

        self.resize(640, 540)

    def sendTrigger(self):
        b = Byte(1)
        self.pub_trigger.publish(b)

    def paintEvent(self, event):
        qp = QPainter()
        qp.begin(self)
        pen = QPen()
        font = QFont()
        font.setPixelSize(16)
        qp.setFont(font)

        win_size = [
            self.frameGeometry().width() - self.camtl[0] - 20,
            self.frameGeometry().height() - self.camtl[1] - 50,
        ]

        image = self.camera_image if self.plotCamImage else self.variance_map
        W = 0
        H = 0
        if self.camera_image is not None:
            W = self.camera_image.width()
            H = self.camera_image.height()

            tl_offset = [0, 0]
            if not self.plotCamImage:
                rest_x = W % self.cell_size[0]
                rest_y = H % self.cell_size[1]
                tl_offset = [
                    ceil(0.5 * rest_x) + floor(self.crop_rect_norm[0] * W),
                    ceil(0.5 * rest_y) + floor(self.crop_rect_norm[1] * H),
                ]

            self.imagescale = min(1.0 * win_size[0] / W, 1.0 * win_size[1] / H)
            self.frametl = [
                self.camtl[0] + 0.5 * (win_size[0] - self.imagescale * W),
                self.camtl[1] + 0.5 * (win_size[1] - self.imagescale * H),
            ]

            qp.translate(self.frametl[0], self.frametl[1])

        if image is not None:
            # print('scale:%s'%imagescale)
            qp.scale(self.imagescale, self.imagescale)
            qp.translate(tl_offset[0], tl_offset[1])
            kh = kv = 1
            tlx = tly = brx = bry = None
            if self.crop_rect_norm is not None:
                tlx = floor(1.0 * W * self.crop_rect_norm[0])
                tly = floor(1.0 * H * self.crop_rect_norm[1])
                brx = ceil(1.0 * W * self.crop_rect_norm[2])
                bry = ceil(1.0 * H * self.crop_rect_norm[3])
                if not self.plotCamImage:
                    kh = (brx - tlx) / image.width()
                    kv = (bry - tly) / image.height()

            qp.scale(kh, kv)
            qp.drawImage(0, 0, image)
            qp.scale(1.0 / kh, 1.0 / kv)
            qp.translate(-tl_offset[0], -tl_offset[1])
            if self.crop_rect_norm is not None:
                pen.setWidth(3)
                pen.setStyle(Qt.DashLine)
                pen.setBrush(QColor(0, 0, 255))
                qp.setPen(pen)
                used_portion_rect = QRect(tlx, tly, brx - tlx, bry - tly)
                qp.drawRect(used_portion_rect)

        if self.unfiltered_leds is not None:
            tmp = 0
            pen.setWidth(3)
            pen.setStyle(Qt.SolidLine)
            pen.setBrush(QColor(255, 0, 0))
            qp.setPen(pen)
            for led in self.unfiltered_leds.detections:
                tmp += 1
                led_rect = QRect(
                    led.pixels_normalized.x * W - 0.5 * self.cell_size[0],
                    led.pixels_normalized.y * H - 0.5 * self.cell_size[1],
                    self.cell_size[0],
                    self.cell_size[1],
                )
                qp.drawText(
                    led.pixels_normalized.x * W - 0.5 * self.cell_size[0],
                    led.pixels_normalized.y * H - 0.5 * self.cell_size[1] - 10,
                    QString.number(led.frequency, "g", 2),
                )
                qp.drawRect(led_rect)

        pen.setStyle(Qt.SolidLine)
        pen.setBrush(QColor(0, 255, 0))
        qp.setPen(pen)

        if self.filtered_leds is not None and W is not 0:
            for led in self.filtered_leds.detections:
                led_rect = QRect(
                    led.pixels_normalized.x * W - 0.5 * self.cell_size[0],
                    led.pixels_normalized.y * H - 0.5 * self.cell_size[1],
                    self.cell_size[0],
                    self.cell_size[1],
                )
                qp.drawText(
                    led.pixels_normalized.x * W + 0.5 * self.cell_size[0] + 10,
                    led.pixels_normalized.y * H - 0.5 * self.cell_size[1],
                    QString.number(led.frequency, "g", 2),
                )

                qp.drawRect(led_rect)
        qp.end()

    def mousePressEvent(self, event):
        click_img_coord = event.pos() - QPoint(self.frametl[0], self.frametl[1])
        click_img_coord = 1.0 * click_img_coord / self.imagescale
        print(f"Clicked point: {click_img_coord}")
        mindist = float("inf")
        closest = None
        W = self.camera_image.width()
        H = self.camera_image.height()
        if self.unfiltered_leds:
            for d in self.unfiltered_leds.detections:
                dist = (d.pixels_normalized.x * W - click_img_coord.x()) ** 2 + (
                    d.pixels_normalized.y * H - click_img_coord.y()
                ) ** 2
                if (
                    dist < mindist
                    and dist < self.imagescale ** 2 * self.cell_size[0] ** 2 + self.cell_size[1] ** 2
                ):
                    closest = d
                    mindist = dist
        if closest is not None:
            self.figDialogs.append(plotWin())
            self.plot(closest, self.figDialogs[-1].figure)
            self.figDialogs[-1].canvas.draw()
            self.figDialogs[-1].show()
        else:
            # Switch from camera image to variance map
            self.plotCamImage = not self.plotCamImage
            if not self.plotCamImage and self.variance_map is None:
                self.plotCamImage = True

    def plot(self, closest, figure):
        W = self.camera_image.width()
        H = self.camera_image.height()
        ax = figure.add_subplot(211)
        # print("Timestamps: {0}".format(closest.signal_ts))
        ax.plot(closest.signal_ts, closest.signal)
        ax.set_title(
            "Signal @ ("
            + str(closest.pixels_normalized.x * W)
            + ", "
            + str(closest.pixels_normalized.y * H)
            + ")",
            fontsize=12,
        )  # , fontweight='bold')
        ax2 = figure.add_subplot(212)
        ax2.plot(closest.fft_fs, closest.fft)
        ax2.set_title(
            "FFT @ ("
            + str(closest.pixels_normalized.x * W)
            + ", "
            + str(closest.pixels_normalized.y * H)
            + ")",
            fontsize=12,
        )  # , fontweight='bold')


app = QApplication(sys.argv)
win = LEDWindow(None)


class LEDVisualizerNode:
    def __init__(self):
        self.first_timestamp = None
        self.data = []
        self.capture_time = 2.3  # capture time
        self.capture_finished = False
        self.tinit = None

        self.node_last_seen = -1

        self.veh_name = rospy.get_namespace().strip("/")
        if not self.veh_name:
            # fall back on private param passed thru rosrun
            # syntax is: rosrun <pkg> <node> _veh:=<bot-id>
            if rospy.has_param("~veh"):
                self.veh_name = rospy.get_param("~veh")

        if not self.veh_name:
            raise ValueError("Vehicle name is not set.")

        self.sub_info = rospy.Subscriber(
            "/" + self.veh_name + "/led_detector_node/debug_info", LEDDetectionDebugInfo, self.info_callback
        )
        self.sub_info = rospy.Subscriber(
            "/" + self.veh_name + "/camera_node/image/compressed", CompressedImage, self.cam_callback
        )
        self.sub_info = rospy.Subscriber(
            "/" + self.veh_name + "/led_detector_node/raw_led_detection",
            LEDDetectionArray,
            self.result_callback,
        )
        self.pub_trigger = rospy.Publisher(
            "/" + self.veh_name + "/led_detector_node/trigger", Byte, queue_size=1
        )
        self.hbtimer = rospy.Timer(rospy.Duration.from_sec(0.2), self.heartbeat_timer)

        win.set_trigger_pub(self.pub_trigger)

    def info_callback(self, msg):
        self.node_last_seen = time.time()
        win.updateState(msg, True)

    def result_callback(self, msg):
        win.updateResults(msg)

    def cam_callback(self, msg):
        # print('Received camera image)
        npimg = numpy_from_ros_compressed(msg)
        win.camera_image = toQImage(npimg)
        win.update()

    def heartbeat_timer(self, event):
        if time.time() - self.node_last_seen > 1.5:
            win.updateState(LEDDetectionDebugInfo(), False)


rospy.init_node("LED_visualizer_node", anonymous=False)
node = LEDVisualizerNode()
# rospy.spin() # not quite needed for callbacks in python?
win.show()
sys.exit(app.exec_())
