import smbus
from collections import namedtuple

I2C_ADDR = 0x42
I2C_BUS = 1

LineDetection = namedtuple('LineDetection', ('outer_right', 'inner_right', 'inner_left', 'outer_left'))


class LineFollower:
	"""
	Class for controlling the 4 line following sensors on the front bumper of DBV2.

	These sensors are connected to the ADC on the microcontroller on the HAT (or HUT). The microcontroller reads
	these values, converts them to millivolts, and publishes them via I2C.

	The microcontroller acts as an I2C slave on address 0x42 on I2C bus 1. It has the following registers. Each pair
	of registers that stores a 2-byte number is little-endian. That is, (lsb, msb)
	(0, 1): ADC 1
	(2, 3): ADC 2
	(4, 5): ADC 3
	(6, 7): ADC 4
	8: ADC diagnostic:
		bit (0, 1): ADC 4 under-volt, over-volt
		bit (2, 3): ADC 3 under-volt, over-volt
		bit (4, 5): ADC 2 under-volt, over-volt
		bit (6, 7): ADC 1 under-volt, over-volt

	In its current form, this class does not make all of the diagnostic information available. It only returns a
	single boolean value, for whether all of the diagnostics are fine. If any of the diagnostic bits are set to 1,
	this value will be False.
	"""

	def __init__(self):
		self.smbus = smbus.SMBus(I2C_BUS)
		# The diagnostic bits on the ADC can sometimes be set briefly on boot. So, try to reset them now so that
		# we will only detect errors that are fresh.
		self.reset_diagnostics()

	def read(self):
		"""
		Read the ADC readings from the I2C bus.

		:return: tuple(detection, valid)
			WHERE
			LineDetection detection is a named tuple of the actual ADC readings in Volts
			bool valid is True iff all 4 ADC ports are neither over-volted nor under-volted
		"""
		raw_readings = self.smbus.read_i2c_block_data(I2C_ADDR, 0, 9)
		voltages = LineDetection(*(
			(lsb + (msb << 8)) / 1000.0	 # Concatenate least significant byte and most significant byte, convert to V
			for lsb, msb 			 	 # for each lsb and msb
			in zip(					 	 # Zip together each of...
				raw_readings[0::2],  	 # Indexes (0, 2, 4, 6) (all least-significant bytes)
				raw_readings[1::2]   	 # Indexes (1, 3, 5, 7) (all most-significant bytes)
			)
		))
		valid = raw_readings[8] == 0x00  # Diagnostic register is 0x00 iff all measurements are valid.

		return voltages, valid

	def diagnostics(self):
		return self.smbus.read_byte_data(I2C_ADDR, 8)

	def reset_diagnostics(self):
		self.smbus.write_byte_data(I2C_ADDR, 8, 0)

	def __del__(self):
		self.smbus.close()
