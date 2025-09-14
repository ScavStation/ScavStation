/* Replaces the 'seed_mobs.dm' default behavior of killing the spawn,
   which affects growing diona nymphs. */
/datum/seed/handle_living_product(var/mob/living/host)
	if(!host || !istype(host)) return

	var/decl/ghosttrap/P = GET_DECL(/decl/ghosttrap/sentient_plant)
	P.request_player(host, "Someone is harvesting \a [display_name].", 15 SECONDS)

	spawn(rand(15 SECONDS, 60 SECONDS))
		host.visible_message("The [host] shakes off some residual seeds.")

		var/total_yield = rand(1,3)
		for(var/j = 0;j<=total_yield;j++)
			new /obj/item/seeds(get_turf(host), null, name)


/* Adds snaprats to infestation event, removes normal mice */
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

/* Become Mouse ghost verb allows you to choose creature type, including valsalia creature types */
/mob/observer/ghost/become_mouse()
	set name = "Become mouse"
	set category = "Ghost"

	if(get_config_value(/decl/config/enum/server_whitelist) == CONFIG_SERVER_JOIN_WHITELIST && !check_server_whitelist(src))
		to_chat(src, SPAN_WARNING("Non-whitelisted players cannot join rounds except as observers."))
		return

	if(get_config_value(/decl/config/toggle/disable_player_mice))
		to_chat(src, SPAN_WARNING("Spawning as a mouse is currently disabled."))
		return

	if(!MayRespawn(1, ANIMAL_SPAWN_DELAY))
		return

	var/turf/T = get_turf(src)
	if(!T || isAdminLevel(T.z))
		to_chat(src, SPAN_WARNING("You may not spawn as a mouse on this Z-level."))
		return

	var/vermintype = input(src, "What type of vermin would you like to become?", "Select Vermin Type") in list("mouse", "lizard", "rat", "snaprat", "ivenmoth")
	if(vermintype == null)
		return

	/*var/response = alert(src, "Are you -sure- you want to become a mouse?","Are you sure you want to squeek?","Squeek!","Nope!")
	if(response != "Squeek!")
		return*/

	//find a viable mouse candidate
	var/mob/living/simple_animal/passive/mouse/host
	var/obj/machinery/atmospherics/unary/vent_pump/vent_found
	var/list/found_vents = list()
	for(var/obj/machinery/atmospherics/unary/vent_pump/v in SSmachines.machinery)
		if(!v.welded && v.z == T.z)
			found_vents.Add(v)
	if(found_vents.len)
		vent_found = pick(found_vents)
		switch(vermintype)
			if("mouse")
				host = new /mob/living/simple_animal/passive/mouse(vent_found.loc)
			if("lizard")
				host = new /mob/living/simple_animal/lizard(vent_found.loc)
			if("rat")
				host = new /mob/living/simple_animal/passive/mouse/rat(vent_found.loc)
			if("snaprat")
				host = new /mob/living/simple_animal/passive/mouse/snaprat(vent_found.loc)
			if("ivenmoth")
				host = new /mob/living/simple_animal/passive/ivenmoth(vent_found.loc)

	else
		to_chat(src, SPAN_WARNING("Unable to find any unwelded vents to spawn mice at."))

	if(host)
		if(get_config_value(/decl/config/toggle/uneducated_mice))
			host.universal_understand = FALSE
		announce_ghost_joinleave(src, 0, "They are now a mouse.")
		host.ckey = src.ckey
		host.status_flags |= NO_ANTAG
		to_chat(host, SPAN_INFO("You are now a " + vermintype + ". Try to avoid interaction with players, and do not give hints away that you are more than a simple creature."))

/* Desert and Tundra planets can spawn snaprats */
/datum/random_map/noise/desert/get_additional_spawns(var/value, var/turf/T)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(2 to 3)
			if(prob(60))
				var/grass_path = pick(subtypesof(/obj/structure/flora/grass))
				new grass_path(T)
			if(prob(5))
				var/mob_type = pick(list(/mob/living/simple_animal/lizard, /mob/living/simple_animal/passive/mouse, /mob/living/simple_animal/passive/mouse/rat, /mob/living/simple_animal/passive/mouse/snaprat, /mob/living/simple_animal/passive/ivenmoth))
				new mob_type(T)
		if(5 to 6)
			if(prob(20))
				var/grass_path = pick(subtypesof(/obj/structure/flora/grass))
				new grass_path(T)
		if(7 to 9)
			if(prob(60))
				new /obj/structure/flora/bush(T)
			else if(prob(20))
				new /obj/structure/flora/tree/dead(T)

/datum/random_map/noise/tundra/get_additional_spawns(var/value, var/turf/T)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(2)
			if(prob(5))
				new /mob/living/simple_animal/crab(T)
		if(6)
			if(prob(60))
				var/grass_path = pick(subtypesof(/obj/structure/flora/grass))
				new grass_path(T)
			if(prob(5))
				var/mob_type = pick(list(/mob/living/simple_animal/lizard, /mob/living/simple_animal/passive/mouse, /mob/living/simple_animal/passive/mouse/rat, /mob/living/simple_animal/passive/mouse/snaprat))
				new mob_type(T)
		if(7)
			if(prob(60))
				new /obj/structure/flora/bush(T)
			else if(prob(30))
				new /obj/structure/flora/tree/pine(T)
			else if(prob(20))
				new /obj/structure/flora/tree/dead(T)
		if(8)
			if(prob(70))
				new /obj/structure/flora/tree/pine(T)
			else if(prob(30))
				new /obj/structure/flora/tree/dead(T)
			else
				new /obj/structure/flora/bush(T)
		if(9)
			new /obj/structure/flora/tree/pine(T)
////resolve_attackby for analyzer to let it copy integrated circuits


/obj/item/integrated_electronics/analyzer/resolve_attackby(atom/A, mob/user, click_params)

	return FALSE