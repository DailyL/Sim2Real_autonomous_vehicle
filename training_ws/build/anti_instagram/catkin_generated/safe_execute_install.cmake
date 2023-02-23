execute_process(COMMAND "/home/dianzhaoli/duckie_catkin_ws/build/anti_instagram/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/dianzhaoli/duckie_catkin_ws/build/anti_instagram/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
