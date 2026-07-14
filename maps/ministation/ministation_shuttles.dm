//supply
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	warmup_time = 10
	location = 1
	dock_target = "supply_shuttle"
	shuttle_area = /area/ministation/supply
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/start
	landmark_tag ="nav_cargo_start"

/obj/effect/shuttle_landmark/supply/station
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"
	base_area = /area/ministation/supply_dock
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
	landmark_tag = "nav_ministation_bridge_north"

/obj/effect/shuttle_landmark/arrivas_south
	landmark_tag = "nav_ministation_arrivals_south"

/obj/machinery/computer/shuttle_control/explore/ministation
	name = "science shuttle console"
	shuttle_tag = "Science Shuttle"

/datum/shuttle/autodock/overmap/science_shuttle
	name = "Science Shuttle"
	shuttle_area = /area/ministation/shuttle/outgoing
	dock_target = "science_shuttle"
	current_location = "nav_ministation_science_dock_shuttle"
//	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/science_dock
	name = "Tradepost Science Department Docking Arm"
	docking_controller = "ministation_science_dock"
	landmark_tag = "nav_ministation_science_dock_shuttle"

/obj/machinery/computer/shuttle_control/explore/murphy
	name = "Murphy docking console"
	shuttle_tag = "Murphy"

/datum/shuttle/autodock/overmap/murphy
	name = "Murphy"
	shuttle_area = list(/area/Murphy/bridge, /area/Murphy/roof, /area/Murphy/common, /area/Murphy/common/upper,
	/area/Murphy/medical, /area/Murphy/lounge, /area/Murphy/kitchen, /area/Murphy/chem, /area/Murphy/ai,
	/area/Murphy/living, /area/Murphy/rnd, /area/Murphy/hydro, /area/Murphy/robotics, /area/Murphy/smresearch,
	/area/Murphy/lowercommon, /area/Murphy/atmos, /area/Murphy/maint/central, /area/Murphy/maint/midMaint,
	/area/Murphy/maint/Mawreek, /area/Murphy/maint/Vayryn, /area/Murphy/maint/guest, /area/Murphy/janitors,
	/area/Murphy/bathroom, /area/Murphy/bedroom, /area/Murphy/bedroom/guest, /area/Murphy/bedroom/Steph,
	/area/Murphy/bedroom/Karlawa_Haven, /area/Murphy/bedroom/Elicot, /area/Murphy/bedroom/Mawreek,
	/area/Murphy/bedroom/Kaawmer, /area/Murphy/bedroom/Vayryn, /area/Murphy/bedroom/Jackson, /area/Murphy/meeting,
	/area/Murphy/ratcage, /area/Murphy/exterior, /area/Murphy/bedroom/Auciel, /area/Murphy/bedroom/Radina,
	/area/Murphy/bedroom/Verity, /area/Murphy/bedroom/James, /area/Murphy/unfinished, /area/Murphy/lowerairlock,
	/area/Murphy/engineeringstorage)
	dock_target = "l2_murphy_west_airlock"
	current_location = "nav_ministation_medical_dock_shuttle"
//	flags = SHUTTLE_FLAGS_PROCESS

/obj/effect/shuttle_landmark/medical_dock
	name = "Tradepost Medical Department Docking Arm"
	docking_controller = "md_airlock"
	landmark_tag = "nav_ministation_medical_dock_shuttle"

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
	//shuttle_area = /area/ministation/shuttle/outgoing_visitors1
	dock_target = "visitor_dock_space1"
	current_location = "nav_ministation_visitor_dock_space1_shuttle"

/obj/effect/shuttle_landmark/visitor_dock_space1
	name = "Tradepost Visiting Docking Bays"
	docking_controller = "visitor_dock_space1"
	landmark_tag = "nav_ministation_visitor_dock_space1_shuttle"

/datum/shuttle/autodock/overmap/visitor_dock_space2
	name = "Visiting Docking Bay 2"
	//shuttle_area = /area/ministation/shuttle/outgoing_visitors2
	dock_target = "visitor_dock_space2"
	current_location = "nav_ministation_visitor_dock_space2_shuttle"

/obj/effect/shuttle_landmark/visitor_dock_space2
	name = "Tradepost Visiting Docking Bays"
	docking_controller = "visitor_dock_space2"
	landmark_tag = "nav_ministation_visitor_dock_space2_shuttle"


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
/obj/abstract/turbolift_spawner/ministation
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
/obj/abstract/turbolift_spawner/ministationpass
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