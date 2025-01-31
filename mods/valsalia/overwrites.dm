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
