/obj/effect/overmap/visitable/ship/mollusc_station
	name = "Tradepost Mollusc"
	color = "#00ffff"
	vessel_mass = 50000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS
	restricted_area = 30
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_BASE|OVERMAP_SECTOR_IN_SPACE

	initial_generic_waypoints = list(
		"nav_mollusc_station_bridge_north",
		"nav_mollusc_station_arrivals_south"
	)


	//exploration and rescue shuttles can only dock port side, b/c there's only one door.
	initial_restricted_waypoints = list(
		/datum/shuttle/autodock/overmap/science_shuttle = list("nav_mollusc_station_science_dock_shuttle"),
		/datum/shuttle/autodock/overmap/murphy = list("nav_mollusc_station_medical_dock_shuttle")
	)
