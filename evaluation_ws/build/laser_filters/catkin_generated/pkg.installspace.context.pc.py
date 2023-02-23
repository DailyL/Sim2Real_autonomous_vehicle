# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "sensor_msgs;roscpp;tf;filters;message_filters;laser_geometry;pluginlib;angles;dynamic_reconfigure;nodelet".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lpointcloud_filters;-llaser_scan_filters".split(';') if "-lpointcloud_filters;-llaser_scan_filters" != "" else []
PROJECT_NAME = "laser_filters"
PROJECT_SPACE_DIR = "/home/dianzhao/real_duckie_catkin_ws/install"
PROJECT_VERSION = "1.9.0"
