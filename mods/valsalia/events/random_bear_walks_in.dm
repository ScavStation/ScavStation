/datum/event/random_bear_walks_in/start()
	var/bears = 0

	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			bears = 1
		if(EVENT_LEVEL_MODERATE)
			return
		if(EVENT_LEVEL_MAJOR)
			bears = 2

	var/list/spots  = get_infestation_turfs()

	for(var/j = 0 to bears-1)
		if(!LAZYLEN(spots))
			continue

		var/turf/T = pick_n_take(spots)
		new/mob/living/simple_animal/hostile/bear(T)

/datum/event/random_bear_walks_in/announce()
	var/stealth_chance = 70 - 20*severity
	if(prob(stealth_chance))
		return
	var/naming
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			naming = "a bear"
		if(EVENT_LEVEL_MODERATE)
			return
		if(EVENT_LEVEL_MAJOR)
			naming = "two bears"
	command_announcement.Announce("The sounds of [naming] can be heard in the wild.")

/datum/event/random_bear_walks_in/proc/get_infestation_turfs()
	var/area/location = pick_area(list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_maint_area))
	if(!location)
		log_debug("Random bear attack failed to find a viable area. Aborting.")
		kill()
		return

	var/list/bear_turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!bear_turfs.len)
		log_debug("Random bear attack failed to find viable turfs in \the [location.proper_name].")
		kill()
		return
	return bear_turfs