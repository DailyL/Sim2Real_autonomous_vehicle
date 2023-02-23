execute_process(COMMAND "/home/dianzhao/real_duckie_catkin_ws/build/vehicle_detection/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/dianzhao/real_duckie_catkin_ws/build/vehicle_detection/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
