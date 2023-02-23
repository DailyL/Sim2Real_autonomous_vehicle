from easy_regression.processor_interface import ProcessorInterface, ProcessorUtilsInterface

__all__ = ["IdentityProcessor"]


class IdentityProcessor(ProcessorInterface):
    def process_log(self, bag_in, prefix: str, bag_out, prefix_out: str, utils: ProcessorUtilsInterface):
        # TODO
        for topic, msg, _t in bag_in.read_messages():
            bag_out.write(topic, msg)
