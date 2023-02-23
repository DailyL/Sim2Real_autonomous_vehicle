## ! DO NOT MANUALLY INVOKE THIS setup.py, USE CATKIN INSTEAD

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# fetch values from package.xml
setup_args = generate_distutils_setup(
    packages=["navigation", "rqt_navigation"],
    package_dir={"": "include"},
    requires=["std_msgs", "rospy", "graphviz"],
)

setup(**setup_args)
