from setuptools import setup

POSTFIX = ''

version = '0.0.1'

description = """
dt_vl53l0x: Python bindings for the VL53L0X library
===================================================

This package contains drivers and their Python bindings for the
`VL53L0X` time-of-flight lidar sensor.

The original library is published with a `MIT
license on <https://github.com/pimoroni/VL53L0X-python>`__.

You can find more information on how to use this library in the 
`examples` directory.

"""

setup(
    name='dt_vl53l0x',
    version=version+POSTFIX,
    author='Andrea F. Daniele',
    author_email='afdaniele@ttic.edu',
    url="https://github.com/duckietown/lib-dt-vl53l0x",
    install_requires=[],
    packages=['dt_vl53l0x'],
    long_description=description,
    include_package_data=True
)
