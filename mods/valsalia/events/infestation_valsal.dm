#define VERM_MICE 0
#define VERM_FROG 1
#define VERM_SPIDERS 2

/datum/event/infestation
	announceWhen = 10
	endWhen = 11
	var/area/location_valsal
	var/vermin_valsal
	var/vermstring_valsal

/datum/event/infestation/start()
	var/list/vermin_turfs
	var/attempts = 3
	do
		vermin_turfs = set_location_get_infestation_turfs_valsal()
		if(!location_valsal)
			return
	while(!vermin_turfs && --attempts > 0)

	if(!vermin_turfs)
		log_debug("Vermin infestation failed to find a viable spawn after 3 attempts. Aborting.")
		kill()

	var/list/spawn_types = list()
	var/max_number
	vermin_valsal = rand(0,2)
	switch(vermin_valsal)
		if(VERM_MICE)
			spawn_types = list(
				/mob/living/simple_animal/passive/mouse/brown,
				/mob/living/simple_animal/passive/mouse/gray,
				/mob/living/simple_animal/passive/mouse/white,
				/mob/living/simple_animal/passive/mouse/rat
			)
			max_number = 12
			vermstring_valsal = "mice"
		if(VERM_FROG)
			spawn_types = list(/mob/living/simple_animal/frog)
			max_number = 14
			vermstring_valsal = "frogs"
		if(VERM_SPIDERS)
			spawn_types = list(/obj/effect/spider/spiderling)
			max_number = 3
			vermstring_valsal = "spiders"

	spawn(0)
		var/num = 0
		for(var/i = 1 to severity)
			num += rand(2,max_number)
		log_and_message_admins("Vermin infestation spawned ([vermstring_valsal] x[num]) in \the [location_valsal.proper_name]", location_valsal = pick_area_turf(location_valsal))
		while(vermin_turfs.len && num > 0)
			var/turf/T = pick_n_take(vermin_turfs)
			num--

			var/spawn_type = pick(spawn_types)
			var/obj/effect/spider/spiderling/S = new spawn_type(T)
			if(istype(S))
				S.amount_grown = -1

/datum/event/infestation/proc/set_location_get_infestation_turfs_valsal()
	location_valsal = pick_area(list(/proc/is_not_space_area, /proc/is_valsalia_building_area))
	if(!location_valsal)
		log_debug("Vermin infestation failed to find a viable area. Aborting.")
		kill()
		return

	var/list/vermin_turfs = get_area_turfs(location_valsal, list(/proc/not_turf_contains_dense_objects, /proc/IsTurfAtmosSafe))
	if(!vermin_turfs.len)
		log_debug("Vermin infestation failed to find viable turfs in \the [location_valsal.proper_name].")
		return
	return vermin_turfs

/proc/is_valsalia_building_area(var/area/A)
	if(!istype(A))
		return FALSE
	. = istype(A, /area/valSal_port/town) || istype(A, /area/valSal_port/enclave)

#undef VERM_MICE
#undef VERM_FROG
#undef VERM_SPIDERS
