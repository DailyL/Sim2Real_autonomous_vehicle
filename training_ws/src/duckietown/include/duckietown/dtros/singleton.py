import rospy
rospy.__instance__ = None


def get_instance():
    return rospy.__instance__