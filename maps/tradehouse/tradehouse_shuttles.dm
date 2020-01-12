/obj/effect/shuttle_landmark/lower_level
	name = "Lower Level Dock"
	landmark_tag = "nav_tradehouse_station"
	docking_controller = "lower_level_dock"

/obj/effect/shuttle_landmark/upper_level
	name = "Upper Level Dock"
	landmark_tag = "nav_tradehouse_offsite"
	special_dock_targets = list("Example" = "tradehouse_shuttle_port")
	docking_controller = "upper_level_dock"

/datum/shuttle/autodock/ferry/wagon
	name = "Tradehouse Wagon"
	shuttle_area = /area/shuttle/escape
	dock_target = "tradehouse_shuttle_starboard"
	warmup_time = 10

	location = 0
	waypoint_station = "nav_tradehouse_station"
	waypoint_offsite = "nav_tradehouse_offsite"