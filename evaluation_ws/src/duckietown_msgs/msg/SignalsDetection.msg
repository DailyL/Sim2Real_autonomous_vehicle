Header header

# this is what we can see at the intersection:
string front
string right
string left

# For the first backoff approach
# string led_detected
# string no_led_detected

# Each of these can be:
string NO_CAR='no_car_detected'
string SIGNAL_A='car_signal_A'
string SIGNAL_B='car_signal_B'
string SIGNAL_C='car_signal_C'
string SIGNAL_PRIORITY='car_signal_priority'
string SIGNAL_SACRIFICE_FOR_PRIORITY='car_signal_sacrifice_for_priority'

string NO_CARS='no_cars_detected'
string CARS   ='cars_detected'


# Plus we can see the traffic light

# for the moment we assume that no traffic light exists

string traffic_light_state

string NO_TRAFFIC_LIGHT='no_traffic_light'
string STOP='tl_stop'
string GO='tl_go'
string YIELD='tl_yield'
