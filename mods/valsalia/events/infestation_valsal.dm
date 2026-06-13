/datum/event/infestation_valsalia
	announceWhen = 10
	endWhen = 11
	var/area/location
	var/vermin
	var/vermstring

/datum/event/infestation_valsalia/start()
	var/list/vermin_turfs
	var/attempts = 3
	do
		vermin_turfs = set_location_get_infestation_turfs_valsalia()
		if(!location)
			return
	while(!vermin_turfs && --attempts > 0)

	if(!vermin_turfs)
		log_debug("Vermin infestation failed to find a viable spawn after 3 attempts. Aborting.")
		kill()

	var/list/spawn_types = list()
	var/max_number
	vermin = rand(0,2)
	switch(vermin)
		if(0)
			spawn_types = list(
				/mob/living/simple_animal/passive/mouse/brown,
				/mob/living/simple_animal/passive/mouse/gray,
				/mob/living/simple_animal/passive/mouse/white,
				/mob/living/simple_animal/passive/mouse/rat
			)
			max_number = 12
			vermstring = "mice"
		if(1)
			spawn_types = list(/mob/living/simple_animal/frog)
			max_number = 14
			vermstring = "frogs"
		if(2)
			spawn_types = list(/obj/effect/spider/spiderling)
			max_number = 3
			vermstring = "spiders"

	spawn(0)
		var/num = 0
		for(var/i = 1 to severity)
			num += rand(2,max_number)
		log_and_message_admins("Vermin infestation spawned ([vermstring] x[num]) in \the [location.proper_name]", location = pick_area_turf(location))
		while(vermin_turfs.len && num > 0)
			var/turf/T = pick_n_take(vermin_turfs)
			num--

			var/spawn_type = pick(spawn_types)
			var/obj/effect/spider/spiderling/S = new spawn_type(T)
			if(istype(S))
				S.amount_grown = -1

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
