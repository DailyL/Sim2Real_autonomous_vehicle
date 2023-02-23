import numpy as np


class LaneController:
    """
    The Lane Controller can be used to compute control commands from pose estimations.

    The control commands are in terms of linear and angular velocity (v, omega). The input are errors in the relative
    pose of the Duckiebot in the current lane.

    This implementation is a simple PI(D) controller.

    Args:
        ~v_bar (:obj:`float`): Nominal velocity in m/s
        ~k_d (:obj:`float`): Proportional term for lateral deviation
        ~k_theta (:obj:`float`): Proportional term for heading deviation
        ~k_Id (:obj:`float`): integral term for lateral deviation
        ~k_Iphi (:obj:`float`): integral term for lateral deviation
        ~d_thres (:obj:`float`): Maximum value for lateral error
        ~theta_thres (:obj:`float`): Maximum value for heading error
        ~d_offset (:obj:`float`): Goal offset from center of the lane
        ~integral_bounds (:obj:`dict`): Bounds for integral term
        ~d_resolution (:obj:`float`): Resolution of lateral position estimate
        ~phi_resolution (:obj:`float`): Resolution of heading estimate
        ~omega_ff (:obj:`float`): Feedforward part of controller
        ~verbose (:obj:`bool`): Verbosity level (0,1,2)
        ~stop_line_slowdown (:obj:`dict`): Start and end distances for slowdown at stop lines

    """

    def __init__(self, parameters):
        self.parameters = parameters
        self.d_I = 0.0
        self.phi_I = 0.0
        self.prev_d_err = 0.0
        self.prev_phi_err = 0.0

    def update_parameters(self, parameters):
        """Updates parameters of LaneController object.

        Args:
            parameters (:obj:`dict`): dictionary containing the new parameters for LaneController object.
        """
        self.parameters = parameters

    def compute_control_action(self, d_err, phi_err, dt, wheels_cmd_exec, stop_line_distance):
        """Main function, computes the control action given the current error signals.

        Given an estimate of the error, computes a control action (tuple of linear and angular velocity). This is done
        via a basic PI(D) controller with anti-reset windup logic.

        Args:
            d_err (:obj:`float`): error in meters in the lateral direction
            phi_err (:obj:`float`): error in radians in the heading direction
            dt (:obj:`float`): time since last command update
            wheels_cmd_exec (:obj:`bool`): confirmation that the wheel commands have been executed (to avoid
                                           integration while the robot does not move)
            stop_line_distance (:obj:`float`):  distance of the stop line, None if not detected.
        Returns:
            v (:obj:`float`): requested linear velocity in meters/second
            omega (:obj:`float`): requested angular velocity in radians/second
        """

        if dt is not None:
            self.integrate_errors(d_err, phi_err, dt)

        self.d_I = self.adjust_integral(
            d_err, self.d_I, self.parameters["~integral_bounds"]["d"], self.parameters["~d_resolution"]
        )
        self.phi_I = self.adjust_integral(
            phi_err,
            self.phi_I,
            self.parameters["~integral_bounds"]["phi"],
            self.parameters["~phi_resolution"],
        )

        self.reset_if_needed(d_err, phi_err, wheels_cmd_exec)

        # Scale the parameters linear such that their real value is at 0.22m/s
        omega = (
            self.parameters["~k_d"].value * d_err
            + self.parameters["~k_theta"].value * phi_err
            + self.parameters["~k_Id"].value * self.d_I
            + self.parameters["~k_Iphi"].value * self.phi_I
        )

        self.prev_d_err = d_err
        self.prev_phi_err = phi_err

        v = self.compute_velocity(stop_line_distance)

        return v, omega

    def compute_velocity(self, stop_line_distance):
        """Linearly decrease velocity if approaching a stop line.

        If a stop line is detected, the velocity is linearly decreased to achieve a better stopping position,
        otherwise the nominal velocity is returned.

        Args:
            stop_line_distance (:obj:`float`): distance of the stop line, None if not detected.
        """
        if stop_line_distance is None:
            return self.parameters["~v_bar"].value
        else:

            d1, d2 = (
                self.parameters["~stop_line_slowdown"]["start"],
                self.parameters["~stop_line_slowdown"]["end"],
            )
            # d1 -> v_bar, d2 -> v_bar/2
            c = (0.5 * (d1 - stop_line_distance) + (stop_line_distance - d2)) / (d1 - d2)
            v_new = self.parameters["~v_bar"].value * c
            v = np.max(
                [self.parameters["~v_bar"].value / 2.0, np.min([self.parameters["~v_bar"].value, v_new])]
            )
            return v

    def integrate_errors(self, d_err, phi_err, dt):
        """Integrates error signals in lateral and heading direction.
        Args:
            d_err (:obj:`float`): error in meters in the lateral direction
            phi_err (:obj:`float`): error in radians in the heading direction
            dt (:obj:`float`): time delay in seconds
        """
        self.d_I += d_err * dt
        self.phi_I += phi_err * dt

    def reset_if_needed(self, d_err, phi_err, wheels_cmd_exec):
        """Resets the integral error if needed.

        Resets the integral errors in `d` and `phi` if either the error sign changes, or if the robot is completely
        stopped (i.e. intersections).

        Args:
            d_err (:obj:`float`): error in meters in the lateral direction
            phi_err (:obj:`float`): error in radians in the heading direction
            wheels_cmd_exec (:obj:`bool`): confirmation that the wheel commands have been executed (to avoid
                                           integration while the robot does not move)
        """
        if np.sign(d_err) != np.sign(self.prev_d_err):
            self.d_I = 0
        if np.sign(phi_err) != np.sign(self.prev_phi_err):
            self.phi_I = 0
        if wheels_cmd_exec[0] == 0 and wheels_cmd_exec[1] == 0:
            self.d_I = 0
            self.phi_I = 0

    @staticmethod
    def adjust_integral(error, integral, bounds, resolution):
        """Bounds the integral error to avoid windup.

        Adjusts the integral error to remain in defined bounds, and cancels it if the error is smaller than the
        resolution of the error estimation.

        Args:
            error (:obj:`float`): current error value
            integral (:obj:`float`): current integral value
            bounds (:obj:`dict`): contains minimum and maximum value for the integral
            resolution (:obj:`float`): resolution of the error estimate

        Returns:
            integral (:obj:`float`): adjusted integral value
        """
        if integral > bounds["top"]:
            integral = bounds["top"]
        elif integral < bounds["bot"]:
            integral = bounds["bot"]
        elif abs(error) < resolution:
            integral = 0
        return integral
