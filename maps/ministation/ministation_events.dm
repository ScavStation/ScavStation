// Ports the restless shade onto the default station as major-severity events
/datum/map/ministation
	event_container_major = /datum/event_container/major/ministation

/datum/event_container/major/ministation/New()
	..()
	available_events += list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Restless Shade", /datum/event/stalker_attack/ministation, 15, list(ASSIGNMENT_SECURITY = 20))	)

/datum/event/stalker_attack/ministation
	check_proc = null
	// The base event only looks for outdoor areas, which ministation doesn't have - fall back to
	// any non-shuttle interior area instead.
	area_predicates = list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_not_shuttle_area)
