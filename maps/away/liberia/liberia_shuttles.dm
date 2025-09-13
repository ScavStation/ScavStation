// Submap shuttles.
// Mule - Shuttle One, Port Side
/obj/effect/overmap/visitable/ship/landable/mule
	name = "Mule"
	shuttle = "Mule"
	moving_state = "ship_moving"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = WEST
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL

/obj/machinery/computer/shuttle_control/explore/mule
	name = "shuttle control console"
	shuttle_tag = "Mule"

/obj/effect/shuttle_landmark/mule/start
	name = "Mule Dock"
	landmark_tag = "nav_mule_start"
	docking_controller = "mule_port_dock"
	flags = SLANDMARK_FLAG_REORIENT

/datum/shuttle/autodock/overmap/mule
	name = "Mule"
	warmup_time = 5
	current_location = "nav_mule_start"
	range = 2
	dock_target = "mule_port_shuttle_dock"
	shuttle_area = list(/area/liberia/mule)
	defer_initialisation = TRUE
	flags = SHUTTLE_FLAGS_PROCESS
	skill_needed = SKILL_BASIC
	ceiling_type = /turf/floor/shuttle_ceiling
