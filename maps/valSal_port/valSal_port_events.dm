/datum/map/valSal_port
	event_container_mundane  = /datum/event_container/mundane/fantasy
	event_container_moderate = /datum/event_container/moderate/fantasy
	event_container_major    = /datum/event_container/major/fantasy

// TODO: more appropriate events.
/datum/event_container/mundane/fantasy
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing", /datum/event/nothing,	100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Vermin Infestation", /datum/event/infestation_valsalia, 100,	list(ASSIGNMENT_JANITOR = 100)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Bristleback Attack", /datum/event/bristleback_attack, 10, list(ASSIGNMENT_SECURITY = 20)),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Bandit Attack", /datum/event/thug_attack, 10, list(ASSIGNMENT_SECURITY = 20))

	)

/datum/event_container/moderate/fantasy
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing", /datum/event/nothing,	100),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Bristleback Attack", /datum/event/bristleback_attack, 25, list(ASSIGNMENT_SECURITY = 20)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Bandit Attack", /datum/event/thug_attack, 25, list(ASSIGNMENT_SECURITY = 20)),
		new /datum/event_meta(EVENT_LEVEL_MODERATE, "Solar Storm", /datum/event/solar_storm_valsal, 25)
	)

/datum/event_container/major/fantasy
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Nothing", /datum/event/nothing,	100),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Bristleback Attack", /datum/event/bristleback_attack, 0, list(ASSIGNMENT_SECURITY = 20)),
		new /datum/event_meta(EVENT_LEVEL_MAJOR, "Bandit Attack", /datum/event/thug_attack, 0, list(ASSIGNMENT_SECURITY = 20))
	)
