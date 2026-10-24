/datum/event/night_terror_attack
	announceWhen = 30
	endWhen = 40
	var/spawned = FALSE

/proc/daycycle_is_night(daycycle_id)
	var/datum/daycycle/cycle = SSdaycycle.get_daycycle(daycycle_id)
	if(!istype(cycle))
		return TRUE
	return istype(cycle.current_period, /datum/daycycle_period/night)

/datum/event/night_terror_attack/setup()
	announceWhen = rand(20, 40)
	endWhen = announceWhen + 10

/datum/event/night_terror_attack/start()
	var/list/spots = get_spawn_turfs()
	if(!LAZYLEN(spots))
		return
	var/turf/T = pick(spots)
	new /mob/living/simple_animal/hostile/night_terror(T)
	spawned = TRUE
	log_and_message_admins("spawned a night terror in [get_area_name(T)] ([T.x], [T.y], [T.z]).", null, T)

/datum/event/night_terror_attack/announce()
	priority_stealth.Announce_quiet("Something vast and hungry moves at the edge of the dark.")

/datum/event/night_terror_attack/proc/get_spawn_turfs()
	var/area/location = pick_area(list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_outside_area))
	if(!location)
		log_debug("Night terror attack failed to find a viable area. Aborting.")
		kill()
		return
	var/list/turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!turfs.len)
		log_debug("Night terror attack failed to find viable turfs in \the [location.proper_name].")
		kill()
		return
	return turfs

/datum/event/night_terror_attack/end()
	log_debug("Night terror attack event spawned [spawned ? 1 : 0] night terror(s).")

/datum/event/night_terror_attack/valSal_port
	check_proc = /proc/night_terror_can_fire_valSal_port

/proc/night_terror_can_fire_valSal_port()
	return daycycle_is_night("daycycle_valSal_port")

/datum/event/night_terror_attack/shaded_hills
	check_proc = /proc/night_terror_can_fire_shaded_hills

/proc/night_terror_can_fire_shaded_hills()
	return daycycle_is_night("daycycle_shaded_hills")
