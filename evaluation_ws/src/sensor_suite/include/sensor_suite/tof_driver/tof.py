import os
import time

import smbus


# define RFD77402_ADDR 0x4C //7-bit unshifted default I2C Address

class ToF():

    def __init__(self):
        self.MyBus = smbus.SMBus(1)
        self.addr = 0x4C

        # Register addresses
        self.RFD77402_ICSR = 0x00
        self.RFD77402_INTERRUPTS = 0x02
        self.RFD77402_COMMAND = 0x04
        self.RFD77402_DEVICE_STATUS = 0x06
        self.RFD77402_RESULT = 0x08
        self.RFD77402_RESULT_CONFIDENCE = 0x0A
        self.RFD77402_CONFIGURE_A = 0x0C
        self.RFD77402_CONFIGURE_B = 0x0E
        self.RFD77402_HOST_TO_MCPU_MAILBOX = 0x10
        self.RFD77402_MCPU_TO_HOST_MAILBOX = 0x12
        self.RFD77402_CONFIGURE_PMU = 0x14
        self.RFD77402_CONFIGURE_I2C = 0x1C
        self.RFD77402_CONFIGURE_HW_0 = 0x20
        self.RFD77402_CONFIGURE_HW_1 = 0x22
        self.RFD77402_CONFIGURE_HW_2 = 0x24
        self.RFD77402_CONFIGURE_HW_3 = 0x26
        self.RFD77402_MOD_CHIP_ID = 0x28

        self.RFD77402_MODE_MEASUREMENT = 0x01
        self.RFD77402_MODE_STANDBY = 0x10
        self.RFD77402_MODE_OFF = 0x11
        self.RFD77402_MODE_ON = 0x12

        self.CODE_VALID_DATA = 0x00
        self.CODE_FAILED_PIXELS = 0x01
        self.CODE_FAILED_SIGNAL = 0x02
        self.CODE_FAILED_SATURATED = 0x03
        self.CODE_FAILED_NOT_NEW = 0x04
        self.CODE_FAILED_TIMEOUT = 0x05

        self.I2C_SPEED_STANDARD = 100000
        self.I2C_SPEED_FAST = 400000

        self.INTSRC_DATA = 1  # //Interrupt fires with newly available data
        self.INTSRC_M2H = 0 << 1  # //Interrupt fires with newly available data in M2H mailbox register
        self.INTSRC_H2M = 0 << 2  # //Interrupt fires when H2M register is read
        self.INTSRC_RST = 0 << 3  # //Interrupt fires when HW reset occurs

        self.INT_CLR_REG = 1
        self.INT_CLR = 0 << 1
        self.INT_PIN_TYPE = 1 << 2
        self.INT_LOHI = 0 << 3

    def goToStandbyMode(self):
        self.MyBus.write_byte_data(self.addr, self.RFD77402_COMMAND, 0x90)
        for i in range(1, 11):
            if (self.MyBus.read_word_data(self.addr, self.RFD77402_DEVICE_STATUS) & 0x001F) == 0x0000:
                ans = True
                break
            elif i < 10:
                time.sleep(0.01)
            else:
                ans = False
        return ans

    def goToOffMode(self):
        self.MyBus.write_byte_data(self.addr, self.RFD77402_COMMAND, 0x91)
        for i in range(1, 11):
            if (self.MyBus.read_word_data(self.addr, self.RFD77402_DEVICE_STATUS) & 0x001F) == 0x0010:
                ans = True
                break
            elif i < 10:
                time.sleep(0.01)
            else:
                ans = False
        return ans

    def goToOnMode(self):
        self.MyBus.write_byte_data(self.addr, self.RFD77402_COMMAND, 0x92)
        for i in range(1, 10):
            if (self.MyBus.read_word_data(self.addr, self.RFD77402_DEVICE_STATUS) & 0x001F) == 0x0018:
                ans = True
                break
            elif i < 10:
                time.sleep(0.01)
            else:
                ans = False
        return ans

    def getPeak(self):
        """Returns the VCSEL peak 4-bit value"""
        configValue = self.MyBus.read_byte_data(self.addr, self.RFD77402_CONFIGURE_A) >> 12
        return configValue & 0x0F

    # Sets the VCSEL peak 4-bit value
    def setPeak(self, peakValue):
        configValue = self.MyBus.read_word_data(self.addr, self.RFD77402_CONFIGURE_A)  # Read
        configValue &= ~0xF000  # Zeros out the peak configuration bits
        configValue |= peakValue << 12  # Mask in user's settings
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_A, configValue)  # Write in this new value

    def getPeak(self):
        """Returns the VCSEL Treshold 4-bit value"""
        configValue = self.MyBus.read_byte_data(self.addr, self.RFD77402_CONFIGURE_A) >> 8
        return configValue & 0x0F

    def setThreshold(self, thresholdValue):
        configValue = self.MyBus.read_word_data(self.addr, self.RFD77402_CONFIGURE_A)  # Read
        configValue &= ~0x0F00  # Zeros out the peak configuration bits
        configValue |= thresholdValue << 8  # Mask in user's settings
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_A, configValue)  # Write in this new value

    def getFrequency(self):
        """Returns the VCSEL Treshold 4-bit value"""
        configValue = self.MyBus.read_word_data(self.addr, self.RFD77402_CONFIGURE_HW_1) >> 12
        return configValue & 0x0F

    def setFrequancy(self, thresholdValue):
        configValue = self.MyBus.read_word_data(self.addr, self.RFD77402_CONFIGURE_HW_1)  # Read
        configValue &= ~0xF000  # Zeros out the peak configuration bits
        configValue |= thresholdValue << 12  # Mask in user's settings
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_1, configValue)  # Write in this new value

    def getMailbox(self):
        """Gets whatever is in the 'MCPU to Host' mailbox, Check ICSR bit 5 before reading"""
        giveBack = self.MyBus.read_word_data(self.addr, self.RFD77402_MCPU_TO_HOST_MAILBOX)
        return giveBack

    def reset(self):
        """"Software reset the device"""
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_1, 1 << 6)
        time.sleep(0.01)

    # Tell MCPU to go to measurement mode
    # Takes a measurement. If measurement data is ready, return true
    def goToMeasurementMode(self):
        self.MyBus.write_byte_data(self.addr, self.RFD77402_COMMAND, 0x81)
        for i in range(1, 10):
            if (self.MyBus.read_word_data(self.addr, self.RFD77402_ICSR) & (1 << 4)) != 0:
                ans = True
                break
            elif i < 10:
                time.sleep(0.01)
            else:
                ans = False
        return ans

    # Read the command opcode and convert to mode
    def getMode(self):
        giveBack = self.MyBus.read_byte_data(self.addr, self.RFD77402_COMMAND) & 0x3F
        return giveBack

    def begin(self):
        mod_chip_ID = self.MyBus.read_word_data(self.addr, self.RFD77402_MOD_CHIP_ID)
        # print('Chip ID:', mod_chip_ID)

        if self.goToStandbyMode() == False:  # Checks if the sensor is in standby mode
            return False

        setting = self.MyBus.read_byte_data(self.addr, self.RFD77402_ICSR)
        setting &= 0xF0  # The Bits 7:4 are R/O so we dont want to change them, Bites 3:0 are R/W
        setting |= self.INT_CLR_REG | self.INT_CLR | self.INT_PIN_TYPE | self.INT_LOHI  # setting the Bits we want to be 1, to 1
        self.MyBus.write_byte_data(self.addr, self.RFD77402_ICSR, setting)

        setting = self.MyBus.read_byte_data(self.addr, self.RFD77402_INTERRUPTS)
        setting &= 0x00  # The Bits 7:4 are R/O so we dont want to change them, Bites 3:0 are R/W
        setting |= self.INTSRC_DATA | self.INTSRC_M2H | self.INTSRC_H2M | self.INTSRC_RST  # setting the Bits we want to be 1, to 1
        self.MyBus.write_byte_data(self.addr, self.RFD77402_INTERRUPTS, setting)

        # Configure I2C Interface
        self.MyBus.write_byte_data(self.addr, self.RFD77402_CONFIGURE_I2C, 0x65)

        # Set initialization - Magic from datasheet.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_PMU, 0x0500)

        if self.goToOffMode() == False:  # Checks if the sensor is in standby mode
            return False

        # Read Module ID
        # Skipped

        # Read Firmware ID
        # Skipped

        # Set initialization - Magic from datasheet. Write 0x06 to 0x15 location.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_PMU, 0x0600)

        if self.goToOnMode() == False:
            return False

        self.setPeak(0x0E)
        self.setThreshold(0x01)

        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_B,
                                   0x10FF)  # Set valid pixel. Set MSP430 default config.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_0, 0x07D0)  # Set saturation threshold = 2,000.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_1,
                                   0x5008)  # Frequecy = 5. Low level threshold = 8.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_2,
                                   0xA041)  # Integration time = 10 * (6500-20)/15)+20 = 4.340ms. Plus reserved magic.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_HW_3,
                                   0x45D4)  # Enable harmonic cancellation. Enable auto adjust of integration time. Plus reserved magic.

        if self.goToStandbyMode() == False:  # Checks if the sensor is in standby mode
            return False

        # Now assume user will want sensor in measurement mode

        # Set initialization - Magic from datasheet. Write 0x05 to 0x15 location.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_PMU, 0x0500)  # Patch_code_id_en, Patch_mem_en

        if self.goToOffMode() == False:  # Checks if the sensor is in standby mode
            return False

        # Write calibration data
        # skipped

        # Set initialization - Magic from datasheet. Write 0x06 to 0x15 location.
        self.MyBus.write_word_data(self.addr, self.RFD77402_CONFIGURE_PMU, 0x0600)

        if self.goToOnMode() == False:
            return False

        return True

    def takeMeasurement(self):
        if self.goToMeasurementMode() == False:
            return self.CODE_FAILED_TIMEOUT
        # New Data is noe available!
        resultRegister = self.MyBus.read_word_data(self.addr, self.RFD77402_RESULT)
        if (resultRegister & ~0x7FFF):
            errorCode = (resultRegister >> 13) & 0x03
            distance = (resultRegister >> 2) & 0x07FF  # Distance is good. Read it.
            # Read confidence register
            confidenceRegister = self.MyBus.read_word_data(self.addr, self.RFD77402_RESULT_CONFIDENCE)
            validPixels = confidenceRegister & 0x0F
            confidenceValue = (confidenceRegister >> 4) & 0x07FF
            return errorCode, distance, validPixels, confidenceValue

        else:
            # reading is not valide
            return 0x03, 0, 0, 0

    def getCalibrationData(self):
        """Retreive 2*27 bytes from MCPU for computation of calibration parameters
           This is 9.2.2 from datasheet
           Reads 54 bytes into the calibration[] array
           Returns true if new cal data is loaded """
        if self.goToOnMode() == False:  # Error - sensor timed out before getting to On Mode
            return False

        # Check ICSR Register and read Mailbox until it is empty
        messages = 0
        while (True):
            if (self.MyBus.read_byte_data(self.addr, self.RFD77402_ICSR) & (
                    1 << 5)) == 0:  # Mailbox interrupt is cleared
                break
            # Mailbox interrupt (Bit 5) is set so read the M2H mailbox register
            self.getMailbox()
            messages += 1  # Throw it out. Just read to clear the register.
            if messages > 27:  # Error - Too many messages
                return False
            time.sleep(0.01)
        # Suggested timeout for status checks from datasheet
        # Issue mailbox command
        self.MyBus.write_word_data(self.addr, self.RFD77402_MCPU_TO_HOST_MAILBOX, 0x0600)  # Send 0x0006 mailbox command

        # Check to see if Mailbox can be read
        # Read 54 bytes of payload into the calibration[54] array
        for message in range(0, 27):
            # Wait for bit to be set
            x = 0
            while (True):
                icsr = self.MyBus.read_byte_data(self.addr, self.RFD77402_ICSR)
                if (icsr & (1 << 5)) != 0:  # New message in available
                    break
                x += 1
                if x > 10:  # Error  timeout
                    return False
                time.sleep(0.01)

            incoming = self.getMailbox()  # Get 16-bit message

            # Put message into larger calibrationData array
            calibrationData[message * 2] = incoming >> 8
            calibrationData[message * 2 + 1] = incoming & 0xFF


# sensor1 = ToF()
# if sensor1.begin()==True:
# ToFDistance1 = sensor1.takeMeasurement()[0]
# print('sensor 1 distance:')			#,ToFDistance1)
# else:
# print('Error')


if __name__ == '__main__':
    sensor1 = ToF()
    while sensor1.begin() == True:
        print(sensor1.takeMeasurement())
        time.sleep(0.1)
        os.system('clear')
