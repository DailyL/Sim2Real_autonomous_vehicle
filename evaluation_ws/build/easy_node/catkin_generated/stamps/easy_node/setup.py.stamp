## ! DO NOT MANUALLY INVOKE THIS setup.py, USE CATKIN INSTEAD

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# fetch values from package.xml
setup_args = generate_distutils_setup(
    packages=["easy_node", "easy_node_tests"],
    package_dir={"": "include"},
    #     entry_points={
    #          'console_scripts': [
    #             'en-desc = mcdp_cli:mcdp_plot_main',
    #         ]
    #       }
)

setup(**setup_args)
