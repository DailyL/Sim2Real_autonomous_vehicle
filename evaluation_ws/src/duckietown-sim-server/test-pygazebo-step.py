# import trollius
# from trollius import From
#
# import pygazebo
# import pygazebo.msg.world_control_pb2
#
# @trollius.coroutine
# def publish_loop():
#     manager = yield From(pygazebo.connect())
#
#     publisher = yield From(
#         manager.advertise('/gazebo/default/world_control',
#                           'gazebo.msgs.WorldControl'))
#
#     message = pygazebo.msg.world_control_pb2.WorldControl()
#     message.multi_step = 1
#
#     while True:
#         yield From(publisher.publish(message))
#
#
# loop = trollius.get_event_loop()
# loop.run_until_complete(publish_loop())
# loop.close()
import subprocess
import time

subprocess.call(["gz","world", "-m", "20"]) # execute 20 steps


# start = time.time()
# for _ in range(100):
#     subprocess.call(['gz', 'world', '-s'])
# diff = time.time() - start
#
#
# print ("runtime: ",diff)
