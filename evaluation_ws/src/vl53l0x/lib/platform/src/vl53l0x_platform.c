/*******************************************************************************
Copyright � 2015, STMicroelectronics International N.V.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of STMicroelectronics nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
NON-INFRINGEMENT OF INTELLECTUAL PROPERTY RIGHTS ARE DISCLAIMED.
IN NO EVENT SHALL STMICROELECTRONICS INTERNATIONAL N.V. BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
********************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <time.h>
#include <linux/i2c-dev.h>
#include <unistd.h>
#include "vl53l0x_platform.h"
#include "vl53l0x_api.h"

int VL53L0X_i2c_init(char * devPath, int devAddr){
    int file;
    if ((file = open(devPath, O_RDWR)) < 0) {
        perror("Failed to open the i2c bus");
        return -1;
    }
    if (ioctl(file, I2C_SLAVE, devAddr) < 0) {
        perror("Failed to acquire bus access and/or talk to slave.\n");
        return -1;
    }
    return file;
}

int VL53L0X_i2c_close(int fd){
    return close(fd);
}

static int i2c_write(int fd, uint8_t cmd, uint8_t * data, uint8_t len){
    uint8_t * buf = malloc(len+1);
    buf[0] = cmd;
    memcpy(buf+1, data, len);
    if (write(fd, buf, len+1) != len+1) {
        printf("Failed to write to the i2c bus.\n");
        free(buf);
        return VL53L0X_ERROR_CONTROL_INTERFACE;
    }
    free(buf);
    return VL53L0X_ERROR_NONE;
}

static int i2c_read(int fd, uint8_t cmd, uint8_t * data, uint8_t len){
    if (write(fd, &cmd, 1) != 1) {
        printf("Failed to write to the i2c bus.\n");
        return VL53L0X_ERROR_CONTROL_INTERFACE;
    }

    if (read(fd, data, len) != len) {
        printf("Failed to read from the i2c bus.\n");
        return VL53L0X_ERROR_CONTROL_INTERFACE;
    }

    return VL53L0X_ERROR_NONE;
}

VL53L0X_Error VL53L0X_LockSequenceAccess(VL53L0X_DEV Dev){
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;
    return Status;
}

VL53L0X_Error VL53L0X_UnlockSequenceAccess(VL53L0X_DEV Dev){
    VL53L0X_Error Status = VL53L0X_ERROR_NONE;
    return Status;
}

VL53L0X_Error VL53L0X_WriteMulti(VL53L0X_DEV Dev, uint8_t index, uint8_t *pdata, uint32_t count){
    return i2c_write(Dev->fd, index, pdata, count);
}

VL53L0X_Error VL53L0X_ReadMulti(VL53L0X_DEV Dev, uint8_t index, uint8_t *pdata, uint32_t count){
    return i2c_read(Dev->fd, index, pdata, count);
}

VL53L0X_Error VL53L0X_WrByte(VL53L0X_DEV Dev, uint8_t index, uint8_t data){
	return i2c_write(Dev->fd, index, &data, 1);
}

VL53L0X_Error VL53L0X_WrWord(VL53L0X_DEV Dev, uint8_t index, uint16_t data){
    uint8_t buf[4];
    buf[1] = data>>0&0xFF;
    buf[0] = data>>8&0xFF;
    return i2c_write(Dev->fd, index, buf, 2);
}

VL53L0X_Error VL53L0X_WrDWord(VL53L0X_DEV Dev, uint8_t index, uint32_t data){
    uint8_t buf[4];
    buf[3] = data>>0&0xFF;
    buf[2] = data>>8&0xFF;
    buf[1] = data>>16&0xFF;
    buf[0] = data>>24&0xFF;
    return i2c_write(Dev->fd, index, buf, 4);
}

VL53L0X_Error VL53L0X_UpdateByte(VL53L0X_DEV Dev, uint8_t index, uint8_t AndData, uint8_t OrData){

    int32_t status_int;
    uint8_t data;

    status_int = i2c_read(Dev->fd, index, &data, 1);

    if (status_int != 0){
        return  status_int;
    }

    data = (data & AndData) | OrData;
    return i2c_write(Dev->fd, index, &data, 1);
}

VL53L0X_Error VL53L0X_RdByte(VL53L0X_DEV Dev, uint8_t index, uint8_t *data){
    uint8_t tmp = 0;
    int ret = i2c_read(Dev->fd, index, &tmp, 1);
    *data = tmp;
    // printf("%u\n", tmp);
    return ret;
}

VL53L0X_Error VL53L0X_RdWord(VL53L0X_DEV Dev, uint8_t index, uint16_t *data){
    uint8_t buf[2];
    int ret = i2c_read(Dev->fd, index, buf, 2);
    uint16_t tmp = 0;
    tmp |= buf[1]<<0;
    tmp |= buf[0]<<8;
    // printf("%u\n", tmp);
    *data = tmp;
    return ret;
}

VL53L0X_Error  VL53L0X_RdDWord(VL53L0X_DEV Dev, uint8_t index, uint32_t *data){
    uint8_t buf[4];
    int ret = i2c_read(Dev->fd, index, buf, 4);
    uint32_t tmp = 0;
    tmp |= buf[3]<<0;
    tmp |= buf[2]<<8;
    tmp |= buf[1]<<16;
    tmp |= buf[0]<<24;
    *data = tmp;
    // printf("%zu\n", tmp);
    return ret;
}

VL53L0X_Error VL53L0X_PollingDelay(VL53L0X_DEV Dev){
    usleep(5000);
    return VL53L0X_ERROR_NONE;
}
