# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "navigation: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iduckietown_msgs:/home/dianzhao/real_duckie_catkin_ws/src/duckietown_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(navigation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_custom_target(_navigation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "navigation" "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(navigation
  "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_cpp(navigation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(navigation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_dependencies(navigation_generate_messages_cpp _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_gencpp)
add_dependencies(navigation_gencpp navigation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(navigation
  "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_eus(navigation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(navigation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_dependencies(navigation_generate_messages_eus _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_geneus)
add_dependencies(navigation_geneus navigation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(navigation
  "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_lisp(navigation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(navigation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_dependencies(navigation_generate_messages_lisp _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_genlisp)
add_dependencies(navigation_genlisp navigation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(navigation
  "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_nodejs(navigation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(navigation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_dependencies(navigation_generate_messages_nodejs _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_gennodejs)
add_dependencies(navigation_gennodejs navigation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(navigation
  "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
)

### Generating Module File
_generate_module_py(navigation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(navigation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(navigation_generate_messages navigation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dianzhao/real_duckie_catkin_ws/src/navigation/srv/GraphSearch.srv" NAME_WE)
add_dependencies(navigation_generate_messages_py _navigation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(navigation_genpy)
add_dependencies(navigation_genpy navigation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS navigation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/navigation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(navigation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET duckietown_msgs_generate_messages_cpp)
  add_dependencies(navigation_generate_messages_cpp duckietown_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/navigation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(navigation_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET duckietown_msgs_generate_messages_eus)
  add_dependencies(navigation_generate_messages_eus duckietown_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/navigation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(navigation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET duckietown_msgs_generate_messages_lisp)
  add_dependencies(navigation_generate_messages_lisp duckietown_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/navigation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(navigation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET duckietown_msgs_generate_messages_nodejs)
  add_dependencies(navigation_generate_messages_nodejs duckietown_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/navigation
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(navigation_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET duckietown_msgs_generate_messages_py)
  add_dependencies(navigation_generate_messages_py duckietown_msgs_generate_messages_py)
endif()
