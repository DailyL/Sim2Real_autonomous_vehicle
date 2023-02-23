cmake_minimum_required(VERSION 2.8.3)
project(duckietown_demos)

find_package(catkin REQUIRED COMPONENTS )

catkin_package()

include_directories(${catkin_INCLUDE_DIRS})
