import time
import os
import yaml
import rospy

"""
Functions in this file were copied from the kinematics node. They could potentially be moved to dt-ros-commons, to
avoid code duplication. Possibly in the DTROS class.
"""


def save_calibration(file_name, data):
    """
    Saves the current tof paramaters to a robot-specific file at
    `file_name`.
    """

    data["calibration_time"] = time.strftime("%Y-%m-%d-%H-%M-%S")

    try:
        os.makedirs(os.path.dirname(file_name))
    except OSError:
        # Probably means the directory already exists
        pass
    with open(file_name, 'w') as outfile:
        outfile.write(yaml.dump(data, default_flow_style=False))


def read_calibration(file_name, node, param_names):
    """
    Reads the saved parameters from `file_name` or
    uses the default values if the file doesn't exist. Adjusts the ROS parameters for the node
    with the new values.
    """
    # Use the default values from the config folder if a robot-specific file does not exist.
    if not os.path.isfile(file_name):
        node.log("Calibration file %s does not exist! Using the default values." % file_name, type='warn')
    else:
        with open(file_name, 'r') as in_file:
            try:
                yaml_dict = yaml.load(in_file)
            except yaml.YAMLError as exc:
                node.log("YAML syntax error. File: %s file_name. Exc: %s" %(file_name, exc), type='fatal')
                rospy.signal_shutdown()
                return

        # Set parameters using value in yaml file
        if yaml_dict is None:
            # Empty yaml file
            return
        for param_name in param_names:
            param_value = yaml_dict.get(param_name)
            if param_name is not None:
                rospy.set_param("~"+param_name, param_value)
            else:
                # Skip if not defined, use default value instead.
                pass
