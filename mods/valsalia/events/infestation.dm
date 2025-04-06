#define VERM_MICE 0
#define VERM_LIZARDS 1
#define VERM_SPIDERS 2
#define VERM_SNAPRATS 3
#define VERM_IVENMOTHS 4


/datum/event/infestation/start()
	var/list/vermin_turfs
	var/attempts = 3
	do
		vermin_turfs = set_location_get_infestation_turfs()
		if(!location)
			return
	while(!vermin_turfs && --attempts > 0)

	if(!vermin_turfs)
		log_debug("Vermin infestation failed to find a viable spawn after 3 attempts. Aborting.")
		kill()

	var/list/spawn_types = list()
	var/max_number
	vermin = rand(1,4)
	switch(vermin)
		if(VERM_MICE)
			spawn_types = list(
				/mob/living/simple_animal/passive/mouse/brown,
				/mob/living/simple_animal/passive/mouse/gray,
				/mob/living/simple_animal/passive/mouse/white,
				/mob/living/simple_animal/passive/mouse/rat
			)
			max_number = 12
			vermstring = "mice"
		if(VERM_LIZARDS)
			spawn_types = list(/mob/living/simple_animal/lizard)
			max_number = 6
			vermstring = "lizards"
		if(VERM_SPIDERS)
			spawn_types = list(/obj/effect/spider/spiderling)
			max_number = 3
			vermstring = "spiders"
		if(VERM_SNAPRATS)
			spawn_types = list(/mob/living/simple_animal/passive/mouse/snaprat)
			max_number = 12
			vermstring = "snaprats"
		if(VERM_IVENMOTHS)
			spawn_types = list(/mob/living/simple_animal/passive/ivenmoth)
			max_number = 10
			vermstring = "ivenmoths"

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