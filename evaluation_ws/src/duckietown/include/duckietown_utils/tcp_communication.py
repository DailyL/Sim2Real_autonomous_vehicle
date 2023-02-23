from duckietown_utils import robot_name
import rospy
from duckietown_msgs.srv import GetVariable, SetVariable
from std_msgs.msg import String
import json


def getVariable(variable_name):
    # Get vehicle name
    veh = robot_name.get_current_robot_name()

    # Create rosservice proxy
    getVar = rospy.ServiceProxy("/" + str(veh) + "/tcp_communication_client_node/get_variable", GetVariable)

    # Data is passed in JSON
    name_json = String()
    name_json.data = json.dumps(variable_name)

    # Execute rosservice
    var = getVar(name_json)

    # Value of variable
    return json.loads(var.value_json.data)

def setVariable(variable_name, value):
    # Get vehicle name
    veh = robot_name.get_current_robot_name()

    # Create rosservice proxy
    setVar = rospy.ServiceProxy("/" + str(veh) + "/tcp_communication_client_node/set_variable", SetVariable)

    # Data is passed in JSON
    name_json = String()
    name_json.data = json.dumps(variable_name)
    value_json = String()
    value_json.data = json.dumps(value)

    # Execute rosservice
    var = setVar(name_json, value_json)


    # Either True, False or ERROR
    return json.loads(var.success_json.data)
