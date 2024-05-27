// Cargo.
/obj/effect/shuttle_landmark/escape_pod/start
	base_area = /area/space

/obj/effect/shuttle_landmark/escape_pod/out
	base_area = /area/space

/obj/effect/shuttle_landmark/escape_pod/transit
	base_area = /area/space

#define ESCAPE_POD(NUMBER) \
/datum/shuttle/autodock/ferry/escape_pod/pod##NUMBER { \
	shuttle_area = /area/shuttle/escape_pod_##NUMBER; \
	name = "Escape Pod " + #NUMBER; \
	dock_target = "escape_pod_" + #NUMBER; \
	arming_controller = "escape_pod_"+ #NUMBER +"_berth"; \
	waypoint_station = "escape_pod_"+ #NUMBER +"_start"; \
	landmark_transition = "escape_pod_"+ #NUMBER +"_transit"; \
	waypoint_offsite = "escape_pod_"+ #NUMBER +"_out"; \
} \
/obj/effect/shuttle_landmark/escape_pod/start/pod##NUMBER { \
	landmark_tag = "escape_pod_"+ #NUMBER +"_start"; \
	docking_controller = "escape_pod_"+ #NUMBER +"_berth"; \
} \
/obj/effect/shuttle_landmark/escape_pod/transit/pod##NUMBER { \
	landmark_tag = "escape_pod_"+ #NUMBER +"_transit"; \
} \
/obj/effect/shuttle_landmark/escape_pod/out/pod##NUMBER { \
	landmark_tag = "escape_pod_"+ #NUMBER +"_out"; \
} \
/area/shuttle/escape_pod_##NUMBER { \
	name = "Escape Pod " + #NUMBER; \
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT; \
}

ESCAPE_POD(1)
ESCAPE_POD(2)
ESCAPE_POD(3)
ESCAPE_POD(4)
ESCAPE_POD(5)
ESCAPE_POD(6)

/obj/machinery/computer/shuttle_control/explore/katydid
	name = "expedition shuttle control console"
	shuttle_tag = "Expedition Shuttle"

/datum/shuttle/autodock/overmap/expedition
	name = "Expedition Shuttle"
	shuttle_area = /area/shuttle/katydid/expedition
	current_location = "nav_expedition_start"
	dock_target = "mining_shuttle_dock"

/obj/effect/shuttle_landmark/katydid_explorer
	name = "Expedition Shuttle"
	landmark_tag = "nav_expedition_start"
	docking_controller = "mining_shuttle"
