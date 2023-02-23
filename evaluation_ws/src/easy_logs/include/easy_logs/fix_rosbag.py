import rosbag
from rosbag.bag import ROSBagException


def _hotfix_get_message_type(info):
    import genpy, genmsg

    _message_types = rosbag.bag._message_types
    message_type = _message_types.get(info.md5sum)
    if message_type is None:
        try:
            msg_def = info.msg_def
            assert isinstance(msg_def, str)
            # msg_def = msg_def.decode('unicode_escape').encode('ascii', errors='ignore')
            message_type = genpy.dynamic.generate_dynamic(info.datatype, msg_def)[info.datatype]
            if message_type._md5sum != info.md5sum:
                pass
        #                 print('WARNING: For type [%s] stored md5sum [%s] does not match message definition [%s].\n'
        #                       '  Try: "rosrun rosbag fix_msg_defs.py old_bag new_bag."'%
        #                       (info.datatype, info.md5sum, message_type._md5sum), file=sys.stderr)
        except genmsg.InvalidMsgSpec:
            message_type = genpy.dynamic.generate_dynamic(info.datatype, "")[info.datatype]
        #             print('WARNING: For type [%s] stored md5sum [%s] has invalid message definition."'
        #                   %(info.datatype, info.md5sum), file=sys.stderr)
        except genmsg.MsgGenerationException as ex:
            raise ROSBagException(f"Error generating datatype {info.datatype}: {str(ex)}")

        _message_types[info.md5sum] = message_type

    return message_type


rosbag.bag._get_message_type = _hotfix_get_message_type
