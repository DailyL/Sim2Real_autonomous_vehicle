# class NoHomographyInfoAvailable(dtu.DTException):
#     pass
#
#
# class InvalidHomographyInfo(dtu.DTException):
#     pass


# def get_homography_default():
#     """ Returns a nominal homography """
#     return get_homography_for_robot('default')


# shamrock
homography_default = """
homography: [-5.828719e-05, -0.0001358896, -0.2350442, 0.001113641, -2.290353e-05, -0.3695509, 
-0.0003339684, -0.007747321, 1]
"""

# @dtu.contract(robot_name=str, returns='array[3x3]')
# def get_homography_for_robot(robot_name):
#     dtu.check_isinstance(robot_name, str)
#     # find the file
#     if robot_name == dtu.DuckietownConstants.ROBOT_NAME_FOR_TESTS:
#         data = dtu.yaml_load(homography_default)
#     else:
#         fn = get_homography_info_config_file(robot_name)
#
#         # load the YAML
#         data = dtu.yaml_load_file(fn)
#
#     # convert the YAML
#     homography = homography_from_yaml(data)
#
#     check_homography_sane_for_DB17(homography)
#
#     return homography

#
# @dtu.contract(data=dict)
# def homography_from_yaml(data):
#     try:
#         h = data['homography']
#         res = np.array(h).reshape((3, 3))
#         return res
#     except Exception as e:
#         msg = 'Could not interpret data:'
#         msg += '\n\n' + dtu.indent(yaml.dump(data), '   ')
#         dtu.raise_wrapped(InvalidHomographyInfo, e, msg)

#
# def get_homography_info_config_file(robot_name):
#     strict = False
#     roots = [os.path.join(dtu.get_duckiefleet_root(), 'calibrations'),
#              os.path.join(dru.get_ros_package_path('duckietown'), 'config', 'baseline', 'calibration')]
#
#     found = []
#     for df in roots:
#     # Load camera information
#         fn = os.path.join(df, 'camera_extrinsic', robot_name + '.yaml')
#         if os.path.exists(fn):
#             found.append(fn)
#             dtu.logger.info("Using filename %s" % fn)
#
#     if len(found) == 0:
#         msg = 'Cannot find homography file for robot %r;\n%s' % (robot_name, roots)
#         raise NoHomographyInfoAvailable(msg)
#     elif len(found) == 1:
#         return found[0]
#     else:
#         msg = 'Found more than one configuration file: \n%s' % "\n".join(found)
#         msg += "\n Please delete one of those."
#         if strict:
#             raise Exception(msg)
#         else:
#             dtu.logger.error(msg)
#             return found[0]
#

# def get_extrinsics_filename(robot_name):
#     fn = dtu.get_duckiefleet_root() + "/calibrations/camera_extrinsic/" + robot_name + ".yaml"
#     return fn

#
# def disable_old_homography(robot_name):
#     fn = get_extrinsics_filename(robot_name)
#     if os.path.exists(fn):
#         for i in range(100):
#             fn2 = fn + '.disabled.%03d' % i
#             if not os.path.exists(fn2):
#                 break
#         msg = 'Disabling old homography - so that if this fails it is clear it failed.\n Backup saved as
#         %s' % fn2
#         dtu.logger.warning(msg)
#         shutil.move(fn, fn2)
#
#
# def check_homography_sane_for_DB17(homography):
#     # TODO: to write
#     pass
