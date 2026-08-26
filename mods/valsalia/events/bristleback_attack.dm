/datum/event/bristleback_attack
	var/list/spawned_bristlebacks = list()
	var/retreat_delay = 5 MINUTES

/datum/event/bristleback_attack/start()
	var/bristlebacks = severity * 0.25 * 2 - 1
	var/groups = rand(3,8)

	var/list/spots
	for(var/i = 0 to groups)
		spots = get_infestation_turfs()

		for(var/j = 0 to bristlebacks)
			if(!LAZYLEN(spots))
				continue

			var/turf/T = pick_n_take(spots)
			spawned_bristlebacks += new/mob/living/simple_animal/hostile/bristleback(T)

	addtimer(CALLBACK(src, PROC_REF(retreat)), retreat_delay)

// Clears out any survivors after a while so they don't linger on the map forever, silent if they've all been killed.
/datum/event/bristleback_attack/proc/retreat()
	var/removed = 0
	for(var/mob/living/simple_animal/hostile/bristleback/B in spawned_bristlebacks)
		if(QDELETED(B) || B.stat == DEAD)
			continue
		qdel(B)
		removed++
	if(removed)
		priority_stealth.Announce_quiet("The bristlebacks have retreated for now.")

/datum/event/bristleback_attack/announce()
	var/naming
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			naming = "pack"
		if(EVENT_LEVEL_MODERATE)
			naming = "pack pack"
		if(EVENT_LEVEL_MAJOR)
			naming = "big pack pack"
	priority_stealth.Announce_quiet("A bristleback [naming] has been detected.")

/proc/is_outside_area(var/area/A)
	. = istype(A) && (A.is_outside == OUTSIDE_YES)

/datum/event/bristleback_attack/proc/get_infestation_turfs()
	var/area/location = pick_area(list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_outside_area))
	if(!location)
		log_debug("Bristleback attack failed to find a viable area. Aborting.")
		kill()
		return

	var/list/bristleback_turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!bristleback_turfs.len)
		log_debug("Bristleback attack failed to find viable turfs in \the [location.proper_name].")
		kill()
		return
	return bristleback_turfs