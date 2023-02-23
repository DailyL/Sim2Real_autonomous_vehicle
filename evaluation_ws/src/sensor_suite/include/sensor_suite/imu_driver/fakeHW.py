"""This is for testing where you don't have access to I2C"""

class smbus(object):
	class SMBus(object):
		def __init__(self, bus): pass
		def write_byte_data(self, a, b, c): pass
		def read_byte_data(self, a, b):
			ret = 0x71 if a == 0x68 else 0x48
			return ret
		def read_i2c_block_data(self, a, b, c): return [0xff, 0xff]*3
		def close(self): pass
