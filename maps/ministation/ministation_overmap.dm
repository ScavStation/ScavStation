/obj/effect/overmap/visitable/ship/ministation
	name = "Tradepost Mollusc"
	color = "#00ffff"
	start_x = 4
	start_y = 4
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS
	restricted_area = 30
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_BASE|OVERMAP_SECTOR_IN_SPACE

	initial_generic_waypoints = list(
		"nav_ministation_bridge_north",
		"nav_ministation_arrivals_south"
	)

	/obj/effect/shuttle_landmark/bridge_north
	landmark_tag = "nav_ministation_bridge_north"

	/obj/effect/shuttle_landmark/arrivas_south
	landmark_tag = "nav_ministation_arrivals_south"
	//exploration and rescue shuttles can only dock port side, b/c there's only one door.
	//initial_restricted_waypoints = list(
	//	/datum/shuttle/autodock/overmap/exploration = list("nav_tradeship_port_dock_shuttle"),
	//	/datum/shuttle/autodock/overmap/rescue = list("nav_tradeship_starboard_dock_rescue")
	//)
