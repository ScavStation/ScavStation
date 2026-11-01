/datum/event/infestation_valsalia
	announceWhen = 10
	endWhen = 11
	var/area/location
	var/vermin
	var/vermstring

/datum/event/infestation_valsalia/proc/set_location_get_infestation_turfs_valsalia()
	// Main behavior: select all viable turfs anywhere that are NOT outside
	var/list/vermin_turfs = list()
	var/list/preds = list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe)
	for(var/area/A in get_filtered_areas(list(/proc/is_area_with_turf)))
		for(var/turf/T in A.contents)
			if(all_predicates_true(list(T), preds) && T.is_outside() == OUTSIDE_NO)
				LAZYADD(vermin_turfs, T)

	if(!vermin_turfs.len)
		log_debug("Vermin infestation failed to find viable non-outside turfs. Aborting.")
		kill()
		return

	var/turf/choose_turf = pick(vermin_turfs)
	location = get_area(choose_turf)
	return vermin_turfs
