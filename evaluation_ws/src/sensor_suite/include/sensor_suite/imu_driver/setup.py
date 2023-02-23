from __future__ import print_function
from setuptools import setup
from mpu9250.version import __version__ as VERSION
from build_utils import BuildCommand
from build_utils import PublishCommand
from build_utils import BinaryDistribution


PACKAGE_NAME = 'mpu9250'
BuildCommand.pkg = PACKAGE_NAME
PublishCommand.pkg = PACKAGE_NAME
PublishCommand.version = VERSION


setup(
	author='Kevin Walchko',
	author_email='walchko@users.noreply.github.com',
	name=PACKAGE_NAME,
	version=VERSION,
	description='python library to use the Sparkfun mpu9250 9-Dof IMU',
	long_description=open('readme.rst').read(),
	url='http://github.com/walchko/{}'.format(PACKAGE_NAME),
	classifiers=[
		'Development Status :: 4 - Beta',
		'Intended Audience :: Developers',
		'License :: OSI Approved :: MIT License',
		'Operating System :: OS Independent',
		'Programming Language :: Python :: 2.7',
		'Programming Language :: Python :: 3.6',
		'Topic :: Software Development :: Libraries',
		'Topic :: Software Development :: Libraries :: Python Modules',
		'Topic :: Software Development :: Libraries :: Application Frameworks'
	],
	license='MIT',
	keywords=['raspberry', 'pi', '', 'mpu9250', 'imu', 'i2c'],
	packages=[PACKAGE_NAME],
	install_requires=['build_utils', 'smbus2'],
	cmdclass={
		'make': BuildCommand,
		'publish': PublishCommand
	}
)
