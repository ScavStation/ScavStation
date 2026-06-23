/datum/event/meteor_strike
	announceWhen = 5
	startWhen = 10
	endWhen = 15

/datum/event/meteor_strike/announce()
	priority_stealth.Announce_quiet("A shooting star is shooting towards the enclave, find cover!")

/datum/event/meteor_strike/start()
	var/turf/T = pick_area_and_turf(
		list(/proc/is_not_space_area, /proc/is_station_area, /proc/is_outside_area),
		list(/proc/not_turf_contains_dense_objects)
	)

	if(!T)
		log_debug("Meteor strike failed to find a viable outdoor turf. Aborting.")
		kill()
		return

	var/area/impact_area = get_area(T)
	var/radius = rand(1, 4)
	log_and_message_admins("Meteor strike detonating at [T] (radius [radius]) in \the [impact_area.proper_name]", location = T)
	explosion(T, max(0, radius - 3), max(0, radius - 2), radius, radius + 1, 0)
