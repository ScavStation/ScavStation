//supply
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	warmup_time = 10
	location = 1
	dock_target = "supply_shuttle"
	shuttle_area = /area/mollusc_station/supply
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/start
	landmark_tag ="nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"
	base_area = /area/mollusc_station/supply_dock
	base_turf = /turf/space

/datum/shuttle/autodock/ferry/emergency/escape_shuttle
	name = "Escape Shuttle"
	warmup_time = 10
	location = 1
	dock_target = "shuttle1"
	shuttle_area = /area/shuttle/escape_shuttle
	waypoint_offsite = "nav_escape_shuttle_start"
	waypoint_station = "nav_escape_shuttle_station"
	landmark_transition = "nav_escape_shuttle_transit"

/obj/effect/shuttle_landmark/escape_shuttle/start
	landmark_tag = "nav_escape_shuttle_start"
	docking_controller = "centcom_escape_dock"

/obj/effect/shuttle_landmark/escape_shuttle/transit
	landmark_tag = "nav_escape_shuttle_transit"

/obj/effect/shuttle_landmark/escape_shuttle/station
	landmark_tag = "nav_escape_shuttle_station"
	docking_controller = "station1"

/obj/effect/shuttle_landmark/bridge_north
	landmark_tag = "nav_mollusc_station_bridge_north"

/obj/effect/shuttle_landmark/arrivas_south
	landmark_tag = "nav_mollusc_station_arrivals_south"

/obj/machinery/computer/shuttle_control/explore/mollusc_station
	name = "science shuttle console"
	shuttle_tag = "Science Shuttle"

/datum/shuttle/autodock/overmap/science_shuttle
	name = "Science Shuttle"
	shuttle_area = /area/mollusc_station/shuttle/outgoing
	dock_target = "science_shuttle"
	current_location = "nav_mollusc_station_science_dock_shuttle"
//	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/science_dock
	name = "Tradepost Science Department Docking Arm"
	docking_controller = "mollusc_station_science_dock"
	landmark_tag = "nav_mollusc_station_science_dock_shuttle"

/obj/machinery/computer/shuttle_control/explore/murphy
	name = "Murphy docking console"
	shuttle_tag = "Murphy"

/datum/shuttle/autodock/overmap/murphy
	name = "Murphy"
	shuttle_area = list(/area/mollusc_station/Murphy/bridge, /area/mollusc_station/Murphy/roof, /area/mollusc_station/Murphy/common, /area/mollusc_station/Murphy/common/upper,
	/area/mollusc_station/Murphy/medical, /area/mollusc_station/Murphy/lounge, /area/mollusc_station/Murphy/kitchen, /area/mollusc_station/Murphy/chem, /area/mollusc_station/Murphy/ai,
	/area/mollusc_station/Murphy/living, /area/mollusc_station/Murphy/rnd, /area/mollusc_station/Murphy/hydro, /area/mollusc_station/Murphy/robotics, /area/mollusc_station/Murphy/smresearch,
	/area/mollusc_station/Murphy/lowercommon, /area/mollusc_station/Murphy/atmos, /area/mollusc_station/Murphy/maint/central, /area/mollusc_station/Murphy/maint/midMaint,
	/area/mollusc_station/Murphy/maint/Mawreek, /area/mollusc_station/Murphy/maint/Vayryn, /area/mollusc_station/Murphy/maint/guest, /area/mollusc_station/Murphy/janitors,
	/area/mollusc_station/Murphy/bathroom, /area/mollusc_station/Murphy/bedroom, /area/mollusc_station/Murphy/bedroom/guest, /area/mollusc_station/Murphy/bedroom/Steph,
	/area/mollusc_station/Murphy/bedroom/Karlawa_Haven, /area/mollusc_station/Murphy/bedroom/Elicot, /area/mollusc_station/Murphy/bedroom/Mawreek,
	/area/mollusc_station/Murphy/bedroom/Kaawmer, /area/mollusc_station/Murphy/bedroom/Vayryn, /area/mollusc_station/Murphy/bedroom/Jackson, /area/mollusc_station/Murphy/meeting,
	/area/mollusc_station/Murphy/ratcage, /area/mollusc_station/Murphy/exterior, /area/mollusc_station/Murphy/bedroom/Auciel, /area/mollusc_station/Murphy/bedroom/Radina,
	/area/mollusc_station/Murphy/bedroom/Verity, /area/mollusc_station/Murphy/bedroom/James, /area/mollusc_station/Murphy/unfinished, /area/mollusc_station/Murphy/lowerairlock,
	/area/mollusc_station/Murphy/engineeringstorage)
	dock_target = "l2_murphy_west_airlock"
	current_location = "nav_mollusc_station_medical_dock_shuttle"
//	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/medical_dock
	name = "Tradepost Medical Department Docking Arm"
	docking_controller = "md_airlock"
	landmark_tag = "nav_mollusc_station_medical_dock_shuttle"

/obj/effect/overmap/visitable/ship/landable/murphy
	name = "Murphy"
	shuttle = "Murphy"
	moving_state = "ship_moving"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 15000
	multiz = 3
	use_mapped_z_levels = FALSE
	fore_dir = NORTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_LARGE

/datum/shuttle/autodock/overmap/visitor_dock_space1
	name = "Visiting Docking Bay 1"
	//shuttle_area = /area/mollusc_station/shuttle/outgoing_visitors1
	dock_target = "visitor_dock_space1"
	current_location = "nav_mollusc_station_visitor_dock_space1_shuttle"

/obj/effect/shuttle_landmark/visitor_dock_space1
	name = "Tradepost Visiting Docking Bays"
	docking_controller = "visitor_dock_space1"
	landmark_tag = "nav_mollusc_station_visitor_dock_space1_shuttle"

/datum/shuttle/autodock/overmap/visitor_dock_space2
	name = "Visiting Docking Bay 2"
	//shuttle_area = /area/mollusc_station/shuttle/outgoing_visitors2
	dock_target = "visitor_dock_space2"
	current_location = "nav_mollusc_station_visitor_dock_space2_shuttle"

/obj/effect/shuttle_landmark/visitor_dock_space2
	name = "Tradepost Visiting Docking Bays"
	docking_controller = "visitor_dock_space2"
	landmark_tag = "nav_mollusc_station_visitor_dock_space2_shuttle"


/obj/effect/overmap/visitable/ship/landable/science_shuttle
	name = "Science Shuttle"
	shuttle = "Science Shuttle"
	moving_state = "ship_moving"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 3000
	fore_dir = EAST
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL

// Essentially a bare platform that moves up and down.
/obj/abstract/turbolift_spawner/mollusc_station
	name = "Tradestation cargo elevator placeholder"
//	icon = 'icons/obj/turbolift_preview_nowalls_3x3.dmi'
	depth = 3
	lift_size_x = 2
	lift_size_y = 2
	door_type =     null
	wall_type =     null
	firedoor_type = null
	light_type =    null
	floor_type =  /turf/floor/tiled/steel_grid
	button_type = /obj/structure/lift/button/standalone
	panel_type =  /obj/structure/lift/panel/standalone
	areas_to_use = list(
		/area/turbolift/l1,
		/area/turbolift/l2,
		/area/turbolift/l3
	)
	floor_departure_sound = 'sound/effects/lift_heavy_start.ogg'
	floor_arrival_sound =   'sound/effects/lift_heavy_stop.ogg'

// See up there
/obj/abstract/turbolift_spawner/mollusc_stationpass
	name = "Tradestation pass elevator placeholder"
//	icon = 'icons/obj/turbolift_preview_nowalls_3x3.dmi'
	depth = 3
	lift_size_x = 1
	lift_size_y = 1
	door_type =     null
	wall_type =     null
	firedoor_type = null
	light_type =    null
	floor_type =  /turf/floor/tiled/steel_grid
	button_type = /obj/structure/lift/button/standalone
	panel_type =  /obj/structure/lift/panel/standalone
	areas_to_use = list(
		/area/turbolift/l1p,
		/area/turbolift/l2p,
		/area/turbolift/l3p
	)
	floor_departure_sound = 'sound/effects/lift_heavy_start.ogg'
	floor_arrival_sound =   'sound/effects/lift_heavy_stop.ogg'