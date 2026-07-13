/datum/event/thug_attack
	announceWhen = 45
	endWhen = 75
	var/spawned_thugs = 0

/datum/event/thug_attack/setup()
	announceWhen = rand(30, 60)
	endWhen += severity * 25

/datum/event/thug_attack/start()
	spawn_bandits()

/datum/event/thug_attack/announce()
	var/naming
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			naming = "stragglers"
		if(EVENT_LEVEL_MODERATE)
			naming = "roamers"
		if(EVENT_LEVEL_MAJOR)
			naming = "attackers"
	priority_stealth.Announce_quiet("Bandit [naming] are moving in on the enclave for supplies.")

/datum/event/thug_attack/proc/get_spawn_turfs()
	var/area/location = pick_area(list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_outside_area))
	if(!location)
		log_debug("Bandit attack failed to find a viable area. Aborting.")
		kill()
		return

	var/list/turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!turfs.len)
		log_debug("Bandit attack failed to find viable turfs in \the [location.proper_name].")
		kill()
		return
	return turfs

/datum/event/thug_attack/proc/spawn_bandits()
	var/n = 0
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			n = 4
		if(EVENT_LEVEL_MODERATE)
			n = 7
		if(EVENT_LEVEL_MAJOR)
			n = 10

	var/list/spots = get_spawn_turfs()
	if(!LAZYLEN(spots))
		return

	for(var/i = 1 to n)
		if(!LAZYLEN(spots))
			break
		var/turf/T = pick_n_take(spots)
		new /mob/living/simple_animal/hostile/thug_aggresive(T)
		spawned_thugs++

/datum/event/thug_attack/end()
	log_debug("Bandit attack event spawned [spawned_thugs] bandits.")