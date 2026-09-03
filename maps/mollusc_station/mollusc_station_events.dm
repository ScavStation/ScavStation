// Ports the restless shade onto the default station as major-severity events
/datum/map/mollusc_station
	event_container_major = /datum/event_container/major/mollusc_station

/datum/event_container/major/mollusc_station/New()
	..()
	available_events += list(
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Restless Shade", /datum/event/stalker_attack/mollusc_station, 15, list(ASSIGNMENT_SECURITY = 20))	)

/datum/event/stalker_attack/mollusc_station
	check_proc = null
	// The base event only looks for outdoor areas, which mollusc_station doesn't have - fall back to
	// any non-shuttle interior area instead.
	area_predicates = list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_not_shuttle_area)
