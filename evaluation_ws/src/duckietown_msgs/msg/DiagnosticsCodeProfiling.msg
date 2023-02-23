string node                             # Node publishing this message
string block                            # Name of the profiled code block
float32 frequency                       # Execution frequency of the block
float32 duration                        # Last execution time of the block (in seconds)
string filename                         # Filename in which this block resides
uint16[2] line_nums                     # Start and end line of the block in the file
float32 time_since_last_execution       # Seconds since last execution