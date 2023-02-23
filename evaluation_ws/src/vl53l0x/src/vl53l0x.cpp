/*
 * ROS node for the ST VL53L0X distance sensor
 *
 * Author: altyr <mail@altyr.ch>
 * Based on "STM VL53L1X ToF rangefinder driver for ROS" by Oleg Kalachev <okalachev@gmail.com>
 *
 * Distributed under MIT License (available at https://opensource.org/licenses/MIT).
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 */

#include <string>
#include <ros/ros.h>
#include <sensor_msgs/Range.h>

#include "vl53l0x_api.h"

int main(int argc, char **argv)
{
	ros::init(argc, argv, "vl53l0x");
	ros::NodeHandle nh, nh_priv("~");

	sensor_msgs::Range range;
	range.radiation_type = sensor_msgs::Range::INFRARED;
	ros::Publisher range_pub = nh_priv.advertise<sensor_msgs::Range>("range", 20);

	// Read parameters
	int mode, i2c_bus, i2c_address, do_reset;
	double poll_rate, timing_budget, offset;
	nh_priv.param("mode", mode, 3);
	nh_priv.param("i2c_bus", i2c_bus, 1);
	nh_priv.param("i2c_address", i2c_address, 0x29);
	nh_priv.param("poll_rate", poll_rate, 100.0);
	nh_priv.param("timing_budget", timing_budget, 0.1);
	nh_priv.param("offset", offset, 0.0);
	nh_priv.param<std::string>("frame_id", range.header.frame_id, "");
	nh_priv.param("field_of_view", range.field_of_view, 0.471239f); // 27 deg, source: datasheet
	nh_priv.param("min_range", range.min_range, 0.0f);
	nh_priv.param("max_range", range.max_range, 4.0f);
	nh_priv.param("reset", do_reset, 1);

	if (timing_budget < 0.02 || timing_budget > 1) {
		ROS_FATAL("Error: timing_budget should be within 0.02 and 1 s (%g is set)", timing_budget);
		ros::shutdown();
	}

	// The minimum inter-measurement period must be longer than the timing budget + 4 ms (*)
	double inter_measurement_period = timing_budget + 0.004;

	// Setup I2C bus
	VL53L0X_Dev_t sensor;
	VL53L0X_DEV dev = &sensor;
	dev->fd = -1;
    dev->I2cDevAddr = i2c_address;
	char path[20];
	sprintf(path, "/dev/i2c-%d", i2c_bus);
	dev->fd = VL53L0X_i2c_init(path, i2c_address);
	if (dev->fd < 0) {
        ROS_FATAL("Failed to open connection\n");
        ros::shutdown();
    }

	// Init sensor
	VL53L0X_Error dev_error;
	if(do_reset) {
		VL53L0X_ResetDevice(dev);
		VL53L0X_WaitDeviceBooted(dev);
	}
	VL53L0X_DataInit(dev);
	VL53L0X_StaticInit(dev);
	uint32_t refSpadCount;
	uint8_t isApertureSpads;
	VL53L0X_PerformRefSpadManagement(dev, &refSpadCount, &isApertureSpads);
	uint8_t pVhvSettings;
	uint8_t pPhaseCal;
	VL53L0X_PerformRefCalibration(dev, &pVhvSettings, &pPhaseCal);

	// Setup sensor
	VL53L0X_SetXTalkCompensationRateMegaCps(dev, 0); // Disable crosstalk compensation
	VL53L0X_SetDeviceMode(dev, VL53L0X_DEVICEMODE_SINGLE_RANGING);
	VL53L0X_SetMeasurementTimingBudgetMicroSeconds(dev, round(timing_budget * 1e6));

	// Start sensor
	for (int i = 0; i < 100; i++) {
		VL53L0X_SetInterMeasurementPeriodMilliSeconds(dev, round(inter_measurement_period * 1e3));
		dev_error = VL53L0X_StartMeasurement(dev);
		if (dev_error == VL53L0X_ERROR_INVALID_PARAMS) {
			inter_measurement_period += 0.001; // Increase inter_measurement_period to satisfy condition (*)
		} else break;
	}

	// Check for errors after start
	if (dev_error != VL53L0X_ERROR_NONE) {
		ROS_FATAL("VL53L0X: Can't start measurement: error %d", dev_error);
		ros::shutdown();
	}

	ROS_INFO("VL53L0X: ranging");

	VL53L0X_RangingMeasurementData_t measurement_data;

	// Main loop
	ros::Rate r(poll_rate);
	while (ros::ok()) {
		r.sleep();
		range.header.stamp = ros::Time::now();

		// Check the data is ready
		uint8_t data_ready = 0;
		VL53L0X_GetMeasurementDataReady(dev, &data_ready);
		if (!data_ready) {
			continue;
		}

		// Read measurement
		VL53L0X_GetRangingMeasurementData(dev, &measurement_data);
		VL53L0X_ClearInterruptMask(dev, 0);
		VL53L0X_StartMeasurement(dev);

		// Check measurement for validness
		if (measurement_data.RangeStatus != 0) {
			char range_status[VL53L0X_MAX_STRING_LENGTH];
			VL53L0X_GetRangeStatusString(measurement_data.RangeStatus, range_status);
			ROS_DEBUG("Range measurement status is not valid: %s", range_status);
			ros::spinOnce();
			continue;
		}

		// Publish measurement
		range.range = measurement_data.RangeMilliMeter / 1000.0 + offset;
		range_pub.publish(range);
		ros::spinOnce();
	}

	// Release
	ROS_INFO("VL53L0X: stop ranging");
	VL53L0X_StopMeasurement(dev);
	VL53L0X_i2c_close(dev->fd);
}
