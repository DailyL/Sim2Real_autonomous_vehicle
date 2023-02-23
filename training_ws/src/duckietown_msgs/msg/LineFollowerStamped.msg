Header header

bool valid  # True iff the ADC reading was valid
# All of the following values are normalized line brightness, between 0 and 1.
# Specifically, an ADC voltage of 0 is mapped to 0, and 3.3V is mapped to 1.0.
float32 outer_right
float32 inner_right
float32 inner_left
float32 outer_left
