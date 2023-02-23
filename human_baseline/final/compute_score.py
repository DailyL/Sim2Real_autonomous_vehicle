import pandas as pd
import matplotlib.pyplot as plt
import json
import os
import seaborn as sns
from matplotlib.lines import Line2D
import os
 


def compute_score(deviation_heading, major_infraction, deviation_lateral, traveled_distance, survival_time):

	score_list = [None] * len(deviation_heading)
	for i in range(len(deviation_heading)):
		score_list[i] = float(survival_time[i]) + float(traveled_distance[i]) - float(deviation_lateral[i]) - 0.5 * float(deviation_heading[i]) - 1.5 * float(major_infraction[i])

	max_score = max(score_list)
	max_index = score_list.index(max_score)


	return max_score, max_index, deviation_heading[max_index], major_infraction[max_index], deviation_lateral[max_index], traveled_distance[max_index], survival_time[max_index]



def read_json(file_path):
	with open(os.getcwd() + file_path + "/total_metrics.json") as f:
		d = json.load(f)
	deviation_heading = d["episode_totals"]["deviation-heading"]
	major_infraction = d["episode_totals"]["in-drivable-lane"]
	deviation_lateral = d["episode_totals"]["deviation-center-line"]
	traveled_distance = d["episode_totals"]["driving-distance-consecutive"]
	survival_time = d["episode_totals"]["survival_time"]
	return deviation_heading, major_infraction, deviation_lateral, traveled_distance, survival_time



"""
player name
"""
player_name = "sarka"



map_1 = "loop_empty"
map_2 = "ETHZ_autolab_technical_track"
map_3 = "_plus_floor"
map_4 = "LF-norm-zigzag"
map_5 = "_huge_V_floor"


map1_is_Exist = os.path.exists(os.getcwd() +"/" + player_name + "/" + map_1 + "/total_metrics.json")
map2_is_Exist = os.path.exists(os.getcwd() +"/" + player_name + "/" + map_2 + "/total_metrics.json")
map3_is_Exist = os.path.exists(os.getcwd() +"/" + player_name + "/" + map_3 + "/total_metrics.json")
map4_is_Exist = os.path.exists(os.getcwd() +"/" + player_name + "/" + map_4 + "/total_metrics.json")
map5_is_Exist = os.path.exists(os.getcwd() +"/" + player_name + "/" + map_5 + "/total_metrics.json")


file = open(player_name + "_final_results.txt", "w")
if map1_is_Exist:
	deviation_heading_1, major_infraction_1, deviation_lateral_1, traveled_distance_1, survival_time_1 = read_json("/" + player_name + "/" + map_1)
	max_score_map_1, max_index_map_1, deviation_heading_map_1, major_infraction_map_1, deviation_lateral_map_1, traveled_distance_map_1, survival_time_map_1 = compute_score(deviation_heading_1, \
		major_infraction_1, deviation_lateral_1, traveled_distance_1, survival_time_1)

	file.write("Final score for map  Normal 1 : %f \n" % max_score_map_1)	
	file.write("With \n")
	file.write("Survival Time: %f  \n" % survival_time_map_1)
	file.write("Traveled distance: %f  \n" %traveled_distance_map_1)
	file.write("Lateral deviation: %f  \n" %deviation_lateral_map_1)
	file.write("Orientation deviation: %f  \n" %deviation_heading_map_1)
	file.write("Major infractions: %f \r \n" %major_infraction_map_1)
else:
	file.write("No data for map  Normal 1 ! \r \n" )

if map2_is_Exist:
	deviation_heading_2, major_infraction_2, deviation_lateral_2, traveled_distance_2, survival_time_2 = read_json("/" + player_name + "/" + map_2)
	max_score_map_2, max_index_map_2, deviation_heading_map_2, major_infraction_map_2, deviation_lateral_map_2, traveled_distance_map_2, survival_time_map_2 = compute_score(deviation_heading_2, \
		major_infraction_2, deviation_lateral_2, traveled_distance_2, survival_time_2)

	file.write("Final score for map  Normal 2 : %f \n" % max_score_map_2)
	file.write("With \n")
	file.write("Survival Time: %f  \n" % survival_time_map_2)
	file.write("Traveled distance: %f \n" %traveled_distance_map_2)
	file.write("Lateral deviation: %f \n" %deviation_lateral_map_2)
	file.write("Orientation deviation: %f \n" %deviation_heading_map_2)
	file.write("Major infractions: %f \r \n" %major_infraction_map_2)

else:
	file.write("No data for map  Normal 2 ! \r \n" )


if map3_is_Exist:
	deviation_heading_3, major_infraction_3, deviation_lateral_3, traveled_distance_3, survival_time_3 = read_json("/" + player_name + "/" + map_3)
	max_score_map_3, max_index_map_3, deviation_heading_map_3, major_infraction_map_3, deviation_lateral_map_3, traveled_distance_map_3, survival_time_map_3 = compute_score(deviation_heading_3, \
		major_infraction_3, deviation_lateral_3, traveled_distance_3, survival_time_3)

	file.write("Final score for map  _plus_floor : %f \n" % max_score_map_3)
	file.write("With \n")
	file.write("Survival Time: %f \n" % survival_time_map_3)
	file.write("Traveled distance: %f \n" %traveled_distance_map_3)
	file.write("Lateral deviation: %f  \n" %deviation_lateral_map_3)
	file.write("Orientation deviation: %f  \n" %deviation_heading_map_3)
	file.write("Major infractions: %f \r \n" %major_infraction_map_3)
else:
	file.write("No data for map  _plus_floor ! \r \n" )


if map4_is_Exist:
	deviation_heading_4, major_infraction_4, deviation_lateral_4, traveled_distance_4, survival_time_4 = read_json("/" + player_name + "/" + map_4)
	max_score_map_4, max_index_map_4, deviation_heading_map_4, major_infraction_map_4, deviation_lateral_map_4, traveled_distance_map_4, survival_time_map_4 = compute_score(deviation_heading_4, \
		major_infraction_4, deviation_lateral_4, traveled_distance_4, survival_time_4)

	file.write("Final score for map  zigzag : %f \n" % max_score_map_4)
	file.write("With \n")
	file.write("Survival Time: %f  \n" % survival_time_map_4)
	file.write("Traveled distance: %f  \n" %traveled_distance_map_4)
	file.write("Lateral deviation: %f  \n" %deviation_lateral_map_4)
	file.write("Orientation deviation: %f  \n" %deviation_heading_map_4)
	file.write("Major infractions: %f \r \n" %major_infraction_map_4)
else:
	file.write("No data for map  zigzag ! \r \n" )


if map5_is_Exist:
	deviation_heading_5, major_infraction_5, deviation_lateral_5, traveled_distance_5, survival_time_5 = read_json("/" + player_name + "/" + map_5)
	max_score_map_5, max_index_map_5, deviation_heading_map_5, major_infraction_map_5, deviation_lateral_map_5, traveled_distance_map_5, survival_time_map_5 = compute_score(deviation_heading_5, \
		major_infraction_5, deviation_lateral_5, traveled_distance_5, survival_time_5)


	file.write("Final score for map  v floor : %f \n" % max_score_map_5)
	file.write("With \n")
	file.write("Survival Time: %f  \n" % survival_time_map_5)
	file.write("Traveled distance: %f  \n" %traveled_distance_map_5)
	file.write("Lateral deviation: %f  \n" %deviation_lateral_map_5)
	file.write("Orientation deviation: %f \n" %deviation_heading_map_5)
	file.write("Major infractions: %f  \n" %major_infraction_map_5)
else:
	file.write("No data for map  v floor ! \r \n" )


file.close()

