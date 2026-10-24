// A single restless shade slips in to hunt whoever it marks
/datum/event/stalker_attack
	announceWhen = 30
	endWhen = 40
	check_proc = /proc/stalker_attack_can_fire
	var/spawned_stalkers = 0
	var/list/area_predicates = list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_outside_area)

/proc/stalker_attack_can_fire()
	return daycycle_is_night("daycycle_valSal_port")

/datum/event/stalker_attack/setup()
	announceWhen = rand(20, 40)
	endWhen = announceWhen + 10

// Always exactly one shade, regardless of severity - it already tracks up to two marked targets on
// its own (see marked_targets/find_target() in mobs/ghost.dm), prioritizing the first and falling to
// the second once the first goes critical, so a second entity was never needed for that.
/datum/event/stalker_attack/start()
	var/list/spots = get_spawn_turfs()
	if(!LAZYLEN(spots))
		return
	var/turf/T = pick(spots)
	new /mob/living/simple_animal/hostile/stalker(T)
	spawned_stalkers++
	log_and_message_admins("spawned a restless shade in [get_area_name(T)] ([T.x], [T.y], [T.z]).", null, T)

/datum/event/stalker_attack/announce()
	priority_stealth.Announce_quiet("Something restless stirs in the dark beyond the enclave.")

/datum/event/stalker_attack/proc/get_spawn_turfs()
	var/area/location = pick_area(area_predicates)
	if(!location)
		log_debug("Stalker attack failed to find a viable area. Aborting.")
		kill()
		return
	var/list/turfs = get_area_turfs(location, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!turfs.len)
		log_debug("Stalker attack failed to find viable turfs in \the [location.proper_name].")
		kill()
		return
	return turfs

/datum/event/stalker_attack/end()
	log_debug("Stalker attack event spawned [spawned_stalkers] restless shade(s).")
