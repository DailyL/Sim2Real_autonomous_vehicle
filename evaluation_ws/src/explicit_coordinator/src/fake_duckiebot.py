#!/usr/bin/env python3


import tkinter as tk

import rospy
from std_msgs.msg import String
from duckietown_msgs.msg import FSMState, SignalsDetection, CoordinationClearance, CoordinationSignal


class FakeDuckiebot:
    def __init__(self):
        self.node = rospy.init_node("fake_duckiebot", anonymous=True)

        # publishing
        self.mode = None
        self.mode_pub = rospy.Publisher("~mode", FSMState, queue_size=10)

        self.signals_detection_pub = rospy.Publisher("~signals_detection", SignalsDetection, queue_size=10)
        self.traffic_light = SignalsDetection.NO_TRAFFIC_LIGHT
        self.right_veh = SignalsDetection.NO_CAR
        self.opposite_veh = SignalsDetection.NO_CAR

        # subscribing
        self.clearance_to_go = CoordinationClearance.NA
        self.clearance_to_go_sub = rospy.Subscriber(
            "~clearance_to_go", CoordinationClearance, self.clearance_to_go_callback
        )

        self.emitted_signal = CoordinationSignal.OFF
        self.clearance_to_go_sub = rospy.Subscriber(
            "~change_color_pattern", String, self.emitted_signal_callback
        )

        self.gui = None

    def clearance_to_go_callback(self, msg):
        self.clearance_to_go = msg.status
        if self.gui:
            self.update_gui(self.gui)

    def emitted_signal_callback(self, msg):
        self.emitted_signal = msg.data
        if self.gui:
            self.update_gui(self.gui)

    def set_gui(self, gui):
        self.gui = gui
        self.update_gui(gui)

    def spin(self):
        # self.publish()
        pass

    def publish(self):
        if self.mode is not None:
            self.mode_pub.publish(FSMState(state=self.mode))
        self.signals_detection_pub.publish(
            SignalsDetection(
                front=self.opposite_veh, right=self.right_veh, traffic_light_state=self.traffic_light
            )
        )

    def publish_mode(self):
        if self.mode is not None:
            self.mode_pub.publish(FSMState(state=self.mode))

    def publish_signals(self):
        self.signals_detection_pub.publish(
            SignalsDetection(
                front=self.opposite_veh, right=self.right_veh, traffic_light_state=self.traffic_light
            )
        )

    def set_mode(self, mode):
        self.mode = mode
        if self.gui:
            self.update_gui(self.gui)
        self.publish_mode()

    def set_intersection(self, status):
        self.intersection = status
        if self.gui:
            self.update_gui(self.gui)

    def set_traffic_light(self, status):
        self.traffic_light = status
        if self.gui:
            self.update_gui(self.gui)

    def set_right_vehicle(self, status):
        self.right_veh = status
        if self.gui:
            self.update_gui(self.gui)

    def set_opposite_vehicle(self, status):
        self.opposite_veh = status
        if self.gui:
            self.update_gui(self.gui)

    def set_intersection_vehicle(self, status):
        self.intersection_veh = status
        if self.gui:
            self.update_gui(self.gui)

    def update_gui(self, gui):

        if self.mode is not None:
            gui.mode_var.set(self.mode)

        gui.traffic_light_var.set(self.traffic_light)

        gui.right_veh_var.set("Right: " + self.right_veh)
        gui.opposite_veh_var.set("Opp.: " + self.opposite_veh)

        values = ["Clearance: NA", "Clearance: WAIT", "Clearance: GO"]
        gui.clearance_to_go_var.set(values[self.clearance_to_go + 1])

        gui.roof_light_var.set("Emitted: " + self.emitted_signal)


class GUI:
    def __init__(self, duckiebot):
        self.root = tk.Tk()
        self.duckiebot = duckiebot

        self.mode_var = tk.StringVar()
        self.mode_label = tk.Label(self.root, textvariable=self.mode_var)
        self.mode_label.pack(side=tk.TOP)

        tk.Button(
            self.root, text="Lane Navigation", command=lambda: self.duckiebot.set_mode("LANE_FOLLOWING")
        ).pack(side=tk.TOP)

        tk.Button(
            self.root, text="Coordination", command=lambda: self.duckiebot.set_mode("COORDINATION")
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="Intersection Nav.",
            command=lambda: self.duckiebot.set_mode("INTERSECTION_CONTROL"),
        ).pack(side=tk.TOP)

        self.traffic_light_var = tk.StringVar()
        tk.Label(self.root, textvariable=self.traffic_light_var).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="TL: None",
            command=lambda: self.duckiebot.set_traffic_light(SignalsDetection.NO_TRAFFIC_LIGHT),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="TL: STOP",
            command=lambda: self.duckiebot.set_traffic_light(SignalsDetection.STOP),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="TL: YIELD",
            command=lambda: self.duckiebot.set_traffic_light(SignalsDetection.YIELD),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root, text="TL: GO", command=lambda: self.duckiebot.set_traffic_light(SignalsDetection.GO)
        ).pack(side=tk.TOP)

        self.right_veh_var = tk.StringVar()
        tk.Label(self.root, textvariable=self.right_veh_var).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="RVeh: NA",
            command=lambda: self.duckiebot.set_right_vehicle(SignalsDetection.NO_CAR),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="RVeh: A",
            command=lambda: self.duckiebot.set_right_vehicle(SignalsDetection.SIGNAL_A),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="RVeh: B",
            command=lambda: self.duckiebot.set_right_vehicle(SignalsDetection.SIGNAL_B),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="RVeh: C",
            command=lambda: self.duckiebot.set_right_vehicle(SignalsDetection.SIGNAL_C),
        ).pack(side=tk.TOP)

        self.opposite_veh_var = tk.StringVar()
        tk.Label(self.root, textvariable=self.opposite_veh_var).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="OVeh: NA",
            command=lambda: self.duckiebot.set_opposite_vehicle(SignalsDetection.NO_CAR),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="OVeh: A",
            command=lambda: self.duckiebot.set_opposite_vehicle(SignalsDetection.SIGNAL_A),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="OVeh: B",
            command=lambda: self.duckiebot.set_opposite_vehicle(SignalsDetection.SIGNAL_B),
        ).pack(side=tk.TOP)

        tk.Button(
            self.root,
            text="OVeh: C",
            command=lambda: self.duckiebot.set_opposite_vehicle(SignalsDetection.SIGNAL_C),
        ).pack(side=tk.TOP)

        tk.Button(self.root, text="Publish Signals", command=lambda: self.duckiebot.publish_signals()).pack(
            side=tk.TOP
        )

        self.clearance_to_go_var = tk.StringVar()
        tk.Label(self.root, textvariable=self.clearance_to_go_var).pack(side=tk.TOP)

        self.roof_light_var = tk.StringVar()
        tk.Label(self.root, textvariable=self.roof_light_var).pack(side=tk.TOP)

        # start infinite topic publishing loop
        self.loop_interval_ms = 500

        def loop():
            self.duckiebot.spin()
            self.root.after(self.loop_interval_ms, loop)

        self.root.after(self.loop_interval_ms, loop)

    def start(self):
        tk.mainloop()


if __name__ == "__main__":
    duckiebot = FakeDuckiebot()
    gui = GUI(duckiebot)
    duckiebot.set_gui(gui)
    gui.start()
