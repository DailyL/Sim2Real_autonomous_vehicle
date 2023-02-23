import logging
import trollius
from trollius import From
import pygazebo

import pygazebo.msg.gz_string_pb2
import pygazebo.msg.poses_stamped_pb2


# DISCLAIMER: I COULDN'T GET THIS RUBBISH TO WORK, TRY test-rosgazebo.py INSTEAD

class PrintHandler(logging.Handler):
    def emit(self, record):
        print("LOG:", dir(record))
        print("LOG:", record.name, record.exc_text, record.exc_info, record.msg)


h = PrintHandler()
logging.getLogger("trollius").addHandler(h)


def callback(data):
    print ("data", data)
    message = pygazebo.msg.poses_stamped_pb2.PosesStamped.FromString(data)
    print('Received message:', message.data)


@trollius.coroutine
def publish_loop():
    manager = yield From(pygazebo.connect())

    manager.subscribe('/gazebo/default/pose/info',
                      'gazebo.msgs.PosesStamped',
                      callback)

    while True:
        # yield From(subscriber.)
        yield From(trollius.sleep(1.0))


loop = trollius.get_event_loop()
print ("starting main loop")
loop.run_until_complete(publish_loop())
